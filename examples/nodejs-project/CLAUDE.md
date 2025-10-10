# Node.js 项目配置示例

## 继承全局配置

> 全局开发规范: ~/.claude/CLAUDE.md
> 本项目特定规范如下

## 项目信息

- **项目名称**: Node.js 示例项目
- **技术栈**: Node.js 20.x + TypeScript + Express + Prisma
- **架构模式**: MVC / Clean Architecture

## 环境要求

- Node.js: >= 20.x
- npm: >= 10.x
- PostgreSQL: >= 14.x

## 常用开发命令

```bash
# 安装依赖
npm install

# 开发模式
npm run dev

# 构建
npm run build

# 测试
npm test
npm run test:watch  # 监听模式
npm run test:coverage  # 覆盖率

# 数据库迁移
npx prisma migrate dev
npx prisma generate

# 代码检查
npm run lint
npm run format
```

## 项目架构规范

### 目录结构
```
src/
├── controllers/   # 控制器
├── services/      # 业务逻辑
├── repositories/  # 数据访问层
├── models/        # 数据模型
├── middlewares/   # 中间件
├── utils/         # 工具函数
└── types/         # TypeScript 类型定义
```

### 代码规范
- 使用 TypeScript 严格模式
- 遵循 ESLint 规则
- 使用 Prettier 格式化代码

### 错误处理
- 统一使用自定义错误类
- 全局错误处理中间件
- 详细的错误日志

## 测试规范

- 使用 Jest 进行单元测试
- 使用 Supertest 进行集成测试
- 目标覆盖率: > 80%

## 提交规范

- 使用 `/ai-commit` 命令
- 遵循 Conventional Commits
- 格式：`[ClaudeCode] type(scope): description`

## 环境变量

使用 `.env` 文件管理环境变量：

```env
# .env.example
NODE_ENV=development
PORT=3000
DATABASE_URL=postgresql://user:password@localhost:5432/dbname
JWT_SECRET=your-secret-key
```

## 常见问题

### 端口冲突
修改 `.env` 中的 PORT 变量

### 数据库连接问题
检查 DATABASE_URL 配置是否正确
