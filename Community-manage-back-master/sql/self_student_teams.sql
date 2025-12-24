/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : student_teams

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 27/09/2022 17:34:31
*/

DROP DATABASE IF EXISTS student_teams ;
CREATE DATABASE student_teams CHARACTER SET utf8;
use student_teams ;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for active_logs
-- ----------------------------
DROP TABLE IF EXISTS `active_logs`;
CREATE TABLE `active_logs`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名时间',
  `active_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动编号',
  `user_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `active_id`(`active_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `active_logs_ibfk_1` FOREIGN KEY (`active_id`) REFERENCES `activities` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `active_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报名记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of active_logs
-- ----------------------------
INSERT INTO `active_logs` VALUES ('1664265108381', '2022-09-27 15:51:48', '1664265108375', '1642422100001');
INSERT INTO `active_logs` VALUES ('1664265292894', '2022-09-27 15:54:52', '1664265108375', '1664264032138');

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `comm` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动概述',
  `detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动详情',
  `ask` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动要求',
  `total` int(11) NOT NULL COMMENT '报名人数',
  `active_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动时间',
  `team_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布社团',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `team_id`(`team_id`) USING BTREE,
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activities
-- ----------------------------
INSERT INTO `activities` VALUES ('1664265108375', '网球活动', '网球活动', '大家提前半小时到体育场集合', '网球活动，身体健康', 2, '2022-09-30 15:00:00', '1664263819169');

-- ----------------------------
-- Table structure for apply_logs
-- ----------------------------
DROP TABLE IF EXISTS `apply_logs`;
CREATE TABLE `apply_logs`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `status` int(11) NOT NULL COMMENT '处理状态',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请时间',
  `team_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请社团',
  `user_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `team_id`(`team_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `apply_logs_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `apply_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申请记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply_logs
-- ----------------------------
INSERT INTO `apply_logs` VALUES ('1664264045259', 1, '2022-09-27 15:34:05', '1664263819169', '1664264032138');
INSERT INTO `apply_logs` VALUES ('1664270274686', 2, '2022-09-27 17:17:54', '1664270193554', '1664264032138');
INSERT INTO `apply_logs` VALUES ('1664270304100', 1, '2022-09-27 17:18:24', '1664270193554', '1664264032138');

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入团时间',
  `team_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加入社团',
  `user_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `team_id`(`team_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('1664263819174', '2022-09-27 15:30:19', '1664263819169', '1642422100001');
INSERT INTO `members` VALUES ('1664264206710', '2022-09-27 15:36:46', '1664263819169', '1664264032138');
INSERT INTO `members` VALUES ('1664270193558', '2022-09-27 17:16:33', '1664270193554', '1664270150010');
INSERT INTO `members` VALUES ('1664270337541', '2022-09-27 17:18:57', '1664270193554', '1664264032138');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知标题',
  `detail` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知详情',
  `create_time` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布时间',
  `team_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布社团',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('1664263983667', '动漫社', '动漫社活动通知', '2022-09-27', NULL);
INSERT INTO `notices` VALUES ('1664264254059', '网球社活动', '本周六举行网球活动，地点北京大学体育馆', '2022-09-27', '1664263819169');

-- ----------------------------
-- Table structure for pay_logs
-- ----------------------------
DROP TABLE IF EXISTS `pay_logs`;
CREATE TABLE `pay_logs`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缴费时间',
  `total` double NOT NULL COMMENT '缴纳费用',
  `team_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收费社团',
  `user_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缴费用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `team_id`(`team_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `pay_logs_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pay_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '缴费记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_logs
-- ----------------------------
INSERT INTO `pay_logs` VALUES ('1664264489734', '2022-09-27 15:41:29', 50, '1664263819169', '1664264032138');
INSERT INTO `pay_logs` VALUES ('1664264500299', '2022-09-27 15:41:40', 200, '1664263819169', '1664264032138');
INSERT INTO `pay_logs` VALUES ('1664264512731', '2022-09-27 15:41:52', 100, '1664263819169', '1642422100001');
INSERT INTO `pay_logs` VALUES ('1664270360810', '2022-09-27 17:19:20', 200, '1664270193554', '1664270150010');

-- ----------------------------
-- Table structure for team_types
-- ----------------------------
DROP TABLE IF EXISTS `team_types`;
CREATE TABLE `team_types`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社团类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_types
-- ----------------------------
INSERT INTO `team_types` VALUES ('1642422100000', '科技创新', '2022-01-17 20:00:00');
INSERT INTO `team_types` VALUES ('1642422100001', '户外运动', '2022-01-17 20:00:00');
INSERT INTO `team_types` VALUES ('1642422100002', '语言文学', '2022-01-17 20:00:00');
INSERT INTO `team_types` VALUES ('1642422100003', '志愿服务', '2022-01-17 20:00:00');

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团名称',
  `create_time` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '建立时间',
  `total` int(11) NOT NULL COMMENT '社团人数',
  `manager` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团号',
  `type_id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团编号',
  `managerName` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团团长',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `team_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社团信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teams
-- ----------------------------
INSERT INTO `teams` VALUES ('1664263819169', '网球社', '2022-09-27', 2, '1642422100001', '1642422100001', '');
INSERT INTO `teams` VALUES ('1664270193554', '动漫社', '2022-09-27', 2, '1664270150010', '1642422100000', '');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录ID',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `pass_word` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '用户年龄',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `type` int(11) NOT NULL COMMENT '用户身份(0系统管理员，1社团团长，2普通用户)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1642422100000', 'admin', '123456', '管理员', '男', 42, '13030303300', '北京市东城区', '2022-01-17 20:00:00', 0);
INSERT INTO `users` VALUES ('1642422100001', 'test1', '123456', '孙尚香', '女', 32, '13232323322', '北京市西城区', '2022-01-17 20:00:00', 1);
INSERT INTO `users` VALUES ('1664264032138', 'test2', '123456', '白居易', '男', 24, '13030303300', '北京市北京大学', '2022-09-27 15:33:52', 2);
INSERT INTO `users` VALUES ('1664270150010', 'test3', '123456', '曹操', '男', 19, '13332323322', '北京市朝阳区', '2022-09-27 17:15:50', 1);

SET FOREIGN_KEY_CHECKS = 1;
