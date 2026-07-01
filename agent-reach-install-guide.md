# Agent Reach 全局安装 + opencode Skill 配置指南

## 一、安装 Agent Reach（全局可用）

### 1. 安装 pipx

```powershell
pip install pipx
pipx ensurepath
```

> 网络慢可加 PyPI 镜像：`pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pipx`

### 2. 用 pipx 全局安装 Agent Reach

```powershell
pipx install https://github.com/Panniantong/agent-reach/archive/main.zip
```

> 如网络慢：`pipx install --pip-args="-i https://pypi.tuna.tsinghua.edu.cn/simple" https://github.com/Panniantong/agent-reach/archive/main.zip`

### 3. 安装核心渠道

```powershell
agent-reach install --env=auto
```

### 4. 可选：安装更多渠道

```powershell
# 小红书（桌面推荐走 OpenCLI）
npm install -g @jackwener/opencli
agent-reach install --env=auto --channels=opencli,xiaohongshu

# 其他渠道
agent-reach install --env=auto --channels=twitter,reddit,facebook,instagram
agent-reach install --env=auto --channels=all  # 全部安装
```

### 5. 验证

```powershell
agent-reach doctor
```

---

## 二、配置 opencode Skill

Agent Reach 安装后会自动写 skill 文件到 `~/.agents/skills/agent-reach/`，但 opencode 的 skill 目录在 `~/.config/opencode/skills/`，需要手动复制：

```powershell
Copy-Item -LiteralPath "$env:USERPROFILE\.agents\skills\agent-reach" `
  -Destination "$env:USERPROFILE\.config\opencode\skills\agent-reach" `
  -Recurse -Force
```

复制后，opencode 在任意项目目录下就能自动加载 agent-reach skill。用户对 AI 说"帮我搜小红书 xxx"即可触发。

---

## 三、OpenCLI + Chrome 扩展（桌面小红书必备）

1. 安装 OpenCLI：`npm install -g @jackwener/opencli`
2. Chrome 安装扩展：https://chromewebstore.google.com/detail/opencli/ildkmabpimmkaediidaifkhjpohdnifk
3. 验证：`opencli doctor` 显示 `Extension: connected` 即成功
4. 在 Chrome 里登录 xiaohongshu.com（复用登录态，无需额外配置）

---

## 四、快速参考

| 操作 | 命令 |
|------|------|
| 搜小红书 | `opencli xiaohongshu search "关键词" -f yaml` |
| 看笔记详情 | `opencli xiaohongshu note "完整URL含xsec_token" -f yaml` |
| 看笔记评论 | `opencli xiaohongshu comments "完整URL含xsec_token" -f yaml` |
| 刷首页推荐 | `opencli xiaohongshu feed -f yaml` |
| 查看渠道状态 | `agent-reach doctor` |

---

## 五、文件位置

| 文件 | 路径 |
|------|------|
| Agent Reach 执行文件 | `~/.local/bin/agent-reach.exe`（pipx 安装） |
| OpenCLI 执行文件 | npm global 目录 |
| Agent Reach 配置 | `~/.agent-reach/config.json` |
| opencode skill 文件 | `~/.config/opencode/skills/agent-reach/SKILL.md` |
| Agent Reach 源码目录 | `~/.agent-reach/tools/` |
