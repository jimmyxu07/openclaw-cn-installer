@echo off
chcp 65001 >nul
color 0A
title OpenClaw Gateway

set "NODE_DIR=%~dp0..\nodejs"
set "CONFIG_FILE=%USERPROFILE%\.openclaw\openclaw.json"

if not exist "%CONFIG_FILE%" (
    echo [提示] 首次使用，请先配置 API Key。
    call "%~dp0configure-apikey.bat"
    exit /b
)

:: 检查 Node.js
if not exist "%NODE_DIR%\node.exe" (
    echo [首次运行] 正在下载 Node.js...
    powershell -Command "& {Invoke-WebRequest -Uri 'https://nodejs.org/dist/v22.14.0/node-v22.14.0-win-x64.zip' -OutFile '%TEMP%\node.zip'; Expand-Archive -Path '%TEMP%\node.zip' -DestinationPath '%~dp0..'; Rename-Item '%~dp0..\node-v22.14.0-win-x64' 'nodejs'}"
    echo [完成] Node.js 已安装
)

echo  Gateway 地址: http://127.0.0.1:18789
echo  按 Ctrl+C 停止服务
echo.

"%NODE_DIR%\npx.cmd" openclaw gateway start

if %ERRORLEVEL% neq 0 (
    echo [错误] Gateway 启动失败。
    pause
)
