@echo off
chcp 65001 >nul
title Auto Claude - 开发模式启动
color 0A

echo ========================================
echo   Auto Claude 中文版 - 开发模式
echo ========================================
echo.
echo 正在启动开发服务器...
echo 启动后会自动打开应用窗口
echo.
echo 提示：开发模式支持热重载（修改代码后自动刷新）
echo 关闭此窗口会停止应用
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
    echo 这可能需要几分钟时间，请耐心等待...
    echo.
    call npm run install:all
    if %errorlevel% neq 0 (
        echo.
        echo [错误] 依赖安装失败！
        echo 请检查网络连接或手动运行: npm run install:all
        echo.
        pause
        exit /b 1
    )
)

:: 检查后端.env配置
if not exist "apps\backend\.env" (
    echo.
    echo [警告] 未找到后端配置文件！
    echo 正在从模板创建 .env 文件...
    copy "apps\backend\.env.example" "apps\backend\.env" >nul
    echo.
    echo [重要] 请在启动前配置您的API密钥：
    echo 编辑文件：apps\backend\.env
    echo.
    echo 按任意键继续启动...
    pause >nul
)

:: 启动开发模式
echo [启动] 正在启动 Auto Claude...
echo.
npm run dev

if %errorlevel% neq 0 (
    echo.
    echo [错误] 启动失败！
    echo 可能的原因：
    echo   1. 端口被占用（5173或其他）
    echo   2. 依赖未正确安装
    echo   3. 配置文件错误
    echo.
    echo 尝试手动运行以查看详细错误：
    echo   npm run dev
    echo.
)

pause
