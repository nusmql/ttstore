-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: tecnotree_store
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_address`
--

DROP TABLE IF EXISTS `tb_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT 'consignee',
  `user_id` int NOT NULL DEFAULT '0' COMMENT 'User ID',
  `province` varchar(63) NOT NULL COMMENT 'province ID',
  `city` varchar(63) NOT NULL COMMENT 'city',
  `county` varchar(63) NOT NULL COMMENT 'country',
  `address_detail` varchar(127) NOT NULL DEFAULT '' COMMENT 'full adress',
  `area_code` char(6) DEFAULT NULL COMMENT 'area code',
  `postal_code` char(6) DEFAULT NULL COMMENT 'post code',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT 'landline',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'default?',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `deleted_at` datetime DEFAULT NULL COMMENT 'deleted',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='delevery address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_address`
--

LOCK TABLES `tb_address` WRITE;
/*!40000 ALTER TABLE `tb_address` DISABLE KEYS */;
INSERT INTO `tb_address` VALUES (2,'testing5',23,'Uusimaa','VANTAA','Finland','Kaarrostie 100','','01009','044 319 2406',1,'2021-10-31 12:34:03','2021-10-31 18:57:02',NULL);
/*!40000 ALTER TABLE `tb_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart`
--

DROP TABLE IF EXISTS `tb_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT 'user table ID',
  `goods_id` int NOT NULL COMMENT 'goods ID',
  `goods_sn` varchar(64) NOT NULL COMMENT 'goods serial number ',
  `goods_name` varchar(128) NOT NULL COMMENT 'goods number',
  `product_id` int NOT NULL COMMENT 'product ID sku',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'price',
  `quantity` smallint NOT NULL DEFAULT '0' COMMENT 'count',
  `specifications` varchar(1024) DEFAULT NULL COMMENT 'product description，采用JSON数组格式',
  `checked` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'is selected?',
  `pic_url` varchar(255) DEFAULT NULL COMMENT 'default picture in cart',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'createt time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `deleted_at` datetime DEFAULT NULL COMMENT 'deleted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='shopping cart';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart`
--

LOCK TABLES `tb_cart` WRITE;
/*!40000 ALTER TABLE `tb_cart` DISABLE KEYS */;
INSERT INTO `tb_cart` VALUES (2,23,1181004,'1646220838','Sankofa: A Novel',251,16.62,1,NULL,1,NULL,'2021-10-31 12:45:04','2021-10-31 18:56:14',NULL);
/*!40000 ALTER TABLE `tb_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT 'category name',
  `keywords` varchar(1023) NOT NULL DEFAULT '' COMMENT 'keywords for search, as json format',
  `desc` varchar(255) DEFAULT '' COMMENT 'category shot description',
  `pid` int DEFAULT NULL COMMENT 'parent category id',
  `icon_url` varchar(255) DEFAULT '' COMMENT 'category icon url',
  `pic_url` varchar(255) DEFAULT '' COMMENT 'category pic url',
  `level` varchar(255) DEFAULT 'L1',
  `sort_order` tinyint DEFAULT '50' COMMENT 'sort factor',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `deleted_at` datetime DEFAULT NULL COMMENT 'soft delete',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1036010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='category table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES (1036007,'Books','','',NULL,'','','0',50,'2021-10-31 12:15:42','2021-10-31 18:55:26',NULL),(1036008,'Literature & Fiction','','',1036007,'','','L1',100,'2021-10-31 12:15:42','2021-10-31 18:55:26',NULL),(1036009,'Reference','','',1036007,'','','L1',100,'2021-10-31 12:25:12','2021-10-31 18:55:26',NULL);
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_goods`
--

DROP TABLE IF EXISTS `tb_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(63) NOT NULL DEFAULT '' COMMENT 'goods serial number',
  `name` varchar(127) NOT NULL DEFAULT '' COMMENT 'good name',
  `category_id` int DEFAULT '0' COMMENT 'goods category',
  `brand_id` int DEFAULT '0',
  `gallery` varchar(1023) DEFAULT NULL COMMENT '商品宣传图片列表，采用JSON数组格式',
  `keywords` varchar(255) DEFAULT '' COMMENT '商品关键字，采用逗号间隔',
  `brief` varchar(255) DEFAULT '' COMMENT 'goods shot description',
  `is_on_sale` tinyint(1) DEFAULT '1' COMMENT 'live?',
  `sort_order` smallint DEFAULT '100' COMMENT 'sort ranking factor',
  `pic_url` varchar(255) DEFAULT NULL COMMENT 'goods pics',
  `share_url` varchar(255) DEFAULT NULL COMMENT 'share pics',
  `is_new` tinyint(1) DEFAULT '0' COMMENT 'is new product?',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT 'is hot product?',
  `unit` varchar(31) DEFAULT NULL COMMENT 'unit',
  `counter_price` decimal(10,2) DEFAULT '0.00' COMMENT 'normal price',
  `retail_price` decimal(10,2) DEFAULT '100000.00' COMMENT 'retail price',
  `detail` text COMMENT 'good details description can be rich text here',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `deleted_at` datetime DEFAULT NULL COMMENT 'deleted',
  PRIMARY KEY (`id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1181006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='good detais SPU';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_goods`
--

LOCK TABLES `tb_goods` WRITE;
/*!40000 ALTER TABLE `tb_goods` DISABLE KEYS */;
INSERT INTO `tb_goods` VALUES (1181004,'1646220838','Sankofa: A Novel',1036008,0,NULL,'Fiction','',1,100,NULL,NULL,1,1,NULL,16.82,16.62,NULL,'2021-10-31 12:19:09','2021-10-31 18:54:22',NULL),(1181005,'0306924099','In the Weeds: Around the World and Behind the Scenes with Anthony Bourdain',1036009,0,NULL,'Referece','',1,100,NULL,NULL,1,1,NULL,25.49,25.49,NULL,'2021-10-31 12:25:51','2021-10-31 18:54:22',NULL);
/*!40000 ALTER TABLE `tb_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_goods_attribute`
--

DROP TABLE IF EXISTS `tb_goods_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_goods_attribute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_id` int NOT NULL DEFAULT '0' COMMENT 'good id',
  `attribute` varchar(255) NOT NULL COMMENT 'goods attribute',
  `value` varchar(255) NOT NULL COMMENT 'attribute value',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `deleted_at` datetime DEFAULT NULL COMMENT 'soft delete',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=877 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='goods attributes config';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_goods_attribute`
--

LOCK TABLES `tb_goods_attribute` WRITE;
/*!40000 ALTER TABLE `tb_goods_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_goods_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_goods_product`
--

DROP TABLE IF EXISTS `tb_goods_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_goods_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_id` int NOT NULL DEFAULT '0' COMMENT 'goods ID',
  `specifications` varchar(1023) NOT NULL COMMENT 'product spec',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'product price',
  `stock` int NOT NULL DEFAULT '0' COMMENT 'product number',
  `url` varchar(127) DEFAULT NULL COMMENT 'product image',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `deleted_at` datetime DEFAULT NULL COMMENT 'deleted',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='goods SKU';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_goods_product`
--

LOCK TABLES `tb_goods_product` WRITE;
/*!40000 ALTER TABLE `tb_goods_product` DISABLE KEYS */;
INSERT INTO `tb_goods_product` VALUES (251,1181004,'{\"ISBN-10\":\"1646220838\",\"ISBN-13\":\"978-1646220830\"}',16.62,100,NULL,'2021-10-31 12:23:24','2021-10-31 18:52:29',NULL),(252,1181005,'{\"ISBN-10\":\"0306924099\",\"ISBN-13\":\"978-0306924095\"}',25.49,100,NULL,'2021-10-31 12:27:18','2021-10-31 18:52:29',NULL);
/*!40000 ALTER TABLE `tb_goods_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT 'User table ID',
  `order_sn` varchar(63) NOT NULL COMMENT 'Order serial number',
  `order_status` smallint NOT NULL COMMENT 'Order status',
  `aftersale_status` smallint DEFAULT '0' COMMENT 'after sale status reserve',
  `consignee` varchar(63) NOT NULL COMMENT 'Consignee name',
  `mobile` varchar(63) NOT NULL COMMENT 'Consignee mobile number',
  `address` text NOT NULL COMMENT 'Consignee full delivery address',
  `message` varchar(511) DEFAULT '' COMMENT 'order additional message',
  `goods_price` decimal(10,2) NOT NULL COMMENT 'goods total price',
  `freight_price` decimal(10,2) NOT NULL COMMENT 'delivery fee',
  `order_price` decimal(10,2) NOT NULL COMMENT 'order_price = goods_price + freight_price',
  `pay_id` varchar(63) DEFAULT NULL COMMENT 'payment table id',
  `pay_time` datetime DEFAULT NULL COMMENT 'payment time',
  `ship_sn` varchar(63) DEFAULT NULL COMMENT 'shipping serial number',
  `ship_channel` varchar(63) DEFAULT NULL COMMENT 'shipping company',
  `ship_time` datetime DEFAULT NULL COMMENT 'start shpping time',
  `confirm_time` datetime DEFAULT NULL COMMENT 'user confirm received time',
  `end_time` datetime DEFAULT NULL COMMENT 'order end time',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create order time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'order update time',
  `deleted_at` datetime DEFAULT NULL COMMENT 'logic delete',
  PRIMARY KEY (`id`),
  KEY `idx_tb_order_deleted` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='order table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
INSERT INTO `tb_order` VALUES (12,23,'2321321',101,0,'testing 5','12321321','testing','',16.62,5.00,21.62,'',NULL,'','',NULL,NULL,NULL,'2021-10-31 19:17:35','2021-10-31 19:18:15','2021-10-31 19:18:16'),(13,23,'2321321',101,0,'testing 5','12321321','testing','',16.62,5.00,21.62,'',NULL,'','',NULL,NULL,NULL,'2021-10-31 20:39:48','2021-10-31 20:46:12','2021-10-31 20:46:13'),(14,23,'2321321',101,0,'testing 5','12321321','testing','',16.62,5.00,21.62,'',NULL,'','',NULL,NULL,NULL,'2021-10-31 20:44:59','2021-10-31 20:55:25','2021-10-31 20:55:26'),(15,23,'2321321',101,0,'testing 5','12321321','testing','',16.62,5.00,21.62,'',NULL,'','',NULL,NULL,NULL,'2021-10-31 22:15:34','2021-10-31 22:15:34',NULL),(16,23,'2321321',101,0,'testing 5','12321321','testing','',16.62,5.00,21.62,'',NULL,'','',NULL,NULL,NULL,'2021-10-31 22:15:36','2021-10-31 22:15:36',NULL);
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_goods`
--

DROP TABLE IF EXISTS `tb_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL DEFAULT '0' COMMENT 'order ID',
  `goods_id` int NOT NULL DEFAULT '0' COMMENT 'goods ID',
  `goods_name` varchar(127) NOT NULL DEFAULT '' COMMENT 'good name',
  `goods_sn` varchar(63) NOT NULL DEFAULT '' COMMENT 'goods serial number',
  `product_id` int NOT NULL DEFAULT '0' COMMENT 'proudct ID',
  `quantity` smallint NOT NULL DEFAULT '0' COMMENT 'quantity to order',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'item prices',
  `specifications` varchar(1023) DEFAULT NULL COMMENT 'item specs',
  `pic_url` varchar(255) DEFAULT '' COMMENT 'product picture',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `deleted_at` datetime DEFAULT NULL COMMENT 'soft delete',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  KEY `idx_tb_order_goods_deleted` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='order items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_goods`
--

LOCK TABLES `tb_order_goods` WRITE;
/*!40000 ALTER TABLE `tb_order_goods` DISABLE KEYS */;
INSERT INTO `tb_order_goods` VALUES (4,12,1181004,'Sankofa: A Novel','1646220838',1181004,1,16.62,'','','2021-10-31 19:17:35','2021-10-31 20:48:49','2021-10-31 19:18:16'),(5,13,1181004,'Sankofa: A Novel','1646220838',1181004,1,16.62,'','','2021-10-31 20:39:48','2021-10-31 20:48:49','2021-10-31 20:46:13'),(6,14,1181004,'Sankofa: A Novel','1646220838',1181004,1,16.62,'','','2021-10-31 20:44:59','2021-10-31 20:55:25','2021-10-31 20:55:26'),(7,15,1181004,'Sankofa: A Novel','1646220838',1181004,1,16.62,'','','2021-10-31 22:15:34','2021-10-31 22:15:34',NULL),(8,16,1181004,'Sankofa: A Novel','1646220838',1181004,1,16.62,'','','2021-10-31 22:15:35','2021-10-31 22:15:35',NULL);
/*!40000 ALTER TABLE `tb_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(63) NOT NULL COMMENT 'user name',
  `password` varchar(63) NOT NULL DEFAULT '123456' COMMENT 'user password',
  `gender` tinyint NOT NULL DEFAULT '0' COMMENT 'gender: 0 unknow, 1 mail, 2 female',
  `nick_name` varchar(45) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `email` varchar(45) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像图片',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 可用, 1 禁用, 2 注销',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='customer info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (4,'jack','$10$G0xmX5Sw2jK9AO7AkOsJfe9NvMHRJyBTRhFIjxMpTz/5JSjKUlDKK',1,'hihi','',NULL,'',0,'2021-10-30 22:47:40','2021-10-31 18:51:37',NULL),(5,'yang','$10$G0xmX5Sw2jK9AO7AkOsJfe9NvMHRJyBTRhFIjxMpTz/5JSjKUlDKK',0,NULL,'',NULL,'',0,'2021-10-30 22:47:40','2021-10-31 18:51:37',NULL),(6,'testing1','$2a$10$G0xmX5Sw2jK9AO7AkOsJfe9NvMHRJyBTRhFIjxMpTz/5JSjKUlDKK',0,NULL,'',NULL,'',0,'2021-10-31 01:26:33','2021-10-31 18:51:37',NULL),(7,'testing2','$2a$10$iOz1MJ1NVZsQ/7oy1Z/X.eaaXWRiUq1RFqN/drjrXwWJxfvyFwKDa',0,NULL,'',NULL,'',0,'2021-10-31 01:26:33','2021-10-31 18:51:37',NULL),(9,'testing3','$2a$10$ENuIjab1h385AN5u70xMSOAJANkhGwXj6/LYt/fPOGdS7mUEtM4PO',0,NULL,'','a@gmail.com','',0,'2021-10-31 01:51:36','2021-10-31 18:51:37',NULL),(13,'testing4','$2a$10$TE6H6Hi.iwctSmqDo4p5CubQOyPi1oWUnsOUvhQ7smoldpZCJii.a',0,NULL,'','a','',0,'2021-10-31 01:57:27','2021-10-31 18:51:37',NULL),(21,'testing6','$2a$10$xqzXBYg/KqWRrCXESdYXZu5/n7Xq/NjqVww1h0T1vNYgzF.WkgUTG',0,NULL,'','a','',0,'2021-10-31 02:08:20','2021-10-31 18:51:37',NULL),(23,'testing5','',0,'haha','213213213213','abc@gmail.com','',0,NULL,'2021-10-31 18:51:37',NULL);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-01  9:26:50
