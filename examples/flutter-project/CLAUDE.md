# Flutter 项目配置示例

## 继承全局配置

> 全局开发规范: ~/.claude/CLAUDE.md (软链接到 agent-rules/core/CLAUDE.global.md)
> 本项目特定规范如下（覆盖全局配置）

## 项目信息

- **项目名称**: Flutter 示例项目
- **技术栈**: Flutter 3.27.4 + Dart 3.2.0+ + Riverpod + Freezed
- **架构模式**: MVVM (Model + Repository + ViewModel + Page)

## 环境要求

- Flutter SDK: 3.27.4
- Dart SDK: 3.2.0+
- 必需IDE插件: Flutter、Dart、Flutter Intl、FlutterAssetsGenerator
- JDK: Java 17（Android Studio 兼容性）

## 常用开发命令

```bash
# 项目设置和清理
flutter clean
flutter pub get

# 代码生成（Freezed/Riverpod 必需）
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs  # 监听模式

# 测试
flutter test                                           # 运行所有测试
flutter test test/specific_test.dart                   # 运行特定测试

# 运行应用
flutter run                                            # 开发模式
flutter run -d ios                                     # iOS 设备/模拟器
flutter run -d android                                 # Android 设备/模拟器
```

## 项目架构规范

### MVVM 分层职责

- **Page/View层**: 继承 `ConsumerStatefulWidget`/`ConsumerWidget`
  - 通过 `ref.watch` 监听 ViewModel 状态
  - 使用 `_buildXXXWidget()` 封装复杂 UI

- **Repository层**: 使用 `@riverpod` 注解
  - 负责数据获取（网络、数据库）
  - 不做业务逻辑处理

- **ViewModel层**: 继承 Riverpod Notifier
  - 使用 Freezed State 管理状态
  - 处理业务逻辑
  - 使用 `try-catch` 包裹 repository 请求

- **Model层**: 使用 Freezed 生成数据类
  - 网络相关 Model 必须使用 `@JsonKey` 注解

### 单元测试规范

- **Mock策略**: 只在最底层（HttpManager）进行 Mock
- **测试组织**: 使用 ProviderContainer 进行依赖注入
- **共用Mock**: 使用 `test/helpers/mocks.dart` 和 `test_container_helper.dart`

### UI 尺寸规范

- **设备适配**: 使用 `UISize(phone, pad)` 适配不同设备
- **按钮实现**: Stack + Image.asset + Center(Text) 模式
- **图片尺寸**: 与 Figma 设计保持一致
- **字体处理**: 去除 'PingFang SC'，使用默认字体

## 代码生成注意事项

- 新增 Riverpod/Freezed 代码后必须执行 build_runner
- 资源文件更新后需要重新生成 Assets.dart

## 提交规范

- 必须使用 `/ai-commit` 命令
- Commit Message 必须使用英文
- 格式：`[ClaudeCode] type: description`

## 外部文档引用

@./docs/architected.md  # 如果有详细架构文档

## 常见问题

### FVM 相关
如果使用 FVM 管理 Flutter 版本：
- 使用 `fvm flutter` 替代 `flutter`
- 使用 `fvm dart` 替代 `dart`

### JDK 版本冲突
配置 Flutter 使用 Java 17

### 算法模块更新
```bash
dart pub upgrade sfealgo_plugin
```
