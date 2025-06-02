# Weblog 博客系统

## 项目概述

Weblog 是一款基于 Spring Boot 和 Vue 3 开发的前后端分离博客系统，提供了完整的博客功能，包括文章管理、分类管理、标签管理、知识库管理、统计分析等功能。系统采用现代化的技术栈，具有良好的性能和用户体验。

## 系统架构

### 前端架构

- **技术栈**：Vue 3 + Vite 4.3 + Element Plus + Pinia
- **项目结构**：基于模块化和组件化设计，清晰的目录结构
- **状态管理**：使用 Pinia 进行状态管理，支持持久化存储
- **路由管理**：使用 Vue Router 进行路由管理，支持路由懒加载
- **UI 组件**：使用 Element Plus 组件库，提供美观的用户界面

### 后端架构

- **核心框架**：Spring Boot 2.6.3
- **项目结构**：采用多模块设计，模块间职责明确，耦合度低
- **安全框架**：Spring Security + JWT 实现认证和授权
- **数据访问**：MyBatis-Plus 3.5.2 实现 ORM 映射，支持分页和批量操作
- **API 文档**：Knife4j 4.3.0 (基于 Swagger) 生成 API 文档
- **全文检索**：Lucene 8.11.1 实现站内搜索功能
- **对象存储**：Minio 8.2.1 实现文件存储
- **Markdown 解析**：Commonmark 0.20.0 实现 Markdown 解析
- **数据库**：MySQL 作为主要数据库
- **SQL 监控**：P6spy 3.9.1 实现 SQL 性能监控
- **敏感词过滤**：ToolGood.Words 实现内容安全过滤
- **工具库**：Guava、Apache Commons、Jackson 等

## 功能模块

### 前端模块

1. **博客前台**
   - 首页文章列表
   - 文章详情页
   - 分类/标签/归档页
   - 知识库列表与详情
   - 搜索功能
   - 暗黑模式切换

2. **管理后台**
   - 仪表盘（访问统计、文章统计）
   - 文章管理（发布、编辑、删除）
   - 分类管理
   - 标签管理
   - 知识库管理
   - 博客设置
   - 用户管理

### 后端模块

1. **weblog-web**：入口项目，负责博客前台展示相关功能，打包也放在这个模块负责
2. **weblog-module-admin**：管理后台模块，负责管理后台相关功能
3. **weblog-module-common**：通用模块，存放一些通用的功能
4. **weblog-module-jwt**：JWT 模块，管理用户认证、鉴权
5. **weblog-module-search**：站内搜索模块，基于 Lucene 实现全文检索

## 数据库设计

系统使用 MySQL 数据库，主要包含以下表：

- 用户表 (weblog_user)
- 文章表 (weblog_article)
- 分类表 (weblog_category)
- 标签表 (weblog_tag)
- 文章-标签关联表 (weblog_article_tag)
- 知识库表 (weblog_wiki)
- 知识库目录表 (weblog_wiki_catalog)
- 博客设置表 (weblog_settings)
- 统计表 (weblog_statistics)

## 技术特点

1. **多模块架构**：后端采用 Maven 多模块结构，模块间职责明确，便于维护和扩展
2. **JWT 认证**：使用 JWT 实现无状态的用户认证，提高系统安全性
3. **全文检索**：集成 Lucene 实现高效的站内搜索功能
4. **对象存储**：使用 Minio 实现文件的分布式存储
5. **响应式设计**：前端采用响应式设计，适配不同设备
6. **状态管理**：使用 Pinia 进行状态管理，支持持久化存储
7. **安全防护**：实现 CSRF 防护、敏感词过滤等安全措施
8. **性能优化**：SQL 监控、分页查询、缓存等多种性能优化手段

## 快速开始

### 环境要求

- JDK 1.8+
- Maven 3.6+
- MySQL 5.7+
- Node.js 16+
- npm 8+

### 后端部署

1. 克隆项目到本地
   ```bash
   https://github.com/Bucengfeijianqurentou/weblog.git
   ```

2. 导入数据库脚本
   ```bash
   mysql -u username -p database_name < weblog.sql
   ```

3. 修改数据库配置
   编辑 `weblog-springboot/weblog-web/src/main/resources/application-dev.yml` 文件，配置数据库连接信息

4. 编译打包
   ```bash
   cd weblog-springboot
   mvn clean package -DskipTests
   ```

5. 运行应用
   ```bash
   java -jar weblog-web/target/weblog-web-0.0.1-SNAPSHOT.jar
   ```

### 前端部署

1. 安装依赖
   ```bash
   cd weblog-vue3
   npm install
   ```

2. 开发模式运行
   ```bash
   npm run dev
   ```

3. 生产环境构建
   ```bash
   npm run build
   ```

## 项目结构

### 前端结构

