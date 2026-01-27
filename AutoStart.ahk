; --------------------------------------------------------------
; AutoHotkey v2: Capslock 增强版 (Hyper Key + 大写开关)
; --------------------------------------------------------------
#Requires AutoHotkey v2.0
;确保脚本只运行一次
#SingleInstance Force

; 1. 初始化：确保脚本启动时，大写锁定是关闭的
SetCapsLockState "Off"

; 2. 定义 Shift + CapsLock：用于切换“真·大写锁定”
+CapsLock::
{
    ; 判断当前状态，如果是开就关，是关就开
    if GetKeyState("CapsLock", "T")
        SetCapsLockState "Off"
    else
        SetCapsLockState "On"
}

; 3. 定义单独按下或组合按下 CapsLock 的行为
; * 代表“通配符”，即不管有没有按其他修饰键（除了被上面拦截的 Shift），都触发这里
; 在 Windows 10/11 中，Ctrl + Alt + Shift + Win 这个组合键，被系统默认分配给了 Office App（在较新的系统中，它会跳转到 Microsoft 365 或 Copilot）。
; ^!+#w:打开 Word
; ^!+#p:打开 PowerPoint
; ^!+#x:打开 Excel
; ^!+#o:打开 Outlook
; ^!+#t:打开 Teams
; ^!+#n:打开 OneNote
; ^!+#l:打开 LinkedIn
; ^!+#y:打开 Yammer
*CapsLock::
{
    ; A. 按下阶段：模拟按下 Ctrl+Alt+Shift+Win
    Send "{Blind}{Ctrl Down}{Alt Down}{Shift Down}"
    
    ; 等待用户松开 CapsLock 键
    KeyWait "CapsLock"
    
    ; B. 松开阶段：弹起那些修饰键
    Send "{Blind}{Ctrl Up}{Alt Up}{Shift Up}{LWin Up}"
    
    ; C. 智能判断：如果刚才仅仅是“按了一下” CapsLock，没有按其他键
    ;    那么就发送一个 Esc
    if (A_PriorKey = "CapsLock")
    {
        Send "{Esc}"
    }
}

; --- 自定义你的快捷键 (举例) ---

; CapsLock + T = 打开终端
^!+t::Run "cmd.exe"

; CapsLock + G = 打开 Gemini
^!+g::Run "chrome.exe https://gemini.google.com"

; CapsLock + B = 打开 Baidu
^!+b::Run "chrome.exe https://baidu.com"

; 一键启动截屏软件
; CapsLock + S = 你的截图工具 (记得你之前问的吗)
^!+s::Run "C:\Users\admin\AppData\Local\Microsoft\WindowsApps\SnippingTool.exe"


;一键打开文件夹
^!+o:: Run 'explorer "D:\GitHub"'

; 一键关闭WinAppDriver.exe
;!k::Run 'taskkill /f /IM "WinAppDriver.exe"'
^!+k:: ProcessClose "WinAppDriver.exe"

;一键启动WinAppDriver.exe
^!+w:: Run "C:\Program Files (x86)\Windows Application Driver\WinAppDriver.exe"

;定义一个函数，用于关闭多个进程
CloseProcesses()
{
	;定义一个数组，包含要关闭的进程名称
	ProcessNames := ["Venus2200Simulator.exe","Jupiter3120Simulator.exe","VenusUI.exe","JupiterUI.exe","Venus2200RT.exe","Jupiter3120RT.exe","VenusDataCollection.exe","JupiterDataCollection.exe","cmd.exe"]
	
	;遍历数组中的每个进程名字并且关闭
	For ProcessName in ProcessNames
	{
		ProcessClose ProcessName
		
		Sleep 1000
		
		;MsgBox  ProcessName
	}
}
^!+a::CloseProcesses()

;一键启动测试
;^!s:: Run "D:\RDC-Soft\trunk\bean\BeanTest\myscript.bat"


; --- 初始化后台播放器 ---
; 创建一个 Windows Media Player 的 COM 对象
; 这是一个由于脚本全程持有的变量，必须设为 Global 或 Static 才能持续播放
Global WMP := ComObject("WMPlayer.OCX") 

; 设置一些基础参数
WMP.settings.autoStart := true  ; 加载完自动播放
WMP.settings.volume := 20      ; 音量 0-100
; 1. 音乐文件夹路径
; AutoHotkey v2 对中文路径支持很好，通常无需特殊编码，但建议保存为 UTF-8
; A_ScriptDir 代表当前脚本所在的文件夹路径
; 注意：中间有一个空格（或用 . 连接），代表拼接字符串
TargetFolder := A_ScriptDir "\音乐"

; 2. 快捷键设置: Ctrl(^) + Alt(!) + Shift(+) + P
^!+p::
{
    ; 初始化一个空数组，用来存放扫描到的歌曲
    MusicList := []

    ; 扫描文件夹 (注意：如果要扫描子文件夹，请将第二个参数改为 "R")
    Loop Files, TargetFolder "\*.mp3" 
    {
        MusicList.Push(A_LoopFileFullPath) ; 把找到的文件路径加到数组里
    }

    ; --- 检查环节 ---
    ; 如果数组长度为 0，说明没找到歌
    if (MusicList.Length = 0)
    {
        MsgBox("错误：在以下路径没有找到 MP3 文件：`n" TargetFolder, "找不到文件", 16)
        return
    }

    ; --- 随机环节 ---
    ; Random(min, max) 生成一个随机索引
    RandomIndex := Random(1, MusicList.Length)
    SongToPlay := MusicList[RandomIndex]

    ; --- 播放环节 ---
    ; 使用系统默认关联的播放器打开该文件
    try 
    {
        ;SoundPlay 会直接调用系统音频引擎播放，不会弹出任何窗口
        ;SoundPlay(SongToPlay)
        ;Run(SongToPlay) ; 也可以用 Run 打开，效果类似双击文件
        WMP.URL := SongToPlay ; 通过 WMP COM 对象播放
        ; 屏幕右下角弹出气泡提示 (显示 3 秒)
        TrayTip("正在随机播放", SongToPlay, 3)
    }
    catch as err
    {
        MsgBox("无法播放文件: " SongToPlay "`n错误信息: " err.Message)
    }
}
; --- 停止/切歌 快捷键 ---
^!+l::
{
    ; 使用 try 包裹，告诉脚本：“试着播放空文件，如果报错也不要崩溃，继续往下走”
    ;try SoundPlay("") 
    ; 调用 COM 对象的停止方法
    WMP.controls.stop()
    
    ; 注意：这里的 "SongToPlay" 加了引号是显示固定文字
    ; 如果你想显示变量里的歌名，由于变量作用域问题，这里可能拿不到，建议直接显示通用提示
    TrayTip("播放已停止", "音乐助手", 2)
}

; --- (可选) 暂停/继续 快捷键 ---
^!+Space::
{
    ; 检查当前状态 (3 = 正在播放)
    if (WMP.playState = 3)
        WMP.controls.pause()
    else
        WMP.controls.play()
}