

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for export_task_info
-- ----------------------------
DROP TABLE IF EXISTS `export_task_info`;
CREATE TABLE `export_task_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `task_id` varchar(32) NOT NULL COMMENT '任务ID',
  `platform_id` varchar(32) NOT NULL COMMENT '平台方ID',
  `template_id` varchar(32) NOT NULL COMMENT '模板ID',
  `task_title` varchar(255) NOT NULL DEFAULT '' COMMENT '任务标题',
  `task_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '任务状态 1-处理中 ; 2-处理成功; 3-处理失败',
  `task_param` varchar(2000) NOT NULL DEFAULT '' COMMENT '任务参数(JSON)',
  `download_url` varchar(512) NOT NULL DEFAULT '' COMMENT '下载文件URL',
  `task_dual` bigint(20) NOT NULL DEFAULT '0' COMMENT '执行耗时毫秒数',
  `task_rows` int(11) NOT NULL DEFAULT '0' COMMENT '任务行数',
  `ext_info` varchar(512) NOT NULL DEFAULT '' COMMENT '扩展信息',
  `remarks` varchar(1024) NOT NULL DEFAULT '' COMMENT '任务备注(失败原因)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_task_id` (`task_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='导出任务表';


-- ----------------------------
-- Table structure for export_template_info
-- ----------------------------
DROP TABLE IF EXISTS `export_template_info`;
CREATE TABLE `export_template_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `template_id` varchar(32) NOT NULL COMMENT '模板ID',
  `platform_id` varchar(32) NOT NULL COMMENT '平台方ID',
  `db_code` varchar(32) NOT NULL COMMENT '数据库编码',
  `template_child_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '子模板ID 0-无',
  `template_title` varchar(255) NOT NULL DEFAULT '' COMMENT '模板标题',
  `template_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '模板状态 1-启用; 2-停用',
  `template_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '模板类型 1-普通导出列表 ; 2-模板导出列表 ; 3-模板导出对象; 4-模板导出对象与列表',
  `table_columns` varchar(2000) NOT NULL COMMENT '表列名',
  `table_names` varchar(1000) NOT NULL DEFAULT '' COMMENT '查询表名集',
  `export_file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '导出文件名',
  `export_fields_exp` varchar(2000) NOT NULL DEFAULT '' COMMENT '导出数据字段集（使用 | 分隔）',
  `query_condition` varchar(3000) NOT NULL DEFAULT '' COMMENT '查询条件，支持部分动态标签',
  `order_by_exp` varchar(255) NOT NULL COMMENT '排序条件表达式 示例：a.create_time desc',
  `page_size` int(10) NOT NULL DEFAULT '1000' COMMENT '分页大小',
  `download_url_expire` bigint(15) NOT NULL DEFAULT '7200' COMMENT '下载链接效期 单位:秒 -1-永久有效',
  `template_file_url` varchar(500) NOT NULL DEFAULT '' COMMENT '模板文件下载地址',
  `template_file_local_path` varchar(500) NOT NULL DEFAULT '' COMMENT '模板文件本地存储地址',
  `template_refresh_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '模板更新标记 1-未更新 ;2-已更新',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_template_id` (`template_id`) USING BTREE,
  KEY `idx_platform_id` (`platform_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='导出模板表';

