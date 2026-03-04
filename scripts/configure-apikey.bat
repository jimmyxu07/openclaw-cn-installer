@echo off
chcp 65001 >nul
color 0B
title OpenClaw API Key 配置工具
cls

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║ 🐱‍💻 OpenClaw 中文版 - API Key 配置 ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

set "CONFIG_DIR=%USERPROFILE%\.openclaw"
set "CONFIG_FILE=%CONFIG_DIR%\openclaw.json"

if not exist "%CONFIG_DIR%" mkdir "%CONFIG_DIR%"
if not exist "%CONFIG_DIR%\workspace" mkdir "%CONFIG_DIR%\workspace"

echo 请选择模型提供商（推荐百炼，费用最低）：
echo.
echo [1] 阿里百炼 ⭐️⭐️⭐️ - 国内最便宜（¥0.5/M tokens）
echo [2] Moonshot Kimi - 有免费额度
echo [3] 智谱 GLM-5 - 中文编程强
echo [4] MiniMax-M2.5 - 高速响应
echo [5] 阿里通义 Qwen - 多语言专家
echo [6] 自定义接口 - 支持中转站
echo.
set /p choice="请输入 [1-6，默认:1]: "
if "%choice%"=="" set choice=1

if "%choice%"=="1" goto CONFIG_BAILIAN
if "%choice%"=="2" goto CONFIG_KIMI
if "%choice%"=="3" goto CONFIG_GLM
if "%choice%"=="4" goto CONFIG_MINIMAX
if "%choice%"=="5" goto CONFIG_QWEN
if "%choice%"=="6" goto CONFIG_CUSTOM

echo 无效选择
pause
exit /b 1

:CONFIG_BAILIAN
echo.
echo ─── 阿里百炼配置 ⭐️⭐️⭐️ ───
echo.
echo 获取 API Key：https://bailian.console.aliyun.com
echo.
set /p apikey="请输入 API Key: "

echo {> "%CONFIG_FILE%"
echo "meta": { "lastTouchedVersion": "2026.3.3" },>> "%CONFIG_FILE%"
echo "models": {>> "%CONFIG_FILE%"
echo "mode": "merge",>> "%CONFIG_FILE%"
echo "providers": {>> "%CONFIG_FILE%"
echo "bailian": {>> "%CONFIG_FILE%"
echo "baseUrl": "https://dashscope.aliyuncs.com/compatible-mode/v1",>> "%CONFIG_FILE%"
echo "api": "openai-compatible",>> "%CONFIG_FILE%"
echo "models": [{ "id": "qwen-plus", "name": "通义千问 Plus", "reasoning": true }],>> "%CONFIG_FILE%"
echo "headers": { "Authorization": "Bearer %apikey%" }>> "%CONFIG_FILE%"
echo }>> "%CONFIG_FILE%"
echo }>> "%CONFIG_FILE%"
echo },>> "%CONFIG_FILE%"
echo "agents": { "defaults": { "model": { "primary": "bailian/qwen-plus" } } },>> "%CONFIG_FILE%"
echo "gateway": { "port": 18789, "mode": "local", "bind": "loopback" }>> "%CONFIG_FILE%"
echo }>> "%CONFIG_FILE%"
goto CONFIG_DONE

:CONFIG_KIMI
echo.
echo ─── Moonshot Kimi 配置 ───
echo.
set /p apikey="请输入 API Key：https://platform.moonshot.cn "
echo {> "%CONFIG_FILE%"
echo "meta": { "lastTouchedVersion": "2026.3.3" },>> "%CONFIG_FILE%"
echo "models": { "mode": "merge", "providers": { "kimi-coding": { "baseUrl": "https://api.kimi.com/coding/", "api": "anthropic-messages", "models": [{ "id": "k2p5", "name": "Kimi for Coding", "reasoning": true }], "headers": { "Authorization": "Bearer %apikey%" } } } },>> "%CONFIG_FILE%"
echo "agents": { "defaults": { "model": { "primary": "kimi-coding/k2p5" } } },>> "%CONFIG_FILE%"
echo "gateway": { "port": 18789, "mode": "local", "bind": "loopback" }>> "%CONFIG_FILE%"
echo }>> "%CONFIG_FILE%"
goto CONFIG_DONE

