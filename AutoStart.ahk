;确保脚本只运行一次
#SingleInstance Force

; 一键启动截屏软件
;!n::Run "C:\Windows\System32\SnippingTool.exe"
!n::Run "C:\Users\admin\AppData\Local\Microsoft\WindowsApps\SnippingTool.exe"

; 一键启动网址
!b::Run "www.baidu.com"

;一键打开文件夹
^!o:: Run 'explorer "D:\RDC-Soft\trunk\bean\BeanTest"'

; 一键关闭WinAppDriver.exe
;!k::Run 'taskkill /f /IM "WinAppDriver.exe"'
!k:: ProcessClose "WinAppDriver.exe"

;一键启动WinAppDriver.exe
^!k:: Run "C:\Program Files (x86)\Windows Application Driver\WinAppDriver.exe"

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
!a::CloseProcesses()

;一键启动测试
^!s:: Run "D:\RDC-Soft\trunk\bean\BeanTest\myscript.bat"

^!l:: ProcessClose "cmd.exe"