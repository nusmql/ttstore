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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-01  9:38:18
