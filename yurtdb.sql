CREATE DATABASE  IF NOT EXISTS `yurtdb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `yurtdb`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: yurtdb
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bolumler`
--

DROP TABLE IF EXISTS `bolumler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bolumler` (
  `bolum_id` int(11) NOT NULL,
  `bolum_ad` varchar(45) NOT NULL,
  PRIMARY KEY (`bolum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolumler`
--

LOCK TABLES `bolumler` WRITE;
/*!40000 ALTER TABLE `bolumler` DISABLE KEYS */;
INSERT INTO `bolumler` VALUES (1,'Yönetim Bilişim Sistemleri'),(2,'Bankacılık');
/*!40000 ALTER TABLE `bolumler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borc`
--

DROP TABLE IF EXISTS `borc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `borc` (
  `borc_id` int(11) NOT NULL,
  `top_borc` varchar(45) DEFAULT NULL,
  `ogrenciler_ogr_id` int(11) NOT NULL,
  PRIMARY KEY (`borc_id`,`ogrenciler_ogr_id`),
  KEY `fk_Borc_ogrenciler1_idx` (`ogrenciler_ogr_id`),
  CONSTRAINT `fk_Borc_ogrenciler1` FOREIGN KEY (`ogrenciler_ogr_id`) REFERENCES `ogrenciler` (`ogr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borc`
--

LOCK TABLES `borc` WRITE;
/*!40000 ALTER TABLE `borc` DISABLE KEYS */;
INSERT INTO `borc` VALUES (1,'6000',1);
/*!40000 ALTER TABLE `borc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duyuru`
--

DROP TABLE IF EXISTS `duyuru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `duyuru` (
  `duyuru_id` int(11) NOT NULL,
  `duyuru` varchar(255) NOT NULL,
  `duyuru_tarihi` varchar(45) NOT NULL,
  `personel_personel_id` int(11) NOT NULL,
  `duyuru_baslik` varchar(45) NOT NULL,
  PRIMARY KEY (`duyuru_id`,`personel_personel_id`),
  KEY `fk_duyuru_personel1_idx` (`personel_personel_id`),
  CONSTRAINT `fk_duyuru_personel1` FOREIGN KEY (`personel_personel_id`) REFERENCES `personel` (`personel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duyuru`
--

LOCK TABLES `duyuru` WRITE;
/*!40000 ALTER TABLE `duyuru` DISABLE KEYS */;
INSERT INTO `duyuru` VALUES (1,'Deneme','25/07/2019',1,'denemes'),(2,'Duyuru İçeriğini Girin','27/5/2019',1,'Duyuru Başlıgı girin'),(3,'sa','27/5/2019',1,'as');
/*!40000 ALTER TABLE `duyuru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ekipmanlar`
--

DROP TABLE IF EXISTS `ekipmanlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ekipmanlar` (
  `ekipman_id` int(11) NOT NULL,
  `ekipman` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ekipman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ekipmanlar`
--

LOCK TABLES `ekipmanlar` WRITE;
/*!40000 ALTER TABLE `ekipmanlar` DISABLE KEYS */;
INSERT INTO `ekipmanlar` VALUES (1,'Bilgisayar');
/*!40000 ALTER TABLE `ekipmanlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etk_say`
--

DROP TABLE IF EXISTS `etk_say`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `etk_say` (
  `sayi_id` int(11) NOT NULL,
  `etkinlik_etkinlik_id` int(11) NOT NULL,
  `ogrenciler_ogr_id` int(11) NOT NULL,
  PRIMARY KEY (`sayi_id`,`etkinlik_etkinlik_id`,`ogrenciler_ogr_id`),
  KEY `fk_etk_say_etkinlik1_idx` (`etkinlik_etkinlik_id`),
  KEY `fk_etk_say_ogrenciler1_idx` (`ogrenciler_ogr_id`),
  CONSTRAINT `fk_etk_say_etkinlik1` FOREIGN KEY (`etkinlik_etkinlik_id`) REFERENCES `etkinlik` (`etkinlik_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_etk_say_ogrenciler1` FOREIGN KEY (`ogrenciler_ogr_id`) REFERENCES `ogrenciler` (`ogr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etk_say`
--

LOCK TABLES `etk_say` WRITE;
/*!40000 ALTER TABLE `etk_say` DISABLE KEYS */;
INSERT INTO `etk_say` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,3),(5,2,1),(6,2,2),(7,3,1),(8,3,2),(9,3,3),(10,4,1),(11,4,2),(12,4,3);
/*!40000 ALTER TABLE `etk_say` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etkinlik`
--

DROP TABLE IF EXISTS `etkinlik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `etkinlik` (
  `etkinlik_id` int(11) NOT NULL,
  `etkinlik_ad` varchar(45) NOT NULL,
  `etkinlik_acıklama` varchar(255) NOT NULL,
  `etkinlik_tarih` varchar(45) NOT NULL,
  `etkinlik_sayi` varchar(45) NOT NULL,
  `etkinlik_fiyat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`etkinlik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etkinlik`
--

LOCK TABLES `etkinlik` WRITE;
/*!40000 ALTER TABLE `etkinlik` DISABLE KEYS */;
INSERT INTO `etkinlik` VALUES (1,'Tam1Fest','25/26/27/28 Nisan 2019 tarihleri arasında Konya’da bir ilki gerçekleştirecek uzun soluklu festival olmaya hazırlanan Konya Tam1Fest ses getirecek kadrosu, eğlenceli aktiviteleri ve doğa dostu olmayı hedefliyor. ','27/05/2019','400','130'),(2,'denemeetkinlik','Denemek için etkinlik','25/09/2019','200','300'),(3,'One Love Festival 15','One Love Festival, arkasında günlük güneşlik anılar, önünde umut dolu bi\' yazla 20 Temmuz\'da Parkorman ve Volkswagen Arena\'da...','20/07/2019','250','200'),(4,'Sweat Fest 2019 - Şehrin Spor Festivali','29-30 Haziran’da sporu ve eğlenmeyi seven herkes Küçükçiftlik Park’a! Çünkü Türkiye\'nin en geniş kapsamlı spor festivali SWEAT FEST; unutulmayacak, yepyeni deneyimlerle şehre ve sana enerji getirecek! ','29/06/2019','Sınırsız','90');
/*!40000 ALTER TABLE `etkinlik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `izinler`
--

DROP TABLE IF EXISTS `izinler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `izinler` (
  `izin_id` int(11) NOT NULL,
  `ogrenciler_ogr_id` int(11) NOT NULL,
  `izin_tarihi` varchar(45) DEFAULT NULL,
  `izin_aciklama` varchar(45) DEFAULT NULL,
  `izin_Adres` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`izin_id`,`ogrenciler_ogr_id`),
  KEY `fk_izinler_ogrenciler1_idx` (`ogrenciler_ogr_id`),
  CONSTRAINT `fk_izinler_ogrenciler1` FOREIGN KEY (`ogrenciler_ogr_id`) REFERENCES `ogrenciler` (`ogr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izinler`
--

LOCK TABLES `izinler` WRITE;
/*!40000 ALTER TABLE `izinler` DISABLE KEYS */;
INSERT INTO `izinler` VALUES (1,1,'26/05/2019','Denemeizin','Kartal/istanbul'),(2,2,'26/05/2019','AÇIKLAMA','Konya'),(3,3,'29/5/2019','asdasd','Konya'),(4,1,'29/05/2019','iş','İstanbul'),(5,3,'25/05/2019','Denemeİzin','Bursa'),(6,3,'26/05/2019','İş Sebebi','Hatay');
/*!40000 ALTER TABLE `izinler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kredikart`
--

DROP TABLE IF EXISTS `kredikart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kredikart` (
  `kart_id` int(11) NOT NULL,
  `kart_no` varchar(45) DEFAULT NULL,
  `kart_sifre` varchar(45) DEFAULT NULL,
  `kart_son_ay` varchar(45) DEFAULT NULL,
  `kart_son_yıl` varchar(45) DEFAULT NULL,
  `ogrenciler_ogr_id` int(11) NOT NULL,
  PRIMARY KEY (`kart_id`,`ogrenciler_ogr_id`),
  KEY `fk_kredikart_ogrenciler1_idx` (`ogrenciler_ogr_id`),
  CONSTRAINT `fk_kredikart_ogrenciler1` FOREIGN KEY (`ogrenciler_ogr_id`) REFERENCES `ogrenciler` (`ogr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kredikart`
--

LOCK TABLES `kredikart` WRITE;
/*!40000 ALTER TABLE `kredikart` DISABLE KEYS */;
INSERT INTO `kredikart` VALUES (1,'1234-5678-9101-1213','1257','05','2023',1),(2,'1235-4854-7877-6666','1234','06','2024',2),(3,'1864-8256-0800-6854','8596','07','2026',3);
/*!40000 ALTER TABLE `kredikart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msjogrtopers`
--

DROP TABLE IF EXISTS `msjogrtopers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `msjogrtopers` (
  `mesaj_id` int(11) NOT NULL,
  `mesajsaat` varchar(45) NOT NULL,
  `ogrenciler_ogr_id` int(11) NOT NULL,
  `personel_personel_id` int(11) NOT NULL,
  `mesaj` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mesaj_id`,`ogrenciler_ogr_id`,`personel_personel_id`),
  KEY `fk_msjogrtopers_ogrenciler1_idx` (`ogrenciler_ogr_id`),
  KEY `fk_msjogrtopers_personel1_idx` (`personel_personel_id`),
  CONSTRAINT `fk_msjogrtopers_ogrenciler1` FOREIGN KEY (`ogrenciler_ogr_id`) REFERENCES `ogrenciler` (`ogr_id`),
  CONSTRAINT `fk_msjogrtopers_personel1` FOREIGN KEY (`personel_personel_id`) REFERENCES `personel` (`personel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msjogrtopers`
--

LOCK TABLES `msjogrtopers` WRITE;
/*!40000 ALTER TABLE `msjogrtopers` DISABLE KEYS */;
INSERT INTO `msjogrtopers` VALUES (1,'1:00',1,1,'Sa'),(2,'3:52',1,1,'as'),(3,'18:34',1,1,'as'),(4,'15:00',3,2,NULL);
/*!40000 ALTER TABLE `msjogrtopers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odalar`
--

DROP TABLE IF EXISTS `odalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `odalar` (
  `oda_id` int(11) NOT NULL,
  `oda_kod` varchar(45) NOT NULL,
  `oda_kat` varchar(45) NOT NULL,
  `oda_yatak` varchar(45) NOT NULL,
  PRIMARY KEY (`oda_id`,`oda_yatak`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odalar`
--

LOCK TABLES `odalar` WRITE;
/*!40000 ALTER TABLE `odalar` DISABLE KEYS */;
INSERT INTO `odalar` VALUES (1,'C3','3','4'),(2,'C2','4','3');
/*!40000 ALTER TABLE `odalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odeme`
--

DROP TABLE IF EXISTS `odeme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `odeme` (
  `odeme_id` int(11) NOT NULL,
  `odeme_tut` varchar(45) NOT NULL,
  `odeme_tarih` varchar(45) NOT NULL,
  `odeme_aciklama` varchar(45) NOT NULL,
  `ogrenciler_ogr_id` int(11) NOT NULL,
  `kredikart_kart_id` int(11) NOT NULL,
  PRIMARY KEY (`odeme_id`,`ogrenciler_ogr_id`,`kredikart_kart_id`),
  KEY `fk_odeme_ogrenciler1_idx` (`ogrenciler_ogr_id`),
  KEY `fk_odeme_kredikart1_idx` (`kredikart_kart_id`),
  CONSTRAINT `fk_odeme_kredikart1` FOREIGN KEY (`kredikart_kart_id`) REFERENCES `kredikart` (`kart_id`),
  CONSTRAINT `fk_odeme_ogrenciler1` FOREIGN KEY (`ogrenciler_ogr_id`) REFERENCES `ogrenciler` (`ogr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odeme`
--

LOCK TABLES `odeme` WRITE;
/*!40000 ALTER TABLE `odeme` DISABLE KEYS */;
INSERT INTO `odeme` VALUES (1,'200','26/05/2019','Taksit Ödemesi',1,1),(2,'350','26/05/2019','Taksit Ödemesi',2,2),(3,'350','29/05/2019','Taksit Ödemesi',1,1),(4,'500','25/05/2019','Taksit Ödemesi',3,3),(5,'350','25/05/2019','Taksit Ödemesi',2,2);
/*!40000 ALTER TABLE `odeme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogr_to_ogr`
--

DROP TABLE IF EXISTS `ogr_to_ogr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ogr_to_ogr` (
  `mesaj_id` int(11) NOT NULL,
  `mesajsaat` varchar(45) NOT NULL,
  `ogr_gonder` int(11) NOT NULL,
  `mesaj` varchar(255) DEFAULT NULL,
  `ogr_al` int(11) NOT NULL,
  PRIMARY KEY (`mesaj_id`,`ogr_gonder`,`ogr_al`),
  KEY `fk_msjogrtopers_ogrenciler1_idx` (`ogr_gonder`),
  KEY `fk_ogr_to_ogr_ogrenciler1_idx` (`ogr_al`),
  CONSTRAINT `fk_msjogrtopers_ogrenciler10` FOREIGN KEY (`ogr_gonder`) REFERENCES `ogrenciler` (`ogr_id`),
  CONSTRAINT `fk_ogr_to_ogr_ogrenciler1` FOREIGN KEY (`ogr_al`) REFERENCES `ogrenciler` (`ogr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogr_to_ogr`
--

LOCK TABLES `ogr_to_ogr` WRITE;
/*!40000 ALTER TABLE `ogr_to_ogr` DISABLE KEYS */;
INSERT INTO `ogr_to_ogr` VALUES (1,'1',1,'des',1);
/*!40000 ALTER TABLE `ogr_to_ogr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogrenciler`
--

DROP TABLE IF EXISTS `ogrenciler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ogrenciler` (
  `ogr_id` int(11) NOT NULL,
  `ogr_tc` varchar(45) NOT NULL,
  `ogr_ad` varchar(45) NOT NULL,
  `ogr_sifre` varchar(45) NOT NULL,
  `ogr_tel` varchar(45) NOT NULL,
  `ogr_email` varchar(255) NOT NULL,
  `kayittarihi` varchar(45) NOT NULL,
  `universite_uni_id` int(11) NOT NULL,
  `Bolumler_bolum_id` int(11) NOT NULL,
  `siniflar_sinif_id` int(11) NOT NULL,
  `Odalar_oda_id` int(11) NOT NULL,
  `profil_photo` text,
  PRIMARY KEY (`ogr_id`,`ogr_tc`),
  KEY `fk_ogrenciler_universite_idx` (`universite_uni_id`),
  KEY `fk_ogrenciler_Bolumler1_idx` (`Bolumler_bolum_id`),
  KEY `fk_ogrenciler_siniflar1_idx` (`siniflar_sinif_id`),
  KEY `fk_ogrenciler_Odalar1_idx` (`Odalar_oda_id`),
  CONSTRAINT `fk_ogrenciler_Bolumler1` FOREIGN KEY (`Bolumler_bolum_id`) REFERENCES `bolumler` (`bolum_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ogrenciler_Odalar1` FOREIGN KEY (`Odalar_oda_id`) REFERENCES `odalar` (`oda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ogrenciler_siniflar1` FOREIGN KEY (`siniflar_sinif_id`) REFERENCES `siniflar` (`sinif_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ogrenciler_universite` FOREIGN KEY (`universite_uni_id`) REFERENCES `universite` (`uni_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogrenciler`
--

LOCK TABLES `ogrenciler` WRITE;
/*!40000 ALTER TABLE `ogrenciler` DISABLE KEYS */;
INSERT INTO `ogrenciler` VALUES (1,'12538734418','Hakan Sefa ÖZKOÇ','15741520','05322722613','hakansefaozkoc@gmail.com','25/05/2019',1,1,1,1,'C:\\Users\\hakan\\eclipse-workspace\\yurtotomasyon\\images\\erkek_1.jpg'),(2,'12538734572','Kaan Emre ÖZKOÇ','48955574','05548658135','kaanemreozkoc@gmail.com','29/5/2019',1,1,3,1,''),(3,'12345678910','Mahmut Hüdai Genç','48955574','05548658195','mahmuthüdaigenc@gmail.com','29/5/2019',2,2,2,2,'');
/*!40000 ALTER TABLE `ogrenciler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pers_to_pers`
--

DROP TABLE IF EXISTS `pers_to_pers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pers_to_pers` (
  `mesaj_id` int(11) NOT NULL,
  `mesajsaat` varchar(45) NOT NULL,
  `pers_gon` int(11) NOT NULL,
  `pers_al` int(11) NOT NULL,
  PRIMARY KEY (`mesaj_id`,`pers_gon`,`pers_al`),
  KEY `fk_msjogrtopers_personel1_idx` (`pers_gon`),
  KEY `fk_pers_to_pers_personel1_idx` (`pers_al`),
  CONSTRAINT `fk_msjogrtopers_personel10` FOREIGN KEY (`pers_gon`) REFERENCES `personel` (`personel_id`),
  CONSTRAINT `fk_pers_to_pers_personel1` FOREIGN KEY (`pers_al`) REFERENCES `personel` (`personel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pers_to_pers`
--

LOCK TABLES `pers_to_pers` WRITE;
/*!40000 ALTER TABLE `pers_to_pers` DISABLE KEYS */;
INSERT INTO `pers_to_pers` VALUES (1,'1',1,1);
/*!40000 ALTER TABLE `pers_to_pers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personel`
--

DROP TABLE IF EXISTS `personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `personel` (
  `personel_id` int(11) NOT NULL,
  `personel_tc` varchar(45) NOT NULL,
  `personel_ad` varchar(45) NOT NULL,
  `personel_soyad` varchar(45) NOT NULL,
  `personel_tel` varchar(45) NOT NULL,
  `personel_email` varchar(45) NOT NULL,
  `personel_adres` varchar(255) NOT NULL,
  `personel_sifre` varchar(45) NOT NULL,
  `personel_photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`personel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personel`
--

LOCK TABLES `personel` WRITE;
/*!40000 ALTER TABLE `personel` DISABLE KEYS */;
INSERT INTO `personel` VALUES (1,'11111111111','Ecem','Evci','05553332221','ecemevci@deneme.com','Konya','123','C:\\Users\\hakan\\eclipse-workspace\\yurtotomasyon\\images\\kadin_2.jpg'),(2,'12345678910','Ahmet','Tekin','05878595548','ahmettekin@odev.com','Konya ','1234',NULL),(3,'15874485495','Enes','Demir','05987456212','enesdemir@deneme.com','Konya','12345',NULL);
/*!40000 ALTER TABLE `personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sikayet`
--

DROP TABLE IF EXISTS `sikayet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sikayet` (
  `sikayet_id` int(11) NOT NULL,
  `sikayet` varchar(255) NOT NULL,
  `sikayet_tarihi` varchar(45) NOT NULL,
  `ogrenciler_ogr_id` int(11) NOT NULL,
  `sikayet_baslik` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sikayet_id`,`ogrenciler_ogr_id`),
  KEY `fk_sikayet_ogrenciler1_idx` (`ogrenciler_ogr_id`),
  CONSTRAINT `fk_sikayet_ogrenciler1` FOREIGN KEY (`ogrenciler_ogr_id`) REFERENCES `ogrenciler` (`ogr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sikayet`
--

LOCK TABLES `sikayet` WRITE;
/*!40000 ALTER TABLE `sikayet` DISABLE KEYS */;
INSERT INTO `sikayet` VALUES (1,'DenemeSikayet','25/06/2016',1,'denemesikayet_baslik'),(2,'Şikayet İçeriğini Girin','27/5/2019',1,'Şikayet Başlıgı girin'),(3,'denemesikaeyy','27/5/2019',1,'sşkaeyet');
/*!40000 ALTER TABLE `sikayet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siniflar`
--

DROP TABLE IF EXISTS `siniflar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `siniflar` (
  `sinif_id` int(11) NOT NULL,
  `sinif` varchar(45) NOT NULL,
  PRIMARY KEY (`sinif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siniflar`
--

LOCK TABLES `siniflar` WRITE;
/*!40000 ALTER TABLE `siniflar` DISABLE KEYS */;
INSERT INTO `siniflar` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'Yüksek Lisans');
/*!40000 ALTER TABLE `siniflar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universite`
--

DROP TABLE IF EXISTS `universite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `universite` (
  `uni_id` int(11) NOT NULL,
  `uni_ad` varchar(45) NOT NULL,
  `uni_adres` varchar(45) NOT NULL,
  PRIMARY KEY (`uni_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universite`
--

LOCK TABLES `universite` WRITE;
/*!40000 ALTER TABLE `universite` DISABLE KEYS */;
INSERT INTO `universite` VALUES (1,'Necmettin Erbakan Üniversitesi','Konya'),(2,'Selçuk Üniversitesi','Konya');
/*!40000 ALTER TABLE `universite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yemek`
--

DROP TABLE IF EXISTS `yemek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `yemek` (
  `yemek_id` int(11) NOT NULL,
  `ana_yemek` varchar(45) DEFAULT NULL,
  `icecek` varchar(45) DEFAULT NULL,
  `tatli` varchar(45) DEFAULT NULL,
  `yemek_tarih` varchar(45) NOT NULL,
  PRIMARY KEY (`yemek_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yemek`
--

LOCK TABLES `yemek` WRITE;
/*!40000 ALTER TABLE `yemek` DISABLE KEYS */;
INSERT INTO `yemek` VALUES (1,'Tavuk Sote','Ayran','Şekerpare','25/05/2019');
/*!40000 ALTER TABLE `yemek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yemek_say`
--

DROP TABLE IF EXISTS `yemek_say`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `yemek_say` (
  `sayi_id` int(11) NOT NULL,
  `yemek_yemek_id` int(11) NOT NULL,
  `ogrenciler_ogr_id` int(11) NOT NULL,
  PRIMARY KEY (`sayi_id`,`yemek_yemek_id`,`ogrenciler_ogr_id`),
  KEY `fk_yemek_say_yemek1_idx` (`yemek_yemek_id`),
  KEY `fk_yemek_say_ogrenciler1_idx` (`ogrenciler_ogr_id`),
  CONSTRAINT `fk_yemek_say_ogrenciler1` FOREIGN KEY (`ogrenciler_ogr_id`) REFERENCES `ogrenciler` (`ogr_id`),
  CONSTRAINT `fk_yemek_say_yemek1` FOREIGN KEY (`yemek_yemek_id`) REFERENCES `yemek` (`yemek_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yemek_say`
--

LOCK TABLES `yemek_say` WRITE;
/*!40000 ALTER TABLE `yemek_say` DISABLE KEYS */;
INSERT INTO `yemek_say` VALUES (1,1,1),(2,1,3);
/*!40000 ALTER TABLE `yemek_say` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-01  0:48:03
