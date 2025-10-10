# 开发工具使用指南

## Shell 工具决策树

### 文件操作
- **查找文件？** → `fd`
  ```bash
  fd "pattern" /path/to/search
  fd -e dart  # 查找所有 .dart 文件
  ```

- **查找文本内容？** → `rg` (ripgrep)
  ```bash
  rg "search_pattern" /path
  rg -i "case_insensitive"  # 忽略大小写
  rg -A 3 -B 3 "pattern"    # 显示上下文
  ```

- **查找代码结构？** → `rg` 或 `ast-grep`
  ```bash
  # Dart/Flutter 使用 rg
  rg "class.*extends ConsumerWidget"

  # JS/TS/Python 使用 ast-grep
  ast-grep --pattern 'function $NAME($$$) { $$$ }'
  ```

### 数据处理
- **JSON 处理？** → `jq`
  ```bash
  cat data.json | jq '.items[] | select(.status == "active")'
  jq -r '.[] | .name' data.json  # 提取字段
  ```

- **YAML/XML 处理？** → `yq`
  ```bash
  yq eval '.config.database' config.yaml
  yq -o json eval config.yaml  # 转换为 JSON
  ```

### 交互选择
- **多结果选择？** → 管道到 `fzf`
  ```bash
  fd -e dart | fzf  # 交互选择 Dart 文件
  git log --oneline | fzf  # 交互选择 commit
  ```

### 版本控制
- **Git 交互浏览？** → `tig`
  ```bash
  tig  # 启动交互式 Git 浏览器
  tig blame file.dart  # 查看文件的 blame 信息
  ```

- **Git 依赖分析？** → `git log --graph`
  ```bash
  git log --graph --oneline --all
  ```

### 系统监控
- **进程监控？** → `htop` 或 `btop`
  ```bash
  htop  # 交互式进程监控
  btop  # 现代化进程监控（更美观）
  ```

## Flutter/Dart 特定工具

### 依赖分析
```bash
# 查看依赖树
flutter pub deps --tree

# 结合 fzf 交互选择
flutter pub deps --tree | fzf
```

### 代码生成
```bash
# Freezed/Riverpod 代码生成
dart run build_runner build --delete-conflicting-outputs

# 监听模式（开发时使用）
dart run build_runner watch --delete-conflicting-outputs
```

### 代码格式化
```bash
# 格式化所有代码
dart format .

# 格式化特定目录
dart format lib/ test/
```

### 测试运行
```bash
# 运行所有测试
flutter test

# 运行特定测试文件
flutter test test/sheet/qin_sheet_utils_test.dart
```

## 最佳实践

### 1. 优先使用专用工具
- ❌ 不要：`cat file.dart | grep "class"`
- ✅ 应该：`rg "class" file.dart`

### 2. 管道组合（Unix 哲学）
```bash
# 查找并交互选择
fd -e dart | fzf | xargs code

# 搜索并统计
rg "TODO" | wc -l
```

### 3. 性能优先
- `ripgrep` > `grep`
- `fd` > `find`
- `bat` > `cat`（带语法高亮）

### 4. 使用别名简化命令
```bash
# 在 ~/.zshrc 或 ~/.bashrc 中添加
alias fdf='fd -e dart | fzf'
alias rgi='rg -i'  # 忽略大小写搜索
alias gcf='git log --oneline | fzf'  # 交互选择 commit
```

## 常见任务示例

### 查找并替换
```bash
# 查找所有包含某个字符串的文件
rg "old_function_name" -l

# 使用 sed 批量替换（谨慎使用）
rg "old_function_name" -l | xargs sed -i 's/old_function_name/new_function_name/g'
```

### 代码统计
```bash
# 统计代码行数
fd -e dart -x wc -l | awk '{sum+=$1} END {print sum}'

# 使用 tokei（推荐）
tokei
```

### Git 工作流
```bash
# 交互式选择要暂存的文件
git status --short | fzf -m | awk '{print $2}' | xargs git add

# 查看最近的提交
tig
```

## 工具安装

### macOS (使用 Homebrew)
```bash
brew install ripgrep fd fzf jq yq tig htop bat tokei
```

### Linux (Ubuntu/Debian)
```bash
apt install ripgrep fd-find fzf jq tig htop bat
```

### 验证安装
```bash
which rg fd fzf jq yq tig htop
```

---

**记住**：工具是为了提高效率，选择最适合任务的工具，而不是最复杂的工具。
