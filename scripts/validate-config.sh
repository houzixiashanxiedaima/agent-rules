#!/bin/bash
# 验证 Agent Rules 配置是否正确设置

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENT_RULES_DIR="$(dirname "$SCRIPT_DIR")"
CLAUDE_CONFIG_DIR="$HOME/.claude"

echo -e "${BLUE}🔍 验证 Agent Rules 配置...${NC}"
echo ""

ERRORS=0
WARNINGS=0

# 1. 检查 agent-rules 目录结构
echo -e "${BLUE}[1/6] 检查目录结构...${NC}"

REQUIRED_DIRS=(
    "core"
    "agents"
    "commands"
    "scripts"
    "examples"
    "docs"
    "workflow"
)

for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$AGENT_RULES_DIR/$dir" ]; then
        echo -e "  ${GREEN}✅ $dir/${NC}"
    else
        echo -e "  ${RED}❌ $dir/ 目录不存在${NC}"
        ((ERRORS++))
    fi
done
echo ""

# 2. 检查核心配置文件
echo -e "${BLUE}[2/6] 检查核心配置文件...${NC}"

REQUIRED_FILES=(
    "core/CLAUDE.global.md"
    "core/AGENTS.global.md"
    "core/base.md"
    "core/tooling.md"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$AGENT_RULES_DIR/$file" ]; then
        echo -e "  ${GREEN}✅ $file${NC}"
    else
        echo -e "  ${RED}❌ $file 文件不存在${NC}"
        ((ERRORS++))
    fi
done
echo ""

# 3. 检查全局软链接
echo -e "${BLUE}[3/6] 检查全局软链接...${NC}"

if [ -L "$CLAUDE_CONFIG_DIR/CLAUDE.md" ]; then
    TARGET=$(readlink "$CLAUDE_CONFIG_DIR/CLAUDE.md")
    if [ "$TARGET" = "$AGENT_RULES_DIR/core/CLAUDE.global.md" ]; then
        echo -e "  ${GREEN}✅ CLAUDE.md 软链接正确${NC}"
        echo -e "     → $TARGET"
    else
        echo -e "  ${YELLOW}⚠️  CLAUDE.md 软链接指向其他位置${NC}"
        echo -e "     当前: $TARGET"
        echo -e "     期望: $AGENT_RULES_DIR/core/CLAUDE.global.md"
        ((WARNINGS++))
    fi
else
    echo -e "  ${RED}❌ CLAUDE.md 软链接不存在${NC}"
    echo -e "     运行: ./scripts/setup.sh 创建软链接"
    ((ERRORS++))
fi

if [ -L "$CLAUDE_CONFIG_DIR/AGENTS.md" ]; then
    TARGET=$(readlink "$CLAUDE_CONFIG_DIR/AGENTS.md")
    if [ "$TARGET" = "$AGENT_RULES_DIR/core/AGENTS.global.md" ]; then
        echo -e "  ${GREEN}✅ AGENTS.md 软链接正确${NC}"
        echo -e "     → $TARGET"
    else
        echo -e "  ${YELLOW}⚠️  AGENTS.md 软链接指向其他位置${NC}"
        echo -e "     当前: $TARGET"
        echo -e "     期望: $AGENT_RULES_DIR/core/AGENTS.global.md"
        ((WARNINGS++))
    fi
else
    echo -e "  ${YELLOW}⚠️  AGENTS.md 软链接不存在（可选）${NC}"
    ((WARNINGS++))
fi
echo ""

# 4. 检查 Agents 定义
echo -e "${BLUE}[4/6] 检查 Agents 定义...${NC}"

AGENT_FILES=(
    "code-reviewer.md"
    "architect-analyst.md"
    "summarizer.md"
    "debugger.md"
    "workflow-orchestrator.md"
    "requirement-analyst.md"
    "task-planner.md"
    "task-executor.md"
)

MISSING_AGENTS=0
for agent in "${AGENT_FILES[@]}"; do
    if [ -f "$AGENT_RULES_DIR/agents/$agent" ]; then
        echo -e "  ${GREEN}✅ $agent${NC}"
    else
        echo -e "  ${YELLOW}⚠️  $agent 不存在${NC}"
        ((MISSING_AGENTS++))
    fi
done

if [ $MISSING_AGENTS -eq 0 ]; then
    echo -e "  ${GREEN}所有核心 Agents 都存在${NC}"
else
    echo -e "  ${YELLOW}缺少 $MISSING_AGENTS 个 Agent 文件${NC}"
    ((WARNINGS++))
fi
echo ""

# 5. 检查命令文件
echo -e "${BLUE}[5/6] 检查命令文件...${NC}"

COMMAND_FILES=(
    "prd-design.md"
    "prd-execute.md"
    "ai-commit.md"
)

for cmd in "${COMMAND_FILES[@]}"; do
    if [ -f "$AGENT_RULES_DIR/commands/$cmd" ]; then
        echo -e "  ${GREEN}✅ $cmd${NC}"
    else
        echo -e "  ${YELLOW}⚠️  $cmd 不存在${NC}"
        ((WARNINGS++))
    fi
done
echo ""

# 6. 检查脚本可执行权限
echo -e "${BLUE}[6/6] 检查脚本权限...${NC}"

SCRIPTS=(
    "setup.sh"
    "link-global-config.sh"
    "validate-config.sh"
)

for script in "${SCRIPTS[@]}"; do
    SCRIPT_PATH="$AGENT_RULES_DIR/scripts/$script"
    if [ -f "$SCRIPT_PATH" ]; then
        if [ -x "$SCRIPT_PATH" ]; then
            echo -e "  ${GREEN}✅ $script (可执行)${NC}"
        else
            echo -e "  ${YELLOW}⚠️  $script (不可执行)${NC}"
            echo -e "     运行: chmod +x $SCRIPT_PATH"
            ((WARNINGS++))
        fi
    else
        echo -e "  ${RED}❌ $script 不存在${NC}"
        ((ERRORS++))
    fi
done
echo ""

# 显示汇总
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}📊 验证汇总${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✅ 配置完全正确！${NC}"
    echo ""
    echo -e "${GREEN}所有检查项都通过，Agent Rules 配置正常。${NC}"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠️  配置基本正确，但有 $WARNINGS 个警告${NC}"
    echo ""
    echo -e "${YELLOW}建议检查上述警告项，确保配置完整。${NC}"
    exit 0
else
    echo -e "${RED}❌ 发现 $ERRORS 个错误和 $WARNINGS 个警告${NC}"
    echo ""
    echo -e "${RED}请修复上述错误后重新验证。${NC}"
    echo ""
    echo -e "${BLUE}💡 建议操作：${NC}"
    if [ $ERRORS -gt 0 ]; then
        echo "  1. 运行 ./scripts/setup.sh 重新配置"
        echo "  2. 检查缺失的文件和目录"
    fi
    echo ""
    exit 1
fi
