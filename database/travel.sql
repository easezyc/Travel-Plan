/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.28 : Database - zyc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zyc` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zyc`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `name` varchar(25) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `id` varchar(20) NOT NULL,
  `image` varchar(500) NOT NULL DEFAULT '/zyc/images/users/default.jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `account` */

insert  into `account`(`name`,`pwd`,`phone`,`id`,`image`) values ('1','1','1','1','/zyc/images/users/default.jpg'),('zyc','1','17888842296','zyc','/zyc/images/users/zyc.jpg');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` varchar(20) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `sup` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `admin` */

insert  into `admin`(`id`,`pwd`,`sup`) values ('xj','1',0),('zyc','1',1),('谢瑾','1',0);

/*Table structure for table `footarticle` */

DROP TABLE IF EXISTS `footarticle`;

CREATE TABLE `footarticle` (
  `id` varchar(50) NOT NULL,
  `userid` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `img` varchar(100) NOT NULL DEFAULT '/zyc/images/cover/default.gif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `footarticle` */

insert  into `footarticle`(`id`,`userid`,`username`,`city`,`title`,`content`,`img`) values ('201608071939759zyc','zyc','zyc','攀枝花','攀枝花一日游','<p>攀枝花是美丽的城市<br/></p>','/zyc/images/cover/fb8eba44-d541-4c7b-b89d-7be79d460ee8.jpg');

/*Table structure for table `photos` */

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `photos` */

insert  into `photos`(`id`,`url`) values ('201608071939759zyc','/zyc/images/photos/093b9758-0a62-40c2-90b9-d2eb7d21459a.jpg'),('201608071939759zyc','/zyc/images/photos/60f1a5e3-a754-4de7-a307-7ef1e1c23e11.jpg'),('201608071846746zyc','/zyc/images/photos/73a1db9e-3de4-43ec-a3c3-748f7f8f4e9c.jpg'),('201608071939759zyc','/zyc/images/photos/aa4fafbf-2fb9-4be3-81cc-73ca37611561.jpg'),('201608071939759zyc','/zyc/images/photos/fcc0d7df-752d-440a-bfef-62b6ebac3b6e.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
