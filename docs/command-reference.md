# 命令参考

Agent Rules 提供的所有命令的完整参考。

## 📋 可用命令

### prd-design

**功能**: 生成完整的技术方案，包括 ASCII 原型图和影响分析

**使用**:
```bash
/prd-design "需求描述"
```

**输出**:
- 系统架构 ASCII 图
- 技术实现方案
- 影响范围分析
- 风险评估

**详细文档**: [commands/prd-design.md](../commands/prd-design.md)

---

### prd-execute

**功能**: 执行技术方案，包括版本管理和完整开发流程

**使用**:
```bash
/prd-execute "方案描述"
```

**流程**:
1. 方案验证
2. 版本管理
3. PRD 文档更新
4. 任务执行
5. 质量检查

**详细文档**: [commands/prd-execute.md](../commands/prd-execute.md)

---

### ai-commit

**功能**: 创建符合规范的 Git 提交

**使用**:
```bash
/ai-commit
```

**流程**:
1. 检查工作目录
2. 代码格式化
3. 暂存更改
4. 生成提交消息
5. 创建提交

**详细文档**: [commands/ai-commit.md](../commands/ai-commit.md)

---

## 🔧 命令选项

### 通用选项

所有命令都支持以下行为：
- 自动检测项目类型
- 读取项目配置
- 应用全局规范

### 项目特定命令

你可以在项目的 `.claude/commands/` 目录创建自定义命令。

## 📝 命令开发指南

### 创建新命令

1. 在 `commands/` 创建 `.md` 文件
2. 按照模板编写命令文档
3. 更新 `commands/README.md`
4. 提交到 Git

### 命令模板

```markdown
# command-name

## 功能描述
[简短描述]

## 使用方式
\`\`\`bash
/command-name "arguments"
\`\`\`

## 参数
- `ARG`: 参数说明

## 执行流程
1. 步骤1
2. 步骤2

## 示例
[使用示例]
```

## 🔗 相关资源

- [使用指南](./usage-guide.md)
- [最佳实践](./best-practices.md)
- [命令目录](../commands/)
