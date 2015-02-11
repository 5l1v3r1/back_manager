/*
SQLyog Ultimate v8.71 
MySQL - 5.6.19 : Database - cjf
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cjf` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `cnvp_sys_nav` */

DROP TABLE IF EXISTS `cnvp_sys_nav`;

CREATE TABLE `cnvp_sys_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统id',
  `title` varchar(100) NOT NULL COMMENT '文字',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `url` varchar(100) NOT NULL COMMENT '链接',
  `target` varchar(20) NOT NULL DEFAULT 'mainFrame' COMMENT '目标',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `orderid` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='导航';

/*Data for the table `cnvp_sys_nav` */

insert  into `cnvp_sys_nav`(`id`,`title`,`icon`,`url`,`target`,`pid`,`orderid`) values (1,'开始','icon-home','javascript:;','mainFrame',0,10),(3,'系统','icon-cog','javascript:;','mainFrame',0,10),(4,'用户','icon-user','javascript:;','mainFrame',0,10),(20,'模型生成','icon-code','Generator/model','mainFrame',2,10),(17,'欢迎使用','icon-send','welcome','mainFrame',1,10),(18,'个人资料','icon-user','profile','mainFrame',1,10),(19,'修改密码','icon-key','password','mainFrame',1,10),(2,'开发','icon-codepen','javascript:;','mainFrame',0,10),(15,'12312312','312','3123123','mainFrame',123,10),(21,'视图生成','icon-code','Generator/view','mainFrame',2,10),(22,'控制器生成','icon-code','Generator/controller','mainFrame',2,10),(23,'系统设置','icon-desktop','System','mainFrame',3,10),(24,'导航菜单','icon-th-list','System/nav','mainFrame',3,10),(26,'文件管理','icon-file','System/file','mainFrame',3,10),(25,'权限配置','icon-asterisk','System/permission','mainFrame',3,10),(27,'日志查询','icon-angle-double-right','System/log','mainFrame',3,10),(28,'用户列表','icon-user','User','mainFrame',4,10),(29,'添加用户','icon-plus','User/create','mainFrame',4,10),(30,'角色列表','icon-group','UserGroup','mainFrame',4,10),(31,'添加角色','icon-plus','UserGroup/create','mainFrame',4,10);

/*Table structure for table `cnvp_user` */

DROP TABLE IF EXISTS `cnvp_user`;

CREATE TABLE `cnvp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账号',
  `account` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `cname` varchar(10) DEFAULT NULL COMMENT '中文名',
  `ename` varchar(50) DEFAULT NULL COMMENT '英文名',
  `flg` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_login_time` bigint(13) DEFAULT NULL COMMENT '最后登录时间',
  `create_time` bigint(13) NOT NULL COMMENT '创建时间',
  `create_user_id` int(11) NOT NULL COMMENT '创建者',
  `update_time` bigint(13) DEFAULT NULL COMMENT '更新时间',
  `update_user_id` int(11) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `cnvp_user` */

insert  into `cnvp_user`(`id`,`account`,`password`,`cname`,`ename`,`flg`,`remark`,`login_count`,`last_login_time`,`create_time`,`create_user_id`,`update_time`,`update_user_id`) values (1,'superadmin','a8f5f167f44f4964e6c998dee827110c','超级管理员','michael.z',1,'',60,1413779275,0,1,1406045498,4),(4,'admin','a8f5f167f44f4964e6c998dee827110c','测试管理员','michaelzx',1,'',2,1406045477,0,1,1406043400,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
