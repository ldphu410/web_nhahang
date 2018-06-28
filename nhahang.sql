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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `date` varchar(15) NOT NULL,
  `time` varchar(15) NOT NULL,
  `person` int(11) NOT NULL,
  `now` varchar(15) NOT NULL,
  `confirm` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (2,'Le Dinh Phu','ldphu410@gmail.com','015','0005-05-05','01:05',4,'23/5/2018','confirm'),(4,'Nguyen B','dd@gmail.com','444','0004-04-04','04:04',44,'23/5/2018','confirm'),(5,'','ldphu410@gmail.com','5','0005-05-05','05:55',4,'23/5/2018','confirm'),(6,'','ldphu410@gmail.com','3','0055-05-05','17:55',2,'23/5/2018','reject'),(7,'AAA','ldphu410@gmail.com','016322222','2018-11-04','02:03',4,'24/5/2018','reject');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chinhanh`
--

DROP TABLE IF EXISTS `chinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chinhanh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) NOT NULL,
  `thongtin` varchar(255) NOT NULL,
  `hinhanh` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chinhanh`
--

LOCK TABLES `chinhanh` WRITE;
/*!40000 ALTER TABLE `chinhanh` DISABLE KEYS */;
INSERT INTO `chinhanh` VALUES (1,'    Chi Nhánh 1','<p>- <strong>Address:&nbsp;</strong>01, Nguyễn Văn Cừ, q3, HCM</p>\n<p>- <strong>Phone:</strong> 0168xxxxxx&nbsp;</p>','    /static/images/myImage-1528013902207.jpg    '),(4,'Chi Nhánh 2','<p>-&nbsp;<strong>Address: </strong>145, Nguyễn Văn Cừ, q5, HCM</p>\n<p>-&nbsp;<strong>Phone:</strong>&nbsp;0168xxxxxx&nbsp;</p>','/static/images/myImage-1528013915113.jpg'),(5,'Chi Nhánh 3','<p>-&nbsp;<strong>Address:&nbsp;</strong>01, L&yacute; Th&aacute;i Tổ, q10, HCM</p>\n<p>-&nbsp;<strong>Phone:</strong>&nbsp;0983xxxxxx&nbsp;</p>','/static/images/myImage-1528013927365.jpg');
/*!40000 ALTER TABLE `chinhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `idcmt` int(11) NOT NULL,
  `noidungcmt` json DEFAULT NULL,
  PRIMARY KEY (`idcmt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (18,'[{\"name\": \"Phu\", \"time\": \"25/6/2018\", \"noidung\": \"Xin chao moi nguoi!\"}, {\"name\": \"Quy\", \"time\": \"25-5-2018  14:8\", \"noidung\": \"Hello!!!!\"}, {\"name\": \"Hiii\", \"time\": \"25-5-2018  14:37\", \"noidung\": \"Mons Ngon Qua\"}, {\"name\": \"Son\", \"time\": \"27-5-2018  15:38\", \"noidung\": \"ok\"}]'),(19,'[{\"name\": \"Lê Đình Phú\", \"time\": \"25/6/2018 2:54\", \"noidung\": \"Món này ngon cực kỳ :)\"}, {\"name\": \"Phat\", \"time\": \"25-5-2018  15:5\", \"noidung\": \"Uhm. Ngon that!!\"}]'),(21,'[{\"name\": \"Lê Đình Phú\", \"time\": \"25/6/2018 2:54\", \"noidung\": \"Món này ngon cực kỳ :)\"}, {\"name\": \"Phu\", \"time\": \"25-5-2018  15:22\", \"noidung\": \"OK\"}, {\"name\": \"Phat\", \"time\": \"25-5-2018  15:31\", \"noidung\": \"Bình thường\"}]'),(22,'[{\"name\": \"Lê Đình Phú\", \"time\": \"25/6/2018 2:54\", \"noidung\": \"Món này ngon cực kỳ :)\"}]'),(25,'[{\"name\": \"Lê Đình Phú\", \"time\": \"25/6/2018 2:54\", \"noidung\": \"Món này ngon cực kỳ :)\"}, {\"name\": \"Nam\", \"time\": \"25-5-2018  15:6\", \"noidung\": \"Món ít cay hơn là tuyệt vời !!!\"}]'),(39,'[{\"name\": \"Lê Đình Phú\", \"time\": \"25/6/2018 2:54\", \"noidung\": \"Món này ngon cực kỳ :)\"}, {\"name\": \"kkk\", \"time\": \"25-5-2018  15:7\", \"noidung\": \"ww\"}]');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doanhthu`
--

DROP TABLE IF EXISTS `doanhthu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doanhthu` (
  `ngay` varchar(20) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thu1` int(11) NOT NULL,
  `chi1` int(11) NOT NULL,
  `thu2` int(11) NOT NULL,
  `chi2` int(11) NOT NULL,
  `thu3` int(11) NOT NULL,
  `chi3` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doanhthu`
--

LOCK TABLES `doanhthu` WRITE;
/*!40000 ALTER TABLE `doanhthu` DISABLE KEYS */;
INSERT INTO `doanhthu` VALUES ('2018-06-27',1,100000,111111,150000,222222,11111,222222),('2018-06-28',2,200000,120000,500000,120000,100000,200000),('2018-06-29',3,150000,100000,150000,50000,200000,10000),('2018-06-30',4,200000,10000,100000,50000,500000,20000),('2018-07-01',5,700000,10000,800000,10000,200000,10000),('2018-07-02',6,400000,10000,500000,20000,200000,50000);
/*!40000 ALTER TABLE `doanhthu` ENABLE KEYS */;
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
INSERT INTO `header` VALUES (1,'      https://www.facebook.com/phu.ledinh.982','      ldphu410@gmail.com      ','0987383780','      7:30am - 10:00pm      ');
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monan`
--

LOCK TABLES `monan` WRITE;
/*!40000 ALTER TABLE `monan` DISABLE KEYS */;
INSERT INTO `monan` VALUES (18,'Kenchin-jiru','50000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 kh&uacute;c củ cải 4cm (150g),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1/2 củ c&agrave; rốt (70g),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 củ khoai sọ,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 c&aacute;i nấm shiitake kh&ocirc;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 1/2 b&igrave;a đậu phụ thường (150g)</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 2 th&igrave;a dầu vừng (dầu m&egrave;),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">800ml nước d&ugrave;ng dashi nấu từ c&aacute; ngừ kh&ocirc; b&agrave;o mỏng,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(C&aacute;ch nấu nước d&ugrave;ng dashi),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">100ml nước ng&acirc;m, nấm kh&ocirc; shiitake (nếu kh&ocirc;ng c&oacute;, d&ugrave;ng 100ml nước d&ugrave;ng từ c&aacute; ngừ kh&ocirc; b&agrave;o mỏng)</span></p>','/static/images/8.jpg','Canh kiểu Nhật Bản nấu với nhiều loại rau','sang'),(19,'Iwashi no kabayaki don','100000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 con c&aacute; ch&igrave;nh,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a c&agrave; ph&ecirc; x&igrave; dầu,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">một ch&uacute;t bột khoai t&acirc;y,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh dầu r&aacute;n, m</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">ột v&agrave;i nh&aacute;nh l&aacute; ti&ecirc;u n&uacute;i sansho hoặc bột sansho,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh x&igrave; dầu</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 2 th&igrave;a canh đường,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh nước,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">300 g gạo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">430 ml nước&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(hoặc 600 g cơm trắng)</span></p>','/static/images/9.jpg','Cá chình nướng kiểu kabayaki','toi'),(21,'Aisu kyandee','20000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Để l&agrave;m 3 hương vị kh&aacute;c nhau, bạn cần 3 khay đ&aacute;, mỗi khay c&oacute; k&iacute;ch cỡ 10 x 20 cm, s&acirc;u 3 cm. Lấy đũa gỗ d&ugrave;ng 1 lần để l&agrave;m que kem. Kem sữa: 4 th&igrave;a canh sữa đặc c&oacute; đường, 1 cốc sữa (200ml). Kem dứa: 4 miếng dứa hộp (140g), 2 th&igrave;a canh đường</span></p>','/static/images/10.jpg','Kem que đá','trua'),(22,'Saba no shioyaki','100000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 con c&aacute; saba tươi (d&agrave;i khoảng 30cm).&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 quả sudachi (loại quả giống như chanh cốm ở Việt Nam) cắt l&agrave;m đ&ocirc;i; hoặc 4 miếng cam hay chanh,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 củ gừng (d&agrave;i 4 cm, khoảng 40 gam),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">3 th&igrave;a canh giấm gạo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a rưỡi th&igrave;a canh đường,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&frac14; th&igrave;a c&agrave; ph&ecirc; muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh nước</span></p>','/static/images/11.jpg','Cá basa nướng muối','toi'),(25,'Ichigo Daifuku','40000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">\"Ichigo Daifuku\" l&agrave; loại b&aacute;nh giầy ngọt truyền thống của Nhật Bản, B&aacute;nh h&igrave;nh tr&ograve;n, dễ thương, phần nh&acirc;n c&oacute; một quả d&acirc;y t&acirc;y bọc trong đậu đỏ ng&agrave;o đường. Ch&uacute;ng t&ocirc;i sẽ hướng dẫn c&aacute;c bạn c&aacute;ch dễ d&agrave;ng l&agrave;m b&aacute;nh \"ichigo daifuku\"tại nh&agrave;, bằng c&aacute;ch d&ugrave;ng nồi hấp hoặc l&ograve; vi s&oacute;ng.</span></p>','/static/images/myImage-1526348692064.jpg','Bánh giầy ngọt truyền thống của Nhật Bản','toi'),(26,'Lẩu cá tuyết Tara-chiri','99000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">M&oacute;n lẩu \"chiri\" với c&aacute; tara, tức c&aacute; tuyết, đang v&agrave;o m&ugrave;a. \"Chiri\" l&agrave; m&oacute;n lẩu sử dụng nguy&ecirc;n liệu như c&aacute;, rau, đậu phụ, luộc l&ecirc;n rồi chấm với nước chấm ponzu chua mặn. Ch&uacute;ng t&ocirc;i cũng sẽ giới thiệu văn h&oacute;a \"shime\", tức l&agrave; kết th&uacute;c nồi lẩu bằng c&aacute;ch nấu ch&aacute;o với chỗ nước d&ugrave;ng c&ograve;n lại</span></p>','/static/images/myImage-1526348857008.jpg','Lẩu \"chiri\" với cá tuyết','trua toi'),(27,'Miso-shiru','40000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">Canh tương miso l&agrave; một trong những m&oacute;n ăn cơ bản trong ẩm thực Nhật Bản. Đ&acirc;y l&agrave; m&oacute;n ăn h&agrave;ng ng&agrave;y của c&aacute;c gia đ&igrave;nh Nhật Bản, được nấu với nhiều loại nguy&ecirc;n liệu kh&aacute;c nhau. H&ocirc;m nay, ch&uacute;ng ta c&ugrave;ng sử dụng honbushi, tức c&aacute; ngừ kh&ocirc; l&ecirc;n mốc được b&agrave;o mỏng để nấu nước d&ugrave;ng (nước l&egrave;o) v&agrave; nấu canh miso với khoai t&acirc;y v&agrave; h&agrave;nh t&acirc;y.</span></p>','/static/images/myImage-1526349168727.jpg','Canh tương miso','sang trua toi'),(28,'Surinagashi','35000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">&nbsp;M&oacute;n canh \"surinagashi\", một m&oacute;n canh s&aacute;nh l&agrave;m bằng c&aacute;c loại rau, c&aacute; v&agrave; một số nguy&ecirc;n liệu kh&aacute;c nghiền ra, sau đ&oacute; h&ograve;a với nước d&ugrave;ng. Lần n&agrave;y, ch&uacute;ng t&ocirc;i sử dụng ng&ocirc; v&agrave; c&aacute; tr&aacute;p hồng l&agrave;m nguy&ecirc;n liệu ch&iacute;nh.</span></p>','/static/images/myImage-1526349333465.jpg','Canh surinagashi','sang toi'),(29,'Gà rán Teriyaki','65000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">500 g, tương đương 2 chiếc đ&ugrave;i g&agrave; r&uacute;t xương, c&oacute; da&nbsp;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Bột khoai t&acirc;y, lượng vừa đủ</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh dầu ăn</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">50 ml nước t&aacute;o</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 cộng 1/3 th&igrave;a canh x&igrave;-dầu</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a c&agrave; ph&ecirc; đường</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a c&agrave; ph&ecirc; giấm</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">5 g gừng</span></p>','/static/images/myImage-1526349599170.jpg','Thịt gà rán Teriyaki ít muối','trua toi'),(30,'Mỳ Hippari udon và lẩu Kayaki','89000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">- M&oacute;n mỳ Hippari udon</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Mỳ udon luộc sẵn d&ugrave;ng cho 4 người: 4 g&oacute;i (800 gr),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 hộp c&aacute; saba (200 g) kho nước muối</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 4 c&acirc;y h&agrave;nh hoa (h&agrave;nh l&aacute;)</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 1 nh&aacute;nh gừng</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">, 1 ch&uacute;t ớt bột</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">- X&igrave; dầu: lượng vừa đủ</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">- M&oacute;n lẩu Kayaki</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 hộp c&aacute; saba (200 g) kho nước muối,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">4 cốc nước (800 ml),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">2 th&igrave;a canh x&igrave; dầu,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">150 g rau ch&acirc;n vịt,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">250 g rau cải thảo,&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">(hoặc 400 g c&aacute;c loại rau t&ugrave;y &yacute;),&nbsp;</span><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 nh&aacute;nh gừng</span></p>','/static/images/myImage-1526349738650.jpg','Món ăn truyền thống của Tohoku','trua toi'),(31,'Temakizushi','35000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">Tại Nhật Bản, từ cuối năm đến năm mới l&agrave; thời điểm người ta c&oacute; nhiều dịp để mời bạn b&egrave; tới nh&agrave; hoặc đo&agrave;n tụ với gia đ&igrave;nh để tổ chức li&ecirc;n hoan cuối năm, tổ chức lễ Gi&aacute;ng sinh v&agrave; ch&agrave;o đ&oacute;n Năm mới. M&oacute;n sushi cuộn tay temakizushi l&agrave; m&oacute;n ăn th&iacute;ch hợp với những thời điểm n&agrave;y.</span></p>','/static/images/myImage-1526350122794.jpg','Sushi cuộn tay','sang trua toi'),(32,'Tatsuta-age','30000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">M&oacute;n tatsuta-age, một kiểu tẩm bột r&aacute;n đặc biệt của Nhật Bản. Nguy&ecirc;n liệu được ướp trước với x&igrave; dầu rồi lăn qua bột khoai t&acirc;y, sau đ&oacute; r&aacute;n ngập dầu. Do c&aacute;ch chế biến n&agrave;y, m&oacute;n ăn sau khi r&aacute;n tr&ocirc;ng như được phủ một lớp bột trắng b&ecirc;n ngo&agrave;i. H&ocirc;m nay ch&uacute;ng ta c&ugrave;ng chế biến m&oacute;n tatsuta-age với thịt g&agrave; v&agrave; c&aacute; thu.</span></p>','/static/images/myImage-1526350689564.jpg','Món tẩm bột rán tatsuta-age','toi'),(33,'Chanko-nabe','59000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fdf6dc;\">Chanko-nabe l&agrave; loại lẩu do c&aacute;c lực sĩ sumo nấu. Thịt, hải sản, rau v&agrave; c&aacute;c nguy&ecirc;n liệu kh&aacute;c được xắt th&agrave;nh những miếng vừa ăn, sau đ&oacute; cho v&agrave;o nồi lẩu lớn nấu với nước d&ugrave;ng thơm ngon. H&ocirc;m nay, ch&uacute;ng ta nấu Chanko-nabe với thịt g&agrave;, rau v&agrave; x&igrave; dầu.</span></p>','/static/images/myImage-1526350848804.jpg','Lẩu Sumo','trua toi'),(34,'Kushi-age','35000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">300 g thịt g&agrave; (thịt đ&ugrave;i đ&atilde; lọc xương nhưng c&ograve;n da)&nbsp;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・1 quả c&agrave; t&iacute;m nhỏ (khoảng 80 g)</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・2 c&acirc;y nấm shiitake (c&oacute; thể thay bằng nấm hương của Việt Nam)&nbsp;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・1/2 củ h&agrave;nh t&acirc;y</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・1 củ khoai t&acirc;y (nặng 130 g)</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・Muối &amp; ti&ecirc;u</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・Bột m&igrave;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・1 quả trứng</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・Khoảng 3 cốc bột c&agrave; m&igrave;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・Dầu thực vật&nbsp;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・Nước sốt Worcester kiểu Nhật</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">・Que tre (d&agrave;i khoảng 15 cm)</span></p>','/static/images/myImage-1527920561610.jpg','Thịt và rau cũ tẩm bột chiên giòn','trua toi'),(35,'Yaki-tori','55000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Với m&oacute;n negima (thịt đ&ugrave;i v&agrave; h&agrave;nh bar&ocirc;)</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; 250 gam thịt g&agrave; (thịt đ&ugrave;i, vẫn c&ograve;n da)</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; 1 c&acirc;y h&agrave;nh bar&ocirc;, đường k&iacute;nh &iacute;t nhất 1 cm (c&oacute; thể thay bằng h&agrave;nh t&acirc;y)</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; Một ch&uacute;t muối</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; Một &iacute;t dầu thực vật</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Với m&oacute;n tsukune (thịt g&agrave; băm vi&ecirc;n)&nbsp;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; 200 gam thịt g&agrave; băm nhỏ</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; Một đoạn h&agrave;nh bar&ocirc; khoảng 8 cm (20 gam, c&oacute; thể thay bằng h&agrave;nh t&acirc;y)</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; Một nửa củ gừng (khoảng 2 cm)</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; 1/3 th&igrave;a c&agrave;ph&ecirc; muối</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; Hạt ti&ecirc;u</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; 2 th&igrave;a c&agrave; ph&ecirc; bột</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; 1 th&igrave;a canh nước</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Với nước sốt</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; 3 th&igrave;a canh nước tương</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; 3 th&igrave;a canh đường</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">&middot; 1 th&igrave;a canh nước</span></p>','/static/images/myImage-1527921133087.jpg','Gà nướng kiểu Nhật','toi'),(36,'Anpan','15000','<p><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">150 g bột l&agrave;m b&aacute;nh m&igrave;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a canh đường</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1/2 th&igrave;a c&agrave; ph&ecirc; muối</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 th&igrave;a c&agrave; ph&ecirc; men kh&ocirc;</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">90 ml sữa</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">1 quả trứng</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">10 g bơ</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">120 g đậu đỏ nghiền (Xem c&aacute;ch l&agrave;m trong chương tr&igrave;nh hướng dẫn l&agrave;m ch&egrave; Zenzai ph&aacute;t ng&agrave;y 7/1/2011)</span><br style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\" /><span style=\"color: #080808; font-family: notosans, sans-serif; font-size: 18px; background-color: #fcfbf4;\">Bột m&igrave; đa dụng để rắc l&ecirc;n b&aacute;nh</span></p>','/static/images/myImage-1527921287653.jpg','Bánh nhân đậu đỏ','sang');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (2,'  The Fresh And Tasty Burgers !','<p>There&rsquo;s so much fun for you today</p>',' Go on ',' /static/images/myImage-1526351103653.jpg '),(6,'Yummy','<p>A wonderful weekend</p>','Go','/static/images/myImage-1527945859091.jpg'),(7,'Good and Food','<p>Good for health</p>','Try','/static/images/myImage-1527945925912.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'phuld410@gmail.com','123456','Le','Phu'),(3,' ldphu410@gmail.com ','123456','NGuyen Hung','Phat'),(4,'xyz@gmail.com','$2b$10$h5zSdh6tu1OpZ.1vPYoXXezZQZ2VLZauurlPPFvv64Shzyb38tEze','Le','Van AB'),(5,'ldphu410@gmail.com','$2b$10$oxpc1.vMqON/yKeIFBGscOEulzSgP4JVZBWjYth9T3kr4xAHjlZ02','Le','Phu'),(25,'test','$2b$10$JfyVoXgU9RPh4L/PgPLcvuQtZN/ILnl6BChu3HPhdyOHZjpaQ5Acy','phu','le'),(26,'test2','$2b$10$/VLAKhTvQsHV1zRFB7J0UORUOja3qyjaaf4vQA7DJsMLNRgrP6ZQe','le','phuuuu'),(27,'test3','$2b$10$6dabXvCV0KREI3/ciSmm2ewFeIvWfmA7SIFnYjYr6uGPyp.RkXxqi','Le ','Phu'),(28,'ldphu410@gmail.com','$2b$10$UfKRztxPoHDIeD3W6UIwGOJZLkvGWu3VLkeKoAsad5w447H7uRT6u','Le Dinh','Phu'),(29,'nuthde@gmail.com','$2b$10$vbUz47iPG5n1HenD2Srvse7lOebyEa6m2VZ26qtSYNNFsAeo3OFRi','Le','PhuAAA');
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

-- Dump completed on 2018-06-28 21:45:36
