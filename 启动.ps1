# Auto Claude 启动脚本 (PowerShell)
# 使用方法：在此目录右键 -> "用PowerShell运行"

$Host.UI.RawUI.WindowTitle = "Auto Claude 中文版"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Auto Claude 中文版 - 启动中..." -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 切换到脚本所在目录
Set-Location $PSScriptRoot

# 检查Node.js
Write-Host "[检查] 验证 Node.js 安装..." -ForegroundColor Yellow
$nodeVersion = node --version 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "[错误] 未检测到 Node.js！" -ForegroundColor Red
    Write-Host "请访问 https://nodejs.org/ 下载安装" -ForegroundColor Red
    Read-Host "按回车退出"
    exit 1
}
Write-Host "[成功] Node.js 版本: $nodeVersion" -ForegroundColor Green
Write-Host ""

# 检查依赖
if (-not (Test-Path "node_modules")) {
    Write-Host "[安装] 首次运行，正在安装依赖..." -ForegroundColor Yellow
    Write-Host "这可能需要几分钟，请耐心等待..." -ForegroundColor Yellow
    Write-Host ""
    npm run install:all
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[错误] 依赖安装失败！" -ForegroundColor Red
        Read-Host "按回车退出"
        exit 1
    }
    Write-Host ""
}

# 检查配置文件
if (-not (Test-Path "apps\backend\.env")) {
    Write-Host "[警告] 未找到配置文件，从模板创建..." -ForegroundColor Yellow
    Copy-Item "apps\backend\.env.example" "apps\backend\.env"
    Write-Host "[提示] 请在首次使用前配置 API 密钥" -ForegroundColor Yellow
    Write-Host "配置文件位置: apps\backend\.env" -ForegroundColor Cyan
    Write-Host ""
    Read-Host "按回车继续启动"
}

# 启动应用
Write-Host "[启动] 正在启动 Auto Claude 开发服务器..." -ForegroundColor Green
Write-Host "提示: Ctrl+C 停止服务器" -ForegroundColor Gray
Write-Host ""

npm run dev

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "[错误] 启动失败！" -ForegroundColor Red
    Write-Host "请检查错误信息并尝试手动运行：npm run dev" -ForegroundColor Yellow
}

Read-Host "按回车退出"
