
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for scheduled_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `scheduled_quartz_job`;
CREATE TABLE `scheduled_quartz_job` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `project_key` varchar(50) NOT NULL DEFAULT '' COMMENT '项目key',
  `job_class` varchar(80) NOT NULL COMMENT '任务接口类名',
  `job_method` varchar(80) NOT NULL COMMENT '任务方法名',
  `job_arguments` varchar(2048) NOT NULL COMMENT '任务参数',
  `job_group` varchar(80) NOT NULL COMMENT '任务分组',
  `job_name` varchar(80) NOT NULL COMMENT '任务名称',
  `job_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '任务状态 1-启用 2-停用',
  `cron_expression` varchar(80) NOT NULL COMMENT '时间表达式',
  `description` varchar(64) NOT NULL DEFAULT '' COMMENT '任务描述',
  `last_run_timestamp` bigint(20) NOT NULL DEFAULT '-1' COMMENT '最后执行时间戳',
  `create_by` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人ID',
  `create_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '最后修改人ID',
  `update_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最后修改人名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记 0正常 1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_project` (`project_key`) USING BTREE,
  KEY `idx_job_class_method` (`job_class`,`job_method`) USING BTREE,
  KEY `idx_job_name` (`job_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务表';

-- ----------------------------
-- Records of scheduled_quartz_job
-- ----------------------------
BEGIN;
INSERT INTO `scheduled_quartz_job` VALUES (1, 'common', 'taskAdminMonitor', 'monitor', '', '1', '每分钟监控任务', 2, '0 0/1 * * * ?', '监控任务，每分钟执行', 1590162120005, '1', '超级管理员', '2020-05-10 19:07:35', '2', '管理员', '2020-05-23 14:44:03', 0);
INSERT INTO `scheduled_quartz_job` VALUES (2, 'common', 'taskNoArgsDemo', 'noArgsMethod1', '', '1', '无参任务1', 2, '0/5 * * * * ?', '', -1, '1', '超级管理员', '2020-05-10 19:41:23', '2', '管理员', '2020-05-23 14:44:14', 0);
INSERT INTO `scheduled_quartz_job` VALUES (3, 'common', 'taskNoArgsDemo', 'noArgsMethod2', '', '1', '无参任务2', 2, '0/10 * * * * ?', '', -1, '1', '超级管理员', '2020-05-10 19:51:23', '2', '管理员', '2020-05-19 20:55:57', 0);
INSERT INTO `scheduled_quartz_job` VALUES (4, 'common', 'taskHasArgsDemo', 'hasOneArgsMethod', '001', '1', '有参任务1', 1, '0/8 * * * * ?', '', -1, '1', '超级管理员', '2020-05-10 22:38:44', '2', '管理员', '2020-05-18 23:56:59', 1);
INSERT INTO `scheduled_quartz_job` VALUES (5, 'common', 'taskHasArgsDemo', 'hasTwoArgsMethod', '001#&002', '1', '有参任务2', 2, '0/1 * * * * ?', '12345678', 1590072799108, '1', '超级管理员', '2020-05-10 22:43:53', '2', '管理员', '2020-05-21 22:53:19', 0);
INSERT INTO `scheduled_quartz_job` VALUES (6, 'common', 'taskLongSleepDemo', 'sleep30Second', '', '1', '测试任务', 1, '0 0/1 * * * ?', '', 1590217170130, '1', '超级管理员', '2020-05-12 23:24:49', '2', '管理员', '2020-05-23 14:59:30', 0);
INSERT INTO `scheduled_quartz_job` VALUES (7, 'common', 'taskJsonArgsDemo', 'jsonArgsDemo', '{\"page\":88,\"pageSize\":100,\"keywords\":\"BeJson\"}', '1', 'JSON参数任务', 2, '0/5 * * * * ?', '', -1, '3', '程序员小强', '2020-05-18 00:57:16', '2', '管理员', '2020-05-19 20:56:02', 0);
INSERT INTO `scheduled_quartz_job` VALUES (8, 'common', 'taskHasArgsDemo', 'hasOneArgsMethod', '009', '1', '有参任务1', 2, '0/1 * * * * ?', '12345678', 1590216508008, '2', '管理员', '2020-05-19 00:04:59', '2', '管理员', '2020-05-23 14:48:28', 0);
COMMIT;

-- ----------------------------
-- Table structure for scheduled_quartz_job_log
-- ----------------------------
DROP TABLE IF EXISTS `scheduled_quartz_job_log`;
CREATE TABLE `scheduled_quartz_job_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `project_key` varchar(50) NOT NULL DEFAULT '' COMMENT '项目key',
  `job_id` int(11) unsigned NOT NULL COMMENT '任务ID',
  `log_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '日志类型 1-新增 2-修改 3-启动 4-停止 5-删除',
  `log_desc` varchar(32) NOT NULL DEFAULT '' COMMENT '日志描述',
  `content` varchar(2048) NOT NULL DEFAULT '' COMMENT '日志内容',
  `ip_address` varchar(128) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `operate_id` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人ID',
  `operate_name` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_job_id` (`job_id`) USING BTREE,
  KEY `idx_ooperate_id` (`ip_address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务日志记录表';

-- ----------------------------
-- Records of scheduled_quartz_job_log
-- ----------------------------
BEGIN;
INSERT INTO `scheduled_quartz_job_log` VALUES (1, 'common', 2, 1, '新增', '{\"createBy\":\"1\",\"createName\":\"超级管理员\",\"createTime\":1589110883000,\"cronExpression\":\"0/5 * * * * ?\",\"delFlag\":0,\"description\":\"\",\"id\":2,\"jobArguments\":\"\",\"jobClass\":\"TaskNoArgsDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"noArgsMethod1\",\"jobName\":\"无参任务1\",\"jobStatus\":1,\"running\":false,\"triggerName\":\"ScheduledQuartzJobInfo:null:无参任务1:Trigger\",\"updateBy\":\"1\",\"updateName\":\"超级管理员\",\"updateTime\":1589110883000}', '1', '1', '超级管理员', '', '2020-05-10 19:41:23', '2020-05-12 00:59:40');
INSERT INTO `scheduled_quartz_job_log` VALUES (2, 'common', 3, 1, '新增', '{\"createBy\":\"1\",\"createName\":\"超级管理员\",\"createTime\":1589111483000,\"cronExpression\":\"0/10 * * * * ?\",\"delFlag\":0,\"description\":\"\",\"id\":3,\"jobArguments\":\"\",\"jobClass\":\"taskNoArgsDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"noArgsMethod1\",\"jobName\":\"无参任务2\",\"jobStatus\":1,\"running\":false,\"triggerName\":\"ScheduledQuartzJobInfo:null:无参任务2:Trigger\",\"updateBy\":\"1\",\"updateName\":\"超级管理员\",\"updateTime\":1589111483000}', '1', '1', '超级管理员', '', '2020-05-10 19:51:23', '2020-05-23 14:28:08');
INSERT INTO `scheduled_quartz_job_log` VALUES (3, 'common', 4, 1, '新增', '{\"createBy\":\"1\",\"createName\":\"超级管理员\",\"createTime\":1589121524000,\"cronExpression\":\"0/10 * * * * ?\",\"delFlag\":0,\"description\":\"\",\"id\":4,\"jobArguments\":\"\",\"jobClass\":\"taskHasArgsDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"noArgsMethod2\",\"jobName\":\"无参任务2\",\"jobStatus\":1,\"running\":false,\"triggerName\":\"ScheduledQuartzJobInfo:null:无参任务2:Trigger\",\"updateBy\":\"1\",\"updateName\":\"超级管理员\",\"updateTime\":1589121524000}', '1', '1', '超级管理员', '', '2020-05-10 22:38:44', '2020-05-23 14:28:11');
INSERT INTO `scheduled_quartz_job_log` VALUES (4, 'common', 5, 1, '新增', '{\"createBy\":\"1\",\"createName\":\"超级管理员\",\"createTime\":1589121833000,\"cronExpression\":\"0/8 * * * * ?\",\"delFlag\":0,\"description\":\"\",\"id\":5,\"jobArguments\":\"001\",\"jobClass\":\"taskHasArgsDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"hasTwoArgsMethod\",\"jobName\":\"有参任务1\",\"jobStatus\":1,\"running\":false,\"triggerName\":\"ScheduledQuartzJobInfo:null:有参任务1:Trigger\",\"updateBy\":\"1\",\"updateName\":\"超级管理员\",\"updateTime\":1589121833000}', '1', '1', '超级管理员', '', '2020-05-10 22:43:53', '2020-05-23 14:28:14');
INSERT INTO `scheduled_quartz_job_log` VALUES (5, 'common', 6, 1, '新增', '{\"createBy\":\"1\",\"createName\":\"超级管理员\",\"createTime\":1589297089000,\"cronExpression\":\"0/6 * * * * ?\",\"delFlag\":0,\"description\":\"\",\"id\":6,\"jobArguments\":\"001#&002\",\"jobClass\":\"taskLongSleepDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"sleep10Second\",\"jobName\":\"有参任务1\",\"jobStatus\":2,\"triggerName\":\"ScheduledQuartzJobInfo:null:有参任务1:Trigger\",\"updateBy\":\"1\",\"updateName\":\"超级管理员\",\"updateTime\":1589297089000}', '192.168.3.5', '1', '超级管理员', '', '2020-05-12 23:24:49', '2020-05-23 14:28:19');
INSERT INTO `scheduled_quartz_job_log` VALUES (6, 'common', 7, 1, '新增', '{\"createBy\":\"3\",\"createName\":\"程序员小强\",\"createTime\":1589734636000,\"cronExpression\":\"0/6 * * * * ?\",\"delFlag\":0,\"description\":\"\",\"id\":7,\"jobArguments\":\"{\\\"page\\\":88,\\\"pageSize\\\":100,\\\"keywords\\\":\\\"BeJson\\\"}\",\"jobClass\":\"taskJsonArgsDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"jsonArgsDemo\",\"jobName\":\"有参任务1\",\"jobStatus\":2,\"triggerName\":\"ScheduledQuartzJobInfo:null:有参任务1:Trigger\",\"updateBy\":\"3\",\"updateName\":\"程序员小强\",\"updateTime\":1589734636000}', '115.197.170.0 | \r\n\r\n浙江省杭州市 电信\n', '3', '程序员小强', 'Chrome 81.0.4044.138 | Mac', '2020-05-18 00:57:16', '2020-05-23 14:28:22');
INSERT INTO `scheduled_quartz_job_log` VALUES (7, 'common', 8, 1, '新增', '{\"createBy\":\"2\",\"createName\":\"管理员\",\"createTime\":1589817899000,\"cronExpression\":\"0/1 * * * * ?\",\"delFlag\":0,\"description\":\"12345678\",\"id\":8,\"jobArguments\":\"001#&002\",\"jobClass\":\"taskHasArgsDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"hasOneArgsMethod\",\"jobName\":\"有参任务1\",\"jobStatus\":2,\"quartzJobName\":\"taskHasArgsDemo.hasOneArgsMethod\",\"triggerName\":\"job:taskHasArgsDemo:hasOneArgsMethod:Trigger\",\"updateBy\":\"2\",\"updateName\":\"管理员\",\"updateTime\":1589817899000}', '115.197.172.222 | \r\n\r\n浙江省杭州市 电信\n', '2', '管理员', 'Chrome 81.0.4044.138 | Mac', '2020-05-19 00:04:59', '2020-05-23 14:28:25');
INSERT INTO `scheduled_quartz_job_log` VALUES (8, 'common', 1, 2, '修改', '{\"id\":[\"1\",\"1\"],\"projectKey\":[\"common\",\"common\"],\"jobClass\":[\"taskAdminMonitor\",\"taskAdminMonitor\"],\"jobMethod\":[\"monitor\",\"monitor\"],\"jobArguments\":[\"\",\"\"],\"jobGroup\":[\"1\",\"1\"],\"jobName\":[\"监控任务\",\"每分钟监控任务\"],\"jobStatus\":[\"2\",\"2\"],\"cronExpression\":[\"0 0/1 * * * ?\",\"0 0/1 * * * ?\"],\"description\":[\"监控任务，每分钟执行1234567\",\"监控任务，每分钟执行\"],\"LastRunTimestamp\":[\"1590162120005\",\"1590162120005\"],\"createBy\":[\"1\",\"1\"],\"createName\":[\"超级管理员\",\"超级管理员\"],\"createTime\":[\"Sun May 10 19:07:35 CST 2020\",\"Sun May 10 19:07:35 CST 2020\"],\"updateBy\":[\"2\",\"2\"],\"updateName\":[\"管理员\",\"管理员\"],\"updateTime\":[\"Fri May 22 23:42:39 CST 2020\",\"Sat May 23 14:44:03 CST 2020\"],\"delFlag\":[\"0\",\"0\"]}', '127.0.0.1', '2', '管理员', 'Chrome 81.0.4044.138 | Mac', '2020-05-23 14:44:03', '2020-05-23 14:44:03');
INSERT INTO `scheduled_quartz_job_log` VALUES (9, 'common', 2, 2, '修改', '{\"id\":[\"2\",\"2\"],\"projectKey\":[\"common\",\"common\"],\"jobClass\":[\"taskNoArgsDemo\",\"taskNoArgsDemo\"],\"jobMethod\":[\"noArgsMethod1\",\"noArgsMethod1\"],\"jobArguments\":[\"\",\"\"],\"jobGroup\":[\"1\",\"1\"],\"jobName\":[\"无参任务14\",\"无参任务1\"],\"jobStatus\":[\"2\",\"2\"],\"cronExpression\":[\"0/5 * * * * ?\",\"0/5 * * * * ?\"],\"description\":[\"123\",\"\"],\"LastRunTimestamp\":[\"-1\",\"-1\"],\"createBy\":[\"1\",\"1\"],\"createName\":[\"超级管理员\",\"超级管理员\"],\"createTime\":[\"Sun May 10 19:41:23 CST 2020\",\"Sun May 10 19:41:23 CST 2020\"],\"updateBy\":[\"1\",\"2\"],\"updateName\":[\"超级管理员\",\"管理员\"],\"updateTime\":[\"Wed May 20 00:03:17 CST 2020\",\"Sat May 23 14:44:14 CST 2020\"],\"delFlag\":[\"0\",\"0\"]}', '127.0.0.1', '2', '管理员', 'Chrome 81.0.4044.138 | Mac', '2020-05-23 14:44:14', '2020-05-23 14:44:14');
INSERT INTO `scheduled_quartz_job_log` VALUES (10, 'common', 6, 2, '修改', '{\"id\":[\"6\",\"6\"],\"projectKey\":[\"common\",\"common\"],\"jobClass\":[\"taskLongSleepDemo\",\"taskLongSleepDemo\"],\"jobMethod\":[\"sleep30Second\",\"sleep30Second\"],\"jobArguments\":[\"\",\"\"],\"jobGroup\":[\"1\",\"1\"],\"jobName\":[\"有参任务1\",\"测试任务\"],\"jobStatus\":[\"2\",\"2\"],\"cronExpression\":[\"0 0 10,14,16 * * ?\",\"0 0 10,14,16 * * ?\"],\"description\":[\"\",\"\"],\"LastRunTimestamp\":[\"-1\",\"-1\"],\"createBy\":[\"1\",\"1\"],\"createName\":[\"超级管理员\",\"超级管理员\"],\"createTime\":[\"Tue May 12 23:24:49 CST 2020\",\"Tue May 12 23:24:49 CST 2020\"],\"updateBy\":[\"2\",\"2\"],\"updateName\":[\"管理员\",\"管理员\"],\"updateTime\":[\"Tue May 19 20:55:59 CST 2020\",\"Sat May 23 14:44:38 CST 2020\"],\"delFlag\":[\"0\",\"0\"]}', '127.0.0.1', '2', '管理员', 'Chrome 81.0.4044.138 | Mac', '2020-05-23 14:44:38', '2020-05-23 14:44:38');
INSERT INTO `scheduled_quartz_job_log` VALUES (11, 'common', 8, 4, '停止', '{\"createBy\":\"2\",\"createName\":\"管理员\",\"createTime\":1589817899000,\"cronExpression\":\"0/1 * * * * ?\",\"delFlag\":0,\"description\":\"12345678\",\"id\":8,\"jobArguments\":\"009\",\"jobClass\":\"taskHasArgsDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"hasOneArgsMethod\",\"jobName\":\"有参任务1\",\"jobStatus\":2,\"lastRunTimestamp\":1590216507008,\"projectKey\":\"common\",\"quartzJobName\":\"taskHasArgsDemo.hasOneArgsMethod\",\"triggerName\":\"job:taskHasArgsDemo:hasOneArgsMethod:Trigger\",\"updateBy\":\"2\",\"updateName\":\"管理员\",\"updateTime\":1590216507000}', '127.0.0.1', '2', '管理员', 'Chrome 81.0.4044.138 | Mac', '2020-05-23 14:48:27', '2020-05-23 14:48:27');
INSERT INTO `scheduled_quartz_job_log` VALUES (12, 'common', 6, 2, '修改', '{\"id\":[\"6\",\"6\"],\"projectKey\":[\"common\",\"common\"],\"jobClass\":[\"taskLongSleepDemo\",\"taskLongSleepDemo\"],\"jobMethod\":[\"sleep30Second\",\"sleep30Second\"],\"jobArguments\":[\"\",\"\"],\"jobGroup\":[\"1\",\"1\"],\"jobName\":[\"测试任务\",\"测试任务\"],\"jobStatus\":[\"2\",\"2\"],\"cronExpression\":[\"0 0 10,14,16 * * ?\",\"0/1 * * * * ?\"],\"description\":[\"\",\"\"],\"LastRunTimestamp\":[\"-1\",\"-1\"],\"createBy\":[\"1\",\"1\"],\"createName\":[\"超级管理员\",\"超级管理员\"],\"createTime\":[\"Tue May 12 23:24:49 CST 2020\",\"Tue May 12 23:24:49 CST 2020\"],\"updateBy\":[\"2\",\"2\"],\"updateName\":[\"管理员\",\"管理员\"],\"updateTime\":[\"Sat May 23 14:44:38 CST 2020\",\"Sat May 23 14:48:43 CST 2020\"],\"delFlag\":[\"0\",\"0\"]}', '127.0.0.1', '2', '管理员', 'Chrome 81.0.4044.138 | Mac', '2020-05-23 14:48:43', '2020-05-23 14:48:43');
INSERT INTO `scheduled_quartz_job_log` VALUES (13, 'common', 6, 3, '启动', '{\"createBy\":\"1\",\"createName\":\"超级管理员\",\"createTime\":1589297089000,\"cronExpression\":\"0/1 * * * * ?\",\"delFlag\":0,\"description\":\"\",\"id\":6,\"jobArguments\":\"\",\"jobClass\":\"taskLongSleepDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"sleep30Second\",\"jobName\":\"测试任务\",\"jobStatus\":1,\"lastRunTimestamp\":-1,\"projectKey\":\"common\",\"quartzJobName\":\"taskLongSleepDemo.sleep30Second\",\"triggerName\":\"job:taskLongSleepDemo:sleep30Second:Trigger\",\"updateBy\":\"2\",\"updateName\":\"管理员\",\"updateTime\":1590216528000}', '127.0.0.1', '2', '管理员', 'Chrome 81.0.4044.138 | Mac', '2020-05-23 14:48:48', '2020-05-23 14:48:48');
INSERT INTO `scheduled_quartz_job_log` VALUES (14, 'common', 6, 4, '停止', '{\"createBy\":\"1\",\"createName\":\"超级管理员\",\"createTime\":1589297089000,\"cronExpression\":\"0/1 * * * * ?\",\"delFlag\":0,\"description\":\"\",\"id\":6,\"jobArguments\":\"\",\"jobClass\":\"taskLongSleepDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"sleep30Second\",\"jobName\":\"测试任务\",\"jobStatus\":2,\"lastRunTimestamp\":1590216567122,\"projectKey\":\"common\",\"quartzJobName\":\"taskLongSleepDemo.sleep30Second\",\"triggerName\":\"job:taskLongSleepDemo:sleep30Second:Trigger\",\"updateBy\":\"2\",\"updateName\":\"管理员\",\"updateTime\":1590216580000}', '127.0.0.1', '2', '管理员', 'Chrome 81.0.4044.138 | Mac', '2020-05-23 14:49:40', '2020-05-23 14:49:40');
INSERT INTO `scheduled_quartz_job_log` VALUES (15, 'common', 6, 2, '修改', '{\"id\":[\"6\",\"6\"],\"projectKey\":[\"common\",\"common\"],\"jobClass\":[\"taskLongSleepDemo\",\"taskLongSleepDemo\"],\"jobMethod\":[\"sleep30Second\",\"sleep30Second\"],\"jobArguments\":[\"\",\"\"],\"jobGroup\":[\"1\",\"1\"],\"jobName\":[\"测试任务\",\"测试任务\"],\"jobStatus\":[\"2\",\"2\"],\"cronExpression\":[\"0/1 * * * * ?\",\"0 0/1 * * * ?\"],\"description\":[\"\",\"\"],\"LastRunTimestamp\":[\"1590216597262\",\"1590216597262\"],\"createBy\":[\"1\",\"1\"],\"createName\":[\"超级管理员\",\"超级管理员\"],\"createTime\":[\"Tue May 12 23:24:49 CST 2020\",\"Tue May 12 23:24:49 CST 2020\"],\"updateBy\":[\"2\",\"2\"],\"updateName\":[\"管理员\",\"管理员\"],\"updateTime\":[\"Sat May 23 14:49:57 CST 2020\",\"Sat May 23 14:49:59 CST 2020\"],\"delFlag\":[\"0\",\"0\"]}', '127.0.0.1', '2', '管理员', 'Chrome 81.0.4044.138 | Mac', '2020-05-23 14:49:59', '2020-05-23 14:49:59');
INSERT INTO `scheduled_quartz_job_log` VALUES (16, 'common', 6, 3, '启动', '{\"createBy\":\"1\",\"createName\":\"超级管理员\",\"createTime\":1589297089000,\"cronExpression\":\"0 0/1 * * * ?\",\"delFlag\":0,\"description\":\"\",\"id\":6,\"jobArguments\":\"\",\"jobClass\":\"taskLongSleepDemo\",\"jobGroup\":\"1\",\"jobMethod\":\"sleep30Second\",\"jobName\":\"测试任务\",\"jobStatus\":1,\"lastRunTimestamp\":1590216597262,\"projectKey\":\"common\",\"quartzJobName\":\"taskLongSleepDemo.sleep30Second\",\"triggerName\":\"job:taskLongSleepDemo:sleep30Second:Trigger\",\"updateBy\":\"2\",\"updateName\":\"管理员\",\"updateTime\":1590216605000}', '127.0.0.1', '2', '管理员', 'Chrome 81.0.4044.138 | Mac', '2020-05-23 14:50:05', '2020-05-23 14:50:05');
COMMIT;

-- ----------------------------
-- Table structure for scheduled_quartz_user
-- ----------------------------
DROP TABLE IF EXISTS `scheduled_quartz_user`;
CREATE TABLE `scheduled_quartz_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `project_key` varchar(50) NOT NULL COMMENT '项目Key',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `salt` varchar(40) NOT NULL COMMENT '盐',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `real_name` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `user_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1-启用;2-停用;3-锁定',
  `user_type` tinyint(1) NOT NULL DEFAULT '3' COMMENT '用户类型 1-超级管理员 2-管理员 3-普通用户',
  `menus` varchar(1024) NOT NULL DEFAULT '' COMMENT '菜单权限集',
  `functions` varchar(1024) NOT NULL DEFAULT '' COMMENT '功能权限集',
  `remarks` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `last_login_timestamp` bigint(20) NOT NULL DEFAULT '-1' COMMENT '最后登录时间戳',
  `create_by` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人ID',
  `create_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) NOT NULL DEFAULT '' COMMENT '最后修改人ID',
  `update_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最后修改人名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记 0-正常,1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_username` (`username`) USING BTREE,
  KEY `idx_project` (`project_key`),
  KEY `idx_real_name` (`real_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务管理平台用户信息表';

-- ----------------------------
-- Records of scheduled_quartz_user
-- ----------------------------
BEGIN;
INSERT INTO `scheduled_quartz_user` VALUES (1, 'common', 'superAdmin', 'c58a9cbb1b464b15948d2505243ee476', '637f08bd6df8f49efbe733569bbee14e', '超级管理员', 1, 1, '', '', '', 1589903652777, 'system', 'system', '2020-04-25 22:28:53', '1', '超级管理员', '2020-05-19 23:54:12', 0);
INSERT INTO `scheduled_quartz_user` VALUES (2, 'common', 'admin', '83f833e0b28341b6bf73ed2da64051be', '562bce08a46c543325c02c6b4c90dd7f', '管理员', 1, 2, '', '', '', 1590216206554, '1', '超级管理员', '2020-04-25 22:37:03', '2', '管理员', '2020-05-23 14:45:23', 0);
INSERT INTO `scheduled_quartz_user` VALUES (3, 'common', 'xiaoqiang', 'bd401276177a44f4a69393a960463256', '2c79adfcdbee6f698da972955a88c816', '程序员小强', 1, 3, 'userManger,taskManger,taskLogManger', 'userAdd,userUpdate,userUpdatePwd,userUpdatePower,userDelete,taskAdd,taskUpdate,taskChangeStatus', '我是程序员小强', 1589734514447, '1', '超级管理员', '2020-04-25 22:37:03', '2', '管理员', '2020-05-18 00:55:14', 0);
INSERT INTO `scheduled_quartz_user` VALUES (4, 'common', '张三', 'a4479ca5b3744f4790eb7e575729b59b', '1f7fd30946de7a4894b9b09ba5e80b33', '张三', 1, 3, 'userManger,taskManger', 'userAdd,userUpdate,userUpdatePwd,userUpdatePower,userDelete,taskAdd,taskUpdate,taskChangeStatus,taskDelete', '', 1589903334940, '2', '管理员', '2020-05-14 23:42:03', '4', '张三', '2020-05-19 23:48:54', 0);
INSERT INTO `scheduled_quartz_user` VALUES (5, 'common', 'lisi', 'e8c282e197cb49e8b7a5c36d30d365bd', '067f7eebd730e8dfaf0e256abd44ec8f', '李四', 2, 3, '', '', '', 1589893319455, '2', '管理员', '2020-05-14 23:56:21', '2', '管理员', '2020-05-19 21:01:59', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
