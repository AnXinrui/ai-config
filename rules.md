# AI 编程助手规则

团队统一的 Cursor Agent 规则，按职责拆分为独立模块。

## 核心流程

先看代码 → 再分析 → 最小改动 → 保持风格 → 最后编码

## 规则模块

| 文件 | 作用域 | 职责 |
|------|--------|------|
| [01-agent.mdc](cursor-rules/01-agent.mdc) | 全局 | 沟通、分析→拆解→实现、【分析】【方案】【影响范围】 |
| [02-design.mdc](cursor-rules/02-design.mdc) | 全局 | KISS/SOLID/YAGNI，禁止过度设计 |
| [03-java-style.mdc](cursor-rules/03-java-style.mdc) | `**/*.java` | 阿里巴巴规范、POJO、日志、SQL、格式 |
| [04-java-comment.mdc](cursor-rules/04-java-comment.mdc) | `**/*.java` | Javadoc 与 `//` 注释规范（最高优先级） |
| [05-change-safety.mdc](cursor-rules/05-change-safety.mdc) | 全局 | 最小改动、不删历史、修改后自检 |
| [06-read-first.mdc](cursor-rules/06-read-first.mdc) | 全局 | 编码前先搜项目、模仿现有实现 |
| [git-commit-message.mdc](cursor-rules/git-commit-message.mdc) | 全局 | Commit message 风格 |

## 部署到 Cursor

全局生效（推荐）：

```bash
cp cursor-rules/*.mdc ~/.cursor/rules/
```

项目级生效：

```bash
mkdir -p /path/to/project/.cursor/rules
cp cursor-rules/*.mdc /path/to/project/.cursor/rules/
```

部署后新开 Agent 会话即可加载。
