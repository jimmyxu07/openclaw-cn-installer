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
