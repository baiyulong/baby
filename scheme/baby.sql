/*
Navicat MySQL Data Transfer

Source Server         : 192.168.31.132
Source Server Version : 50535
Source Host           : 192.168.31.132:3306
Source Database       : baby

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2014-04-21 19:08:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for by_baby
-- ----------------------------
DROP TABLE IF EXISTS `by_baby`;
CREATE TABLE `by_baby` (
  `b_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `b_nickname` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '宝宝昵称',
  `b_realname` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '宝宝真实姓名',
  `b_sex` tinyint(2) NOT NULL DEFAULT '1' COMMENT '宝宝性别',
  `b_birthday` int(10) NOT NULL DEFAULT '0' COMMENT '宝宝生日',
  `b_weight` tinyint(2) NOT NULL DEFAULT '0' COMMENT '出生体重',
  `b_userid` int(10) NOT NULL DEFAULT '0' COMMENT '父母亲ID',
  `b_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`b_id`),
  KEY `parent_id` (`b_userid`),
  CONSTRAINT `parent_id` FOREIGN KEY (`b_userid`) REFERENCES `by_user` (`u_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of by_baby
-- ----------------------------

-- ----------------------------
-- Table structure for by_baby_photo
-- ----------------------------
DROP TABLE IF EXISTS `by_baby_photo`;
CREATE TABLE `by_baby_photo` (
  `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `p_babyid` int(10) NOT NULL DEFAULT '0' COMMENT '宝宝ID',
  `p_photopath` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '图片路径',
  `p_description` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '照片描述',
  `p_time` int(10) NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`p_id`),
  KEY `baby_id` (`p_babyid`),
  CONSTRAINT `baby_id` FOREIGN KEY (`p_babyid`) REFERENCES `by_baby` (`b_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of by_baby_photo
-- ----------------------------

-- ----------------------------
-- Table structure for by_comment
-- ----------------------------
DROP TABLE IF EXISTS `by_comment`;
CREATE TABLE `by_comment` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `c_userid` int(10) NOT NULL DEFAULT '0' COMMENT '评论人ID',
  `c_content` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '评论内容',
  `c_time` int(10) NOT NULL DEFAULT '0' COMMENT '评论时间',
  PRIMARY KEY (`c_id`),
  KEY `comment_userid` (`c_userid`),
  CONSTRAINT `comment_userid` FOREIGN KEY (`c_userid`) REFERENCES `by_user` (`u_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of by_comment
-- ----------------------------

-- ----------------------------
-- Table structure for by_show_baby
-- ----------------------------
DROP TABLE IF EXISTS `by_show_baby`;
CREATE TABLE `by_show_baby` (
  `s_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `s_userid` int(10) NOT NULL DEFAULT '0' COMMENT '发表人',
  `s_content` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '发表内容',
  `s_photoids` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '照片ID，序列化',
  `s_up` smallint(5) NOT NULL DEFAULT '0' COMMENT '点赞人数',
  `s_down` smallint(5) NOT NULL DEFAULT '0' COMMENT '点弱的人数',
  `s_time` int(10) NOT NULL DEFAULT '0' COMMENT '发表时间',
  PRIMARY KEY (`s_id`),
  KEY `show_userid` (`s_userid`),
  CONSTRAINT `show_userid` FOREIGN KEY (`s_userid`) REFERENCES `by_user` (`u_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of by_show_baby
-- ----------------------------

-- ----------------------------
-- Table structure for by_user
-- ----------------------------
DROP TABLE IF EXISTS `by_user`;
CREATE TABLE `by_user` (
  `u_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_username` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户名',
  `u_password` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '密码',
  `u_nickname` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '昵称',
  `u_realname` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '真实姓名',
  `u_sex` tinyint(2) NOT NULL DEFAULT '2' COMMENT '性别(1男，2女)',
  `u_age` tinyint(3) NOT NULL DEFAULT '20' COMMENT '年龄',
  `u_mobile` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机',
  `u_email` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '邮箱',
  `u_time` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of by_user
-- ----------------------------
