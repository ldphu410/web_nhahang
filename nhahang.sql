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
  `isadmin` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin1','$2b$10$U09M0GFXVGx75O1g3SK38exkUA330BihOP.IRFSdlccHtz8CgXBHq','Le Dinh','Phu','admin');
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
-- Table structure for table `menutrangchu`
--

DROP TABLE IF EXISTS `menutrangchu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menutrangchu` (
  `atr1` varchar(20) DEFAULT NULL,
  `atr2` varchar(20) DEFAULT NULL,
  `atr3` varchar(20) DEFAULT NULL,
  `atr4` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menutrangchu`
--

LOCK TABLES `menutrangchu` WRITE;
/*!40000 ALTER TABLE `menutrangchu` DISABLE KEYS */;
INSERT INTO `menutrangchu` VALUES ('All','Breakfast','Lunch','Dinner',1);
/*!40000 ALTER TABLE `menutrangchu` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monan`
--

LOCK TABLES `monan` WRITE;
/*!40000 ALTER TABLE `monan` DISABLE KEYS */;
INSERT INTO `monan` VALUES (18,'Kenchin-jiru','50000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 kh&uacute;c củ cải 4cm (150g),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1/2 củ c&agrave; rốt (70g),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 củ khoai sọ,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 c&aacute;i nấm shiitake kh&ocirc;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 1/2 b&igrave;a đậu phụ thường (150g)</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 2 th&igrave;a dầu vừng (dầu m&egrave;),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">800ml nước d&ugrave;ng dashi nấu từ c&aacute; ngừ kh&ocirc; b&agrave;o mỏng,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(C&aacute;ch nấu nước d&ugrave;ng dashi),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">100ml nước ng&acirc;m, nấm kh&ocirc; shiitake (nếu kh&ocirc;ng c&oacute;, d&ugrave;ng 100ml nước d&ugrave;ng từ c&aacute; ngừ kh&ocirc; b&agrave;o mỏng)</span></p>','/static/images/8.jpg','Canh kiểu Nhật Bản nấu với nhiều loại rau','trua'),(19,'Iwashi no kabayaki don','100000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 con c&aacute; ch&igrave;nh,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a c&agrave; ph&ecirc; x&igrave; dầu,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">một ch&uacute;t bột khoai t&acirc;y,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh dầu r&aacute;n, m</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">ột v&agrave;i nh&aacute;nh l&aacute; ti&ecirc;u n&uacute;i sansho hoặc bột sansho,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh x&igrave; dầu</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 2 th&igrave;a canh đường,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh nước,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">300 g gạo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">430 ml nước&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(hoặc 600 g cơm trắng)</span></p>','/static/images/9.jpg','Cá chình nướng kiểu kabayaki','toi'),(21,'Aisu kyandee','20000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Để l&agrave;m 3 hương vị kh&aacute;c nhau, bạn cần 3 khay đ&aacute;, mỗi khay c&oacute; k&iacute;ch cỡ 10 x 20 cm, s&acirc;u 3 cm. Lấy đũa gỗ d&ugrave;ng 1 lần để l&agrave;m que kem. Kem sữa: 4 th&igrave;a canh sữa đặc c&oacute; đường, 1 cốc sữa (200ml). Kem dứa: 4 miếng dứa hộp (140g), 2 th&igrave;a canh đường</span></p>','/static/images/10.jpg','Kem que đá','trua'),(22,'Saba no shioyaki','100000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 con c&aacute; saba tươi (d&agrave;i khoảng 30cm).&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 quả sudachi (loại quả giống như chanh cốm ở Việt Nam) cắt l&agrave;m đ&ocirc;i; hoặc 4 miếng cam hay chanh,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 củ gừng (d&agrave;i 4 cm, khoảng 40 gam),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">3 th&igrave;a canh giấm gạo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a rưỡi th&igrave;a canh đường,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&frac14; th&igrave;a c&agrave; ph&ecirc; muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh nước</span></p>','/static/images/11.jpg','Cá basa nướng muối','toi'),(25,'Ichigo Daifuku','40000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">\"Ichigo Daifuku\" l&agrave; loại b&aacute;nh giầy ngọt truyền thống của Nhật Bản, B&aacute;nh h&igrave;nh tr&ograve;n, dễ thương, phần nh&acirc;n c&oacute; một quả d&acirc;y t&acirc;y bọc trong đậu đỏ ng&agrave;o đường. Ch&uacute;ng t&ocirc;i sẽ hướng dẫn c&aacute;c bạn c&aacute;ch dễ d&agrave;ng l&agrave;m b&aacute;nh \"ichigo daifuku\"tại nh&agrave;, bằng c&aacute;ch d&ugrave;ng nồi hấp hoặc l&ograve; vi s&oacute;ng.</span></p>','/static/images/myImage-1526348692064.jpg','Bánh giầy ngọt truyền thống của Nhật Bản','toi'),(26,'Lẩu cá tuyết Tara-chiri','99000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">M&oacute;n lẩu \"chiri\" với c&aacute; tara, tức c&aacute; tuyết, đang v&agrave;o m&ugrave;a. \"Chiri\" l&agrave; m&oacute;n lẩu sử dụng nguy&ecirc;n liệu như c&aacute;, rau, đậu phụ, luộc l&ecirc;n rồi chấm với nước chấm ponzu chua mặn. Ch&uacute;ng t&ocirc;i cũng sẽ giới thiệu văn h&oacute;a \"shime\", tức l&agrave; kết th&uacute;c nồi lẩu bằng c&aacute;ch nấu ch&aacute;o với chỗ nước d&ugrave;ng c&ograve;n lại</span></p>','/static/images/myImage-1526348857008.jpg','Lẩu \"chiri\" với cá tuyết','trua toi'),(27,'Miso-shiru','40000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">Canh tương miso l&agrave; một trong những m&oacute;n ăn cơ bản trong ẩm thực Nhật Bản. Đ&acirc;y l&agrave; m&oacute;n ăn h&agrave;ng ng&agrave;y của c&aacute;c gia đ&igrave;nh Nhật Bản, được nấu với nhiều loại nguy&ecirc;n liệu kh&aacute;c nhau. H&ocirc;m nay, ch&uacute;ng ta c&ugrave;ng sử dụng honbushi, tức c&aacute; ngừ kh&ocirc; l&ecirc;n mốc được b&agrave;o mỏng để nấu nước d&ugrave;ng (nước l&egrave;o) v&agrave; nấu canh miso với khoai t&acirc;y v&agrave; h&agrave;nh t&acirc;y.</span></p>','/static/images/myImage-1526349168727.jpg','Canh tương miso','sang trua toi'),(28,'Surinagashi','35000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">&nbsp;M&oacute;n canh \"surinagashi\", một m&oacute;n canh s&aacute;nh l&agrave;m bằng c&aacute;c loại rau, c&aacute; v&agrave; một số nguy&ecirc;n liệu kh&aacute;c nghiền ra, sau đ&oacute; h&ograve;a với nước d&ugrave;ng. Lần n&agrave;y, ch&uacute;ng t&ocirc;i sử dụng ng&ocirc; v&agrave; c&aacute; tr&aacute;p hồng l&agrave;m nguy&ecirc;n liệu ch&iacute;nh.</span></p>','/static/images/myImage-1526349333465.jpg','Canh surinagashi','sang toi'),(29,'Gà rán Teriyaki','65000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">500 g, tương đương 2 chiếc đ&ugrave;i g&agrave; r&uacute;t xương, c&oacute; da&nbsp;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Bột khoai t&acirc;y, lượng vừa đủ</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh dầu ăn</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">50 ml nước t&aacute;o</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 cộng 1/3 th&igrave;a canh x&igrave;-dầu</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a c&agrave; ph&ecirc; đường</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a c&agrave; ph&ecirc; giấm</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">5 g gừng</span></p>','/static/images/myImage-1526349599170.jpg','Thịt gà rán Teriyaki ít muối','trua toi'),(30,'Mỳ Hippari udon và lẩu Kayaki','89000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">- M&oacute;n mỳ Hippari udon</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Mỳ udon luộc sẵn d&ugrave;ng cho 4 người: 4 g&oacute;i (800 gr),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 hộp c&aacute; saba (200 g) kho nước muối</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 4 c&acirc;y h&agrave;nh hoa (h&agrave;nh l&aacute;)</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 1 nh&aacute;nh gừng</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 1 ch&uacute;t ớt bột</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">- X&igrave; dầu: lượng vừa đủ</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">- M&oacute;n lẩu Kayaki</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 hộp c&aacute; saba (200 g) kho nước muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">4 cốc nước (800 ml),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh x&igrave; dầu,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">150 g rau ch&acirc;n vịt,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">250 g rau cải thảo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(hoặc 400 g c&aacute;c loại rau t&ugrave;y &yacute;),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 nh&aacute;nh gừng</span></p>','/static/images/myImage-1526349738650.jpg','Món ăn truyền thống của Tohoku','trua toi'),(31,'Temakizushi','35000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">Tại Nhật Bản, từ cuối năm đến năm mới l&agrave; thời điểm người ta c&oacute; nhiều dịp để mời bạn b&egrave; tới nh&agrave; hoặc đo&agrave;n tụ với gia đ&igrave;nh để tổ chức li&ecirc;n hoan cuối năm, tổ chức lễ Gi&aacute;ng sinh v&agrave; ch&agrave;o đ&oacute;n Năm mới. M&oacute;n sushi cuộn tay temakizushi l&agrave; m&oacute;n ăn th&iacute;ch hợp với những thời điểm n&agrave;y.</span></p>','/static/images/myImage-1526350122794.jpg','Sushi cuộn tay','sang trua toi'),(32,'Tatsuta-age','30000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">M&oacute;n tatsuta-age, một kiểu tẩm bột r&aacute;n đặc biệt của Nhật Bản. Nguy&ecirc;n liệu được ướp trước với x&igrave; dầu rồi lăn qua bột khoai t&acirc;y, sau đ&oacute; r&aacute;n ngập dầu. Do c&aacute;ch chế biến n&agrave;y, m&oacute;n ăn sau khi r&aacute;n tr&ocirc;ng như được phủ một lớp bột trắng b&ecirc;n ngo&agrave;i. H&ocirc;m nay ch&uacute;ng ta c&ugrave;ng chế biến m&oacute;n tatsuta-age với thịt g&agrave; v&agrave; c&aacute; thu.</span></p>','/static/images/myImage-1526350689564.jpg','Món tẩm bột rán tatsuta-age','toi'),(33,'Chanko-nabe','59000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">Chanko-nabe l&agrave; loại lẩu do c&aacute;c lực sĩ sumo nấu. Thịt, hải sản, rau v&agrave; c&aacute;c nguy&ecirc;n liệu kh&aacute;c được xắt th&agrave;nh những miếng vừa ăn, sau đ&oacute; cho v&agrave;o nồi lẩu lớn nấu với nước d&ugrave;ng thơm ngon. H&ocirc;m nay, ch&uacute;ng ta nấu Chanko-nabe với thịt g&agrave;, rau v&agrave; x&igrave; dầu.</span></p>','/static/images/myImage-1526350848804.jpg','Lẩu Sumo','trua toi');
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
INSERT INTO `slides` VALUES (2,' The Fresh And Tasty Burgers','<p>There’s so much fun for you today</p>','Go on','/static/images/myImage-1526351103653.jpg'),(3,'The Taste of Joy','It’s gonna be a lovely day','Try','/static/images/myImage-1526351111843.jpg'),(4,' It’s gonna be a great weekend ','<p>You Deserve a Break Today</p>',' Buy Now','  /static/images/slide04.jpg  ');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` text NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'abc@gmail.com','keuhfZG$7lmhk~m^Iq','',''),(2,'phuld410@gmail.com','123456','Le','Phu'),(3,'ldphu410@gmail.com','123456','Phu','Phu'),(4,'xyz@gmail.com','$2b$10$FbHTl/0ciaaL1B6l.cX/zO2YxcDB4FLQSM/Slnfd5l4MTAbJXYSXm','Nguyen','A'),(5,'ldphu','$2b$10$HFfOZfCHxhAlXjuJteG5IO5Xc6shpRPtBXOF.6L2vG80lr2v1OZl6','Le','Phu'),(25,'test','$2b$10$JfyVoXgU9RPh4L/PgPLcvuQtZN/ILnl6BChu3HPhdyOHZjpaQ5Acy','phu','le'),(26,'test2','$2b$10$9y.qsXpiId.dvAur19KG5ecQybyiP/qtz68.RVzJIXYJtkw55Vw4u','le','phuuuu'),(27,'test3','$2b$10$MSej23mSTl4vs0o4wS75XepKJnVKZQ2lZCWmBtZQEPd.vNBpRT.BG','Le ','Phu');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-15 20:23:48
