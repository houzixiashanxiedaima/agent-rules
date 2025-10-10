# AI 代码助手通用配置规则库

> 基于 Linux 内核开发理念的 AI 代码助手标准化配置

## 📋 项目概述

本项目提供了一套标准化的 AI 代码助手配置规则，遵循"好品味"、实用主义、简洁性原则。

**核心特性**:
- 统一开发标准（基于 Linus Torvalds 的代码品味）
- 多工具支持（Claude Code、OpenAI、Gemini 等）
- 软链接方案（集中管理配置，修改一处所有项目生效）

## 📁 目录结构

```
agent-rules/
├── core/                     # 核心配置文件
│   ├── base.md              # 通用开发原则和工具使用指南
│   ├── CLAUDE.global.md     # Claude Code 全局配置
│   └── AGENTS.global.md     # OpenAI 全局配置
├── commands/                 # Claude Code 自定义命令
│   ├── prd-design.md        # 方案设计命令
│   └── prd-execute.md       # 方案执行命令
├── agents/                   # Claude Code 专业 Agent 定义
│   ├── code-reviewer.md
│   ├── architect-analyst.md
│   └── ... (9个 Agent)
├── workflow/                 # Claude Code 工作流文档
├── .gitignore
├── LICENSE
└── README.md
```

## 🚀 快速开始

### 1. 克隆项目

```bash
git clone <your-repo-url> ~/QinProjects/agent-rules
cd ~/QinProjects/agent-rules
```

### 2. 为不同 AI 工具创建软链接

#### Claude Code

```bash
# 创建 ~/.claude 目录（如果不存在）
mkdir -p ~/.claude

# 创建软链接
ln -sf ~/QinProjects/agent-rules/core/CLAUDE.global.md ~/.claude/CLAUDE.md

# 验证软链接
ls -la ~/.claude/CLAUDE.md
```

#### OpenAI / Copilot

```bash
# 创建软链接（假设配置文件路径为 ~/.openai/AGENTS.md）
mkdir -p ~/.openai
ln -sf ~/QinProjects/agent-rules/core/AGENTS.global.md ~/.openai/AGENTS.md
```

#### 其他 AI 工具

根据工具的配置文件路径，创建对应的软链接到 `core/CLAUDE.global.md` 或 `core/AGENTS.global.md`。

### 3. 配置层级

```
CLAUDE.local.md       # 本地私有（优先级最高）
    ↓
CLAUDE.md             # 项目配置
    ↓
~/.claude/CLAUDE.md   # 全局配置（软链接）
    ↓
core/base.md          # 核心原则（优先级最低）
```

**覆盖原则**: 上层配置覆盖下层同名配置

## 🎯 核心开发原则

### 1. 好品味 (Good Taste)
- 消除特殊情况，让边界情况变成正常情况
- 避免条件分支，简化逻辑

### 2. 兼容性铁律 (Never Break Userspace)
- 向后兼容性神圣不可侵犯
- 任何破坏现有程序的改动都是 bug

### 3. 实用主义信仰
- 解决实际问题，而非假想威胁
- 拒绝"理论完美"但实际复杂的方案

### 4. 简洁执念标准
- 3 层缩进规则：超过 3 层说明设计有问题
- 函数单一职责
- 复杂性是万恶之源

详细规范请查看 [core/base.md](./core/base.md)

## 🛠️ Claude Code 专用命令

### /prd-design
生成完整技术方案，包括 ASCII 原型图和影响分析

[详细文档](./commands/prd-design.md)

### /prd-execute
执行技术方案，包括版本管理和开发流程

[详细文档](./commands/prd-execute.md)

## 🤖 Claude Code 专业 Agents

位于 `agents/` 目录，Claude Code 会根据任务自动调用：

- **code-reviewer**: 代码评审专家
- **architect-analyst**: 架构设计专家
- **task-planner**: 任务规划专家
- **task-executor**: 任务执行专家
- **debugger**: 调试问题专家
- **requirement-analyst**: 需求分析专家
- **workflow-orchestrator**: 工作流编排专家
- **summarizer**: 项目总结专家
- **gemini-analyzer**: 大型代码库分析专家

## 💡 常见问题

**Q: 软链接在 Windows 下工作吗？**
A: 使用 WSL 或 Junction。直接 Windows 需要管理员权限。

**Q: 修改全局配置后需要重启吗？**
A: 不需要，Claude Code 会自动重新加载。

**Q: 项目配置和全局配置冲突怎么办？**
A: 项目配置优先级更高，会覆盖全局配置。

## 📄 许可证

本项目采用 [MIT License](LICENSE) 开源协议。

## 🙏 致谢

本项目的开发理念受到以下启发：
- **Linus Torvalds** - Linux 内核开发的"好品味"原则
- **Linux 内核社区** - 实用主义和简洁性的工程文化

---

**让 AI 成为更好的代码伙伴** 🤖✨
