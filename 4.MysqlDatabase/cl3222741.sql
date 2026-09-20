-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl3222741
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cl3222741`
--

/*!40000 DROP DATABASE IF EXISTS `cl3222741`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl3222741` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl3222741`;

--
-- Table structure for table `baoxiugongneng`
--

DROP TABLE IF EXISTS `baoxiugongneng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baoxiugongneng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `baoxiuneirong` longtext NOT NULL COMMENT '报修内容',
  `baoxiushijian` datetime NOT NULL COMMENT '保修时间',
  `shangjiazhanghao` varchar(200) NOT NULL COMMENT '商家账号',
  `shangjiamingcheng` varchar(200) NOT NULL COMMENT '商家名称',
  `shangjiadizhi` varchar(200) NOT NULL COMMENT '商家地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708225019381 DEFAULT CHARSET=utf8 COMMENT='报修功能';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baoxiugongneng`
--

LOCK TABLES `baoxiugongneng` WRITE;
/*!40000 ALTER TABLE `baoxiugongneng` DISABLE KEYS */;
INSERT INTO `baoxiugongneng` VALUES (71,'2024-02-18 02:53:07','报修内容1','2024-02-18 10:53:07','商家账号1','商家名称1','商家地址1'),(72,'2024-02-18 02:53:08','报修内容2','2024-02-18 10:53:08','商家账号2','商家名称2','商家地址2'),(73,'2024-02-18 02:53:08','报修内容3','2024-02-18 10:53:08','商家账号3','商家名称3','商家地址3'),(74,'2024-02-18 02:53:08','报修内容4','2024-02-18 10:53:08','商家账号4','商家名称4','商家地址4'),(75,'2024-02-18 02:53:08','报修内容5','2024-02-18 10:53:08','商家账号5','商家名称5','商家地址5'),(76,'2024-02-18 02:53:08','报修内容6','2024-02-18 10:53:08','商家账号6','商家名称6','商家地址6'),(1708225019380,'2024-02-18 02:56:59','<p>12</p>','2024-02-18 10:56:55','122','洪福','中国');
/*!40000 ALTER TABLE `baoxiugongneng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caipinleixing`
--

DROP TABLE IF EXISTS `caipinleixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caipinleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `caipinleixing` varchar(200) DEFAULT NULL COMMENT '菜品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708225054434 DEFAULT CHARSET=utf8 COMMENT='菜品类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caipinleixing`
--

LOCK TABLES `caipinleixing` WRITE;
/*!40000 ALTER TABLE `caipinleixing` DISABLE KEYS */;
INSERT INTO `caipinleixing` VALUES (61,'2024-02-18 02:53:07','菜品类型1'),(62,'2024-02-18 02:53:07','菜品类型2'),(63,'2024-02-18 02:53:07','菜品类型3'),(64,'2024-02-18 02:53:07','菜品类型4'),(65,'2024-02-18 02:53:07','菜品类型5'),(66,'2024-02-18 02:53:07','菜品类型6'),(1708225045077,'2024-02-18 02:57:24','蔬菜'),(1708225054433,'2024-02-18 02:57:34','肉类');
/*!40000 ALTER TABLE `caipinleixing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caipinxinxi`
--

DROP TABLE IF EXISTS `caipinxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caipinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `caipinmingcheng` varchar(200) NOT NULL COMMENT '菜品名称',
  `caipinleixing` varchar(200) NOT NULL COMMENT '菜品类型',
  `caipinxiangqing` longtext NOT NULL COMMENT '菜品详情',
  `kouwei` varchar(200) DEFAULT NULL COMMENT '口味',
  `tupian` longtext COMMENT '图片',
  `kucun` int(11) DEFAULT NULL COMMENT '库存',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  `shangjiamingcheng` varchar(200) DEFAULT NULL COMMENT '商家名称',
  `shangjiadizhi` varchar(200) DEFAULT NULL COMMENT '商家地址',
  `price` double DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708225112921 DEFAULT CHARSET=utf8 COMMENT='菜品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caipinxinxi`
--

LOCK TABLES `caipinxinxi` WRITE;
/*!40000 ALTER TABLE `caipinxinxi` DISABLE KEYS */;
INSERT INTO `caipinxinxi` VALUES (81,'2024-02-18 02:53:08','菜品名称1','菜品类型1','菜品详情1','原味','file/caipinxinxiTupian1.jpg,file/caipinxinxiTupian2.jpg,file/caipinxinxiTupian3.jpg',1,'商家账号1','商家名称1','商家地址1',99.9),(82,'2024-02-18 02:53:08','菜品名称2','菜品类型2','菜品详情2','原味','file/caipinxinxiTupian2.jpg,file/caipinxinxiTupian3.jpg,file/caipinxinxiTupian4.jpg',2,'商家账号2','商家名称2','商家地址2',99.9),(83,'2024-02-18 02:53:08','菜品名称3','菜品类型3','菜品详情3','原味','file/caipinxinxiTupian3.jpg,file/caipinxinxiTupian4.jpg,file/caipinxinxiTupian5.jpg',3,'商家账号3','商家名称3','商家地址3',99.9),(84,'2024-02-18 02:53:08','菜品名称4','菜品类型4','菜品详情4','原味','file/caipinxinxiTupian4.jpg,file/caipinxinxiTupian5.jpg,file/caipinxinxiTupian6.jpg',4,'商家账号4','商家名称4','商家地址4',99.9),(85,'2024-02-18 02:53:08','菜品名称5','菜品类型5','菜品详情5','原味','file/caipinxinxiTupian5.jpg,file/caipinxinxiTupian6.jpg,file/caipinxinxiTupian7.jpg',5,'商家账号5','商家名称5','商家地址5',99.9),(86,'2024-02-18 02:53:08','菜品名称6','菜品类型6','菜品详情6','原味','file/caipinxinxiTupian6.jpg,file/caipinxinxiTupian7.jpg,file/caipinxinxiTupian8.jpg',6,'商家账号6','商家名称6','商家地址6',99.9),(1708225089653,'2024-02-18 02:58:09','青瓜','蔬菜','11','原味','file/1708225083434.jpg',12,'122','洪福','中国',6),(1708225112920,'2024-02-18 02:58:32','猪肉','肉类','21','原味','file/1708225105222.jpg',21,'122','洪福','中国',20);
/*!40000 ALTER TABLE `caipinxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) DEFAULT NULL COMMENT '商品表名',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `buynumber` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `discountprice` double DEFAULT NULL COMMENT '折扣价',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuxiaohuodong`
--

DROP TABLE IF EXISTS `cuxiaohuodong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuxiaohuodong` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `huodongmingcheng` varchar(200) DEFAULT NULL COMMENT '活动名称',
  `huodongshijian` datetime NOT NULL COMMENT '活动时间',
  `youhuifangshi` varchar(200) DEFAULT NULL COMMENT '优惠方式',
  `cuxiaotiaojian` varchar(200) NOT NULL COMMENT '促销条件',
  `guizeshuoming` longtext COMMENT '规则说明',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  `shangjiamingcheng` varchar(200) DEFAULT NULL COMMENT '商家名称',
  `lianxidianhua` varchar(200) NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708225034876 DEFAULT CHARSET=utf8 COMMENT='促销活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuxiaohuodong`
--

LOCK TABLES `cuxiaohuodong` WRITE;
/*!40000 ALTER TABLE `cuxiaohuodong` DISABLE KEYS */;
INSERT INTO `cuxiaohuodong` VALUES (111,'2024-02-18 02:53:08','活动名称1','2024-02-18 10:53:08','优惠方式1','促销条件1','规则说明1','商家账号1','商家名称1','联系电话1'),(112,'2024-02-18 02:53:08','活动名称2','2024-02-18 10:53:08','优惠方式2','促销条件2','规则说明2','商家账号2','商家名称2','联系电话2'),(113,'2024-02-18 02:53:08','活动名称3','2024-02-18 10:53:08','优惠方式3','促销条件3','规则说明3','商家账号3','商家名称3','联系电话3'),(114,'2024-02-18 02:53:08','活动名称4','2024-02-18 10:53:08','优惠方式4','促销条件4','规则说明4','商家账号4','商家名称4','联系电话4'),(115,'2024-02-18 02:53:08','活动名称5','2024-02-18 10:53:08','优惠方式5','促销条件5','规则说明5','商家账号5','商家名称5','联系电话5'),(116,'2024-02-18 02:53:08','活动名称6','2024-02-18 10:53:08','优惠方式6','促销条件6','规则说明6','商家账号6','商家名称6','联系电话6'),(1708225034875,'2024-02-18 02:57:13','活动','2024-02-18 10:57:09','1','1','11','122','洪福','13212121212');
/*!40000 ALTER TABLE `cuxiaohuodong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-02-18 02:53:08','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"评价信息\",\"menuJump\":\"列表\",\"tableName\":\"pingjiaxinxi\"}],\"fontClass\":\"icon-common29\",\"menu\":\"评价信息管理\",\"unicode\":\"&#xee2e;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"已退款订单\",\"menuJump\":\"已退款\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"已支付订单\",\"menuJump\":\"已支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"已发货订单\",\"menuJump\":\"已发货\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"已完成订单\",\"menuJump\":\"已完成\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"商品订单\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"已取消订单\",\"menuJump\":\"已取消\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"未支付订单\",\"menuJump\":\"未支付\",\"tableName\":\"orders\"}],\"menu\":\"订单管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"查看评论\",\"库存统计\"],\"menu\":\"菜品信息\",\"menuJump\":\"列表\",\"tableName\":\"caipinxinxi\"}],\"fontClass\":\"icon-common34\",\"menu\":\"菜品信息管理\",\"unicode\":\"&#xee85;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-wenzi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"menu\":\"商家信息\",\"menuJump\":\"列表\",\"tableName\":\"shangjiaxinxi\"},{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"},{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"管理员\",\"menuJump\":\"列表\",\"tableName\":\"users\"}],\"fontClass\":\"icon-common49\",\"menu\":\"管理员管理\",\"unicode\":\"&#xef79;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"},{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"新闻资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"fontClass\":\"icon-common9\",\"menu\":\"轮播图管理\",\"unicode\":\"&#xedc9;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"促销活动\",\"menuJump\":\"列表\",\"tableName\":\"cuxiaohuodong\"}],\"fontClass\":\"icon-common38\",\"menu\":\"促销活动管理\",\"unicode\":\"&#xeeb2;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"查看\"],\"menu\":\"报修功能\",\"menuJump\":\"列表\",\"tableName\":\"baoxiugongneng\"}],\"fontClass\":\"icon-common37\",\"menu\":\"报修功能管理\",\"unicode\":\"&#xeea4;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"查看\"],\"menu\":\"购物车\",\"menuJump\":\"列表\",\"tableName\":\"cart\"}],\"menu\":\"购物车管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\"],\"menu\":\"新闻资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-paint\",\"buttons\":[\"查看\"],\"menu\":\"促销活动\",\"menuJump\":\"列表\",\"tableName\":\"cuxiaohuodong\"}],\"menu\":\"促销活动管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\",\"评价\"],\"menu\":\"商家信息\",\"menuJump\":\"列表\",\"tableName\":\"shangjiaxinxi\"}],\"menu\":\"商家信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"查看评论\",\"评价\"],\"menu\":\"菜品信息\",\"menuJump\":\"列表\",\"tableName\":\"caipinxinxi\"}],\"menu\":\"菜品信息管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"已发货订单\",\"menuJump\":\"已发货\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"已完成订单\",\"menuJump\":\"已完成\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"商品订单\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"已取消订单\",\"menuJump\":\"已取消\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"未支付订单\",\"menuJump\":\"未支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"已退款订单\",\"menuJump\":\"已退款\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"销售额统计\",\"销量统计\"],\"menu\":\"已支付订单\",\"menuJump\":\"已支付\",\"tableName\":\"orders\"}],\"menu\":\"订单管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"报修功能\",\"menuJump\":\"列表\",\"tableName\":\"baoxiugongneng\"}],\"fontClass\":\"icon-common37\",\"menu\":\"报修功能管理\",\"unicode\":\"&#xeea4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"促销活动\",\"menuJump\":\"列表\",\"tableName\":\"cuxiaohuodong\"}],\"fontClass\":\"icon-common38\",\"menu\":\"促销活动管理\",\"unicode\":\"&#xeeb2;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-shop\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"菜品类型\",\"menuJump\":\"列表\",\"tableName\":\"caipinleixing\"},{\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\",\"库存统计\"],\"menu\":\"菜品信息\",\"menuJump\":\"列表\",\"tableName\":\"caipinxinxi\"}],\"fontClass\":\"icon-common34\",\"menu\":\"菜品信息管理\",\"unicode\":\"&#xee85;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"审核\",\"修改\",\"删除\"],\"menu\":\"评价信息\",\"menuJump\":\"列表\",\"tableName\":\"pingjiaxinxi\"}],\"fontClass\":\"icon-common29\",\"menu\":\"评价信息管理\",\"unicode\":\"&#xee2e;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"查看\"],\"menu\":\"购物车\",\"menuJump\":\"列表\",\"tableName\":\"cart\"}],\"menu\":\"购物车管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\"],\"menu\":\"新闻资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-paint\",\"buttons\":[\"查看\"],\"menu\":\"促销活动\",\"menuJump\":\"列表\",\"tableName\":\"cuxiaohuodong\"}],\"menu\":\"促销活动管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\",\"评价\"],\"menu\":\"商家信息\",\"menuJump\":\"列表\",\"tableName\":\"shangjiaxinxi\"}],\"menu\":\"商家信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"查看评论\",\"评价\"],\"menu\":\"菜品信息\",\"menuJump\":\"列表\",\"tableName\":\"caipinxinxi\"}],\"menu\":\"菜品信息管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"商家信息\",\"tableName\":\"shangjiaxinxi\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\"],\"menu\":\"已发货订单\",\"menuJump\":\"已发货\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\"],\"menu\":\"已完成订单\",\"menuJump\":\"已完成\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\"],\"menu\":\"商品订单\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\"],\"menu\":\"已取消订单\",\"menuJump\":\"已取消\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\"],\"menu\":\"未支付订单\",\"menuJump\":\"未支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\"],\"menu\":\"已退款订单\",\"menuJump\":\"已退款\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\"],\"menu\":\"已支付订单\",\"menuJump\":\"已支付\",\"tableName\":\"orders\"}],\"menu\":\"订单管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\"],\"menu\":\"评价信息\",\"menuJump\":\"列表\",\"tableName\":\"pingjiaxinxi\"}],\"fontClass\":\"icon-common29\",\"menu\":\"评价信息管理\",\"unicode\":\"&#xee2e;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"查看\"],\"menu\":\"购物车\",\"menuJump\":\"列表\",\"tableName\":\"cart\"}],\"menu\":\"购物车管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\"],\"menu\":\"新闻资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-paint\",\"buttons\":[\"查看\"],\"menu\":\"促销活动\",\"menuJump\":\"列表\",\"tableName\":\"cuxiaohuodong\"}],\"menu\":\"促销活动管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\",\"评价\"],\"menu\":\"商家信息\",\"menuJump\":\"列表\",\"tableName\":\"shangjiaxinxi\"}],\"menu\":\"商家信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"查看评论\",\"评价\"],\"menu\":\"菜品信息\",\"menuJump\":\"列表\",\"tableName\":\"caipinxinxi\"}],\"menu\":\"菜品信息管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='新闻资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (31,'2024-02-18 02:53:07','青花瓷','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起','file/newsPicture1.jpg','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起， 隔江千万里，在瓶底书前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起， 晕开了局，如传世的青花瓷自顾自美丽，你眼带笑意，色白花青的锦鲤跃然于碗底，临摹宋体落款时却惦记着你，你隐藏在窑烧里千年的秘密，极细腻犹如绣花针落地，帘外芭蕉惹骤雨门环惹铜绿，而我路过那江南小镇惹了你，在泼墨山水画里，你从墨色深处被隐去，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天色等烟雨 ，而我在等你，月色被打捞起， 晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起 ，晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意。'),(32,'2024-02-18 02:53:07','理想三旬','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在','file/newsPicture2.jpg','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在，青春又醉倒在，籍籍无名的怀，靠嬉笑来虚度，聚散得慷慨，辗转却去不到，对的站台，如果漂泊是成长，必经的路牌，你迷醒岁月中，那贫瘠的未来，像遗憾季节里，未结果的爱，弄脏了每一页诗，吻最疼痛的告白，而风声吹到这，已不需要释怀，就老去吧，孤独别醒来，渴望的离开只是无处停摆就歌唱吧，眼睛眯起来而热泪的崩坏，只是没抵达的存在，就甜蜜地忍耐，繁星润湿窗台，光影跳动着像在，困倦里说爱，再无谓的感慨，以为明白，梦倒塌的地方，今已爬满青苔。'),(33,'2024-02-18 02:53:07','七里香','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠','file/newsPicture3.jpg','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，雨下整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，你是我唯一想要的了解，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，那饱满的稻穗幸福了这个季节，而你的脸颊像田里熟透的番茄，你突然对我说七里香的名字很美，我此刻却只想亲吻你倔强的嘴，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，是我唯一想要的了解。'),(34,'2024-02-18 02:53:07','江南','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸','file/newsPicture4.jpg','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天 抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，相信爱一天抵过永远。在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂。'),(35,'2024-02-18 02:53:07','那些你很冒险的梦','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落','file/newsPicture5.jpg','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心有多执着就加倍心痛，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，我不想放手 你松开的左手，你爱的放纵 我白不回天空，我输了 累了，但你再也 不回头，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，你真的不懂 我的爱已降落。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) DEFAULT NULL COMMENT '商品表名',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `buynumber` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `discountprice` double DEFAULT NULL COMMENT '折扣价',
  `total` double DEFAULT NULL COMMENT '总价',
  `discounttotal` double DEFAULT NULL COMMENT '折扣总价格',
  `type` varchar(200) DEFAULT NULL COMMENT '支付类型',
  `status` varchar(200) DEFAULT NULL COMMENT '订单状态',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `tel` varchar(200) DEFAULT NULL COMMENT '电话',
  `consignee` varchar(200) DEFAULT NULL COMMENT '收货人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `logistics` longtext COMMENT '物流',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=1708225225817 DEFAULT CHARSET=utf8 COMMENT='商品订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1708225213204,'2024-02-18 03:00:12','202421811011736','caipinxinxi',1708225089653,'青瓜','file/1708225083434.jpg',1,6,6,6,6,'1','已支付',NULL,NULL,NULL,'',NULL,1708225138935),(1708225225816,'2024-02-18 03:00:25','202421811024569','caipinxinxi',1708225112920,'猪肉','file/1708225105222.jpg',1,20,20,20,20,'1','已支付',NULL,NULL,NULL,'',NULL,1708225138935);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingjiaxinxi`
--

DROP TABLE IF EXISTS `pingjiaxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingjiaxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pingjianeirong` longtext NOT NULL COMMENT '评价内容',
  `pingjiashijian` datetime DEFAULT NULL COMMENT '评价时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `shhf` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708225259452 DEFAULT CHARSET=utf8 COMMENT='评价信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingjiaxinxi`
--

LOCK TABLES `pingjiaxinxi` WRITE;
/*!40000 ALTER TABLE `pingjiaxinxi` DISABLE KEYS */;
INSERT INTO `pingjiaxinxi` VALUES (1708225194512,'2024-02-18 02:59:54','111','2024-02-18 10:59:50','1','李阳','11'),(1708225259451,'2024-02-18 03:00:59','11121','2024-02-18 11:00:53','1','李阳','11');
/*!40000 ALTER TABLE `pingjiaxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shangjiaxinxi`
--

DROP TABLE IF EXISTS `shangjiaxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shangjiaxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangjiazhanghao` varchar(200) NOT NULL COMMENT '商家账号',
  `shangjiamima` varchar(200) DEFAULT NULL COMMENT '商家密码',
  `shangjiamingcheng` varchar(200) NOT NULL COMMENT '商家名称',
  `shangjiatupian` longtext COMMENT '商家图片',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `yingyeshijian` date DEFAULT NULL COMMENT '营业时间',
  `shangjiadizhi` varchar(200) DEFAULT NULL COMMENT '商家地址',
  `dianneisheshi` longtext COMMENT '店内设施',
  `shangjiajianjie` longtext COMMENT '商家简介',
  `shangjiagonggao` longtext COMMENT '商家公告',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shangjiazhanghao` (`shangjiazhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1708224979926 DEFAULT CHARSET=utf8 COMMENT='商家信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shangjiaxinxi`
--

LOCK TABLES `shangjiaxinxi` WRITE;
/*!40000 ALTER TABLE `shangjiaxinxi` DISABLE KEYS */;
INSERT INTO `shangjiaxinxi` VALUES (41,'2024-02-18 02:53:07','商家账号1','123456','商家名称1','file/shangjiaxinxiShangjiatupian1.jpg','19819881111','2024-02-18','商家地址1','店内设施1','商家简介1','商家公告1'),(42,'2024-02-18 02:53:07','商家账号2','123456','商家名称2','file/shangjiaxinxiShangjiatupian2.jpg','19819881112','2024-02-18','商家地址2','店内设施2','商家简介2','商家公告2'),(43,'2024-02-18 02:53:07','商家账号3','123456','商家名称3','file/shangjiaxinxiShangjiatupian3.jpg','19819881113','2024-02-18','商家地址3','店内设施3','商家简介3','商家公告3'),(44,'2024-02-18 02:53:07','商家账号4','123456','商家名称4','file/shangjiaxinxiShangjiatupian4.jpg','19819881114','2024-02-18','商家地址4','店内设施4','商家简介4','商家公告4'),(45,'2024-02-18 02:53:07','商家账号5','123456','商家名称5','file/shangjiaxinxiShangjiatupian5.jpg','19819881115','2024-02-18','商家地址5','店内设施5','商家简介5','商家公告5'),(46,'2024-02-18 02:53:07','商家账号6','123456','商家名称6','file/shangjiaxinxiShangjiatupian6.jpg','19819881116','2024-02-18','商家地址6','店内设施6','商家简介6','商家公告6'),(1708224979925,'2024-02-18 02:56:19','122','122','洪福','file/1708224974751.jpg','13212121212','2024-02-18','中国','1','1',NULL);
/*!40000 ALTER TABLE `shangjiaxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'admin','users','管理员','cch7eath3swg13356itm5w656k3sd55w','2024-02-18 02:55:44','2024-02-18 04:02:41'),(2,1708224979925,'122','shangjiaxinxi','管理员','pq1g0qg9j4uq8rr4h1ruwgrlyh0fd9lc','2024-02-18 02:56:27','2024-02-18 03:56:27'),(3,1708225138935,'1','yonghu','用户','mhwznbm538zbptvv6htihvnjzk16jx0n','2024-02-18 02:59:02','2024-02-18 03:59:03');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-02-18 02:53:08','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghumima` varchar(200) NOT NULL COMMENT '用户密码',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `money` double DEFAULT '0' COMMENT '余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1708225138936 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (51,'2024-02-18 02:53:07','用户账号1','123456','用户姓名1','file/yonghuTouxiang1.jpg','男','19819881111',200),(52,'2024-02-18 02:53:07','用户账号2','123456','用户姓名2','file/yonghuTouxiang2.jpg','男','19819881112',200),(53,'2024-02-18 02:53:07','用户账号3','123456','用户姓名3','file/yonghuTouxiang3.jpg','男','19819881113',200),(54,'2024-02-18 02:53:07','用户账号4','123456','用户姓名4','file/yonghuTouxiang4.jpg','男','19819881114',200),(55,'2024-02-18 02:53:07','用户账号5','123456','用户姓名5','file/yonghuTouxiang5.jpg','男','19819881115',200),(56,'2024-02-18 02:53:07','用户账号6','123456','用户姓名6','file/yonghuTouxiang6.jpg','男','19819881116',200),(1708225138935,'2024-02-18 02:58:58','1','1','李阳','file/1708225134158.jpg','男','13212121211',29974);
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-20 12:48:26
