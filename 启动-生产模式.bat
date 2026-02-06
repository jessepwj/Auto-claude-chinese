@echo off
chcp 65001 >nul
title Auto Claude - 生产模式启动
color 0B

echo ========================================
echo   Auto Claude 中文版 - 生产模式
echo ========================================
echo.
echo 正在启动生产版本...
echo.
echo 提示：生产模式性能更好，但不支持热重载
echo 修改代码需要重新构建
echo.
echo ========================================
echo.

cd /d "%~dp0"

:: 检查Node.js是否安装
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Node.js！
    echo 请先安装 Node.js 24+: https://nodejs.org/
    echo.
    pause
    exit /b 1
)

:: 检查是否已安装依赖
if not exist "node_modules\" (
    echo [提示] 首次运行，正在安装依赖...
    echo.
    call npm run install:all
    if %errorlevel% neq 0 (
        echo.
        echo [错误] 依赖安装失败！
        pause
        exit /b 1
    )
)

:: 检查是否已构建
if not exist "apps\frontend\dist\" (
    echo [提示] 未检测到构建文件，正在构建...
    echo 这可能需要几分钟...
    echo.
    call npm run build
    if %errorlevel% neq 0 (
        echo.
        echo [错误] 构建失败！
        pause
        exit /b 1
    )
)

:: 检查后端.env配置
if not exist "apps\backend\.env" (
    echo.
    echo [警告] 未找到后端配置文件！
    copy "apps\backend\.env.example" "apps\backend\.env" >nul
    echo 请先配置 apps\backend\.env 文件
    echo.
    pause
)

:: 启动生产模式
echo [启动] 正在启动 Auto Claude...
echo.
npm start

if %errorlevel% neq 0 (
    echo.
    echo [错误] 启动失败！
    echo.
)

pause