```
weblog-vue3/
├── public/                 # 静态资源
├── src/
│   ├── api/                # API 接口
│   │   ├── admin/          # 管理后台接口
│   │   └── frontend/       # 前台接口
│   ├── assets/             # 资源文件
│   ├── components/         # 公共组件
│   ├── layouts/            # 布局组件
│   ├── router/             # 路由配置
│   ├── stores/             # Pinia 状态管理
│   ├── styles/             # 样式文件
│   ├── utils/              # 工具函数
│   ├── views/              # 页面组件
│   │   ├── admin/          # 管理后台页面
│   │   └── frontend/       # 前台页面
│   ├── App.vue             # 根组件
│   ├── axios.js            # Axios 配置
│   └── main.js             # 入口文件
├── .env                    # 环境变量
├── index.html              # HTML 模板
├── package.json            # 项目依赖
└── vite.config.js          # Vite 配置
```

### 后端结构

```
weblog-springboot/
├── weblog-web/                         # 入口模块
│   ├── src/main/java/
│   │   └── com/cishu/weblog/web/
│   │       ├── config/                 # 配置类
│   │       ├── controller/             # 控制器
│   │       ├── service/                # 服务接口和实现
│   │       └── WeblogWebApplication.java # 启动类
│   └── src/main/resources/             # 资源文件
│       ├── application.yml             # 应用配置
│       ├── application-dev.yml         # 开发环境配置
│       └── application-prod.yml        # 生产环境配置
├── weblog-module-admin/                # 管理后台模块
│   └── src/main/java/
│       └── com/cishu/weblog/admin/
│           ├── config/                 # 配置类
│           ├── controller/             # 控制器
│           ├── service/                # 服务接口和实现
│           └── utils/                  # 工具类
├── weblog-module-common/               # 通用模块
│   └── src/main/java/
│       └── com/cishu/weblog/common/
│           ├── config/                 # 配置类
│           ├── domain/                 # 领域模型
│           │   ├── dos/                # 数据对象
│           │   └── mapper/             # MyBatis Mapper
│           └── utils/                  # 工具类
├── weblog-module-jwt/                  # JWT 模块
│   └── src/main/java/
│       └── com/cishu/weblog/jwt/
│           ├── config/                 # 配置类
│           ├── filter/                 # 过滤器
│           └── handler/                # 处理器
└── weblog-module-search/               # 搜索模块
    └── src/main/java/
        └── com/cishu/weblog/search/
            ├── config/                 # 配置类
            └── service/                # 服务接口和实现
```

## 核心技术详解

### 后端核心技术

1. **Spring Boot**：使用 Spring Boot 2.6.3 作为基础框架，简化开发流程
2. **Spring Security**：实现认证和授权，保护 API 安全
3. **JWT**：使用 JJWT 0.11.2 实现 JSON Web Token 认证
4. **MyBatis-Plus**：增强的 MyBatis 框架，简化数据库操作
   - 自定义分页插件
   - 批量插入 SQL 注入器
   - SQL 性能监控 (P6spy)
5. **Knife4j**：基于 Swagger 的 API 文档生成工具
6. **Lucene**：全文检索引擎，实现站内搜索
   - 中文分词 (SmartCN)
   - 关键词高亮
   - 查询解析器
7. **Minio**：对象存储服务，用于存储上传的文件
8. **Commonmark**：Markdown 解析库，支持表格、任务列表等扩展
9. **ToolGood.Words**：敏感词过滤工具
10. **RestTemplate**：HTTP 客户端，用于服务间通信
11. **Spring Mail**：邮件发送服务
12. **定时任务**：使用 @EnableScheduling 实现定时任务

### 前端核心技术

1. **Vue 3**：使用 Composition API 进行组件开发
2. **Vite**：现代化的前端构建工具，提供更快的开发体验
3. **Element Plus**：基于 Vue 3 的 UI 组件库
4. **Pinia**：Vue 3 的状态管理库，替代 Vuex
5. **Vue Router**：Vue.js 的官方路由
6. **Axios**：基于 Promise 的 HTTP 客户端
7. **Markdown 编辑器**：用于文章编辑
8. **ECharts**：数据可视化图表库，用于统计分析

## 部署与运维

### 开发环境

- 使用 Spring Boot 内置的 Tomcat 运行后端应用
- 使用 Vite 开发服务器运行前端应用
- 使用 MySQL 作为数据库
- 使用 Minio 作为对象存储服务

### 生产环境

- 使用 Docker 容器化部署
- 使用 Nginx 作为前端静态资源服务器和反向代理
- 使用 MySQL 作为数据库
- 使用 Minio 作为对象存储服务

## 贡献指南

1. Fork 项目
2. 创建特性分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add some amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 创建 Pull Request

## 许可证

本项目采用 MIT 许可证，详情请参阅 LICENSE 文件。

## 联系方式

- 作者：辞树
- 邮箱：2193008417@qq.com
- 博客：https://www.cishu.com

---

感谢使用 Weblog 博客系统！
        