#!/bin/bash
# 为新项目创建配置文件
# 使用方法: ./link-global-config.sh [project-path]

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 获取项目路径
PROJECT_DIR="${1:-.}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENT_RULES_DIR="$(dirname "$SCRIPT_DIR")"

# 转换为绝对路径
PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"

echo -e "${BLUE}🚀 为项目创建配置文件...${NC}"
echo ""
echo -e "${YELLOW}项目路径: $PROJECT_DIR${NC}"
echo ""

# 检查项目目录是否存在
if [ ! -d "$PROJECT_DIR" ]; then
    echo -e "${RED}❌ 项目目录不存在: $PROJECT_DIR${NC}"
    exit 1
fi

# 检查是否已经有 CLAUDE.md
if [ -f "$PROJECT_DIR/CLAUDE.md" ]; then
    echo -e "${YELLOW}⚠️  CLAUDE.md 已存在${NC}"
    read -p "是否覆盖？(y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}取消操作${NC}"
        exit 0
    fi
    # 备份现有文件
    BACKUP_FILE="$PROJECT_DIR/CLAUDE.md.backup.$(date +%Y%m%d_%H%M%S)"
    mv "$PROJECT_DIR/CLAUDE.md" "$BACKUP_FILE"
    echo -e "${GREEN}✅ 已备份到: $BACKUP_FILE${NC}"
    echo ""
fi

# 尝试检测项目类型
PROJECT_TYPE="unknown"
if [ -f "$PROJECT_DIR/pubspec.yaml" ]; then
    PROJECT_TYPE="flutter"
elif [ -f "$PROJECT_DIR/package.json" ]; then
    PROJECT_TYPE="nodejs"
elif [ -f "$PROJECT_DIR/requirements.txt" ] || [ -f "$PROJECT_DIR/setup.py" ]; then
    PROJECT_TYPE="python"
elif [ -f "$PROJECT_DIR/go.mod" ]; then
    PROJECT_TYPE="go"
fi

echo -e "${BLUE}📋 检测到项目类型: $PROJECT_TYPE${NC}"
echo ""

# 创建项目 CLAUDE.md
echo -e "${BLUE}📝 创建 CLAUDE.md...${NC}"

cat > "$PROJECT_DIR/CLAUDE.md" <<EOF
# 项目配置

## 继承全局配置

> 全局开发规范: ~/.claude/CLAUDE.md (软链接到 agent-rules/core/CLAUDE.global.md)
> 本项目特定规范如下（覆盖全局配置）

## 项目信息

- **项目名称**: [填写项目名称]
- **技术栈**: [填写技术栈]
- **架构模式**: [填写架构模式，如 MVVM/MVC/MVP]

## 项目特定规范

### 环境要求
[填写环境要求，如 Flutter SDK、Node.js 版本等]

### 常用命令
\`\`\`bash
# 示例命令
# flutter clean && flutter pub get
# npm install
# pip install -r requirements.txt
\`\`\`

### 提交规范（如有项目特定要求）
- 遵循全局 Git 提交规范
- [添加项目特定的提交要求]

### 代码规范
[填写项目特定的代码规范]

## 外部文档引用

# 如果有项目架构文档，在此引用
# @./docs/architected.md

## 项目特定命令

# 如果有项目特定的自定义命令，在此引用
# @./.claude/commands/custom-command.md

## 常见问题

[记录项目开发中的常见问题和解决方案]
EOF

echo -e "${GREEN}✅ CLAUDE.md 创建成功${NC}"
echo ""

# 创建 .gitignore（如果不存在）
if [ ! -f "$PROJECT_DIR/.gitignore" ]; then
    echo -e "${BLUE}📝 创建 .gitignore...${NC}"
    cat > "$PROJECT_DIR/.gitignore" <<EOF
# Claude Code 私有配置
CLAUDE.local.md
EOF
    echo -e "${GREEN}✅ .gitignore 创建成功${NC}"
else
    # 检查是否已经包含 CLAUDE.local.md
    if ! grep -q "CLAUDE.local.md" "$PROJECT_DIR/.gitignore"; then
        echo -e "${BLUE}📝 更新 .gitignore...${NC}"
        echo "" >> "$PROJECT_DIR/.gitignore"
        echo "# Claude Code 私有配置" >> "$PROJECT_DIR/.gitignore"
        echo "CLAUDE.local.md" >> "$PROJECT_DIR/.gitignore"
        echo -e "${GREEN}✅ .gitignore 已更新${NC}"
    else
        echo -e "${YELLOW}ℹ️  .gitignore 已包含 CLAUDE.local.md${NC}"
    fi
fi
echo ""

# 创建 CLAUDE.local.md 模板
if [ ! -f "$PROJECT_DIR/CLAUDE.local.md" ]; then
    echo -e "${BLUE}📝 创建 CLAUDE.local.md 模板...${NC}"
    cat > "$PROJECT_DIR/CLAUDE.local.md" <<EOF
# 本地私有配置

> 此文件不会被提交到 Git，用于存放个人开发环境的配置

## 本地工具偏好

# 使用 fvm 管理 Flutter
# - 使用 'fvm flutter' 替代 'flutter'

## 本地环境变量

# API_KEY=your-local-api-key
# DATABASE_URL=localhost:5432

## 临时开发规则

# 在此添加临时的、实验性的开发规则
# 这些规则不会影响团队其他成员
EOF
    echo -e "${GREEN}✅ CLAUDE.local.md 模板创建成功${NC}"
else
    echo -e "${YELLOW}ℹ️  CLAUDE.local.md 已存在，跳过创建${NC}"
fi
echo ""

# 显示完成信息
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✨ 项目配置完成！${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BLUE}📁 创建的文件：${NC}"
echo "  ✅ $PROJECT_DIR/CLAUDE.md"
echo "  ✅ $PROJECT_DIR/CLAUDE.local.md (私有配置)"
echo "  ✅ $PROJECT_DIR/.gitignore (更新/创建)"
echo ""
echo -e "${BLUE}📚 下一步：${NC}"
echo "  1. 编辑 CLAUDE.md，填写项目信息和特定规范"
echo "  2. 在 CLAUDE.local.md 中添加本地开发配置（可选）"
echo "  3. 提交 CLAUDE.md 到 Git："
echo "     git add CLAUDE.md .gitignore"
echo "     git commit -m '[ClaudeCode] docs: add project configuration'"
echo ""
echo -e "${YELLOW}💡 提示：${NC}"
echo "  - CLAUDE.md 会被提交到 Git（团队共享）"
echo "  - CLAUDE.local.md 不会被提交（个人配置）"
echo "  - 项目配置会覆盖全局配置中的同名项"
echo ""

# 如果是 Flutter 项目，额外提示
if [ "$PROJECT_TYPE" = "flutter" ]; then
    echo -e "${BLUE}🎯 Flutter 项目特别提示：${NC}"
    echo "  - 记得在 CLAUDE.md 中指定 Flutter SDK 版本"
    echo "  - 添加常用命令如 build_runner、代码生成等"
    echo "  - 如果使用 fvm，在 CLAUDE.local.md 中配置"
    echo ""
fi
