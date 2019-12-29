

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `class_id` varchar(32) NOT NULL COMMENT '班级ID',
  `head_teacher_id` varchar(32) NOT NULL COMMENT '班主任ID',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_class_id` (`class_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='班级表';

-- ----------------------------
-- Records of class_info
-- ----------------------------
BEGIN;
INSERT INTO `class_info` VALUES (1, 'C1001', 'T2001', '一班', '2019-12-15 11:27:27', '2019-12-15 11:27:32');
INSERT INTO `class_info` VALUES (2, 'C1002', 'T2002', '二班', '2019-12-15 11:27:27', '2019-12-15 11:27:32');
INSERT INTO `class_info` VALUES (3, 'C1003', 'T2003', '三班', '2019-12-15 11:27:27', '2019-12-15 11:28:13');
COMMIT;

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `student_id` varchar(32) NOT NULL COMMENT '学生ID',
  `class_id` varchar(32) NOT NULL COMMENT '班级ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别 0-未知, 1-男,2-女 ',
  `age` tinyint(4) NOT NULL DEFAULT '0' COMMENT '年龄',
  `school_date` int(10) NOT NULL COMMENT '入学时间 yyyyMMdd',
  `progress_rate` decimal(10,2) NOT NULL COMMENT '成绩进步率 示例 2.01',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='学生表';

