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

echo Gateway 地址: http://127.0.0.1:18789
echo 按 Ctrl+C 停止服务
echo.

"%NODE_DIR%\npx.cmd" openclaw gateway start

if %ERRORLEVEL% neq 0 (
echo [错误] Gateway 启动失败。
pause
)
