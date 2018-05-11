CREATE DATABASE  IF NOT EXISTS `nhahang` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nhahang`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: nhahang
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` text NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'abc@gmail.com','keuhfZG$7lmhk~m^Iq','',''),(2,'phuld410@gmail.com','123456','Le','Phu'),(3,'ldphu410@gmail.com','123456','Phu','Phu');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header`
--

DROP TABLE IF EXISTS `header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fb` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `sdt` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header`
--

LOCK TABLES `header` WRITE;
/*!40000 ALTER TABLE `header` DISABLE KEYS */;
INSERT INTO `header` VALUES (1,'   https://www.facebook.com/phu.ledinh.982   ','   ldphu410@gmail.com   ','01683293784','   8:00am - 10:00pm   ');
/*!40000 ALTER TABLE `header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monan`
--

DROP TABLE IF EXISTS `monan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `gia` varchar(45) NOT NULL,
  `nguyenlieu` text NOT NULL,
  `hinhanh` text NOT NULL,
  `gioithieu` text NOT NULL,
  `bua` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monan`
--

LOCK TABLES `monan` WRITE;
/*!40000 ALTER TABLE `monan` DISABLE KEYS */;
INSERT INTO `monan` VALUES (18,'Kenchin-jiru','50000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 kh&uacute;c củ cải 4cm (150g),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1/2 củ c&agrave; rốt (70g),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 củ khoai sọ,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 c&aacute;i nấm shiitake kh&ocirc;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 1/2 b&igrave;a đậu phụ thường (150g)</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 2 th&igrave;a dầu vừng (dầu m&egrave;),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">800ml nước d&ugrave;ng dashi nấu từ c&aacute; ngừ kh&ocirc; b&agrave;o mỏng,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(C&aacute;ch nấu nước d&ugrave;ng dashi),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">100ml nước ng&acirc;m, nấm kh&ocirc; shiitake (nếu kh&ocirc;ng c&oacute;, d&ugrave;ng 100ml nước d&ugrave;ng từ c&aacute; ngừ kh&ocirc; b&agrave;o mỏng)</span></p>','/static/images/8.jpg','Canh kiểu Nhật Bản nấu với nhiều loại rau','trua'),(19,'Iwashi no kabayaki don','100000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 con c&aacute; ch&igrave;nh,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a c&agrave; ph&ecirc; x&igrave; dầu,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">một ch&uacute;t bột khoai t&acirc;y,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh dầu r&aacute;n, m</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">ột v&agrave;i nh&aacute;nh l&aacute; ti&ecirc;u n&uacute;i sansho hoặc bột sansho,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh x&igrave; dầu</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 2 th&igrave;a canh đường,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh nước,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">300 g gạo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">430 ml nước&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(hoặc 600 g cơm trắng)</span></p>','/static/images/9.jpg','Cá chình nướng kiểu kabayaki','toi'),(21,'Aisu kyandee','20000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Để l&agrave;m 3 hương vị kh&aacute;c nhau, bạn cần 3 khay đ&aacute;, mỗi khay c&oacute; k&iacute;ch cỡ 10 x 20 cm, s&acirc;u 3 cm. Lấy đũa gỗ d&ugrave;ng 1 lần để l&agrave;m que kem. Kem sữa: 4 th&igrave;a canh sữa đặc c&oacute; đường, 1 cốc sữa (200ml). Kem dứa: 4 miếng dứa hộp (140g), 2 th&igrave;a canh đường</span></p>','/static/images/10.jpg','Kem que đá','trua'),(22,'Saba no shioyaki','100000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 con c&aacute; saba tươi (d&agrave;i khoảng 30cm).&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 quả sudachi (loại quả giống như chanh cốm ở Việt Nam) cắt l&agrave;m đ&ocirc;i; hoặc 4 miếng cam hay chanh,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 củ gừng (d&agrave;i 4 cm, khoảng 40 gam),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">3 th&igrave;a canh giấm gạo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a rưỡi th&igrave;a canh đường,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&frac14; th&igrave;a c&agrave; ph&ecirc; muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh nước</span></p>','/static/images/11.jpg','Cá basa nướng muối','toi'),(23,'tnmj','jhk','<p>jđjl</p>','/static/upload/myImage-1525878790081.jpg','jkhkh','sang');
/*!40000 ALTER TABLE `monan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `button_content` varchar(255) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (2,' The Fresh And Tasty Burgers','<p>There’s so much fun for you today</p>','Go on',' /static/images/slide02.jpg '),(3,'The Taste of Joy','It’s gonna be a lovely day','Try',' /static/images/01.jpg '),(4,'It’s gonna be a great weekend','You Deserve a Break Today','Buy',' /static/images/slide04.jpg ');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-11  9:29:33
