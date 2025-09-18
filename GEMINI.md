# Google Gemini CLI 专用配置

> 基于 [base.md](base.md) 通用配置的Google Gemini特定扩展

## Google Gemini 特性

### 多模态能力
- **文本理解** - 深度自然语言处理
- **代码分析** - 多语言代码理解和生成
- **图像理解** - 图表、架构图、UI设计理解
- **文档处理** - PDF、Word等文档格式分析

### 推理能力
- **逻辑推理** - 复杂问题分解和求解
- **模式识别** - 代码模式和设计模式识别
- **架构分析** - 系统架构理解和优化建议
- **性能分析** - 性能瓶颈识别和优化方案

## Google Gemini工作模式

### 系统分析模式
1. **架构理解**
   ```markdown
   # Gemini擅长理解复杂系统架构
   请分析以下系统的：
   - 模块间依赖关系
   - 数据流向
   - 潜在的性能瓶颈
   - 扩展性问题
   ```

2. **问题诊断**
   ```markdown
   # 基于症状进行根因分析
   系统出现以下问题：
   - 响应时间变慢
   - 内存使用率高
   - 偶发性错误

   请分析可能的原因并提供解决方案
   ```

3. **优化建议**
   ```markdown
   # 全方位优化分析
   当前代码存在的问题：
   - 复杂度分析
   - 可维护性评估
   - 性能优化机会
   - 安全性检查
   ```

### 代码生成和重构
1. **智能代码生成**
   ```python
   # Gemini可以基于高级描述生成复杂代码
   """
   创建一个用户管理系统，需要包含：
   1. 用户注册和登录
   2. 权限管理
   3. 数据加密
   4. 审计日志
   5. RESTful API
   """
   ```

2. **架构级重构**
   ```markdown
   # 基于最佳实践的架构重构
   当前单体应用需要重构为微服务架构：
   - 服务拆分策略
   - 数据库设计
   - API网关配置
   - 部署和监控
   ```

## Google Gemini专用命令

### gemini-analyze 命令
**功能**: 深度系统分析和诊断

```bash
gemini-analyze --type [architecture|performance|security|code] --target [path]
```

**分析类型**:
- **architecture** - 系统架构分析
- **performance** - 性能瓶颈分析
- **security** - 安全漏洞检测
- **code** - 代码质量评估
- **dependencies** - 依赖关系分析

### gemini-design 命令
**功能**: 系统设计和架构规划

```bash
gemini-design --scope [system|module|component] --requirements "requirements.md"
```

**设计范围**:
- **system** - 完整系统架构设计
- **module** - 模块级设计
- **component** - 组件设计
- **database** - 数据库设计
- **api** - API设计

### gemini-optimize 命令
**功能**: 智能优化建议

```bash
gemini-optimize --focus [performance|maintainability|scalability] --codebase [path]
```

**优化焦点**:
- **performance** - 性能优化
- **maintainability** - 可维护性提升
- **scalability** - 可扩展性改进
- **security** - 安全性加强
- **cost** - 成本优化

## 高级推理模式

### 分步问题解决
```markdown
# Step-by-step问题分解
复杂需求: 构建一个高并发的电商系统

Step 1: 需求分析
- 用户量级预估
- 并发量要求
- 数据量级
- 性能指标

Step 2: 架构设计
- 微服务拆分
- 数据库选型
- 缓存策略
- 消息队列

Step 3: 技术选型
- 编程语言选择
- 框架选择
- 基础设施选择
- 监控工具选择

Step 4: 实施计划
- 开发优先级
- 测试策略
- 部署策略
- 风险控制
```

### 多角度分析
```markdown
# 从多个维度分析同一问题
问题: 数据库查询性能差

技术角度:
- 索引优化
- 查询语句优化
- 数据库配置调优

业务角度:
- 业务逻辑优化
- 数据模型重设计
- 缓存策略

运维角度:
- 硬件资源配置
- 监控和告警
- 备份和恢复策略

成本角度:
- 硬件投入成本
- 人力维护成本
- 业务影响成本
```

## 提示词工程策略

### 上下文丰富化
```markdown
# 提供充分的上下文信息
项目背景:
- 行业: 金融科技
- 用户规模: 100万+
- 交易量: 每日10万笔
- 合规要求: 满足银行监管

技术栈:
- 后端: Java + Spring Boot
- 数据库: MySQL + Redis
- 前端: React + TypeScript
- 部署: Kubernetes + Docker

当前问题:
- 交易处理延迟增加
- 系统偶发性错误
- 用户投诉增多

请提供解决方案...
```

### 约束条件明确化
```markdown
# 明确限制条件和要求
需求: 优化系统性能

约束条件:
- 预算限制: 10万元以内
- 时间限制: 2个月完成
- 人力资源: 3个开发人员
- 技术栈: 不能大幅更改现有技术栈
- 业务影响: 不能影响正常业务运行

性能目标:
- 响应时间减少50%
- 并发处理能力提升100%
- 错误率降低到0.1%以下
```

