# 示例配置文件

此目录包含不同类型项目的 Claude Code 配置示例，帮助你快速开始配置新项目。

## 📁 可用示例

### Flutter 项目
**目录**: `flutter-project/`

**适用于**:
- Flutter 移动应用
- Flutter Web 应用
- Flutter Desktop 应用

**包含**:
- MVVM 架构配置
- Riverpod + Freezed 状态管理
- 单元测试规范
- UI 适配规范

**查看**: [flutter-project/CLAUDE.md](./flutter-project/CLAUDE.md)

---

### Node.js 项目
**目录**: `nodejs-project/`

**适用于**:
- Express.js 后端服务
- NestJS 应用
- Next.js 全栈应用

**包含**:
- TypeScript 配置
- MVC/Clean Architecture
- Jest 测试配置
- Prisma ORM 集成

**查看**: [nodejs-project/CLAUDE.md](./nodejs-project/CLAUDE.md)

---

### Python 项目
**目录**: `python-project/`

**适用于**:
- FastAPI 后端服务
- Django 应用
- Flask 应用
- 数据科学项目

**包含**:
- Clean Architecture
- FastAPI + SQLAlchemy
- pytest 测试配置
- Poetry 依赖管理

**查看**: [python-project/CLAUDE.md](./python-project/CLAUDE.md)

---

## 🚀 如何使用示例

### 方法 1：直接复制

```bash
# 复制示例配置到你的项目
cp examples/flutter-project/CLAUDE.md /path/to/your/project/

# 编辑配置，填写项目信息
vim /path/to/your/project/CLAUDE.md
```

### 方法 2：使用脚本

```bash
# 使用 link-global-config.sh 创建基础配置
cd /path/to/your/project
~/agent-rules/scripts/link-global-config.sh .

# 然后参考示例配置进行补充
```

### 方法 3：作为参考

直接查看示例，了解如何组织项目配置，然后手动编写自己的配置。

## 📝 自定义配置

### 必填项
- 项目名称
- 技术栈
- 架构模式

### 推荐填写
- 环境要求
- 常用开发命令
- 项目特定规范
- 提交规范
- 常见问题

### 可选项
- 外部文档引用
- 项目特定命令
- 工作流配置

## 🎯 配置优先级

```
项目 CLAUDE.local.md (最高)
  ↓
项目 CLAUDE.md
  ↓
全局 ~/.claude/CLAUDE.md
  ↓
agent-rules/core/base.md (最低)
```

**说明**:
- 上层配置会覆盖下层配置
- 项目配置优先于全局配置
- 本地私有配置优先于项目配置

## 💡 最佳实践

### 1. 保持简洁
只添加项目特定的配置，不要重复全局配置中已有的内容。

### 2. 使用引用
对于大型项目，将详细架构文档放在 `docs/` 目录，在 CLAUDE.md 中引用：

```markdown
## 外部文档引用
@./docs/architected.md
@./docs/api-design.md
```

### 3. 版本控制
- ✅ 提交 `CLAUDE.md` 到 Git（团队共享）
- ❌ 不要提交 `CLAUDE.local.md`（个人配置）

### 4. 定期更新
随着项目演进，及时更新配置文件：
- 新增的开发规范
- 变更的技术栈
- 更新的依赖版本

### 5. 文档化决策
在配置中记录重要的技术决策：

```markdown
## 技术决策记录

### 为什么选择 Riverpod 而不是 GetX？
- 更好的类型安全
- 更灵活的依赖注入
- 更符合 Flutter 官方推荐
```

## 🔗 相关资源

- [Agent Rules 主页](../)
- [核心配置文件](../core/)
- [共享命令](../commands/)
- [自动化脚本](../scripts/)

---

## 📮 贡献新示例

如果你有其他技术栈的配置示例，欢迎贡献！

### 贡献步骤

1. 在 `examples/` 创建新目录（如 `go-project/`）
2. 添加 `CLAUDE.md` 和 `CLAUDE.local.md`（可选）
3. 更新此 README
4. 提交 PR

### 示例要求

- 配置完整且可用
- 包含常用命令和规范
- 提供清晰的注释说明
- 遵循 agent-rules 的整体风格

---

**维护说明**：
- 定期审查和更新示例配置
- 确保示例反映最新的最佳实践
- 收集用户反馈改进示例质量
