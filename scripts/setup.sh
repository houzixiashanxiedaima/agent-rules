#!/bin/bash
# Agent Rules 自动配置脚本
# 用于首次配置全局 Claude Code 和 OpenAI 配置

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 配置路径
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENT_RULES_DIR="$(dirname "$SCRIPT_DIR")"
CLAUDE_CONFIG_DIR="$HOME/.claude"

echo -e "${BLUE}🚀 开始配置 Agent Rules...${NC}"
echo ""

# 显示配置信息
echo -e "${YELLOW}配置信息：${NC}"
echo "  Agent Rules 目录: $AGENT_RULES_DIR"
echo "  Claude 配置目录: $CLAUDE_CONFIG_DIR"
echo ""

# 1. 创建 .claude 目录
if [ ! -d "$CLAUDE_CONFIG_DIR" ]; then
    echo -e "${BLUE}📁 创建 Claude 配置目录...${NC}"
    mkdir -p "$CLAUDE_CONFIG_DIR"
    echo -e "${GREEN}✅ 目录创建成功${NC}"
else
    echo -e "${YELLOW}⚠️  Claude 配置目录已存在${NC}"
fi
echo ""

# 2. 备份现有配置（如果存在）
if [ -f "$CLAUDE_CONFIG_DIR/CLAUDE.md" ] && [ ! -L "$CLAUDE_CONFIG_DIR/CLAUDE.md" ]; then
    BACKUP_FILE="$CLAUDE_CONFIG_DIR/CLAUDE.md.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}📦 备份现有 CLAUDE.md...${NC}"
    mv "$CLAUDE_CONFIG_DIR/CLAUDE.md" "$BACKUP_FILE"
    echo -e "${GREEN}✅ 备份到: $BACKUP_FILE${NC}"
    echo ""
fi

if [ -f "$CLAUDE_CONFIG_DIR/AGENTS.md" ] && [ ! -L "$CLAUDE_CONFIG_DIR/AGENTS.md" ]; then
    BACKUP_FILE="$CLAUDE_CONFIG_DIR/AGENTS.md.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}📦 备份现有 AGENTS.md...${NC}"
    mv "$CLAUDE_CONFIG_DIR/AGENTS.md" "$BACKUP_FILE"
    echo -e "${GREEN}✅ 备份到: $BACKUP_FILE${NC}"
    echo ""
fi

# 3. 创建软链接
echo -e "${BLUE}🔗 创建全局配置软链接...${NC}"

# 删除现有软链接（如果存在）
[ -L "$CLAUDE_CONFIG_DIR/CLAUDE.md" ] && rm "$CLAUDE_CONFIG_DIR/CLAUDE.md"
[ -L "$CLAUDE_CONFIG_DIR/AGENTS.md" ] && rm "$CLAUDE_CONFIG_DIR/AGENTS.md"

# 创建新的软链接
ln -s "$AGENT_RULES_DIR/core/CLAUDE.global.md" "$CLAUDE_CONFIG_DIR/CLAUDE.md"
ln -s "$AGENT_RULES_DIR/core/AGENTS.global.md" "$CLAUDE_CONFIG_DIR/AGENTS.md"

echo -e "${GREEN}✅ 软链接创建成功${NC}"
echo ""

# 4. 验证软链接
echo -e "${BLUE}🔍 验证软链接...${NC}"

if [ -L "$CLAUDE_CONFIG_DIR/CLAUDE.md" ]; then
    TARGET=$(readlink "$CLAUDE_CONFIG_DIR/CLAUDE.md")
    echo -e "${GREEN}✅ CLAUDE.md → $TARGET${NC}"
else
    echo -e "${RED}❌ CLAUDE.md 软链接创建失败${NC}"
    exit 1
fi

if [ -L "$CLAUDE_CONFIG_DIR/AGENTS.md" ]; then
    TARGET=$(readlink "$CLAUDE_CONFIG_DIR/AGENTS.md")
    echo -e "${GREEN}✅ AGENTS.md → $TARGET${NC}"
else
    echo -e "${RED}❌ AGENTS.md 软链接创建失败${NC}"
    exit 1
fi

echo ""

# 5. 显示完成信息
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✨ 配置完成！${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BLUE}📁 配置文件位置：${NC}"
echo "  全局 Claude 配置: $CLAUDE_CONFIG_DIR/CLAUDE.md"
echo "  → $AGENT_RULES_DIR/core/CLAUDE.global.md"
echo ""
echo "  全局 Agents 配置: $CLAUDE_CONFIG_DIR/AGENTS.md"
echo "  → $AGENT_RULES_DIR/core/AGENTS.global.md"
echo ""
echo -e "${BLUE}📚 下一步：${NC}"
echo "  1. 在项目中创建 CLAUDE.md（项目特定配置）"
echo "  2. 在项目中创建 CLAUDE.local.md（私有配置，不提交）"
echo "  3. 运行 'scripts/link-global-config.sh <project-path>' 快速配置新项目"
echo "  4. 开始使用 Claude Code！"
echo ""
echo -e "${YELLOW}💡 提示：${NC}"
echo "  - 全局配置修改后会自动应用到所有项目"
echo "  - 项目配置会覆盖全局配置（项目配置优先级更高）"
echo "  - 使用 CLAUDE.local.md 存放不想提交的私有配置"
echo ""