### 多轮对话策略
```markdown
# 渐进式深入分析
第一轮: 获取概览
"请先给出系统架构的整体评估"

第二轮: 深入细节
"针对你提到的数据库性能问题，请详细分析"

第三轮: 具体方案
"请提供具体的SQL优化方案和实施步骤"

第四轮: 实施计划
"请制定详细的实施时间表和风险控制措施"
```

## Google Gemini集成配置

### CLI配置
```bash
# 安装Google Cloud CLI
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

# 配置认证
gcloud auth login
gcloud config set project your-project-id

# 设置Gemini API
export GOOGLE_APPLICATION_CREDENTIALS="path/to/service-account.json"
export GEMINI_MODEL="gemini-pro"
```

### 项目配置
```json
{
    "name": "gemini-ai-project",
    "scripts": {
        "analyze": "gemini-cli analyze",
        "design": "gemini-cli design",
        "optimize": "gemini-cli optimize",
        "review": "gemini-cli code-review"
    },
    "gemini": {
        "model": "gemini-pro",
        "temperature": 0.2,
        "maxOutputTokens": 8192,
        "topP": 0.8,
        "topK": 40,
        "safetySettings": [
            {
                "category": "HARM_CATEGORY_HARASSMENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            }
        ]
    }
}
```

### 环境变量配置
```bash
# Gemini API配置
export GEMINI_API_KEY="your-api-key"
export GEMINI_MODEL="gemini-pro"
export GEMINI_TEMPERATURE="0.2"
export GEMINI_MAX_TOKENS="8192"

# 项目配置
export PROJECT_TYPE="webapp"
export LANGUAGE="typescript"
export FRAMEWORK="nextjs"
```

## 质量保证和最佳实践

### 多轮验证策略
```markdown
# Gemini输出验证清单
第一层验证: 逻辑一致性
- [ ] 建议是否逻辑自洽
- [ ] 是否考虑了所有约束条件
- [ ] 方案是否可行

第二层验证: 技术可行性
- [ ] 技术方案是否成熟
- [ ] 是否存在技术风险
- [ ] 实施难度评估

第三层验证: 业务适配性
- [ ] 是否符合业务需求
- [ ] 是否考虑了用户体验
- [ ] 是否满足合规要求
```

### 输出质量评估
```markdown
# Gemini响应质量评分标准
完整性 (1-5分):
- 是否回答了所有问题
- 是否提供了足够的细节
- 是否包含了实施步骤

准确性 (1-5分):
- 技术建议是否正确
- 最佳实践是否恰当
- 风险评估是否准确

实用性 (1-5分):
- 建议是否可操作
- 方案是否切实可行
- 成本效益是否合理
```

## 特定于Gemini的Git提交规范

### 提交消息格式
```
[Gemini] type(scope): description

Analysis: model reasoning process
Validation: verification steps taken
Context: relevant background information

Generated-by: gemini-pro
Confidence: high/medium/low
```

### 示例提交消息
```bash
[Gemini] refactor(database): optimize query performance based on analysis

Analysis:
- Gemini分析了50+个查询语句的执行计划
- 识别出3个主要性能瓶颈
- 基于数据访问模式提供优化建议

优化内容:
- 添加复合索引 user_id + created_at
- 重写子查询为JOIN操作
- 实施查询结果缓存策略

性能提升:
- 平均查询时间从2.3s降低到0.15s
- 数据库CPU使用率下降40%
- 并发处理能力提升3倍

Validation: 在测试环境验证，性能测试通过
Context: 用户投诉响应时间过长，需要紧急优化

Generated-by: gemini-pro
Confidence: high
```

## 错误处理和降级策略

### 错误类型处理
```markdown
# Gemini可能的错误类型和处理策略

1. 理解错误
   - 问题: Gemini误解需求
   - 处理: 重新描述需求，增加上下文

2. 输出不完整
   - 问题: 回答被截断或不完整
   - 处理: 调整max_tokens参数，分步骤询问

3. 技术建议错误
   - 问题: 提供了过时或错误的技术建议
   - 处理: 人工验证，查阅最新文档

4. 过度复杂化
   - 问题: 提供了过于复杂的解决方案
   - 处理: 要求简化方案，强调实用性
```

### 质量控制流程
```markdown
# Gemini输出的质量控制流程
1. 自动验证
   - 语法检查
   - 逻辑一致性检查
   - 技术可行性初步评估

2. 人工审查
   - 技术方案审查
   - 业务逻辑验证
   - 安全性评估

3. 测试验证
   - 原型验证
   - 性能测试
   - 用户反馈收集

4. 迭代改进
   - 基于反馈调整
   - 优化提示词
   - 更新配置参数
```

---

# 总结

此配置专门为Google Gemini优化，充分利用其：
- **多模态理解** - 文本、代码、图像综合分析
- **深度推理** - 复杂问题分解和系统性思考
- **架构洞察** - 系统级分析和优化建议
- **全栈视角** - 从业务到技术的全方位考虑

通过引用`base.md`获得通用配置，然后添加Gemini特有的推理模式和分析策略，实现最智能的AI辅助决策。