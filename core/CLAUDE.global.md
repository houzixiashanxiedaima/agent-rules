# Claude Code 全局配置

> 此文件应通过软链接放置在 ~/.claude/CLAUDE.md

## 引用基础配置

@./base.md

## Claude Code 特定配置

### ultrathink 模式
- 深度思考每一次文件操作
- 不吝啬使用智能，追求卓越
- 推进人类文明发展
- ultrathink! ultrathink! ultrathink!

## 自定义命令

位于 `../commands/` 目录：

- **prd-design**: 生成技术方案，包括 ASCII 原型图和影响分析
- **prd-execute**: 执行技术方案，包括版本管理和开发流程

使用方式：查看各命令的 .md 文档

## 专业 Agents

位于 `../agents/` 目录，Claude Code 会根据任务自动调用：

- **code-reviewer**: 代码评审专家
- **architect-analyst**: 架构设计专家
- **task-planner**: 任务规划专家
- **task-executor**: 任务执行专家
- **summarizer**: 项目总结专家
- **debugger**: 调试问题专家
- **requirement-analyst**: 需求分析专家
- **workflow-orchestrator**: 工作流编排专家
- **gemini-analyzer**: 大型代码库分析专家

## Workflow 工作流

位于 `../workflow/` 目录，定义 Agents 协作流程。

Workflow-orchestrator 会协调各个 Agent 按以下顺序工作：
1. requirement-analyst → 需求分析
2. architect-analyst → 架构设计
3. task-planner → 任务规划
4. task-executor → 开发执行
5. code-reviewer → 代码评审
6. debugger → 问题修复（如需要）
7. summarizer → 项目总结

## 问题解决

- 所有问题，尝试 3 次还无法解决，就抛出来让用户决策
