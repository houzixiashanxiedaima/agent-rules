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

## 🏗️ 架构设计

```
┌─────────────────────────────────────────────────────────┐
│                    配置架构图                            │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────────────┐    ┌─────────────────────────────────┐ │
│  │   base.md   │ ─→ │        通用配置基础             │ │
│  │  (核心配置)  │    │  • 开发原则                     │ │
│  └─────────────┘    │  • 工作流程                     │ │
│          │          │  • 质量标准                     │ │
│          ↓          │  • 通用命令                     │ │
│  ┌─────────────────────────────────────────────────────┐ │
│  │              工具特定配置                            │ │
│  ├─────────────┬─────────────┬─────────────────────────┤ │
│  │ CLAUDE.md   │ AGENTS.md   │      GEMINI.md          │ │
│  │             │             │                         │ │
│  │ • 多模态    │ • 代码生成  │   • 深度推理            │ │
│  │ • 上下文    │ • 实时补全  │   • 架构分析            │ │
│  │ • 工具集成  │ • 测试生成  │   • 系统优化            │ │
│  └─────────────┴─────────────┴─────────────────────────┘ │
│                                                         │
│  ┌─────────────────────────────────────────────────────┐ │
│  │                  专用命令系统                        │ │
│  ├─────────────────────┬───────────────────────────────┤ │
│  │   prd-design.md     │      prd-execute.md           │ │
│  │                     │                               │ │
│  │ • 需求分析          │   • 方案验证                  │ │
│  │ • ASCII 原型图      │   • 版本管理                  │ │
│  │ • 技术方案设计      │   • 任务分解                  │ │
│  │ • 影响范围评估      │   • 质量检查                  │ │
│  └─────────────────────┴───────────────────────────────┘ │
└─────────────────────────────────────────────────────────┘
```

## 📁 文件结构

```
agent-rules/
├── base.md          # 通用配置基础
├── CLAUDE.md        # Claude Code 专用配置
├── AGENTS.md        # OpenAI Codex/Copilot 配置
├── GEMINI.md        # Google Gemini CLI 配置
├── prd-design.md    # PRD 设计命令文档
├── prd-execute.md   # PRD 执行命令文档
├── .gitignore       # Git 忽略规则
└── README.md        # 项目说明文档
```

## 🚀 快速开始

### 1. 选择对应的 AI 工具配置

#### Claude Code 用户
```bash
# 复制 Claude Code 配置到你的项目
cp CLAUDE.md ~/.claude/CLAUDE.md
# 或者在配置中引用
echo "@/path/to/agent-rules/base.md" >> ~/.claude/CLAUDE.md
```

#### OpenAI Codex/Copilot 用户
```bash
# 复制 OpenAI 配置
cp AGENTS.md ~/.openai/config.md
# 配置环境变量
export OPENAI_CONFIG_PATH="/path/to/agent-rules/AGENTS.md"
```

#### Google Gemini 用户
```bash
# 复制 Gemini 配置
cp GEMINI.md ~/.gemini/config.md
# 设置配置路径
export GEMINI_CONFIG_PATH="/path/to/agent-rules/GEMINI.md"
```

### 2. 基础配置引用

在你的 AI 工具配置文件中添加：

```markdown
# 引用通用基础配置
@/path/to/agent-rules/base.md

# 工具特定配置
@/path/to/agent-rules/[TOOL].md
```

## 🎯 核心特性

### 开发原则 (基于 Linux 内核开发经验)

#### 1. 代码品味 (Good Taste)
- **消除特殊情况** - 重新设计让边界情况变成正常情况
- **避免条件分支** - 好的设计能减少 if/else 判断
- **直觉驱动** - 简洁的解决方案通常是正确的

#### 2. 兼容性铁律 (Never Break Userspace)
- **向后兼容性神圣不可侵犯**
- 任何破坏现有程序的改动都是 bug
- 实用性优于理论完美

#### 3. 实用主义信仰
- **解决实际问题**，而非假想威胁
- 拒绝"理论完美"但实际复杂的方案
- 代码为现实世界服务

#### 4. 简洁执念标准
- **3 层缩进规则** - 超过 3 层缩进说明设计有问题
- **函数单一职责** - 每个函数只做一件事并做好
- **复杂性是万恶之源** - 优先选择简单方案

### 标准化工作流程

#### 任务管理
```markdown
# 标准 TODO-LIST 格式
- [ ] 需求分析和理解
- [ ] 架构设计和方案制定
- [ ] 代码实现和测试
- [ ] 文档更新和总结
```

#### Git 提交规范
```bash
# 统一的提交格式
[AI-TOOL] type: description

详细说明 AI 执行的具体操作
包括使用的工具和分析过程

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-authored-by: [AI-Tool] <ai@provider.com>
```

