# AI 编程助手规则

## 基本信息

- 称呼我为「帅哥」
- 复杂需求拆解成小任务，分步实现，每完成一个小任务后再继续
- 代码实现前后要仔细检查，确保没有遗漏
- 如果有疑问，先询问再修改，不要擅自做决定
- 在进行代码设计规划时，请符合「第一性原理」
- 在代码实现时，请符合「KISS 原则」和「SOLID 原则」

## Java 编码规范

- 写 Java 代码要遵守**阿里巴巴代码规范**和**阿里巴巴命名规范**
- 通过写注释来提高代码可读性，让方法的功能一目了然
- 新建 Java 文件必须添加类注释, 注解要保持下面示例的顺序：

```java
/**
 * @description xxx
 * @author xinrui.an
 * @date yyyy/MM/dd
 */
```

- 尽量复用已有代码，避免重复代码
- 确保代码可读性与可维护性，必要时加简要注释
- 不要用魔法值

## 注释规范（最高优先级）

### 类、接口、枚举、方法必须使用 Javadoc

- 类、接口、枚举、public 方法、protected 方法、接口方法、抽象方法必须使用 `/** */` 注释
- 枚举的每个枚举值必须有注释
- 类属性必须有注释

```java
/**
 * 用户服务
 *
 * @author xinrui.an
 * @date 2026/06/11
 * @description 用户相关业务处理
 */
public class UserService {
}
```

### 方法内部注释

- 使用 `//` 单行或多行业务注释，**禁止**使用 `/* */`
- 注释**必须写在代码上方**，禁止行尾注释
- `//` 后必须且仅能有一个空格

```java
// 第一步：收集所有非空 specCode
List<String> specCodeList = dtoList.stream()
        .map(DemoDTO::getSpecCode)
        .filter(StringUtils::isNotBlank)
        .distinct()
        .collect(Collectors.toList());

// 第二步：批量查询规格信息
Map<String, SpecInfo> specInfoMap = specService.queryMap(specCodeList);
```

## 代码格式规范

- if/for/while 必须使用大括号，即使只有一行
- 运算符两边必须有空格
- Stream 链式调用必须换行，每行缩进对齐

```java
// Stream 链式调用示例
List<String> codeList = dtoList.stream()
        .map(DemoDTO::getCode)
        .filter(StringUtils::isNotBlank)
        .distinct()
        .collect(Collectors.toList());
```

## Java 开发规范

- 禁止使用 Executors 创建线程池，必须使用 `new ThreadPoolExecutor(...)`
- POJO 属性必须使用包装类型（Integer、Long、Boolean 等），禁止使用基本类型
- POJO 必须实现 toString（推荐使用 Lombok `@Data`）

## SQL 规范

- SQL 关键字必须大写（SELECT、FROM、WHERE 等）
- **禁止**使用 `SELECT *`，必须明确指定字段

```sql
SELECT id, name, status FROM user WHERE status = 1
```

## 日志规范

- 禁止字符串拼接日志，必须使用占位符

```java
// 正确
log.info("用户id：{}", userId);

// 错误
log.info("用户id：" + userId);
```

## 异常处理规范

- 禁止吞异常，catch 块必须记录日志

```java
catch (Exception e) {
    log.error("查询失败", e);
}
```

## 代码变更原则

- 尽量**不要删除**历史代码和注释
- 在已有功能基础上添加新功能时，必须确保：
  - 不影响原有功能
  - 不添加多余的功能、代码、逻辑、文件、配置、依赖
- 代码变更范围**最小化**，避免大范围修改
- 代码修改遵循**单一职责原则**，不混合多个变更
- 遵循架构设计，保持代码风格一致
- 不引入不必要的依赖，避免增加维护成本
- 实现后进行基本逻辑自检，确保无错误
