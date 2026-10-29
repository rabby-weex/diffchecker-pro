@echo off
chcp 65001 >nul
title DiffChecker Pro 安装向导
cd /d "%~dp0"

echo ========================================================
echo   DiffChecker Pro 自动化安装向导 (Windows)
echo ========================================================
echo.

:: 1. 创建桌面快捷方式
echo [1/2] 正在创建桌面快捷方式...
set SCRIPT_DIR=%~dp0
set TARGET_VBS=%SCRIPT_DIR%DiffCheckerPro.vbs

powershell -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut([System.IO.Path]::Combine([System.Environment]::GetFolderPath('Desktop'), 'DiffChecker Pro.lnk')); $s.TargetPath = '%TARGET_VBS%'; $s.WorkingDirectory = '%SCRIPT_DIR%'; $ico = '%SCRIPT_DIR%assets\app.ico'; if (Test-Path $ico) { $s.IconLocation = $ico }; $s.Description = 'DiffChecker Pro - 纯净代码对比与 AI 智能诊断'; $s.Save()"

if %errorlevel% equ 0 (
    echo [成功] 桌面快捷方式创建完成！
) else (
    echo [提示] 快捷方式创建被拦截，你可直接双击运行 DiffCheckerPro.bat
)

echo.
echo [2/2] 首次启动验证...
echo ========================================================
echo   安装完成！你现在可以通过桌面上的快捷方式直接打开。
echo   或者按任意键立即启动体验！
echo ========================================================
pause
start "" "%TARGET_VBS%"
exit
