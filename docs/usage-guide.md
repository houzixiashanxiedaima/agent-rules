# Agent Rules 使用指南

本指南介绍如何在日常开发中使用 Agent Rules 提高效率。

## 🎯 日常工作流

### 1. 开始新功能开发

```bash
# 使用 prd-design 命令设计方案
/prd-design "实现用户登录功能"

# 审查方案后，使用 prd-execute 执行
/prd-execute "按照设计方案实现登录功能"
```

### 2. 代码提交

```bash
# 使用 ai-commit 命令规范提交
/ai-commit

# 或手动提交
git add .
git commit -m "[ClaudeCode] feat: add user login feature"
```

### 3. 代码评审

```bash
# 使用 code-reviewer agent
# Claude Code 会自动在适当时机调用
```

## 📝 自定义命令使用

### 查看可用命令

查看 `commands/` 目录下的所有命令：
- `prd-design.md` - 方案设计
- `prd-execute.md` - 方案执行
- `ai-commit.md` - 智能提交

### 创建自定义命令

在项目的 `.claude/commands/` 目录创建 `.md` 文件：

```markdown
# my-command

## 功能描述
[描述命令功能]

## 使用方式
\`\`\`bash
/my-command "arguments"
\`\`\`

## 执行流程
1. 步骤1
2. 步骤2
```

## 🤖 Agent 使用

Agent Rules 提供了多个专业 Agent：

- **code-reviewer**: 代码评审
- **architect-analyst**: 架构设计
- **task-planner**: 任务规划
- **debugger**: 问题调试
- **summarizer**: 项目总结

Claude Code 会根据任务自动选择合适的 Agent。

## 💡 最佳实践

### 配置管理

1. **全局配置**: 通用规范和工具配置
2. **项目配置**: 项目特定规范
3. **本地配置**: 个人开发偏好（不提交）

### 提交规范

- 使用 `/ai-commit` 命令
- 提交消息必须英文
- 遵循 Conventional Commits 格式

### 工作流程

1. 需求分析 → 方案设计
2. 方案执行 → 代码实现
3. 代码评审 → 问题修复
4. 提交代码 → 文档更新

## 🔗 相关资源

- [命令参考](./command-reference.md)
- [最佳实践](./best-practices.md)
- [示例配置](../examples/)

---

更多使用技巧请查看项目 README 和相关文档。
