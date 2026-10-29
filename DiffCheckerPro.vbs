' ============================================================
'  DiffChecker Pro - Windows 静默后台启动脚本 (无黑框控制台)
' ============================================================
Set WshShell = CreateObject("WScript.Shell")
WshShell.CurrentDirectory = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
WshShell.Run "cmd /c DiffCheckerPro.bat", 0, False
