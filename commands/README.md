# 共享命令目录

此目录包含可在多个项目中复用的 Claude Code 自定义命令。

## 📋 可用命令

### prd-design
**功能**：生成完整的技术方案，包括 ASCII 原型图和影响分析

**使用场景**：
- 需求分析和技术方案设计
- 系统架构设计
- 影响范围评估

**详细文档**：[prd-design.md](./prd-design.md)

---

### prd-execute
**功能**：执行技术方案，包括版本管理和完整开发流程

**使用场景**：
- 基于设计方案实施开发
- 自动化版本管理
- 任务分解和执行

**详细文档**：[prd-execute.md](./prd-execute.md)

---

### ai-commit
**功能**：创建符合规范的 Git 提交

**使用场景**：
- 自动化 Git 提交流程
- 规范化提交消息
- 代码格式化和暂存

**详细文档**：[ai-commit.md](./ai-commit.md)

---

## 🔧 如何在项目中使用

### 方法 1：直接引用（推荐）

在项目的 `CLAUDE.md` 中引用：

```markdown
# 项目配置

## 引用共享命令
@/path/to/agent-rules/commands/prd-design.md
@/path/to/agent-rules/commands/prd-execute.md
@/path/to/agent-rules/commands/ai-commit.md
```

### 方法 2：复制到项目

将需要的命令复制到项目的 `.claude/commands/` 目录：

```bash
cp /path/to/agent-rules/commands/ai-commit.md ./.claude/commands/
```

### 方法 3：软链接

创建软链接（适合经常更新的命令）：

```bash
ln -s /path/to/agent-rules/commands/ai-commit.md ./.claude/commands/ai-commit.md
```

## 📝 创建新命令

### 命令文件结构

```markdown
# 命令名称

简短描述

## 功能描述
详细说明命令的功能

## 使用方式
\`\`\`bash
/command-name "arguments"
\`\`\`

## 参数说明
- `ARGUMENT`: 参数描述

## 执行流程
1. 步骤 1
2. 步骤 2
3. 步骤 3

## 示例
具体的使用示例

## 注意事项
使用时的注意事项
```

### 命名规范

- 文件名：`command-name.md`（小写，连字符分隔）
- 命令调用：`/command-name`
- 一个文件一个命令

### 提交新命令

1. 在 `commands/` 目录创建新的 `.md` 文件
2. 按照结构模板编写命令
3. 更新此 README.md 添加命令说明
4. 提交到 Git

```bash
git add commands/new-command.md
git commit -m "[ClaudeCode] feat: add new-command for X functionality"
```

## 🎯 最佳实践

### 1. 命令应该是可复用的
- 不要包含项目特定的硬编码值
- 使用参数传递项目特定信息
- 设计通用的工作流程

### 2. 提供清晰的文档
- 详细的功能描述
- 完整的使用示例
- 常见问题解答

### 3. 测试命令
在多个项目中测试命令，确保：
- 参数处理正确
- 错误处理完善
- 输出格式一致

### 4. 版本控制
- 重大修改时增加版本号
- 在文档中记录变更历史
- 保持向后兼容性

## 🔗 相关资源

- [Claude Code 文档](https://docs.claude.com/en/docs/claude-code)
- [自定义命令指南](https://docs.claude.com/en/docs/claude-code/custom-commands)
- [Agent Rules 项目](../)

---

**维护说明**：
- 每次添加新命令后更新此 README
- 定期审查和更新现有命令
- 收集用户反馈改进命令设计
