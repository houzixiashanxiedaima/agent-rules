# Python 项目配置示例

## 继承全局配置

> 全局开发规范: ~/.claude/CLAUDE.md
> 本项目特定规范如下

## 项目信息

- **项目名称**: Python 示例项目
- **技术栈**: Python 3.11+ + FastAPI + SQLAlchemy + Pydantic
- **架构模式**: Clean Architecture / Hexagonal

## 环境要求

- Python: >= 3.11
- Poetry: >= 1.7 (推荐) 或 pip
- PostgreSQL: >= 14.x

## 常用开发命令

```bash
# 使用 Poetry
poetry install                  # 安装依赖
poetry run python main.py       # 运行应用
poetry run pytest               # 运行测试
poetry run black .              # 代码格式化
poetry run ruff check .         # 代码检查

# 使用 pip + venv
python -m venv venv
source venv/bin/activate        # Linux/macOS
# venv\Scripts\activate         # Windows
pip install -r requirements.txt

# 运行应用
python main.py
uvicorn main:app --reload       # FastAPI 热重载

# 测试
pytest
pytest --cov=src --cov-report=html  # 覆盖率报告

# 代码质量
black .                         # 格式化
ruff check .                    # Linter
mypy .                          # 类型检查
```

## 项目架构规范

### 目录结构
```
src/
├── domain/         # 领域层（业务逻辑）
│   ├── entities/
│   ├── use_cases/
│   └── interfaces/
├── infrastructure/ # 基础设施层
│   ├── database/
│   ├── repositories/
│   └── external/
├── presentation/   # 表现层
│   ├── api/
│   ├── schemas/
│   └── dependencies/
└── core/           # 核心配置
    ├── config.py
    └── exceptions.py
```

### 代码规范
- 遵循 PEP 8 风格指南
- 使用 Black 进行代码格式化
- 使用 Ruff 进行代码检查
- 使用类型注解（Type Hints）
- 使用 Pydantic 进行数据验证

### 依赖注入
使用 FastAPI 的依赖注入系统

## 测试规范

- 使用 pytest 进行测试
- 使用 pytest-asyncio 处理异步测试
- 使用 pytest-cov 生成覆盖率报告
- 目标覆盖率: > 85%

### 测试组织
```
tests/
├── unit/           # 单元测试
├── integration/    # 集成测试
├── e2e/            # 端到端测试
└── conftest.py     # 共享 fixtures
```

## 提交规范

- 使用 `/ai-commit` 命令
- 格式：`[ClaudeCode] type: description`
- 类型：feat, fix, refactor, test, docs, chore

## 环境变量

使用 `.env` 文件或 `config.py`:

```python
# config.py
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    app_name: str = "My App"
    database_url: str
    secret_key: str

    class Config:
        env_file = ".env"
```

## 依赖管理

### 使用 Poetry（推荐）
```toml
# pyproject.toml
[tool.poetry]
name = "my-project"
version = "0.1.0"

[tool.poetry.dependencies]
python = "^3.11"
fastapi = "^0.104.0"
sqlalchemy = "^2.0.0"
```

### 使用 pip
```txt
# requirements.txt
fastapi>=0.104.0
sqlalchemy>=2.0.0
pydantic>=2.0.0
```

## 常见问题

### 虚拟环境问题
确保激活正确的虚拟环境

### 依赖冲突
使用 Poetry 解决依赖冲突，或者创建新的虚拟环境
