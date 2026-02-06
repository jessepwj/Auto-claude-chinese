@echo off
chcp 65001 >nul
title Auto Claude 中文版
color 0A

:: 切换到脚本所在目录
cd /d "%~dp0"

:: 直接启动开发模式（最常用）
npm run dev

:: 如果失败，显示错误信息
if %errorlevel% neq 0 (
    echo.
    echo [错误] 启动失败！请检查：
    echo   1. 是否已运行：npm run install:all
    echo   2. 是否已配置：apps\backend\.env
    echo   3. Node.js是否正确安装
    echo.
    pause
)
