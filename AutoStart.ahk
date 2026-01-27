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