#### 质量控制八荣八耻
**八荣 (Honor)**:
- 以深入研究为荣 - 仔细查阅文档和最佳实践
- 以确认执行为荣 - 明确需求后再行动
- 以人工验证为荣 - 重要逻辑需人工确认
- 以复用接口为荣 - 优先使用现有成熟接口

**八耻 (Shame)**:
- 以猜测 API 为耻 - 盲目假设接口行为
- 以模糊执行为耻 - 需求不明确就开始编码
- 以假设逻辑为耻 - 未经确认就实现业务逻辑
- 以创建接口为耻 - 重复造轮子

## 🛠️ 专用命令系统

### prd-design 命令
**功能**: 生成完整技术方案，包括 ASCII 原型图和影响分析

```bash
prd-design "实现用户认证系统"
```

**特性**:
- **全面分析**: 深度分析需求和技术细节
- **可视化**: 使用 ASCII 图表直观展示
- **风险控制**: 确保不影响无关模块
- **实用性**: 提供可直接执行的方案

**输出内容**:
- 系统架构 ASCII 图
- 技术实现方案
- 影响范围分析
- 风险评估

### prd-execute 命令
**功能**: 执行技术方案，包括版本管理和完整开发流程

```bash
prd-execute "基于 prd-design 的方案实施用户认证"
```

**特性优势**:
- **自动化流程**: 从方案到实施的完整自动化
- **版本管控**: 规范的版本管理和变更追踪
- **风险控制**: 多重检查确保不影响现有功能
- **文档同步**: PRD 文档与代码实现保持同步
- **质量保证**: ultrathink 深度检查确保实施质量

**执行流程**:
1. 方案验证和可行性检查
2. 版本号自增和变更日志
3. PRD 文档更新
4. 任务分解和顺序执行
5. 质量检查和兼容性验证

## 📊 配置对比

| 特性 | base.md | CLAUDE.md | AGENTS.md | GEMINI.md |
|------|---------|-----------|-----------|-----------|
| **适用工具** | 通用 | Claude Code | OpenAI Codex | Google Gemini |
| **核心优势** | 开发原则 | 多模态理解 | 代码生成 | 深度推理 |
| **工作模式** | 通用流程 | 探索分析 | 实时补全 | 系统分析 |
| **提示策略** | 标准化 | 上下文丰富 | 注释驱动 | 分步推理 |
| **质量控制** | 八荣八耻 | 多轮验证 | 人工审查 | 多角度分析 |

## 🔧 高级用法

### 1. 多工具协作
```bash
# 使用不同 AI 工具处理不同阶段
# 需求分析 - Gemini (深度推理)
prd-design "用户管理系统需求"

# 代码生成 - OpenAI Codex (高效生成)
prd-execute "基于设计方案实现功能"

# 代码审查 - Claude Code (全面分析)
claude-review --codebase "./src" --focus "security,performance"
```

### 2. 项目级配置定制
```json
{
  "ai-config": {
    "primary-tool": "claude-code",
    "fallback-tools": ["openai-codex", "gemini"],
    "quality-gates": {
      "coverage": 80,
      "complexity": 10,
      "security-score": 8
    },
    "commit-format": "[ClaudeCode] {type}: {description}",
    "review-required": ["security", "performance", "architecture"]
  }
}
```

### 3. 团队协作配置
```yaml
# .ai-team-config.yml
team:
  default-reviewer: "claude-code"
  code-style: "linux-kernel"
  commit-convention: "ai-standard"

quality-standards:
  - name: "good-taste"
    description: "消除特殊情况，简化逻辑"
  - name: "no-userspace-break"
    description: "保持向后兼容性"
  - name: "pragmatic"
    description: "实用主义优于理论完美"

tools:
  claude:
    use-for: ["analysis", "review", "documentation"]
  openai:
    use-for: ["generation", "completion", "testing"]
  gemini:
    use-for: ["architecture", "optimization", "reasoning"]
```

## 🤝 贡献指南

### 贡献类型
- **配置优化** - 改进现有配置文件
- **新工具支持** - 添加新的 AI 工具配置
- **文档完善** - 补充使用说明和最佳实践
- **Bug 修复** - 修复配置错误或不兼容问题

### 提交规范
```bash
# 配置文件修改
[ClaudeCode] feat(config): add support for new AI tool

# 文档更新
[ClaudeCode] docs: update README with advanced usage

# Bug 修复
[ClaudeCode] fix(base): correct git commit format
```

### 开发流程
1. Fork 本仓库
2. 创建特性分支 `git checkout -b feature/new-tool-support`
3. 进行修改并测试
4. 提交变更 `git commit -m "[ClaudeCode] feat: add new feature"`
5. 推送分支 `git push origin feature/new-tool-support`
6. 创建 Pull Request

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