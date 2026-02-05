# 发布到GitHub指南

## 当前状态 ✅

✅ **远程仓库已配置**
- Origin: `https://github.com/jessepwj/Auto-Claude-Chinese.git`
- Upstream: `https://github.com/AndyMik90/Auto-Claude.git`

✅ **代码已准备就绪**
- master分支包含完整的中文本地化
- 所有文档已更新（README, CONTRIBUTING, FORK_NOTICE）

---

## 📋 发布步骤

### 步骤 1: 在GitHub上创建仓库

1. 访问 https://github.com/new
2. 填写仓库信息：
   - **Repository name**: `Auto-Claude-Chinese`
   - **Description**: `Auto Claude 的简体中文本地化版本 | Simplified Chinese localization of Auto Claude`
   - **Visibility**: 选择 **Public**（公开）
   - ⚠️ **不要勾选** "Add a README file"
   - ⚠️ **不要勾选** "Add .gitignore"
   - ⚠️ **不要勾选** "Choose a license"（代码已经包含LICENSE文件）
3. 点击 **Create repository**

### 步骤 2: 配置GitHub认证

#### 方法A: Personal Access Token (推荐)

1. 访问 https://github.com/settings/tokens/new
2. 填写信息：
   - **Note**: `Auto-Claude-Chinese Push Access`
   - **Expiration**: 选择 `90 days` 或 `No expiration`
   - **Select scopes**: 勾选 `repo` (完整的仓库权限)
3. 点击 **Generate token**
4. **立即复制token**（只显示一次！）
   ```
   ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   ```
5. 保存到安全的地方

#### 方法B: SSH密钥（如果您已配置）

如果您已经有SSH密钥配置，可以修改远程URL：
```bash
git remote set-url origin git@github.com:jessepwj/Auto-Claude-Chinese.git
```

### 步骤 3: 推送代码到GitHub

**使用Personal Access Token:**

```bash
# 推送master分支到origin
git push -u origin master
```

**当提示输入密码时：**
- Username: `jessepwj`
- Password: 粘贴您的 **Personal Access Token**（不是GitHub密码！）

**首次推送后，Git会记住凭据（Windows凭据管理器），之后不需要重复输入。**

### 步骤 4: 配置仓库设置

推送成功后，在GitHub仓库页面配置：

1. **设置描述和主题**
   - 访问 `https://github.com/jessepwj/Auto-Claude-Chinese`
   - 点击右上角的 ⚙️ Settings
   - 在 About 部分添加：
     - **Description**: `Auto Claude 的简体中文本地化版本 | Simplified Chinese localization of Auto Claude`
     - **Website**: （如果有）
     - **Topics**: `auto-claude`, `chinese`, `i18n`, `localization`, `ai`, `coding-assistant`, `electron`, `react`, `typescript`, `python`

2. **设置默认分支**
   - Settings → General → Default branch
   - 确认 `master` 是默认分支

3. **添加社交图片**（可选）
   - 可以使用 `.github/assets/Auto-Claude-Kanban.png`

---

## 🎉 完成后

仓库将可以通过以下地址访问：
```
https://github.com/jessepwj/Auto-Claude-Chinese
```

**下一步：**
1. ⭐ 给原项目点Star：https://github.com/AndyMik90/Auto-Claude
2. 📢 在README中添加Badge（已包含）
3. 🔄 定期同步上游更新：
   ```bash
   git fetch upstream
   git checkout master
   git merge upstream/main
   git push origin master
   ```

---

## ⚠️ 常见问题

### Q: 推送时提示 "remote: Repository not found"
**A:** 您需要先在GitHub上创建 `Auto-Claude-Chinese` 仓库（步骤1）

### Q: 推送时提示 "Authentication failed"
**A:** 确保：
- 使用的是 **Personal Access Token**，不是GitHub密码
- Token有 `repo` 权限
- 用户名正确（`jessepwj`）

### Q: 如何撤销推送？
**A:** 在推送前，您随时可以重置：
```bash
git reset --soft HEAD~1  # 撤销最后一次提交，保留更改
```

---

## 📞 需要帮助？

如果遇到问题，请检查：
1. GitHub仓库是否已创建
2. Personal Access Token是否有效
3. 网络连接是否正常

**准备好后，运行：**
```bash
git push -u origin master
```