-- ----------------------------
-- Records of export_template_info
-- ----------------------------
BEGIN;
INSERT INTO `export_template_info` VALUES (1, '10001', 'T1001', 'DB1001', '0', '学生信息', 1, 1, 'student_id|name|sex|age|school_date', 'student_info', '学生信息列表', 'student_id?title=学生ID|name?title=学生名称|sex?title=性别&replace=0_未知,1_男,2_女|age?title=年龄|school_date?title=入学时间&dateFormat=yyyyMMdd_yyyy-MM-dd', '<if test=\"classId != null and classId!=\'\' \">\n AND class_id = #{classId,jdbcType=VARCHAR}\n</if>\n<if test=\"studentName != null and studentName != \'\' \">\n AND name LIKE CONCAT(#{studentName,jdbcType=VARCHAR},\'%\')\n</if>', '', 100, 3600, '', '', 1, '2019-11-23 11:06:39', '2019-12-15 17:23:37');
INSERT INTO `export_template_info` VALUES (2, '10002', 'T1001', 'DB1001', '0', '学生与班级信息', 1, 1, 'a.student_id|a.`name` student_name|a.sex|a.age|a.school_date|b.`name` class_name|c.`name` teacher_name', '  student_info a INNER JOIN class_info b ON a.class_id = b.class_id INNER JOIN teacher_info c ON b.head_teacher_id = c.teacher_id ', '学生与班级信息列表', 'student_id?title=学生ID|student_name?title=学生名称|sex?title=性别&replace=0_未知,1_男,2_女|age?title=年龄|school_date?title=入学时间&dateFormat=yyyyMMdd_yyyy-MM-dd|teacher_name?title=班主任名称|class_name?title=班级名称', '<if test=\"classId != null\">\n AND a.class_id = #{classId,jdbcType=VARCHAR}\n</if>\n<if test=\"studentName != null and studentName != \'\' \">\n AND a.name LIKE CONCAT(#{studentName,jdbcType=VARCHAR},\'%\')\n</if>\n<if test=\"teacherName != null and teacherName != \'\' \">\n AND c.name LIKE CONCAT(#{teacherName,jdbcType=VARCHAR},\'%\')\n</if>', '', 10, 3600, '', '', 1, '2019-11-23 11:06:39', '2019-12-25 21:58:14');
INSERT INTO `export_template_info` VALUES (3, '10003', 'T1001', 'DB1001', '0', '学生与班级信息模板导出', 1, 2, 'a.student_id|a.`name` student_name|a.sex|a.age|a.school_date|b.`name` class_name|c.`name` teacher_name', '  student_info a INNER JOIN class_info b ON a.class_id = b.class_id INNER JOIN teacher_info c ON b.head_teacher_id = c.teacher_id ', '学生与班级模板导出列表', 'student_id|student_name|sex?replace=0_未知,1_男,2_女|age|school_date?title=入学时间&dateFormat=yyyyMMdd_yyyy-MM-dd|teacher_name|class_name', '<if test=\"classId != null\">\n AND a.class_id = #{classId,jdbcType=VARCHAR}\n</if>\n<if test=\"studentName != null and studentName != \'\' \">\n AND a.name LIKE CONCAT(#{studentName,jdbcType=VARCHAR},\'%\')\n</if>\n<if test=\"teacherName != null and teacherName != \'\' \">\n AND c.name LIKE CONCAT(#{teacherName,jdbcType=VARCHAR},\'%\')\n</if>', '', 150, 3600, 'https://gen-excel.oss-cn-hangzhou.aliyuncs.com/gen-excel/template/学生与班级信息列表模板01.xlsx', '', 2, '2019-11-23 11:06:39', '2019-12-25 21:40:33');
INSERT INTO `export_template_info` VALUES (4, '10004', 'T1001', 'DB1001', '0', '教职工个人信息', 1, 3, 'teacher_id|name|profession_date|job_title|phone,email|address|progression_rate', 'teacher_info', '教职工个人信息表', 'teacher_id|name|profession_date?dateFormat=yyyyMMdd_yyyy-MM-dd|job_title|phone|email|address|progression_rate?numFormat=multiply_100,format_2', '<if test=\"teacherId != null and teacherId!=\'\' \">\n AND teacher_id = #{teacherId,jdbcType=VARCHAR}\n</if>', '', 100, 3600, 'https://gen-excel.oss-cn-hangzhou.aliyuncs.com/gen-excel/template/教职工个人信息表导出模板.xlsx', '', 2, '2019-11-23 11:06:39', '2019-12-15 17:04:49');
INSERT INTO `export_template_info` VALUES (5, '10005', 'T1001', 'DB1001', '10006', '班级全员信息-老师', 1, 4, 'b.name class_name|a.name teacher_name|a.progression_rate|a.phone|a.email', 'teacher_info  a INNER JOIN class_info b on b.head_teacher_id =a.teacher_id\n', '班级全员信息', 'class_name|teacher_name|progression_rate?numFormat=multiply_100,format_2|phone|email', 'class_id = #{classId,jdbcType=VARCHAR}', '', 100, 3600, 'https://gen-excel.oss-cn-hangzhou.aliyuncs.com/gen-excel/template/班级全员信息模板.xlsx', '', 2, '2019-11-23 11:06:39', '2019-12-15 17:33:21');
INSERT INTO `export_template_info` VALUES (6, '10006', 'T1001', 'DB1001', '0', '班级全员信息-学生', 1, 4, 'student_id|name student_name|sex|age|school_date', 'student_info', '班级全员信息', 'student_id|student_name|sex?replace=0_未知,1_男,2_女|age|school_date?dateFormat=yyyyMMdd_yyyy-MM-dd', 'class_id = #{classId,jdbcType=VARCHAR}', '', 100, 3600, '', '', 1, '2019-11-23 11:06:39', '2019-12-15 17:28:44');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
