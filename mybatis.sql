/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.5.27 : Database - mybatis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mybatis` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mybatis`;

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `did` int(11) NOT NULL,
  `dname` varchar(50) DEFAULT NULL,
  `dremark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dept` */

insert  into `dept`(`did`,`dname`,`dremark`) values (1,'财务部',''),(2,'公关部',''),(3,'人事部',''),(4,'服务部','');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `card_id` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `qq_num` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `sex` varchar(30) DEFAULT NULL,
  `party` varchar(50) DEFAULT NULL COMMENT '政治面貌',
  `birthday` date DEFAULT NULL,
  `race` varchar(10) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `speciality` varchar(50) DEFAULT NULL COMMENT '特长',
  `hobby` varchar(30) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  KEY `FK_employee_dept` (`dept_id`),
  CONSTRAINT `FK_employee_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`did`),
  CONSTRAINT `FK_employee_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`jid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`dept_id`,`job_id`,`name`,`card_id`,`address`,`post_code`,`tel`,`phone`,`qq_num`,`email`,`sex`,`party`,`birthday`,`race`,`education`,`speciality`,`hobby`,`remark`,`create_date`) values (1,4,1,'张三','QBZ1234567890012','温柔乡','527000','1234567890','3233033','1234567890','forevergarden@126.com','男','党员','2020-07-15','汉','本科','计算机',NULL,NULL,'2020-07-15 16:09:51'),(2,2,2,'李四','avas1222222222212','温柔乡','527000','12121212121','3233033','1234567890','forevergarden@126.com','男','共青团员','2019-07-17','汉','本科','啊啊大苏打',NULL,NULL,'2020-07-17 15:21:21'),(3,3,1,'王五','avas1222222222212','温柔乡','527000','212122222212','3233033','1234567890','forevergarden@126.com','女','共青团员','2019-07-17','汉','本科','啊啊大苏打',NULL,NULL,'2020-07-17 15:22:46'),(4,4,3,'赵六','avas1222222222212','温柔乡','527000','212122222212','3233033','1234567890','forevergarden@126.com','男','群众','2020-07-17','汉','本科','阿达','啊啊啊','啊啊啊','2020-07-17 15:23:12'),(5,4,2,'陈七','avas1222222222212','温柔乡','527000','212122222212','3233033','1234567890','forevergarden@126.com','女','共青团员','2019-07-17','汉','本科','阿达',NULL,NULL,'2020-07-17 15:23:41'),(6,1,3,'爱扒','avas1222222222212','温柔乡','527000','1234567890','3233033','1234567890','forevergarden@126.com','男','群众','2020-07-08','汉','本科','啊啊大苏打',NULL,NULL,'2020-07-17 15:24:45'),(7,3,3,'阿九','avas1222222222212','温柔乡','527000','1234567890','3233033','1234567890','forevergarden@126.com','男','群众','2020-07-08','汉','本科','啊啊大苏打',NULL,NULL,'2020-07-17 15:25:18'),(8,3,2,'阿什','avas1222222222212','温柔乡','527000','1234567890','3233033','1234567890','forevergarden@126.com','男','群众','2020-07-01','汉','本科','啊啊大苏打',NULL,NULL,'2020-07-17 15:25:35'),(9,1,1,'十一','avas1222222222212','温柔乡','527000','1234567890','3233033','1234567890','forevergarden@126.com','男','群众','2020-07-01','汉','专科','啊啊大苏打',NULL,NULL,'2020-07-17 15:25:51'),(10,2,1,'十二','avas1222222222212','温柔乡','527000','1234567890','3233033','1234567890','forevergarden@126.com','男','共青团员','2020-07-01','汉','研究生','啊啊大苏打',NULL,NULL,'2020-07-17 15:26:06'),(12,4,1,'1121','avas1222222222212','温柔乡','527000','1234567890','3233033','1234567890','forevergarden@126.com','男','群众','2020-07-20','汉','本科','啊啊大苏打',NULL,NULL,'2020-07-20 15:18:57');

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `jid` int(11) NOT NULL,
  `jname` varchar(20) DEFAULT NULL,
  `jremark` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `job` */

insert  into `job`(`jid`,`jname`,`jremark`) values (1,'软件工程师',''),(2,'网络工程师',''),(3,'运维',''),(4,'会计','');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` varchar(50) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `theme` varchar(500) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` longtext,
  `remark` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`id`,`username`,`theme`,`title`,`content`,`remark`,`create_time`) values ('20200718160948','Joe','','你好','<div style=\"text-align: center;\"><b><i><u><font size=\"7\">你好</font></u></i></b></div>','','2020-07-18 16:21:01'),('20200718162201','Joe','test','test','<div style=\"text-align: center;\"><i><b><u><font size=\"6\">test</font></u></b></i></div>','test','2020-07-18 16:22:01'),('20200718200056','Joe','','加油','&nbsp; &nbsp; <font size=\"5\"><b>革命尚未成功，同志仍需努力</b></font>','','2020-07-18 20:00:56'),('20200720153042','Joeeee','mybatis','mybatis','&nbsp; &nbsp;<b><font size=\"5\"><i>&nbsp; &nbsp; &nbsp;<span style=\"color: rgb(68, 68, 68); font-family: &quot;Droid Serif&quot;, Georgia, &quot;Times New Roman&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans CN&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, serif; background-color: rgb(255, 255, 255);\">映射器是MyBatis中最核心的组件之一，在MyBatis 3之前，只支持XML映射器，所有的SQL语句都必须在XML文件中配置。而从MyBatis 3开始，开始支持接口映射器，其底层利用的是接口绑定技术（注：面试中经常会问到的一个知识点，见下文5.1项介绍）。另外，接口映射器允许通过注解定义SQL语句，用以替代XML文件配置SQL。</span></i></font></b>','111','2020-07-20 15:30:42');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `rid` int(11) NOT NULL,
  `rname` varchar(20) DEFAULT NULL,
  `rremark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`rid`,`rname`,`rremark`) values (0,'超级管理员',NULL),(1,'管理员',''),(2,'普通用户','');

/*Table structure for table `uploadfile` */

DROP TABLE IF EXISTS `uploadfile`;

CREATE TABLE `uploadfile` (
  `id` varchar(100) NOT NULL,
  `uploadName` varchar(50) DEFAULT NULL,
  `fileName` varchar(500) DEFAULT NULL,
  `uploadDate` datetime DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `savePath` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `uploadfile` */

insert  into `uploadfile`(`id`,`uploadName`,`fileName`,`uploadDate`,`title`,`savePath`) values ('f20200720154004','Joeeee','done.png','2020-07-20 15:40:04','你好','D:\\apache-tomcat-7.0.52\\webapps\\bighomework_upload\\U00001\\c5d8c7314e334b47a63d28a235812607_done.png');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `number` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `FK_user_role` (`role_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`number`,`password`,`role_id`,`phone`,`createdate`,`username`,`remark`) values ('U00001','123',0,'1234567890',NULL,'Joeeee','come on!'),('U00002','123',1,'1234567890',NULL,'Jack',NULL),('U00003','123',2,'1234567789',NULL,'哈哈哈',NULL),('U00004','123',1,'1234567789','2020-07-20 14:50:56','阿四','hello world'),('U00005','123',0,'1234567789','2020-07-22 12:09:01','初五','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