-- ----------------------------
-- Records of student_info
-- ----------------------------
BEGIN;
INSERT INTO `student_info` VALUES (1, 'S3001', 'C1001', '小明', 1, 10, 20190930, 0.90, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (2, 'S3002', 'C1001', '小华', 1, 11, 20190929, 0.80, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (3, 'S3003', 'C1001', '小东', 1, 10, 20190930, 0.93, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (4, 'S3004', 'C1001', '小红', 2, 11, 20190929, 0.93, '2019-12-15 11:35:11', '2019-12-15 14:50:32');
INSERT INTO `student_info` VALUES (5, 'S3005', 'C1001', '小白', 1, 9, 20191001, 0.80, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (6, 'S3006', 'C1001', '小小', 2, 10, 20191001, 0.97, '2019-12-15 11:35:11', '2019-12-15 14:50:36');
INSERT INTO `student_info` VALUES (7, 'S3007', 'C1001', '小米', 2, 10, 20190929, 0.93, '2019-12-15 11:35:11', '2019-12-15 14:50:37');
INSERT INTO `student_info` VALUES (8, 'S3008', 'C1001', '小溪', 1, 11, 20191001, 0.80, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (9, 'S3009', 'C1001', '小北', 1, 10, 20190930, 0.95, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (10, 'S3010', 'C1001', '小夏', 2, 11, 20190930, 0.80, '2019-12-15 11:35:11', '2019-12-15 14:50:39');
INSERT INTO `student_info` VALUES (11, 'S3011', 'C1002', '大明', 1, 10, 20191001, 0.96, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (12, 'S3012', 'C1002', '大华', 1, 10, 20190930, 0.93, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (13, 'S3013', 'C1002', '大东', 1, 11, 20190930, 0.96, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (14, 'S3014', 'C1002', '大红', 2, 10, 20190929, 0.96, '2019-12-15 11:35:11', '2019-12-15 14:50:42');
INSERT INTO `student_info` VALUES (15, 'S3015', 'C1002', '大白', 1, 11, 20190930, 0.80, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (16, 'S3016', 'C1002', '大大', 2, 10, 20190929, 0.89, '2019-12-15 11:35:11', '2019-12-15 14:50:47');
INSERT INTO `student_info` VALUES (17, 'S3017', 'C1002', '大米', 2, 11, 20190930, 0.88, '2019-12-15 11:35:11', '2019-12-15 14:50:53');
INSERT INTO `student_info` VALUES (18, 'S3018', 'C1002', '大溪', 1, 10, 20190930, 0.90, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (19, 'S3019', 'C1002', '大北', 1, 9, 20190930, 0.98, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (20, 'S3020', 'C1002', '大夏', 2, 10, 20190930, 0.98, '2019-12-15 11:35:11', '2019-12-15 14:50:56');
INSERT INTO `student_info` VALUES (21, 'S3021', 'C1003', '小明明', 1, 10, 20191002, 0.98, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (22, 'S3022', 'C1003', '小华华', 1, 10, 20190930, 0.88, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (23, 'S3023', 'C1003', '小东东', 1, 11, 20190928, 0.90, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (24, 'S3024', 'C1003', '小红红', 2, 10, 20191002, 0.88, '2019-12-15 11:35:11', '2019-12-15 14:50:58');
INSERT INTO `student_info` VALUES (25, 'S3025', 'C1003', '小小小', 2, 10, 20190930, 0.98, '2019-12-15 11:35:11', '2019-12-15 14:51:00');
INSERT INTO `student_info` VALUES (26, 'S3026', 'C1003', '小米米', 2, 10, 20190929, 0.98, '2019-12-15 11:35:11', '2019-12-15 14:51:01');
INSERT INTO `student_info` VALUES (27, 'S3027', 'C1003', '小溪溪', 1, 11, 20190930, 0.88, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (28, 'S3028', 'C1003', '小北北', 1, 10, 20191002, 0.93, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (29, 'S3029', 'C1003', '小夏夏', 2, 11, 20190930, 0.97, '2019-12-15 11:35:11', '2019-12-15 14:51:05');
INSERT INTO `student_info` VALUES (30, 'S3030', 'C1003', '小贝贝', 1, 11, 20191002, 0.90, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (31, 'S3031', 'C1003', '小包包', 1, 10, 20190930, 0.88, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (32, 'S3032', 'C1003', '小文文', 2, 10, 20190930, 0.97, '2019-12-15 11:35:11', '2019-12-15 14:51:10');
INSERT INTO `student_info` VALUES (33, 'S3033', 'C1003', '小看看', 1, 9, 20190930, 0.88, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
INSERT INTO `student_info` VALUES (34, 'S3034', 'C1003', '小花花', 2, 10, 20190930, 0.88, '2019-12-15 11:35:11', '2019-12-15 14:51:13');
INSERT INTO `student_info` VALUES (35, 'S3035', 'C1003', '小天天', 1, 9, 20190927, 0.99, '2019-12-15 11:35:11', '2019-12-15 11:35:17');
COMMIT;

-- ----------------------------
-- Table structure for teacher_info
-- ----------------------------
DROP TABLE IF EXISTS `teacher_info`;
CREATE TABLE `teacher_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `teacher_id` varchar(32) NOT NULL COMMENT '班主任ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `job_title` varchar(255) NOT NULL DEFAULT '' COMMENT '职称',
  `teacher_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '教师类型 1-代课老师 2-班主任',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '家庭住址',
  `progression_rate` decimal(10,4) NOT NULL COMMENT '升学率',
  `profession_date` int(10) NOT NULL COMMENT '入教时间 格式:yyyyMMdd',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='老师表';

-- ----------------------------
-- Records of teacher_info
-- ----------------------------
BEGIN;
INSERT INTO `teacher_info` VALUES (1, 'T2001', '张三', '普通班主任', 1, '13235727262', '123@163.com', '浙江省杭州市西湖区', 0.9870, 20170809, '2019-12-15 11:29:24', '2019-12-15 11:53:55');
INSERT INTO `teacher_info` VALUES (2, 'T2002', '李四', '优秀班主任', 1, '15264447382', '456@126.com', '浙江省杭州市拱墅区', 0.8890, 20160809, '2019-12-15 11:29:24', '2019-12-15 11:53:56');
INSERT INTO `teacher_info` VALUES (3, 'T2003', '王五', '最佳班主任', 1, '18776549832', '789@126.com', '浙江省杭州市滨江区', 0.9980, 20150809, '2019-12-15 11:29:24', '2019-12-15 11:53:57');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
