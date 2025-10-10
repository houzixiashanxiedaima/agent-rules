# AI 代码助手通用配置规则库

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/user/repo/graphs/commit-activity)

> 基于 Linux 内核开发理念的 AI 代码助手标准化配置

## 📋 项目概述

本项目提供了一套标准化的 AI 代码助手配置规则，旨在：

- **统一开发标准** - 基于 Linus Torvalds 的代码品味和开发理念
- **提升代码质量** - 遵循"好品味"、实用主义、简洁性原则
- **标准化流程** - 规范化的 Git 提交、任务管理、文档更新流程
- **多工具支持** - 支持 Claude Code、OpenAI Codex、Google Gemini 等主流 AI 工具
- **软链接方案** - 集中管理配置，修改一处所有项目生效

## 🏗️ 架构设计

```
┌─────────────────────────────────────────────────────────┐
│                    配置架构图                            │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌──────────────┐     ┌─────────────────────────────┐  │
│  │ core/        │ ──→ │   核心配置                  │  │
│  │              │     │  • base.md - 通用原则       │  │
│  │              │     │  • tooling.md - 工具指南    │  │
│  │              │     │  • CLAUDE.global.md         │  │
│  │              │     │  • AGENTS.global.md         │  │
│  └──────────────┘     └─────────────────────────────┘  │
│         │                                               │
│         │  软链接                                       │
│         ↓                                               │
│  ┌──────────────────────────────────────────────────┐  │
│  │         ~/.claude/CLAUDE.md (全局配置)            │  │
│  └──────────────────────────────────────────────────┘  │
│                                                         │
│  ┌──────────────┐     ┌─────────────────────────────┐  │
│  │ commands/    │ ──→ │   共享命令                  │  │
│  │              │     │  • prd-design.md            │  │
│  │              │     │  • prd-execute.md           │  │
│  │              │     │  • ai-commit.md             │  │
│  └──────────────┘     └─────────────────────────────┘  │
│                                                         │
│  ┌──────────────┐     ┌─────────────────────────────┐  │
│  │ agents/      │ ──→ │   专业 Agents               │  │
│  │              │     │  • code-reviewer            │  │
│  │              │     │  • architect-analyst        │  │
│  │              │     │  • task-planner 等          │  │
│  └──────────────┘     └─────────────────────────────┘  │
│                                                         │
│  ┌──────────────┐     ┌─────────────────────────────┐  │
│  │ scripts/     │ ──→ │   自动化工具                │  │
│  │              │     │  • setup.sh                 │  │
│  │              │     │  • link-global-config.sh    │  │
│  │              │     │  • validate-config.sh       │  │
│  └──────────────┘     └─────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

## 📁 目录结构

```
agent-rules/
├── core/                     # 核心配置文件
│   ├── CLAUDE.global.md      # Claude Code 全局配置
│   ├── AGENTS.global.md      # OpenAI 全局配置
│   ├── base.md               # 通用开发原则
│   └── tooling.md            # 工具使用指南
├── commands/                 # 共享命令
│   ├── prd-design.md         # 方案设计命令
│   ├── prd-execute.md        # 方案执行命令
│   ├── ai-commit.md          # 智能提交命令
│   └── README.md             # 命令说明
├── agents/                   # 专业 Agent 定义
│   ├── code-reviewer.md
│   ├── architect-analyst.md
│   ├── task-planner.md
│   └── ... (9个 Agent)
├── scripts/                  # 自动化脚本
│   ├── setup.sh              # 全局配置安装
│   ├── link-global-config.sh # 项目配置创建
│   └── validate-config.sh    # 配置验证
├── examples/                 # 示例配置
│   ├── flutter-project/
│   ├── nodejs-project/
│   └── python-project/
├── docs/                     # 文档
│   ├── setup-guide.md
│   ├── usage-guide.md
│   ├── command-reference.md
│   └── best-practices.md
├── workflow/                 # 工作流文档（由 agents 生成）
├── .gitignore
├── LICENSE
└── README.md                 # 本文件
```

## 🚀 快速开始

### 1. 安装全局配置

```bash
# 克隆项目
git clone <your-repo-url>/agent-rules.git ~/QinProjects/agent-rules
cd ~/QinProjects/agent-rules

# 运行安装脚本
./scripts/setup.sh
```

安装脚本会：
- 创建 `~/.claude` 目录
- 备份现有配置
- 创建软链接：`~/.claude/CLAUDE.md` → `agent-rules/core/CLAUDE.global.md`

### 2. 验证安装

```bash
# 检查软链接
ls -la ~/.claude/CLAUDE.md

# 运行验证脚本
./scripts/validate-config.sh
```

### 3. 为项目创建配置

```bash
# 进入你的项目
cd /path/to/your/project

