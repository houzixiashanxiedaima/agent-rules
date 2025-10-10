# ai-commit 命令

创建符合规范的 Git 提交

## 功能描述

自动化创建规范的 Git 提交消息，包括代码格式化、暂存更改、生成提交消息等完整流程。

## 使用方式

```bash
/ai-commit
```

## 执行流程

### 1. 检查工作目录状态
- 运行 `git status` 查看未跟踪和修改的文件
- 运行 `git diff` 查看暂存和未暂存的更改
- 运行 `git log` 查看最近的提交历史，学习提交风格

### 2. 代码格式化（根据项目类型）
- **Flutter/Dart**: `dart format .`
- **JavaScript/TypeScript**: `npm run format` 或 `prettier --write .`
- **Python**: `black .`
- **Go**: `go fmt ./...`

### 3. 暂存所有更改
- 分析哪些文件应该被暂存
- 排除敏感文件（.env, credentials.json 等）
- 执行 `git add` 暂存相关文件

### 4. 生成提交消息
- 分析暂存的更改类型（新功能/修复/重构等）
- 生成简洁的英文提交消息
- 包含详细说明（如有必要）

### 5. 创建提交
使用标准格式创建提交：

```bash
git commit -m "$(cat <<'EOF'
[ClaudeCode] type: brief description

Detailed explanation if needed.

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"
```

### 6. 验证提交
- 运行 `git status` 确认提交成功
- 运行 `git log -1` 显示刚创建的提交

## 提交消息格式

### 基本格式
```
[AI-TOOL] type: brief description in English

Detailed explanation (optional, can be in Chinese or English)

🤖 Generated with [Tool Name]
Co-Authored-By: [AI Name] <email@example.com>
```

### AI 工具标签
- `[ClaudeCode]` - Claude Code
- `[Copilot]` - GitHub Copilot
- `[Gemini]` - Google Gemini
- `[OpenAI]` - OpenAI Codex

### 提交类型（type）
- `feat` - 新功能
- `fix` - Bug 修复
- `refactor` - 重构代码
- `style` - 代码格式化
- `docs` - 文档更新
- `test` - 测试相关
- `chore` - 构建或辅助工具变动
- `perf` - 性能优化

## 示例

### 示例 1：新增功能
```
[ClaudeCode] feat: add user authentication module

Implemented JWT-based authentication with login and logout functionality.
Includes token validation and refresh mechanism.

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>
```

### 示例 2：Bug 修复
```
[ClaudeCode] fix: resolve null pointer exception in payment

Fixed NPE that occurred when processing refunds without transaction ID.
Added null checks and error handling.

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>
```

### 示例 3：重构
```
[ClaudeCode] refactor: migrate GetX to Riverpod in user module

Replaced GetX state management with Riverpod + Freezed.
Updated all related tests and documentation.

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>
```

### 示例 4：代码格式化
```
[ClaudeCode] style: apply dart format to entire codebase

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>
```

## 注意事项

### 敏感文件检查
在提交前，检查以下敏感文件：
- `.env` 文件
- `credentials.json`
- API 密钥文件
- 私钥文件

**如果用户明确要求提交这些文件，应该警告并确认。**

### Pre-commit Hook 处理
如果提交失败是因为 pre-commit hook 修改了文件：

1. 检查提交作者：`git log -1 --format='%an %ae'`
2. 检查是否已推送：`git status`
3. 如果满足条件，使用 `--amend` 修正提交
4. 否则创建新提交

### 提交消息语言
- **标题行**：必须使用英文
- **详细说明**：可以使用中文或英文

### 禁止操作
- ❌ 不要使用 `--no-verify` 跳过 hooks
- ❌ 不要使用 `--force` 强制推送到 main/master
- ❌ 不要修改其他开发者的提交（`git commit --amend` 仅用于自己的提交）

## 工作流集成

### 与 prd-execute 配合
```bash
# 1. 执行开发任务
/prd-execute "实现用户登录功能"

# 2. 开发完成后自动提交
/ai-commit
```

### 与代码评审配合
```bash
# 1. 编写代码
# 2. 代码评审
/code-review

# 3. 修复问题后提交
/ai-commit
```

## 故障排除

### 问题：提交消息格式错误
**解决方案**：使用 HEREDOC 格式，确保多行消息正确传递

### 问题：Pre-commit hook 失败
**解决方案**：
1. 查看 hook 输出的错误信息
2. 修复相关问题
3. 重新运行 `/ai-commit`

### 问题：合并冲突
**解决方案**：
1. 手动解决冲突
2. 使用 `git add` 标记为已解决
3. 继续提交流程

---

**最佳实践**：
- 频繁提交，每个逻辑单元一个提交
- 提交消息要清晰描述"为什么"而不仅是"是什么"
- 提交前运行测试确保代码质量
