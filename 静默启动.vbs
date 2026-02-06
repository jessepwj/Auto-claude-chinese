' Auto Claude 静默启动脚本
' 功能：后台启动，不显示命令行窗口

Set WshShell = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")

' 获取脚本所在目录
scriptDir = FSO.GetParentFolderName(WScript.ScriptFullName)

' 切换到项目目录并启动
WshShell.CurrentDirectory = scriptDir
WshShell.Run "cmd /c npm run dev", 0, False

' 提示用户（可选）
WshShell.Popup "Auto Claude 正在后台启动..." & vbCrLf & vbCrLf & "请等待应用窗口打开", 3, "Auto Claude 中文版", 64

Set WshShell = Nothing
Set FSO = Nothing