:CONFIG_GLM
echo.
echo ─── 智谱 GLM-5 配置 ───
echo.
set /p apikey="请输入 API Key：https://open.bigmodel.cn "
echo {> "%CONFIG_FILE%"
echo "meta": { "lastTouchedVersion": "2026.3.3" },>> "%CONFIG_FILE%"
echo "models": { "mode": "merge", "providers": { "zhipu": { "baseUrl": "https://open.bigmodel.cn/api/paas/v4/", "api": "openai-compatible", "models": [{ "id": "glm-5", "name": "智谱 GLM-5", "reasoning": true }], "headers": { "Authorization": "Bearer %apikey%" } } } },>> "%CONFIG_FILE%"
echo "agents": { "defaults": { "model": { "primary": "zhipu/glm-5" } } },>> "%CONFIG_FILE%"
echo "gateway": { "port": 18789, "mode": "local", "bind": "loopback" }>> "%CONFIG_FILE%"
echo }>> "%CONFIG_FILE%"
goto CONFIG_DONE

:CONFIG_MINIMAX
echo.
echo ─── MiniMax-M2.5 配置 ───
echo.
set /p apikey="请输入 API Key: "
set /p groupid="请输入 Group ID: "
echo {> "%CONFIG_FILE%"
echo "meta": { "lastTouchedVersion": "2026.3.3" },>> "%CONFIG_FILE%"
echo "models": { "mode": "merge", "providers": { "minimax": { "baseUrl": "https://api.minimax.chat/v1/", "api": "openai-compatible", "models": [{ "id": "MiniMax-M2.5-highspeed", "name": "MiniMax-M2.5", "reasoning": true }], "headers": { "Authorization": "Bearer %apikey%" }, "extraBody": { "group_id": "%groupid%" } } } },>> "%CONFIG_FILE%"
echo "agents": { "defaults": { "model": { "primary": "minimax/MiniMax-M2.5-highspeed" } } },>> "%CONFIG_FILE%"
echo "gateway": { "port": 18789, "mode": "local", "bind": "loopback" }>> "%CONFIG_FILE%"
echo }>> "%CONFIG_FILE%"
goto CONFIG_DONE

:CONFIG_QWEN
echo.
echo ─── 阿里通义 Qwen 配置 ───
echo.
set /p apikey="请输入 API Key：https://dashscope.console.aliyun.com "
echo {> "%CONFIG_FILE%"
echo "meta": { "lastTouchedVersion": "2026.3.3" },>> "%CONFIG_FILE%"
echo "models": { "mode": "merge", "providers": { "qwen": { "baseUrl": "https://dashscope.aliyuncs.com/api/v1/", "api": "openai-compatible", "models": [{ "id": "qwen3.5-plus", "name": "通义千问 3.5 Plus", "reasoning": true }], "headers": { "Authorization": "Bearer %apikey%" } } } },>> "%CONFIG_FILE%"
echo "agents": { "defaults": { "model": { "primary": "qwen/qwen3.5-plus" } } },>> "%CONFIG_FILE%"
echo "gateway": { "port": 18789, "mode": "local", "bind": "loopback" }>> "%CONFIG_FILE%"
echo }>> "%CONFIG_FILE%"
goto CONFIG_DONE

:CONFIG_CUSTOM
echo.

echo ─── 自定义接口配置 ───
echo.
set /p name="提供商名称 (如: api2d): "
set /p baseurl="Base URL: "
set /p apikey="API Key: "
set /p model="模型名称: "
echo {> "%CONFIG_FILE%"
echo "meta": { "lastTouchedVersion": "2026.3.3" },>> "%CONFIG_FILE%"
echo "models": { "mode": "merge", "providers": { "%name%": { "baseUrl": "%baseurl%", "api": "openai-compatible", "models": [{ "id": "%model%", "name": "%model%", "reasoning": true }], "headers": { "Authorization": "Bearer %apikey%" } } } },>> "%CONFIG_FILE%"
echo "agents": { "defaults": { "model": { "primary": "%name%/%model%" } } },>> "%CONFIG_FILE%"
echo "gateway": { "port": 18789, "mode": "local", "bind": "loopback" }>> "%CONFIG_FILE%"
echo }>> "%CONFIG_FILE%"
goto CONFIG_DONE

:CONFIG_DONE
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║ ✅ 配置完成！ ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo 配置文件: %CONFIG_FILE%
echo.
choice /C YN /M "是否立即启动 Gateway"
if %ERRORLEVEL%==1 (
call "%~dp0start-gateway.bat"
) else (
echo 稍后通过桌面图标启动
pause
)
