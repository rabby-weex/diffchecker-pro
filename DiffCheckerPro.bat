@echo off
chcp 65001 >nul
title DiffChecker Pro
cd /d "%~dp0"

echo ========================================================
echo   DiffChecker Pro 正在启动...
echo ========================================================

:: 1. 检测 Python 环境
set PY_CMD=""
python --version >nul 2>&1
if %errorlevel% equ 0 (
    set PY_CMD=python
) else (
    py --version >nul 2>&1
    if %errorlevel% equ 0 (
        set PY_CMD=py
    )
)

if "%PY_CMD%"=="" (
    echo [提示] 未检测到全局 Python 解释器。
    echo 正在尝试检测标准安装路径...
    if exist "%LocalAppData%\Programs\Python\Python312\python.exe" (
        set PY_CMD="%LocalAppData%\Programs\Python\Python312\python.exe"
    ) else if exist "%LocalAppData%\Programs\Python\Python311\python.exe" (
        set PY_CMD="%LocalAppData%\Programs\Python\Python311\python.exe"
    ) else if exist "%ProgramFiles%\Python312\python.exe" (
        set PY_CMD="%ProgramFiles%\Python312\python.exe"
    ) else if exist "C:\Python312\python.exe" (
        set PY_CMD="C:\Python312\python.exe"
    ) else (
        echo [错误] 请先安装 Python 3 (https://www.python.org/downloads/) 并勾选 "Add python.exe to PATH"！
        pause
        exit /b 1
    )
)

:: 2. 检查并启动后台 AI 桥接服务
curl -s -m 1 http://127.0.0.1:28833/health >nul 2>&1
if %errorlevel% neq 0 (
    start "" /b %PY_CMD% server.py
    timeout /t 1 /nobreak >nul
)

:: 3. 优先使用 Edge 或 Chrome 以极简独立 App 窗口模式打开
set BROWSER_CMD=""

if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" (
    set BROWSER_CMD="%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
) else if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" (
    set BROWSER_CMD="%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
) else if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
    set BROWSER_CMD="%ProgramFiles%\Google\Chrome\Application\chrome.exe"
) else if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" (
    set BROWSER_CMD="%LocalAppData%\Google\Chrome\Application\chrome.exe"
)

if not "%BROWSER_CMD%"=="" (
    start "" %BROWSER_CMD% --app=http://127.0.0.1:28833/ --window-size=1380,900
) else (
    start http://127.0.0.1:28833/
)

exit
