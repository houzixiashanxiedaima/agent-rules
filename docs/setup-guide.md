# Agent Rules 安装和配置指南

本指南将帮助你设置 Agent Rules，为你的 AI 代码助手提供统一的配置规范。

## 📋 前置要求

- macOS / Linux / Windows (WSL)
- Git
- Bash shell
- Claude Code / OpenAI Codex / Google Gemini（至少一个）

## 🚀 快速开始

### 1. 克隆或下载项目

```bash
# 克隆到指定目录
cd ~/QinProjects  # 或你喜欢的目录
git clone <your-repo-url>/agent-rules.git

# 或者下载并解压
```

### 2. 运行安装脚本

```bash
cd agent-rules
chmod +x scripts/*.sh  # 确保脚本可执行
./scripts/setup.sh
```

安装脚本会：
- 创建 `~/.claude` 目录
- 备份现有配置（如果存在）
- 创建软链接到全局配置

### 3. 验证安装

```bash
# 检查软链接
ls -la ~/.claude/CLAUDE.md
# 应该显示: CLAUDE.md -> /path/to/agent-rules/core/CLAUDE.global.md

# 运行验证脚本
./scripts/validate-config.sh
```

## 📁 为现有项目配置

### 方法 1：使用自动化脚本（推荐）

```bash
cd /path/to/your/project
~/QinProjects/agent-rules/scripts/link-global-config.sh .
```

脚本会自动：
- 创建 `CLAUDE.md`（项目配置）
- 创建 `CLAUDE.local.md`（私有配置模板）
- 更新 `.gitignore`

### 方法 2：手动配置

#### 创建项目配置

在项目根目录创建 `CLAUDE.md`：

```markdown
# 项目配置

## 继承全局配置
> 全局开发规范: ~/.claude/CLAUDE.md

## 项目信息
- 项目名称: [填写]
- 技术栈: [填写]
- 架构模式: [填写]

## 项目特定规范
[填写项目特定的开发规范...]
```

#### 创建本地私有配置（可选）

在项目根目录创建 `CLAUDE.local.md`：

```markdown
# 本地私有配置

## 本地工具偏好
[个人开发环境配置...]

## 临时开发规则
[临时规则...]
```

#### 更新 .gitignore

确保 `.gitignore` 包含：

```gitignore
# Claude Code 私有配置
CLAUDE.local.md
```

### 方法 3：从示例复制

```bash
# 选择对应的示例
cp ~/QinProjects/agent-rules/examples/flutter-project/CLAUDE.md .

# 编辑并填写项目信息
vim CLAUDE.md
```

## 🔧 配置说明

### 文件层级和优先级

```
CLAUDE.local.md      # 本地私有（不提交）
    ↓ 优先级
CLAUDE.md            # 项目配置（提交到 Git）
    ↓
~/.claude/CLAUDE.md  # 全局配置（软链接）
    ↓
agent-rules/core/    # 核心配置
```

### 配置继承规则

- **覆盖原则**: 上层配置会覆盖下层同名配置
- **引用方式**: 使用 `@filepath` 引用其他配置文件
- **项目优先**: 项目配置优先于全局配置

## 🎯 不同场景的配置

### 场景 1：个人开发者

```bash
# 1. 运行全局配置
./scripts/setup.sh

# 2. 为每个项目创建配置
cd ~/projects/project1
~/agent-rules/scripts/link-global-config.sh .

cd ~/projects/project2
~/agent-rules/scripts/link-global-config.sh .
```

### 场景 2：团队协作

```bash
# 1. 团队共享配置仓库
git clone <team-agent-rules-repo>

# 2. 每个成员设置全局配置
./scripts/setup.sh

# 3. 项目 CLAUDE.md 提交到项目仓库
# 4. 个人 CLAUDE.local.md 不提交
```

### 场景 3：多项目共享

```bash
# 1. 全局配置
./scripts/setup.sh

# 2. 在项目中引用全局配置
# CLAUDE.md 中只写项目特定内容

# 3. 修改全局配置自动影响所有项目
vim ~/agent-rules/core/CLAUDE.global.md
```

## 🛠️ 高级配置

### 自定义全局配置

编辑全局配置文件：

```bash
vim ~/QinProjects/agent-rules/core/CLAUDE.global.md
```

修改后会自动应用到所有项目。

### 创建项目特定命令

```bash
# 在项目中创建 .claude/commands 目录
mkdir -p .claude/commands

# 创建自定义命令
cat > .claude/commands/my-command.md <<EOF
# my-command

功能描述...
EOF

# 在 CLAUDE.md 中引用
# @./.claude/commands/my-command.md
```

### 使用 Agent Workflow

参考 [workflow 文档](../workflow/README.md) 配置完整的开发流程。

## 🔍 故障排除

### 问题 1：软链接失败

**症状**: `setup.sh` 报错，软链接创建失败

**解决方案**:
```bash
# 检查目录权限
ls -la ~/.claude

# 手动创建软链接
ln -sf ~/QinProjects/agent-rules/core/CLAUDE.global.md ~/.claude/CLAUDE.md
```

### 问题 2：配置未生效

**症状**: 修改配置后 Claude Code 未识别

**解决方案**:
```bash
# 1. 检查软链接是否正确
ls -la ~/.claude/CLAUDE.md

# 2. 重启 Claude Code CLI

# 3. 运行验证脚本
./scripts/validate-config.sh
```

### 问题 3：Windows 软链接问题

**症状**: Windows 下无法创建软链接

**解决方案**:
- 使用 WSL（推荐）
- 或使用 Junction: `mklink /J`
- 或直接复制文件（不推荐，失去同步优势）

### 问题 4：权限问题

**症状**: 脚本无法执行

**解决方案**:
```bash
# 添加执行权限
chmod +x scripts/*.sh
```

## 📚 下一步

- 阅读 [使用指南](./usage-guide.md)
- 查看 [命令参考](./command-reference.md)
- 学习 [最佳实践](./best-practices.md)
- 参考 [示例配置](../examples/)

## 💬 获取帮助

- 查看 [FAQ](./best-practices.md#常见问题)
- 提交 [Issue](https://github.com/user/agent-rules/issues)
- 参与 [Discussions](https://github.com/user/agent-rules/discussions)

---

**维护说明**: 本文档随项目更新而更新，请定期查看最新版本。