# 运行配置脚本
~/QinProjects/agent-rules/scripts/link-global-config.sh .
```

这会创建：
- `CLAUDE.md` - 项目配置（提交到 Git）
- `CLAUDE.local.md` - 私有配置（不提交）
- 更新 `.gitignore`

## 🎯 核心特性

### 软链接方案优势

✅ **集中管理**: 修改一处，所有项目生效
✅ **版本控制**: 配置变更可追踪
✅ **灵活覆盖**: 项目配置可覆盖全局配置
✅ **私有配置**: 支持个人开发环境配置

### 开发原则 (基于 Linux 内核)

**1. 好品味 (Good Taste)**
- 消除特殊情况，让边界情况变成正常情况
- 避免条件分支，简化逻辑
- 经典案例：链表删除 10 行优化为 4 行

**2. 兼容性铁律 (Never Break Userspace)**
- 向后兼容性神圣不可侵犯
- 任何破坏现有程序的改动都是 bug

**3. 实用主义信仰**
- 解决实际问题，而非假想威胁
- 拒绝"理论完美"但实际复杂的方案

**4. 简洁执念标准**
- 3 层缩进规则：超过 3 层说明设计有问题
- 函数单一职责
- 复杂性是万恶之源

### 质量控制八荣八耻

**八荣 (Honor)**:
- 以深入研究为荣 - 仔细查阅文档
- 以确认执行为荣 - 明确需求再行动
- 以人工验证为荣 - 重要逻辑需确认
- 以复用接口为荣 - 优先用现有接口
- 以主动测试为荣 - 提前验证功能
- 以遵循规范为荣 - 严格按架构执行
- 以诚实无知为荣 - 不懂就问
- 以谨慎重构为荣 - 深思熟虑后修改

**八耻 (Shame)**:
- 以猜测 API 为耻 - 盲目假设接口
- 以模糊执行为耻 - 需求不明就编码
- 以假设逻辑为耻 - 未确认就实现
- 以创建接口为耻 - 重复造轮子
- 以跳过验证为耻 - 不测试就提交
- 以破坏架构为耻 - 违背设计规范
- 以装懂为耻 - 不懂装懂
- 以盲目修改为耻 - 不理解就修改

## 🛠️ 专用命令系统

### prd-design 命令
**功能**: 生成完整技术方案，包括 ASCII 原型图和影响分析

```bash
/prd-design "实现用户认证系统"
```

**输出**: 系统架构图、技术方案、影响范围、风险评估

[详细文档](./commands/prd-design.md)

### prd-execute 命令
**功能**: 执行技术方案，包括版本管理和开发流程

```bash
/prd-execute "基于设计方案实施用户认证"
```

**流程**: 方案验证 → 版本管理 → PRD 更新 → 任务执行 → 质量检查

[详细文档](./commands/prd-execute.md)

### ai-commit 命令
**功能**: 创建符合规范的 Git 提交

```bash
/ai-commit
```

**流程**: 格式化代码 → 暂存更改 → 生成提交消息 → 创建提交

[详细文档](./commands/ai-commit.md)

## 📚 配置层级

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

## 🔧 配置示例

### Flutter 项目

参考 [examples/flutter-project/CLAUDE.md](./examples/flutter-project/CLAUDE.md)

包含：MVVM 架构、Riverpod + Freezed、单元测试规范

### Node.js 项目

参考 [examples/nodejs-project/CLAUDE.md](./examples/nodejs-project/CLAUDE.md)

包含：TypeScript、MVC/Clean Architecture、Jest 测试

### Python 项目

参考 [examples/python-project/CLAUDE.md](./examples/python-project/CLAUDE.md)

包含：FastAPI、Clean Architecture、pytest 测试

## 📖 文档

- [安装指南](./docs/setup-guide.md) - 详细的安装和配置步骤
- [使用指南](./docs/usage-guide.md) - 日常工作流和命令使用
- [命令参考](./docs/command-reference.md) - 所有命令的完整说明
- [最佳实践](./docs/best-practices.md) - 配置管理和使用技巧

## 🤝 贡献指南

### 贡献类型
- 配置优化 - 改进现有配置
- 新工具支持 - 添加新的 AI 工具配置
- 文档完善 - 补充使用说明
- Bug 修复 - 修复配置问题

### 提交规范
```bash
[ClaudeCode] feat(config): add support for new AI tool
[ClaudeCode] docs: update README with examples
[ClaudeCode] fix(core): correct tooling path reference
```

### 开发流程
1. Fork 本仓库
2. 创建特性分支 `git checkout -b feature/new-feature`
3. 进行修改并测试
4. 提交变更 `git commit -m "[ClaudeCode] feat: description"`
5. 推送分支 `git push origin feature/new-feature`
6. 创建 Pull Request

## 💡 常见问题

**Q: 软链接在 Windows 下工作吗？**
A: 使用 WSL 或 Junction。直接 Windows 需要管理员权限。

**Q: 修改全局配置后需要重启吗？**
A: 不需要，Claude Code 会自动重新加载。

**Q: 项目配置和全局配置冲突怎么办？**
A: 项目配置优先级更高，会覆盖全局配置。

**Q: 如何在多个项目间共享配置？**
A: 使用全局配置 + 软链接方案即可。

更多问题查看 [最佳实践文档](./docs/best-practices.md)

## 📄 许可证

本项目采用 [MIT License](LICENSE) 开源协议。

## 📞 支持和反馈

- **Issues**: [GitHub Issues](https://github.com/user/agent-rules/issues)
- **Discussions**: [GitHub Discussions](https://github.com/user/agent-rules/discussions)
- **Email**: yuyi@yuyins.com

## 🙏 致谢

本项目的开发理念受到以下启发：
- **Linus Torvalds** - Linux 内核开发的"好品味"原则
- **Linux 内核社区** - 实用主义和简洁性的工程文化
- **开源社区** - 协作开发和知识分享的精神

---

**让 AI 成为更好的代码伙伴** 🤖✨
