/*
 Navicat MySQL Data Transfer

 Source Server         : mydatabase
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : weblog

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 28/05/2025 19:49:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `cover` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章封面',
  `summary` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文章摘要',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  `read_num` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '被阅读次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (4, '测试', 'https://img.quanxiaoha.com/quanxiaoha/193dd1504ebb4f138085acb23619e0dd.jpg', 'test', '2025-05-26 14:42:12', '2025-05-26 15:39:11', 0, 1);
INSERT INTO `t_article` VALUES (5, '测试标题', 'https://img.quanxiaoha.com/quanxiaoha/193dd1504ebb4f138085acb23619e0dd.jpg', '测试摘要', '2025-05-26 14:43:17', '2025-05-28 09:51:29', 0, 2);
INSERT INTO `t_article` VALUES (6, '《淮上与友人别》赏析', 'http://101.132.176.129:9000/weblog/0609605d99704c23a093b08fed87da5a.png', '人生南北多歧路，君向潇湘我向秦。', '2025-05-26 16:12:50', '2025-05-26 17:16:09', 0, 3);
INSERT INTO `t_article` VALUES (7, '《别鲁颂》评析', 'http://101.132.176.129:9000/weblog/48a07bce5a9c4aebb63ba88272bf5870.jpg', '李白的《别鲁颂》是一首充满豪迈之气和高洁情怀的诗歌。虽然在李白存世诗作中，此诗的知名度不如《静夜思》、《将进酒》等，但它依然展现了“诗仙”独特的风格和思想。', '2025-05-26 19:44:45', '2025-05-26 19:44:45', 0, 11);
INSERT INTO `t_article` VALUES (8, '代码高亮测试', 'http://101.132.176.129:9000/weblog/0464e7ac3e354c0cb7eae7726e7b1862.png', '代码高亮测试', '2025-05-28 10:20:52', '2025-05-28 10:20:52', 0, 2);

-- ----------------------------
-- Table structure for t_article_category_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_article_category_rel`;
CREATE TABLE `t_article_category_rel`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` bigint UNSIGNED NOT NULL COMMENT '文章id',
  `category_id` bigint UNSIGNED NOT NULL COMMENT '分类id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_article_id`(`article_id` ASC) USING BTREE,
  INDEX `idx_category_id`(`category_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章所属分类关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_category_rel
-- ----------------------------
INSERT INTO `t_article_category_rel` VALUES (5, 4, 11);
INSERT INTO `t_article_category_rel` VALUES (7, 6, 11);
INSERT INTO `t_article_category_rel` VALUES (8, 7, 2);
INSERT INTO `t_article_category_rel` VALUES (9, 5, 11);
INSERT INTO `t_article_category_rel` VALUES (10, 8, 1);

-- ----------------------------
-- Table structure for t_article_content
-- ----------------------------
DROP TABLE IF EXISTS `t_article_content`;
CREATE TABLE `t_article_content`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章内容id',
  `article_id` bigint NOT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '教程正文',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章内容表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_content
-- ----------------------------
INSERT INTO `t_article_content` VALUES (4, 4, 'test');
INSERT INTO `t_article_content` VALUES (5, 5, '## 👋 自我介绍\n\n> 大家好，我是小哈。前某厂中台架构，公众号小哈学 Java 作者。91年生人，码龄 9 年，先后供职于支付、共享等互联网领域，主导负责过数据传输、日志平台、任务调度、文件平台等产品，以支撑各部门业务线。喜欢分享知识，热爱技术，也不止于技术，不只是写 Java，业余也爱玩前端、Python、Android 等，是个活跃的技术折腾者。\n\n本实战项目是星球内部第一个项目，目前**已输出 17w+ 字，更新了 124 小节内容，演示图片：802 张，还在持续爆肝中，目标是将 Java 程序员生涯中，比较典型的项目都教会大家，如前后端分离博客全栈级开发、秒杀系统、在线商城、IM 即时通讯（Netty）、权限管理（Spring Security）、Spring Cloud Alibaba 微服务等等... 目前有 370+ 小伙伴已加入，一起学习打卡，一起进步！同频的人才能走的更快、更远 ！** 欢迎各位小伙伴加入哟~\n\n👉 [加入星球](https://t.zsxq.com/12h3hIayK \"加入星球\")，你将获得: <span style=\"color: #f97316; font-weight: 700;\">专属的项目实战 / Java 学习路线 / 一对一提问 / 学习打卡 / 赠书活动</span>，与一群热爱学习的小伙伴一起，将走的更快、更远! **公众号：小哈学Java, 回复【星球】**，可领取<span style=\"color: #f97316; font-weight: 700;\">专属优惠券</span>~\n\n---\n\n> 本项目 1.0 版本已部署到了阿里云服务器上，可点击下面链接进行访问，查看实际效果：\n>\n> 演示地址：[http://118.31.41.16/](http://118.31.41.16/)\n>\n> 后台登录演示账号:\n> \n> - 账号：test\n> - 密码：test\n\n## 🏃 关于实战项目\n\n知识星球是个私密学习圈子，我会在星球内部，出**一系列从 0 到 1 的实战项目，贴合真实的企业级项目开发规范，使用主流的企业技术栈，全程手写后端 + 前端完整代码，通过专栏的形式，把每个功能点的开发的步骤，手摸手，通过丰富的图片 + 文字，保姆级教学（PS: 同时按小节进度提供代码，不至于一上来代码量太多，不知道从哪入手）**。\n\n\n![](https://img.quanxiaoha.com/quanxiaoha/169361945065538)\n\n目前，我已经给自己的网站：[犬小哈教程](www.quanxiaoha.com/column \"犬小哈教程\") 新开发了专栏模块，可以让小伙伴们只需跟着实战专栏，按照章节顺序教学来，上手敲，即可搞定每个功能点的开发，成体系地完成一个独立项目。*目前加入的小伙伴，都给出了超高评价，以下了截取了部分好评*：\n\n![](https://img.quanxiaoha.com/quanxiaoha/169733756405612)\n\n![](https://img.quanxiaoha.com/quanxiaoha/169733761293187)\n\n![](https://img.quanxiaoha.com/quanxiaoha/169733762195775)\n\n另外，在跟随小节内容上手的过程中，若遇到问题，可在星球内发起 *1v1 提问，小哈亲自解答*。\n\n![\"星球内提问\"](https://img.quanxiaoha.com/quanxiaoha/169396126861858 \"星球内提问\")\n\n星球说不清楚的，项目进度因为某一块搞不定的，微信发我源码，帮忙看问题出在哪：\n\n![搞不定的，微信发我源码，帮忙看问题出在哪](https://img.quanxiaoha.com/quanxiaoha/169406285385964 \"搞不定的，微信发我源码，帮忙看问题出在哪\")\n\n\n陪伴式写项目，到最终部署到云服务器上，能够通过域名来访问，完成项目上线。\n\n> 💡 TIP : 后期也会尝试分享一些适合程序员的技术副业，比如开发一些小工具网站，进行推广运营，有了一定用户量，能够挣点零花钱啥的。当然，这都是后话了，前提还需要你能够自行完整的开发一个独立应用，前期还是以项目实战为主。\n\n既然小哈是准备出一系列的实战项目，我希望这些项目的难度是循序渐进的，能够让你真实的感受到自己的功力在慢慢增强。但是又不想写那种纯纯的 CRUD 型管理后台项目，太枯燥。那么，第一个项目小哈就定位在难度不大，易上手，有趣，并且非常有代表性，实际工作中也能够被频繁用到的。\n\n脑瓜子一转，想到之前好多读者问我博客的事情，今年 4 月份的时候，又有读者微信问我: *你的博客有没有开源，感觉还挺好看，也想学习、部署一个。*\n\n![](https://img.quanxiaoha.com/quanxiaoha/169355366112215)\n\n于是乎，花了点时间整了第一个实战项目 —— **前后端分离的博客 Weblog**。\n\n\n## 💁 项目介绍\n\n每个技术人都应该有属于自己的博客！相比较直接使用第三方博客平台，自行搭建博客更有成就感；另外就是没有平台限制，比如你想发个二维码引流啥的，平台基本都是不允许的，还有，你可以自由 `div` 定制自己想要的博客 `css` 样式，哪天 UI 看不爽了，咱就自己换；最后，*面试的时候，如果简历贴上的是自己开发博客地址，也会很加分*！\n\n### 🔗 演示地址\n\n目前 1.0 版本已经部署到了阿里云服务器上，可点击下面链接进行访问，查看实际效果：\n\n[http://118.31.41.16/](http://118.31.41.16/ \"http://118.31.41.16/\")\n\n管理后台登录账号/密码:\n\n- 账号：test\n- 密码：test\n\n> ⚠️ 注意：该账号的角色为*游客*角色，*仅支持查询操作*，新增、修改、删除操作会提示不允许。\n\n### ⚒️ 功能模块\n\n> 💡 TIP : 以下*只是 1.0 版本的功能，后续小哈将添加更多功能进去, 比如图库管理、知识库、在线人数统计、SSR（服务端渲染） 等等*，能够想到的高逼格功能，咱都整上，附带超详细的实战图文笔记 ...\n\n![Weblog 功能模块一览](https://img.quanxiaoha.com/quanxiaoha/169560157482464 \"Weblog 功能模块一览\")\n\n### ✏️ 技术栈\n\n![Weblog 技术栈一览](https://img.quanxiaoha.com/quanxiaoha/169560181378937 \"Weblog 技术栈一览\")\n\n## 🎉 专栏目标\n\n学完本项目，你将具备如下能力：\n\n- 掌握独立开发全栈项目的能力（*后端 + 前端*）；\n- 掌握 Spring Boot 相关技术栈，以及构建后端项目能力，写出符合企业级的代码规范；\n- 掌握 Vue 3.2 + Element Plus + Vite 4 技术构建前端工程的能力，并能够手动搭建 Admin 后台管理系统；\n- 掌握前端页面响应式设计（同时适配不同屏幕），排版布局，能够根据自己需求，`div` 自己想要的前端效果；\n- ...\n\n## 💡 专栏亮点\n\n- 在技术选型上，小哈选择了目前主流热门的技术栈，对标企业级项目开发；\n- 严格把控代码质量，数据库设计，写出令同事称道的代码；\n- 熟悉后端工程的搭建，如一些通用的基础设施：参数校验、全局异常捕获、`API` 统一出入参日志打印等等；\n- 能够独立完成整个网站的部署流程，从功能开发到服务器、域名选购，再到网站备案，最终公网可访问；\n- 对象存储 `Minio` 的使用, 能够独立搭建个人图床；\n- 从 0 到 1 ，通过 `Element Plus` 纯手搭 `Admin` 管理后台前端骨架；\n- 使用 Vue 3 `setup` 等语法糖新特性；\n- 博客前台页面在设计上美观大气；\n- ...\n\n## 📖 专栏大纲\n\n整个实战专栏，小哈按功能点开发进度来做的目录，目前已经更新到了第第五章，目录大致如下：\n\n> 💡 TIP : 如下目录不代表最终内容，只会更多，目前只是把已完成的部分详细的罗列了出来，其中大部分功能正在开发中，所属具体小节的标题也会陆续更新进来。\n\n- 一、[项目介绍](https://www.quanxiaoha.com/column/10000.html)\n- 二、开发环境搭建\n  - [2.1 【后端】环境安装&工具准备](https://www.quanxiaoha.com/column/10003.html)\n  - [2.2 【前端】开发环境&工具安装](https://www.quanxiaoha.com/column/10004.html)\n\n- 三、Spring Boot 后端工程搭建\n  - [3.1 搭建 Spring Boot 多模块工程](https://www.quanxiaoha.com/column/10005.html)\n  - [3.2 Spring Boot 多环境配置](https://www.quanxiaoha.com/column/10006.html)\n  - [3.3 配置 Lombok](https://www.quanxiaoha.com/column/10007.html)\n  - [3.4 Spring Boot 整合 Lockback 日志](https://www.quanxiaoha.com/column/10008.html)\n  - [3.5 Spring Boot 自定义注解，实现 API 请求日志切面](https://www.quanxiaoha.com/column/10009.html)\n  - [3.6 Spring Boot 通过 MDC 实现日志跟踪](https://www.quanxiaoha.com/column/10010.html)\n  - [3.7 Spring Boot 实现优雅的参数校验](https://www.quanxiaoha.com/column/10011.html)\n  - [3.8 Spring Boot 自定义响应工具类](https://www.quanxiaoha.com/column/10012.html)\n  - [3.9 Spring Boot 实现全局异常管理](https://www.quanxiaoha.com/column/10013.html)\n  - [3.10 全局异常处理器+参数校验（最佳实践）](https://www.quanxiaoha.com/column/10014.html)\n  - [3.11 整合 Knife4j：提升接口调试效率](https://www.quanxiaoha.com/column/10015.html)\n  - [3.12 自定义 Jackson 序列化、反序列化，支持 Java 8 日期新特性](https://www.quanxiaoha.com/column/10016.html)\n  - [3.13 小结](https://www.quanxiaoha.com/column/10017.html)\n\n- 四、使用 Vue 3 + Vite 4 搭建前端工程\n  - [4.1 Vue 3 环境安装& Weblog 项目搭建](https://www.quanxiaoha.com/column/10018.html)\n  - [4.2 安装 VSCode 开发工具](https://www.quanxiaoha.com/column/10019.html)\n  - [4.3 添加 vue-router 路由管理器](https://www.quanxiaoha.com/column/10020.html)\n  - [4.4 Vite 配置路径别名：更方便的引用文件](https://www.quanxiaoha.com/column/10021.html)\n  - [4.5 整合 Tailwind CSS](https://www.quanxiaoha.com/column/10022.html)\n  - [4.6 整合 Tailwind CSS 组件库：Flowbite](https://www.quanxiaoha.com/column/10023.html)\n  - [4.7 整合饿了么 Element Plus 组件库](https://www.quanxiaoha.com/column/10024.html)\n\n- 五、登录模块开发\n  - [5.1 登录页设计：支持响应式布局](https://www.quanxiaoha.com/column/10025.html)\n  - [5.2 登录页加点盐：通过 Animate.css 添加动画](https://www.quanxiaoha.com/column/10026.html)\n  - [5.3 整合 Mybatis Plus](https://www.quanxiaoha.com/column/10027.html)\n  - [5.4 p6spy 组件打印完整的 SQL 语句、执行耗时](https://www.quanxiaoha.com/column/10028.html)\n  - [5.5 整合 Spring Security](https://www.quanxiaoha.com/column/10029.html)\n  - [5.6 Spring Security 整合 JWT ：实现身份认证](https://www.quanxiaoha.com/column/10030.html)\n  - [5.7 Spring Security 整合 JWT ：实现接口鉴权](https://www.quanxiaoha.com/column/10031.html)\n  - [5.8 Vue 整合 Axios 实现登录功能](https://www.quanxiaoha.com/column/10032.html)\n  - [5.9 登录页表单验证](https://www.quanxiaoha.com/column/10033.html)\n  - [5.10 登录消息提示、回车键监听、按钮加载 Loading](https://www.quanxiaoha.com/column/10034.html)\n  - [5.11 存储 Token 到 Cookie 中](https://www.quanxiaoha.com/column/10035.html)\n  - [5.12 Axios 添加请求拦截器、响应拦截器](https://www.quanxiaoha.com/column/10036.html)\n  - [5.13 全局路由拦截：实现页面标题动态设置、后台路由跳转的登录判断](https://www.quanxiaoha.com/column/10037.html)\n  - [5.14 实现页面顶部加载 Loading 效果](https://www.quanxiaoha.com/column/10038.html)\n  - [5.15 重复登录问题优化、密码框可显示密码](https://www.quanxiaoha.com/column/10040.html)\n  - [5.16 角色鉴权：添加演示账号，仅支持查询操作](https://www.quanxiaoha.com/column/10089.html)\n  \n  \n  \n\n- 六、Element Plus 手搭 Admin 管理后台骨架\n  - [6.1 搭建管理后台基本布局](https://www.quanxiaoha.com/column/10039.html)\n  - [6.2 后台公共 Header 头：样式布局](https://www.quanxiaoha.com/column/10041.html)\n  - [6.3 后台公共左侧 Menu 菜单栏：样式布局](https://www.quanxiaoha.com/column/10042.html)\n  - [6.4 整合全局状态管理库 Pinia](https://www.quanxiaoha.com/column/10043.html)\n  - [6.5 左边菜单栏点击收缩、展开功能实现](https://www.quanxiaoha.com/column/10044.html)\n  - [6.6 支持全屏展示、页面点击刷新](https://www.quanxiaoha.com/column/10045.html)\n  - [6.7 标签导航栏组件实现：样式布局](https://www.quanxiaoha.com/column/10046.html)\n  - [6.8 标签导航栏组件实现：路由同步 (1)](https://www.quanxiaoha.com/column/10047.html)\n  - [6.9 标签导航栏组件实现：路由同步 (2)](https://www.quanxiaoha.com/column/10048.html)\n  - [6.10 标签导航栏组件实现：标签页关闭](https://www.quanxiaoha.com/column/10049.html)\n  - [6.11 标签导航栏组件实现：关闭其他、全部标签页](https://www.quanxiaoha.com/column/10050.html)\n  - [6.12 后台公共 Footer 页脚：样式布局](https://www.quanxiaoha.com/column/10051.html)\n  - [6.13 使用 KeepAlive 缓存组件，提高页面切换性能和响应速度](https://www.quanxiaoha.com/column/10052.html)\n  - [6.14 使用 Transition 组件添加全局过渡动画](https://www.quanxiaoha.com/column/10053.html)\n  - [6.15 修改用户密码接口开发](https://www.quanxiaoha.com/column/10054.html)\n  - [6.16 获取当前登录用户信息接口开发](https://www.quanxiaoha.com/column/10055.html)\n  - [6.17 Pinia 存储用户信息，动态显示登录用户名](https://www.quanxiaoha.com/column/10056.html)\n  - [6.18 使用 pinia-persist 插件实现 Pinia 数据持久化](https://www.quanxiaoha.com/column/10057.html)\n  - [6.19 用户修改密码、退出登录功能开发](https://www.quanxiaoha.com/column/10058.html)\n  - [6.20 小结](https://www.quanxiaoha.com/column/10059.html)\n\n  \n\n  \n- 七、管理后台：文章分类模块开发\n  - [7.1 分类模块接口分析](https://www.quanxiaoha.com/column/10060.html)\n  - [7.2 文章分类：新增接口开发](https://www.quanxiaoha.com/column/10061.html)\n  - [7.3 文章分类：分页接口开发](https://www.quanxiaoha.com/column/10062.html)\n  - [7.4 文章分类：删除接口开发](https://www.quanxiaoha.com/column/10063.html)\n  - [7.5 文章发布：分类 Select 下拉列表接口开发](https://www.quanxiaoha.com/column/10064.html)\n  - [7.6 后台分类管理页面：样式布局](https://www.quanxiaoha.com/column/10065.html)\n  - [7.7 Config Provider 全局配置: 实现组件中文化](https://www.quanxiaoha.com/column/10066.html)\n  - [7.8 文章分类：分页列表数据动态渲染](https://www.quanxiaoha.com/column/10067.html)\n  - [7.9 文章分类：新增功能开发](https://www.quanxiaoha.com/column/10068.html)\n  - [7.10 文章分类：删除功能开发](https://www.quanxiaoha.com/column/10069.html)\n  - [7.11 通用表单对话框组件封装](https://www.quanxiaoha.com/column/10070.html)\n  - [7.12 添加 Table 组件加载 Loading 、表单对话框提交按钮 Loading 动画](https://www.quanxiaoha.com/column/10071.html)\n  \n\n\n- 八、管理后台：标签模块开发\n  - [8.1 标签模块接口分析【视频讲解】](https://www.quanxiaoha.com/column/10072.html)\n  - [8.2 标签管理：新增标签接口开发【视频讲解】](https://www.quanxiaoha.com/column/10073.html)\n  - [8.3 标签管理：标签分页接口开发【视频讲解】](https://www.quanxiaoha.com/column/10074.html)\n  - [8.4 标签管理：删除标签接口开发【视频讲解】](https://www.quanxiaoha.com/column/10075.html)\n  - [8.5 标签关键词模糊查询 select 列表接口开发【视频讲解】](https://www.quanxiaoha.com/column/10076.html)\n  - [8.6 标签管理页面开发：分页列表【视频讲解】](https://www.quanxiaoha.com/column/10077.html)\n  - [8.7 标签管理页面开发：新增&删除标签功能【视频讲解】](https://www.quanxiaoha.com/column/10078.html)\n  \n  \n  \n- 九、管理后台：博客设置模块开发\n  - [9.1 博客设置模块功能分析、表设计](https://www.quanxiaoha.com/column/10079.html)\n  - [9.2 Docker 本地安装 Minio 对象存储](https://www.quanxiaoha.com/column/10080.html)\n  - [9.3 文件上传接口开发](https://www.quanxiaoha.com/column/10081.html)\n  - [9.4 博客设置: 更新接口开发](https://www.quanxiaoha.com/column/10082.html)\n  - [9.5 整合 Mapstruct : 简化属性映射](https://www.quanxiaoha.com/column/10083.html)\n  - [9.6 博客设置：获取详情接口开发](https://www.quanxiaoha.com/column/10084.html)\n  - [9.7 博客设置页面：样式布局](https://www.quanxiaoha.com/column/10085.html)\n  - [9.8 管理后台：滚动样式优化](https://www.quanxiaoha.com/column/10086.html)\n  - [9.9 博客设置页：数据渲染、图片上传](https://www.quanxiaoha.com/column/10087.html)\n  - [9.10 博客设置页：更新设置](https://www.quanxiaoha.com/column/10088.html)\n  \n\n\n\n- 十、管理后台：文章模块开发\n  - [10.1 文章管理模块功能分析、表设计](https://www.quanxiaoha.com/column/10090.html)\n  - [10.2 文章管理：文章发布接口开发（1）](https://www.quanxiaoha.com/column/10091.html)\n  - [10.3 文章管理：文章发布接口开发（2）—— SQL 注入器实现批量插入](https://www.quanxiaoha.com/column/10092.html)\n  - [10.4 文章管理：文章删除接口开发](https://www.quanxiaoha.com/column/10093.html)\n  - [10.5 文章管理：分页接口开发](https://www.quanxiaoha.com/column/10094.html)\n  - [10.6 文章管理：获取文章详情接口开发](https://www.quanxiaoha.com/column/10095.html)\n  - [10.7 文章管理：文章更新接口开发](https://www.quanxiaoha.com/column/10096.html)\n  - [10.8 文章管理：分页列表开发](https://www.quanxiaoha.com/column/10097.html)\n  - [10.9 文章管理页：删除文章开发](https://www.quanxiaoha.com/column/10098.html)\n  - [10.10 文章管理页：写文章对话框样式布局](https://www.quanxiaoha.com/column/10099.html)\n  - [10.11 文章管理页：文章发布功能开发](https://www.quanxiaoha.com/column/10100.html)\n  - [10.12 文章管理：获取所有标签 Select 列表接口开发](https://www.quanxiaoha.com/column/10101.html)\n  - [10.13 文章管理页：文章编辑功能开发](https://www.quanxiaoha.com/column/10102.html)\n  - [10.14 Bug 修复：分类、标签删除接口添加是否关联文章校验; 前端 token 过期问题 fixed](https://www.quanxiaoha.com/column/10103.html)\n  \n  \n  \n  \n  \n\n- 十一、博客前台：首页开发\n   - [11.1 前台首页、归档页接口分析](https://www.quanxiaoha.com/column/10104.html)\n   - [11.2 前台首页：文章分页接口开发](https://www.quanxiaoha.com/column/10105.html)\n   - [11.3 公共侧边栏：获取分类、标签列表接口开发](https://www.quanxiaoha.com/column/10106.html)\n   - [11.4 公共部分：获取博客设置信息接口开发](https://www.quanxiaoha.com/column/10107.html)\n   - [11.5 前台 Header 头组件封装](https://www.quanxiaoha.com/column/10108.html)   \n   - [11.6 首页样式布局设计（1）](https://www.quanxiaoha.com/column/10109.html)\n   - [11.7 首页样式布局设计（2） —— 侧边栏博主信息卡片](https://www.quanxiaoha.com/column/10110.html)\n   - [11.8 首页样式布局设计（3） —— 侧边栏分类、标签卡片](https://www.quanxiaoha.com/column/10111.html)\n   - [11.9 首页样式布局设计（4） —— Footer 组件封装](https://www.quanxiaoha.com/column/10112.html)\n   - [11.10 首页文章分页数据渲染](https://www.quanxiaoha.com/column/10113.html)\n   - [11.11 公共右边栏：博主信息卡片组件封装](https://www.quanxiaoha.com/column/10114.html)\n   - [11.12 公共右边栏：分类、标签卡片组件封装](https://www.quanxiaoha.com/column/10115.html)\n   - [11.13 公共 Header 头：跳转后台、退出登录功能开发](https://www.quanxiaoha.com/column/10116.html)\n   \n   \n\n- 十二、博客前台：归档列表页、分类列表页、标签列表页开发\n   - [12.1 归档页、分类列表页接口分析](https://www.quanxiaoha.com/column/10117.html)\n   - [12.2 文章归档分页接口开发](https://www.quanxiaoha.com/column/10118.html)\n   - [12.3 前台归档页：样式布局设计](https://www.quanxiaoha.com/column/10119.html)\n   - [12.4 前台归档页：分页列表功能开发](https://www.quanxiaoha.com/column/10120.html)\n   - [12.5 前台分类页开发](https://www.quanxiaoha.com/column/10121.html)\n   - [12.6 获取某个分类下的文章列表——分页接口开发](https://www.quanxiaoha.com/column/10122.html)\n   - [12.7 前台分类-文章列表页: 样式布局开发](https://www.quanxiaoha.com/column/10123.html)\n   - [12.8 分类-文章列表页开发](https://www.quanxiaoha.com/column/10124.html)\n   - [12.9 前台标签列表页：样式布局&功能开发](https://www.quanxiaoha.com/column/10125.html)\n   - [12.10 获取某个标签下的文章列表——分页接口开发](https://www.quanxiaoha.com/column/10130.html)\n   - [12.11 标签-文章列表页开发](https://www.quanxiaoha.com/column/10131.html)\n\n\n- 十三、博客前台：文章详情页开发\n   - [13.1 文章详情页接口分析](https://www.quanxiaoha.com/column/10126.html)\n   - [13.2 后端封装 Markdown 装换工具类](https://www.quanxiaoha.com/column/10127.html)\n   - [13.3 获取文章详情接口开发](https://www.quanxiaoha.com/column/10128.html)\n   - [13.4 文章详情页：样式布局设计](https://www.quanxiaoha.com/column/10129.html)\n\n   - *努力爆肝中，每天更新两小节, 按目前的更新速度，1.0 版本差不多还剩1个半月更新完毕...*\n- 十四、管理后台：仪表盘模块开发\n- 十五、项目部署上线\n  - 云服务器选购\n  - 相关环境安装（JDK、Docker、Nginx、Mysql）\n  - Nginx 配合 Spring Boot 部署\n  - 部署前端项目以及通过 IP 访问\n  - 域名选购\n  - 网站备案\n  - 域名映射，项目正式上线\n\n\n\n## 👨🏻‍💻 适用人群\n\n- **在校学生**，有一定基础，想做毕业设计，或者为找工作准备，需要实战项目加分；\n\n  > 💡 TIP: 小白也没关系，小哈将会告诉你学习路线是啥，哪里有免费的高质量学习视频可以白嫖，学完这些技术栈后再来做实战项目，或者学一点基础边实战边学习都可以。\n\n- **已经参与工作，对前后端分离感兴趣**，想学习 Vue 3 前端，对独立上线自己网站感兴趣的童鞋；\n- **想独立接私活**，需要同时会后端、前端技术栈的童鞋；\n\n## ✊ 如何加入？\n\n小哈已经将本站的专栏模块接入了知识星球，想要查看专栏内容，需要订阅我星球后，*微信扫码授权登录后即可解锁所有内容*。因为目前也是刚开始运营，所以价格不会太高，星球官方定价最低必须是 50 元。小哈最终定价为 <font class=\"text-xl\" style=\'color: red\'><b>限时 35 元（附 15 元的优惠券，记得扫码领取下方优惠券加入哟）</b></font>，后续随着内容慢慢的更新迭代，会慢慢涨上去，所以早加入更具性价比哟~ \n\n<font class=\"text-xl\" style=\'color: red\'><b>星球支持 3 天无理由退费</b></font>，感兴趣的小伙伴*可先加入，看看内容质量如何，不合适直接退款就行，觉得确实内容很干货，就留下来学习，无套路!*\n\n<div class=\"flex items-center justify-center text-lg text-red-500 font-bold mb-2\">扫描下方二维码加入, 星球支持 3 天无理由退款，可以先进去看看合不合适👇👇</div>\n\n![\"领取优惠券加入，更划算\"](https://img.quanxiaoha.com/quanxiaoha/169355760680941 \"领取优惠券加入，更划算\")\n\n<div class=\"flex items-center justify-center text-lg text-red-500 font-bold\">扫描上方二维码加入, 星球支持 3 天无理由退款，可以先进去看看合不合适👆👆</div>\n\n\n\n\n## ❓ 关于答疑\n\n小伙伴们如果在跟着专栏学习，手敲项目的过程中遇到问题，碰到无法解决的问题，**可在小哈的知识星球内部提问**，我会统一来解答, 如果星球说不清楚的，就加私人微信，打包发项目，亲自给你看哪一步有问题，保证跟上项目进度，不落下任何一个小伙伴，大家一起冲冲冲~\n\n## 😃 加微信咨询\n\n对专栏感兴趣的小伙伴，也可以加小哈私人微信来咨询，扫描下方二维码即可，记得备注【*咨询*】哟：\n\n![扫描二维码，添加小哈私人微信](https://img.quanxiaoha.com/quanxiaoha/169536889316499 \"扫描二维码，添加小哈私人微信\")\n');
INSERT INTO `t_article_content` VALUES (6, 6, '**《淮上与友人别》啊赏析**\n\n“数声风笛离亭晚，君向潇湘我向秦。” 这两句诗，出自晚唐诗人郑谷的《淮上与友人别》，短短十四字，却蕴含着深沉的离愁别绪和广阔的地理空间，是历代传诵的送别名句。\n\n**诗句背景：**\n\n这首诗的背景是诗人郑谷在淮河边送别友人。晚唐时期，政局动荡，士人飘零，友人间的聚散显得更为频繁和伤感。在这种背景下，离别之情往往被赋予更深层次的时代悲凉。\n\n**意境解析：**\n\n1.  **“数声风笛离亭晚”：**\n    * **“数声风笛”：** 笛声本身就带有悠扬、哀怨的特质，常在离别诗中出现，渲染悲伤氛围。这里用“数声”，既表明笛声的断续，更暗示了离别的紧迫与仓促，仿佛笛声是匆匆吹响，为即将分手的友人送行。\n    * **“离亭晚”：** “离亭”是古代送别之处，是承载着无数离愁的场所。“晚”字则点明了时间，傍晚时分，夕阳西下，暮色苍茫，更容易引发人的感伤。光线由明转暗，也象征着离别后友人的未来充满未知，增添了愁绪。风、笛、亭、晚，这几个意象组合在一起，构成了一幅凄清、萧瑟的送别画面，将离别的伤感氛围烘托到了极致。\n\n2.  **“君向潇湘我向秦”：**\n    * **“君向潇湘”：** “潇湘”泛指今湖南一带，水系纵横，风景秀丽，但路途遥远。它代表着友人即将前往的远方。\n    * **“我向秦”：** “秦”则指关中地区，即今陕西一带，是当时的政治文化中心。它代表着诗人自己的归途。\n    * **“君向……我向……”：** 这种对仗句式，明确且直接地指出了两人的分道扬镳，各自奔赴不同的远方。这种空间上的遥远和方向上的相悖，将离别的距离感和孤寂感表达得淋漓尽致。\n\n**艺术特色：**\n\n* **以景烘情：** 诗人巧妙地将自然景物（风、笛、晚）与离别场所（离亭）融为一体，创造出一种凄婉的意境，从而自然而然地流露出离愁。\n* **空间对比：** “潇湘”与“秦”的对比，不仅仅是地理上的遥远，更是心理上的疏离。它强化了友人分别后各自孤身天涯的感受。\n* **平淡中见深情：** 诗句语言朴素，没有华丽的辞藻，但其所蕴含的深情厚谊却感人至深。这种克制而又深沉的情感表达，更显出离别的无奈和惆怅。\n* **含蓄隽永：** 诗歌并没有直接描写悲痛，而是通过场景、声音和方向的对比，让读者自己去体会那份不舍与忧伤。这使得诗句具有很强的艺术感染力，给人留下无尽的想象空间。\n\n**总结：**\n\n“数声风笛离亭晚，君向潇湘我向秦”这两句诗，以其精炼的语言、深邃的意境和饱含的深情，成为唐代送别诗中的典范。它不仅描绘了一幅典型的离别图景，更深刻地表达了友人之间真挚的情感和对未来前途未卜的忧虑，堪称千古绝唱。它超越了具体的送别场景，成为所有离别愁绪的普遍写照，至今仍能引发人们的共鸣。');
INSERT INTO `t_article_content` VALUES (7, 7, '李白的《别鲁颂》是一首充满豪迈之气和高洁情怀的诗歌。虽然在李白存世诗作中，此诗的知名度不如《静夜思》、《将进酒》等，但它依然展现了“诗仙”独特的风格和思想。\n\n**全诗原文：**\n\n谁道泰山高，下却鲁连节。\n谁云秦军众，摧却鲁连舌。\n独立天地间，清风洒兰雪。\n夫子还倜傥，攻文继前烈。\n错落石上松，无为秋霜折。\n赠言镂宝刀，千岁庶不灭。\n\n**创作背景：**\n\n关于《别鲁颂》具体的创作时间，目前没有确切的定论。从诗歌内容来看，它以战国时期齐国义士鲁仲连（即鲁连）的典故为核心，歌颂了鲁仲连不畏强秦、义不帝秦的凛然气节。\n\n李白一生傲岸不羁，崇尚道家思想，追求自由和个体精神的独立。他多次在诗歌中表达对功名利禄的淡泊，对高洁品格的赞美。鲁仲连的形象恰好契合了李白所推崇的这种“独立天地间”的君子风范。因此，这首诗很可能是在李白感叹世事、抒发胸臆之时所作，借古人言志。\n\n**诗歌赏析：**\n\n* **开篇点题，反问激昂：** “谁道泰山高，下却鲁连节。谁云秦军众，摧却鲁连舌。” \n    * 诗人以两个反问句开头，直接点出鲁仲连的非凡事迹。泰山之高，象征着世俗的强大力量，而鲁仲连的气节却能使其“下却”；秦军之众，象征着无可匹敌的武力，而鲁仲连的三寸不烂之舌却能“摧却”。\n    * 这种开篇方式气势磅礴，瞬间将读者带入一个充满英雄气概的境界，也直接奠定了诗歌的豪迈基调。\n\n* **中段抒情，品格高洁：** “独立天地间，清风洒兰雪。夫子还倜傥，攻文继前烈。”\n    * “独立天地间”是全诗的核心意象，它高度概括了鲁仲连不依附权势、不慕荣利的独立精神，也反映了李白自身对高洁品格的追求。\n    * “清风洒兰雪”一句，则通过清新的意象，进一步渲染了鲁仲连高洁、纯粹的形象。兰花象征君子，雪象征纯洁，清风则寓意其风骨凛然。\n    * “夫子还倜傥，攻文继前烈”中的“夫子”指的仍是鲁仲连，赞扬他潇洒不羁、才华横溢，并且能够继承前代贤哲的功业。\n\n* **结尾寄语，意境深远：** “错落石上松，无为秋霜折。赠言镂宝刀，千岁庶不灭。”\n    * “错落石上松”以青松傲立于岩石之上，不畏严寒的形象，再次比喻鲁仲连坚韧不拔、不屈不挠的品格。即使是秋霜，也无法将其摧折，进一步强调其节操的坚定。\n    * 最后两句“赠言镂宝刀，千岁庶不灭”，将对鲁仲连的赞美提升到永恒的高度。如同将赠言刻在宝刀上，鲁仲连的功绩和精神将流芳百世，千年不朽。\n\n**艺术特色：**\n\n* **豪迈奔放：** 诗歌整体气势雄浑，语言洒脱，充满浪漫主义色彩。\n* **用典精妙：** 巧妙运用鲁仲连的典故，以古喻今，表达诗人对独立人格和高尚节操的崇尚。\n* **意象鲜明：** 泰山、秦军、清风、兰雪、石上松、宝刀等意象，或象征威严强大，或象征高洁纯粹，共同构建了诗歌的意境。\n* **感情充沛：** 字里行间流露出诗人对鲁仲连的敬仰之情，以及对不屈精神的赞美，充满激情。\n\n总而言之，《别鲁颂》是李白以古人明志的典型作品，通过对鲁仲连高尚节操的歌颂，表达了诗人自身对独立、高洁、不屈不挠精神的追求，也展现了他作为“诗仙”的豪迈与浪漫。');
INSERT INTO `t_article_content` VALUES (8, 8, '```java\npublic static void main(String args[]){\n  System.out.println(\"Hello World!\");\n}\n```\n代码高亮测试');

-- ----------------------------
-- Table structure for t_article_tag_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_article_tag_rel`;
CREATE TABLE `t_article_tag_rel`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` bigint UNSIGNED NOT NULL COMMENT '文章id',
  `tag_id` bigint UNSIGNED NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id` ASC) USING BTREE,
  INDEX `idx_tag_id`(`tag_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章对应标签关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_tag_rel
-- ----------------------------
INSERT INTO `t_article_tag_rel` VALUES (9, 4, 19);
INSERT INTO `t_article_tag_rel` VALUES (12, 6, 8);
INSERT INTO `t_article_tag_rel` VALUES (13, 6, 20);
INSERT INTO `t_article_tag_rel` VALUES (14, 7, 20);
INSERT INTO `t_article_tag_rel` VALUES (15, 7, 8);
INSERT INTO `t_article_tag_rel` VALUES (16, 5, 8);
INSERT INTO `t_article_tag_rel` VALUES (17, 5, 9);
INSERT INTO `t_article_tag_rel` VALUES (18, 5, 17);
INSERT INTO `t_article_tag_rel` VALUES (19, 5, 18);
INSERT INTO `t_article_tag_rel` VALUES (20, 8, 7);

-- ----------------------------
-- Table structure for t_blog_settings
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_settings`;
CREATE TABLE `t_blog_settings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `logo` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '博客Logo',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '博客名称',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者名',
  `introduction` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '介绍语',
  `avatar` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者头像',
  `github_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'GitHub 主页访问地址',
  `csdn_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'CSDN 主页访问地址',
  `gitee_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Gitee 主页访问地址',
  `zhihu_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '知乎主页访问地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog_settings
-- ----------------------------
INSERT INTO `t_blog_settings` VALUES (1, 'http://101.132.176.129:9000/weblog/e6341d050f6f49d7b325cbec5caf0471.png', '辞树的博客', '辞树', '独立天地间，清风洒兰雪。', 'http://101.132.176.129:9000/weblog/6db3baed91804e3f9025255e7c81fa51.png', 'https://github.com/Bucengfeijianqurentou', '', 'https://gitee.com/red-sleeved-tea', '');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除标志位：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, 'Java', '2025-05-22 10:10:48', '2025-05-22 10:10:48', 0);
INSERT INTO `t_category` VALUES (2, 'Python', '2025-05-22 10:11:54', '2025-05-22 10:11:54', 0);
INSERT INTO `t_category` VALUES (5, 'AI', '2025-05-22 15:26:00', '2025-05-22 15:26:00', 0);
INSERT INTO `t_category` VALUES (11, 'fff', '2025-05-22 15:50:57', '2025-05-22 15:50:57', 0);

-- ----------------------------
-- Table structure for t_statistics_article_pv
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_article_pv`;
CREATE TABLE `t_statistics_article_pv`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pv_date` date NOT NULL COMMENT '被统计的日期',
  `pv_count` bigint UNSIGNED NOT NULL COMMENT 'pv访问量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_pv_date`(`pv_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '统计表 - 文章 PV (访问量)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_statistics_article_pv
-- ----------------------------

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除标志位: 0: 未删除 1: 已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (1, '标签1', '2025-05-22 16:29:11', '2025-05-22 16:29:11', 0);
INSERT INTO `t_tag` VALUES (2, '标签2', '2025-05-22 16:29:32', '2025-05-22 16:29:32', 0);
INSERT INTO `t_tag` VALUES (6, 'biaoqian', '2025-05-22 16:29:56', '2025-05-22 16:29:56', 0);
INSERT INTO `t_tag` VALUES (7, 'IT', '2025-05-22 17:34:20', '2025-05-22 17:34:20', 0);
INSERT INTO `t_tag` VALUES (8, '生活', '2025-05-22 17:34:20', '2025-05-22 17:34:20', 0);
INSERT INTO `t_tag` VALUES (9, 'ffffff', '2025-05-22 17:46:20', '2025-05-22 17:46:20', 0);
INSERT INTO `t_tag` VALUES (11, 'fdsf', '2025-05-22 17:46:40', '2025-05-22 17:46:40', 0);
INSERT INTO `t_tag` VALUES (15, '新的标签1', '2025-05-26 14:40:35', '2025-05-26 14:40:35', 0);
INSERT INTO `t_tag` VALUES (16, '新的标签2', '2025-05-26 14:40:35', '2025-05-26 14:40:35', 0);
INSERT INTO `t_tag` VALUES (17, '新的标签3', '2025-05-26 14:43:17', '2025-05-26 14:43:17', 0);
INSERT INTO `t_tag` VALUES (18, '新的标签4', '2025-05-26 14:43:17', '2025-05-26 14:43:17', 0);
INSERT INTO `t_tag` VALUES (19, '你好呀', '2025-05-26 15:39:11', '2025-05-26 15:39:11', 0);
INSERT INTO `t_tag` VALUES (20, '诗词', '2025-05-26 16:12:50', '2025-05-26 16:12:50', 0);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '辞树', '$2a$10$DYi5rkNmE9rtn5LJ9./I2Og8dYteXszfKMNn.67XZCzkO.OjPC4Ji', '2025-03-04 11:44:39', '2025-03-04 11:44:39', 0);
INSERT INTO `t_user` VALUES (3, 'test', '$2a$10$TcoTghDBfW9HP.74lLRVPOMTv3oNNB3JF4EBKBtKbDCUrpLrlX8Dm', '2025-03-07 11:15:12', '2025-05-22 15:49:41', 0);
INSERT INTO `t_user` VALUES (4, '犬小哈', '123456', '2025-05-19 20:54:52', '2025-05-19 20:54:52', 0);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `role` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, '辞树', 'ROLE_ADMIN', '2023-07-07 01:21:15');
INSERT INTO `t_user_role` VALUES (2, 'test', 'ROLE_VISITOR', '2023-07-07 01:23:33');

SET FOREIGN_KEY_CHECKS = 1;
