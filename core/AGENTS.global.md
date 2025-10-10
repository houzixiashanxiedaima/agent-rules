# OpenAI Codex/Copilot 全局配置

> 此文件应通过软链接放置在 ~/.claude/AGENTS.md（如果使用 OpenAI 工具）

## 引用基础配置
@./base.md
@./tooling.md

## OpenAI Codex 特定配置

### 代码生成模式
- 实时代码补全
- 上下文感知生成
- 多语言支持

### 注释驱动开发
- 通过注释描述功能
- 自动生成实现代码
- 测试用例生成

### 最佳实践
- 清晰的函数和变量命名
- 详细的注释说明
- 遵循项目代码风格

## MCP 集成
- **Context7**：访问最新第三方库文档
- 其他 MCP 服务器配置

## 提交规范

使用 `[OpenAI]` 或 `[Copilot]` 前缀标识 AI 生成的提交：

```
[OpenAI] feat: add user authentication module
[Copilot] fix: resolve memory leak in data processing
```
