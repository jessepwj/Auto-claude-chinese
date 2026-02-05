# 贡献指南

感谢您对 Auto Claude 的关注！本文档提供了为项目做出贡献的指南和说明。

> **🌏 关于此文档**: 这是中文本地化版本的贡献指南。原始项目的贡献请参考 [AndyMik90/Auto-Claude](https://github.com/AndyMik90/Auto-Claude)。

## 如何贡献

| 您想做什么 | 从哪里开始 |
|-----------|-----------|
| Bug 修复和小改进 | 直接提交 PR |
| 新功能 / 架构变更 | 先在 [GitHub Discussions](https://github.com/AndyMik90/Auto-Claude/discussions) 或 [Discord](https://discord.com/channels/1448614759996854284/1451298184612548779) 讨论 |
| 问题和设置帮助 | [Discord #setup-help](https://discord.com/channels/1448614759996854284/1451298184612548779) |
| 翻译改进 | 直接提交 PR，修改 `apps/frontend/src/shared/i18n/locales/zh-CN/` 中的文件 |

## AI 辅助贡献

我们欢迎使用 AI 工具（Claude、Codex、Copilot 等）构建的 PR——考虑到这个项目的性质，不欢迎反而很奇怪。

也就是说，我们见过一些 AI 生成的 PR 引入了回归，因为贡献者没有验证代码实际做了什么。为了保持高质量，我们要求 AI 辅助的 PR 包含以下内容：

- **标记它** - 在 PR 描述中提及 AI 辅助（PR 模板中有相应部分）
- **说明测试级别** - 未测试、轻度测试或充分测试
- **分享上下文** - 提示词或会话日志帮助审查者理解意图
- **确认您理解代码** - 您应该能够描述 PR 做了什么以及底层代码如何工作

AI 辅助的 PR 与任何其他贡献一样经历相同的审查流程。透明度只是帮助审查者知道在哪里更仔细地查看。

## 目录

- [如何贡献](#如何贡献)
- [AI 辅助贡献](#ai-辅助贡献)
- [贡献者许可协议 (CLA)](#贡献者许可协议-cla)
- [先决条件](#先决条件)
- [快速开始](#快速开始)
- [开发设置](#开发设置)
- [预提交钩子](#预提交钩子)
- [代码风格](#代码风格)
- [测试](#测试)
- [持续集成](#持续集成)
- [Git 工作流](#git-工作流)
- [Pull Request 流程](#pull-request-流程)
- [Issue 报告](#issue-报告)
- [架构概览](#架构概览)

## 贡献者许可协议 (CLA)

所有贡献者必须在贡献被接受之前签署我们的贡献者许可协议 (CLA)。

### 为什么需要 CLA

Auto Claude 目前采用 AGPL-3.0 许可。CLA 确保项目在未来引入额外许可选项（例如商业/企业许可）时具有适当的许可灵活性。

您保留对贡献的完全版权所有权。

### 如何签署

1. 提交 Pull Request
2. CLA 机器人将自动评论并提供说明
3. 在 PR 上评论：`I have read the CLA Document and I hereby sign the CLA`
4. 完成 - 您只需签署一次，它适用于所有未来的贡献

在此阅读完整的 CLA：[CLA.md](CLA.md)

## 先决条件

在贡献之前，请确保您已安装以下内容：

- **Python 3.12+** - 用于后端框架
- **Node.js 24+** - 用于 Electron 前端
- **npm 10+** - 前端包管理器（随 Node.js 一起提供）
- **uv**（推荐）或 **pip** - Python 包管理器
- **CMake** - 构建原生依赖所需（例如 LadybugDB）
- **Git** - 版本控制

### 安装 Python 3.12

**Windows:**
```bash
winget install Python.Python.3.12
```

**macOS:**
```bash
brew install python@3.12
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install python3.12 python3.12-venv
```

**Linux (Fedora):**
```bash
sudo dnf install python3.12
```

### 安装 Node.js 24+

**Windows:**
```bash
winget install OpenJS.NodeJS.LTS
```

**macOS:**
```bash
brew install node@24
```

**Linux (Ubuntu/Debian):**
```bash
curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
sudo apt install -y nodejs
```

**Linux (Fedora):**
```bash
sudo dnf install nodejs npm
```

### 安装 CMake

**Windows:**
```bash
winget install Kitware.CMake
```

**macOS:**
```bash
brew install cmake
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install cmake
```

**Linux (Fedora):**
```bash
sudo dnf install cmake
```

## 快速开始

最快的入门方式：

```bash
# 克隆仓库（使用您自己的 fork）
git clone https://github.com/YOUR-USERNAME/Auto-Claude-Chinese.git
cd Auto-Claude-Chinese

# 安装所有依赖（跨平台）
npm run install:all

# 在开发模式下运行
npm run dev

# 或构建并运行生产版本
npm start
```

## 开发设置

该项目包含两个主要组件：

1. **Python 后端** (`apps/backend/`) - 核心自主编码框架
2. **Electron 前端** (`apps/frontend/`) - 桌面 UI

从仓库根目录，两个命令处理所有事情：

```bash
# 安装所有依赖（Python 后端 + Electron 前端）
npm run install:all

# 启动开发模式（热重载）
npm run dev
```

`npm run install:all` 自动：
- 检测系统上的 Python 3.12+
- 创建虚拟环境（`apps/backend/.venv`）
- 安装后端运行时和测试依赖
- 复制 `.env.example` 到 `.env`（如果尚未存在）
- 安装前端 npm 依赖

安装后，在 `apps/backend/.env` 中配置您的凭据：
```bash
# 获取您的 Claude Code OAuth 令牌
claude setup-token

# 然后使用您的令牌和任何其他提供者密钥编辑 apps/backend/.env
```

### 其他有用命令

```bash
npm start              # 构建并运行生产版本
npm run build          # 为生产构建前端
npm run package        # 打包发布
npm run test:backend   # 运行 Python 测试
```

> **注意：** 对于常规使用，我们建议从 [GitHub Releases](https://github.com/AndyMik90/Auto-Claude/releases) 下载预构建版本。从源代码运行主要面向贡献者和测试未发布功能的人。

## 预提交钩子

我们使用 [pre-commit](https://pre-commit.com/) 在每次提交之前运行代码检查和格式化检查。这确保了整个项目的代码质量和一致性。

### 设置

```bash
# 安装 pre-commit
pip install pre-commit

# 安装 git 钩子（克隆后运行一次）
pre-commit install
```

### 提交时运行的检查

当您提交时，以下检查会自动运行：

| 检查 | 范围 | 描述 |
|------|------|------|
| **ruff** | `apps/backend/` | Python 代码检查器，带自动修复 |
| **ruff-format** | `apps/backend/` | Python 代码格式化器 |
| **eslint** | `apps/frontend/` | TypeScript/React 代码检查器 |
| **typecheck** | `apps/frontend/` | TypeScript 类型检查 |
| **trailing-whitespace** | 所有文件 | 删除尾随空格 |
| **end-of-file-fixer** | 所有文件 | 确保文件以换行符结尾 |
| **check-yaml** | 所有文件 | 验证 YAML 语法 |
| **check-added-large-files** | 所有文件 | 防止大文件提交 |

### 手动运行

```bash
# 对所有文件运行所有检查
pre-commit run --all-files

# 运行特定钩子
pre-commit run ruff --all-files

# 临时跳过钩子（不推荐）
git commit --no-verify -m "message"
```

## 代码风格

### Python

- 遵循 PEP 8 风格指南
- 为函数签名使用类型提示
- 为公共函数和类使用文档字符串
- 尽可能保持函数简洁，不超过 50 行
- 使用有意义的变量和函数名

```python
# 好
def get_next_chunk(spec_dir: Path) -> dict | None:
    """
    在实现计划中查找下一个待处理的块。

    Args:
        spec_dir: 规格目录的路径

    Returns:
        下一个块字典，如果所有块都已完成则返回 None
    """
    ...

# 避免
def gnc(sd):
    ...
```

### TypeScript/React

- 使用 TypeScript 严格模式
- 遵循 `apps/frontend/src/` 中现有的组件模式
- 使用带钩子的函数组件
- 优先使用命名导出而不是默认导出
- 使用 `src/renderer/components/ui/` 中的 UI 组件

```typescript
// 好
export function TaskCard({ task, onEdit }: TaskCardProps) {
  const [isEditing, setIsEditing] = useState(false);
  ...
}

// 避免
export default function(props) {
  ...
}
```

### 通用

- 无尾随空格
- TypeScript/JSON 使用 2 空格缩进，Python 使用 4 空格
- 文件以换行符结尾
- 实际情况下保持行长度在 100 字符以下

### 文件编码 (Python)

**始终为文本文件操作指定 `encoding="utf-8"`** 以确保 Windows 兼容性。

Windows Python 默认使用 `cp1252` 编码而不是 UTF-8，导致以下内容出错：
- Emoji (🚀, ✅, ❌)
- 国际字符 (ñ, é, 中文, العربية)
- 特殊符号 (™, ©, ®)

**正确做法：**

```python
# 读取文件
with open(path, encoding="utf-8") as f:
    content = f.read()

# 写入文件
with open(path, "w", encoding="utf-8") as f:
    f.write(content)

# Path 方法
from pathlib import Path
content = Path(file).read_text(encoding="utf-8")
Path(file).write_text(content, encoding="utf-8")

# JSON 文件 - 读取
import json
with open(path, encoding="utf-8") as f:
    data = json.load(f)

# JSON 文件 - 写入
with open(path, "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)
```

**错误做法：**

```python
# 错误 - 平台相关编码
with open(path) as f:
    content = f.read()

# 错误 - Path 方法不带编码
content = Path(file).read_text()

# 错误 - json.dump 上的编码（不是 open！）
json.dump(data, f, encoding="utf-8")  # 错误
```

## 测试

### Python 测试

```bash
# 运行所有测试（从仓库根目录）
npm run test:backend

# 或手动使用 pytest
cd apps/backend
.venv/Scripts/pytest.exe ../tests -v          # Windows
.venv/bin/pytest ../tests -v                   # macOS/Linux

# 运行特定测试文件
npm run test:backend -- tests/test_security.py -v

# 运行特定测试
npm run test:backend -- tests/test_security.py::test_bash_command_validation -v

# 跳过慢速测试
npm run test:backend -- -m "not slow"

# 运行覆盖率测试
pytest tests/ --cov=apps/backend --cov-report=html
```

### 前端测试

```bash
cd apps/frontend

# 运行单元测试
npm test

# 在监视模式下运行测试
npm run test:watch

# 运行覆盖率测试
npm run test:coverage

# 运行 E2E 测试（需要构建的应用）
npm run build
npm run test:e2e

# 运行代码检查
npm run lint

# 运行类型检查
npm run typecheck
```

### 测试要求

在提交 PR 之前：

1. **所有现有测试必须通过**
2. **新功能应包含测试**
3. **Bug 修复应包含回归测试**
4. **测试覆盖率不应显著下降**

## Git 工作流

我们使用 **Git Flow** 分支策略来管理发布和并行开发。

### 分支概览

```
main (stable)          ← 仅发布、测试的代码（标记版本）
  │
develop                ← 集成分支 - 所有 PR 首先合并到这里
  │
├── feature/xxx        ← 新功能
├── fix/xxx            ← Bug 修复
├── release/vX.Y.Z     ← 发布准备
└── hotfix/xxx         ← 紧急生产修复
```

### Pull Request 目标

> ⚠️ **重要：** 所有 PR 应该针对 `develop`，而不是 `main`！

| 您的分支类型 | 目标分支 |
|-------------|---------|
| `feature/*` | `develop` |
| `fix/*` | `develop` |
| `docs/*` | `develop` |
| `refactor/*` | `develop` |
| `test/*` | `develop` |
| `chore/*` | `develop` |

### 提交消息

编写清晰、简洁的提交消息，解释更改背后的"为什么"：

```bash
# 好
git commit -m "为失败的 API 调用添加重试逻辑

为瞬态故障实现指数退避。
修复 #123"

# 避免
git commit -m "修复东西"
git commit -m "WIP"
```

**格式：**
```
<type>: <subject>

<body>

<footer>
```

- **type**: feat, fix, docs, style, refactor, test, chore
- **subject**: 简短描述（最多 50 个字符，祈使语气）
- **body**: 详细解释（如果需要）（在 72 个字符处换行）
- **footer**: 引用 issue、破坏性更改

## Pull Request 流程

1. **Fork 仓库** 并从 `develop` 创建您的分支（不是 main！）

   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/your-feature-name
   ```

2. **进行更改** 遵循代码风格指南

3. **充分测试**：
   ```bash
   # Python（从仓库根目录）
   npm run test:backend

   # 前端
   cd apps/frontend && npm test && npm run lint && npm run typecheck
   ```

4. **更新文档** 如果您的更改影响：
   - 公共 API
   - 配置选项
   - 面向用户的行为

5. **创建 Pull Request**：
   - 使用清晰、描述性的标题
   - 引用任何相关的 issue
   - 描述您做了什么更改以及为什么
   - 为 UI 更改包含屏幕截图
   - 列出任何破坏性更改

6. **PR 标题格式**：
   ```
   <type>: <description>
   ```
   示例：
   - `feat: 添加对自定义提示的支持`
   - `fix: 解决工作进程中的内存泄漏`
   - `docs: 更新安装说明`

## 翻译贡献

如果您想改进中文翻译：

### 翻译文件位置

```
apps/frontend/src/shared/i18n/locales/zh-CN/
├── common.json        # 通用术语
├── navigation.json    # 导航菜单
├── settings.json      # 设置界面
├── tasks.json         # 任务管理
├── errors.json        # 错误消息
├── onboarding.json    # 入门向导
├── welcome.json       # 欢迎页面
├── gitlab.json        # GitLab 集成
├── taskReview.json    # 任务审查
├── terminal.json      # 终端
└── changelog.json     # 更新日志
```

### 翻译指南

1. **保持一致性** - 使用整个应用中一致的术语
2. **遵循命名空间** - 不要在 `common.json` 中添加特定功能的翻译
3. **测试您的翻译** - 在应用中验证文本适合 UI
4. **注意变量** - 保留插值变量如 `{{count}}`, `{{name}}`
5. **复数形式** - 中文通常不需要复数，但保留 `count` 参数

### 示例 PR

```bash
# 创建翻译改进分支
git checkout -b fix/improve-chinese-translations

# 编辑翻译文件
# apps/frontend/src/shared/i18n/locales/zh-CN/settings.json

# 提交更改
git commit -m "fix(i18n): 改进设置页面的中文翻译

- 修正 'Agent' 术语为更准确的'代理'
- 改进 MCP 服务器描述的措辞
- 统一使用'项目'而不是'工程'"

# 推送并创建 PR
git push origin fix/improve-chinese-translations
```

## Issue 报告

### Bug 报告

报告 bug 时，请包含：

1. **清晰的标题** 描述问题
2. **环境详情**：
   - 操作系统和版本
   - Python 版本
   - Node.js 版本（用于 UI 问题）
   - Auto Claude 版本
3. **重现步骤**
4. **预期行为** vs **实际行为**
5. **错误消息** 或日志（如果适用）
6. **屏幕截图**（用于 UI 问题）

### 功能请求

请求功能时：

1. **描述问题** 您试图解决的问题
2. **解释您提议的解决方案**
3. **考虑替代方案** 您考虑过的
4. **提供上下文** 关于您的用例

## 架构概览

Auto Claude 包含两个主要部分：

### Python 后端 (`apps/backend/`)

核心自主编码框架：

- **入口点**: `run.py` (构建运行器), `spec_runner.py` (规格创建器)
- **代理系统**: `agent.py`, `client.py`, `prompts/`
- **执行**: `coordinator.py` (并行), `worktree.py` (隔离)
- **内存**: `memory.py` (基于文件), `graphiti_memory.py` (基于图)
- **QA**: `qa_loop.py`, `prompts/qa_*.md`

### Electron 前端 (`apps/frontend/`)

桌面界面：

- **主进程**: `src/main/` - Electron 主进程，IPC 处理器
- **渲染器**: `src/renderer/` - React UI 组件
- **共享**: `src/shared/` - 类型和工具

详细架构信息，请参见 [CLAUDE.md](CLAUDE.md)。

---

## 问题？

如果您对贡献有疑问，请随时：

1. 使用 `question` 标签提交 GitHub issue
2. 查看现有的 issue 和讨论
3. 在 [Discord](https://discord.gg/KCXaPBr4Dj) 上提问

感谢您为 Auto Claude 做出贡献！
