/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50543
 Source Host           : 127.0.0.1
 Source Database       : demo

 Target Server Type    : MySQL
 Target Server Version : 50543
 File Encoding         : utf-8

 Date: 04/09/2016 17:32:33 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tbl_exam`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_exam`;
CREATE TABLE `tbl_exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(255) NOT NULL,
  `exam_place` varchar(255) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_startTime` time NOT NULL,
  `exam_endTime` time NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_exam`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_exam` VALUES ('1', '测试科目1', '综合楼1102', '2016-06-22', '08:00:00', '09:40:00'), ('2', '测试科目2', '综合楼1103', '2016-06-23', '10:20:00', '12:00:00'), ('3', '测试科目', '综合楼1104', '2016-06-25', '14:00:00', '16:00:00'), ('4', '视听说', '综合楼1105', '2016-06-19', '14:00:00', '16:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_examArrange`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_examArrange`;
CREATE TABLE `tbl_examArrange` (
  `user_id` int(255) NOT NULL,
  `exam_id` int(255) NOT NULL,
  KEY `exam_id` (`exam_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_examarrange_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_examarrange_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `tbl_exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_examArrange`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_examArrange` VALUES ('1345030253', '1'), ('1345030253', '2'), ('1345030253', '3'), ('1345030253', '4');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `user_pwd` varchar(32) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1345030254 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_user`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_user` VALUES ('1345030253', '152232452@qq.com', 'test', '熊才昌', '133837850811');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
