# Claude Code 专用配置

> 基于 [base.md](base.md) 通用配置的Claude Code特定扩展

## Claude Code 特性

### 工具集成优势
- **多模态能力** - 支持图片、文档、代码多种输入格式
- **上下文理解** - 超长上下文处理能力
- **代码推理** - 深度代码逻辑分析和优化建议
- **实时协作** - 与开发环境深度集成

### Claude Code专用工具

#### 文档和搜索工具
- **Read** - 读取本地文件，支持多种格式
- **Glob** - 文件模式匹配搜索
- **Grep** - 基于ripgrep的强大文本搜索
- **WebFetch** - 获取在线文档和资源
- **WebSearch** - 实时网络搜索能力

#### 代码操作工具
- **Edit** - 精确代码编辑
- **MultiEdit** - 批量文件修改
- **Write** - 创建新文件
- **TodoWrite** - 任务管理和进度跟踪

#### 项目管理工具
- **Bash** - 执行终端命令
- **Task** - 启动专用代理处理复杂任务
- **NotebookEdit** - Jupyter笔记本编辑

#### 外部集成
- **Context7** - 最新技术文档访问
- **GitHub搜索** - 实际代码示例查找
- **MCP集成** - Feishu、文档等外部服务

## Claude Code工作流程

### 项目分析阶段
1. **项目探索**
   ```bash
   # 使用Glob快速了解项目结构
   - **/*.md      # 文档文件
   - src/**/*.js  # 源代码文件
   - **/*.json    # 配置文件
   ```

2. **代码理解**
   ```bash
   # 使用Grep进行代码搜索
   - 搜索关键函数定义
   - 查找依赖关系
   - 分析架构模式
   ```

3. **需求确认**
   - 使用Read工具查看需求文档
   - WebFetch获取相关技术文档
   - Context7查询最新API文档

### 开发实施阶段
1. **任务管理**
   ```markdown
   # 使用TodoWrite创建任务清单
   - [ ] 需求分析
   - [ ] 架构设计
   - [ ] 代码实现
   - [ ] 测试验证
   ```

2. **代码实现**
   - **单文件修改** - 使用Edit工具
   - **多文件批量修改** - 使用MultiEdit工具
   - **新文件创建** - 使用Write工具

3. **质量保证**
   ```bash
   # 使用Bash执行质量检查
   npm run lint        # 代码规范检查
   npm run test        # 单元测试
   npm run build       # 构建验证
   ```

### 协作和部署
1. **版本控制**
   ```bash
   # Git操作标准流程
   git status          # 检查状态
   git add .           # 暂存修改
   git commit -m "[ClaudeCode] feat: implement user authentication"
   ```

2. **文档同步**
   - 自动更新README.md
   - 更新API文档
   - 同步PRD文档

## Claude Code专用命令扩展

### claude-analyze 命令
**功能**: 深度分析项目结构和代码质量

```bash
claude-analyze [project-path]
```

**执行流程**:
1. 使用Glob扫描项目结构
2. 使用Grep分析代码模式
3. 生成项目分析报告
4. 提供优化建议

### claude-refactor 命令
**功能**: 智能代码重构

```bash
claude-refactor [target] [strategy]
```

**重构策略**:
- **extract-function** - 提取函数
- **simplify-logic** - 简化逻辑
- **optimize-imports** - 优化导入
- **reduce-complexity** - 降低复杂度

### claude-docs 命令
**功能**: 自动生成和更新文档

```bash
claude-docs [type] [target]
```

**文档类型**:
- **api** - API文档
- **readme** - README文件
- **changelog** - 变更日志
- **architecture** - 架构文档

## Claude Code最佳实践

### 提示词优化
- **上下文提供** - 充分利用长上下文能力
- **明确指令** - 具体说明期望的输出格式
- **渐进式请求** - 复杂任务分解为多个步骤

### 代码审查模式
```markdown
# Claude Code代码审查检查点
- [ ] 代码逻辑正确性
- [ ] 性能优化机会
- [ ] 安全隐患检查
- [ ] 可维护性评估
- [ ] 测试覆盖度
```

### 错误处理策略
1. **三次尝试原则** - 自动重试失败操作
2. **渐进降级** - 从复杂方案到简单方案
3. **用户确认** - 关键决策需要用户确认
4. **详细日志** - 记录操作过程和错误信息

## 特定于Claude Code的Git提交规范

### 提交消息格式
```
[ClaudeCode] type(scope): description

详细说明Claude Code执行的具体操作
包括使用的工具和分析过程

Closes #issue-number
```

### 示例提交消息
```bash
[ClaudeCode] feat(auth): implement JWT authentication system

使用Claude Code分析现有架构后，实现了基于JWT的身份验证系统：
- 使用Context7查询最新JWT最佳实践
- 通过GitHub搜索参考了10+开源项目实现
- 使用MultiEdit批量更新了6个相关文件
- 通过Bash执行了完整的测试流程

性能提升: 登录响应时间减少40%
安全加强: 添加了token刷新和失效机制

Closes #123
```

## 环境配置

### 必需工具
```bash
# 确保以下工具已安装
npm install -g typescript   # TypeScript支持
pip install ruff            # Python代码检查
cargo install ripgrep       # 文本搜索
```

### 项目模板
```json
{
  "name": "claude-code-project",
  "scripts": {
    "lint": "eslint src/",
    "test": "jest",
    "build": "webpack",
    "dev": "webpack-dev-server",
    "claude:analyze": "node scripts/claude-analyze.js",
    "claude:refactor": "node scripts/claude-refactor.js"
  }
}
```

### 配置文件示例
```javascript
// .claude-config.js
module.exports = {
  projectType: 'webapp',
  framework: 'react',
  testFramework: 'jest',
  linting: true,
  formatting: 'prettier',
  commitPrefix: '[ClaudeCode]',
  autoDocUpdate: true,
  qualityGates: {
    coverage: 80,
    complexity: 10,
    duplication: 5
  }
};
```

---

# 总结

此配置专门为Claude Code优化，充分利用其：
- **多模态理解能力** - 处理各种格式输入
- **深度分析能力** - 理解复杂代码逻辑
- **工具集成优势** - 与开发环境无缝协作
- **长上下文能力** - 处理大型项目

通过引用`base.md`获得通用配置，然后添加Claude Code特有的工具和工作流程，实现最佳开发体验。