-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: astronomy_db
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `bodies`
--

DROP TABLE IF EXISTS `bodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `chars_id` int NOT NULL,
  `bodies_orbiting_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bodies_chars_idx` (`chars_id`),
  KEY `fk_bodies_bodies_idx` (`bodies_orbiting_id`),
  CONSTRAINT `fk_bodies_bodies` FOREIGN KEY (`bodies_orbiting_id`) REFERENCES `bodies` (`id`),
  CONSTRAINT `fk_bodies_chars` FOREIGN KEY (`chars_id`) REFERENCES `chars` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodies`
--

LOCK TABLES `bodies` WRITE;
/*!40000 ALTER TABLE `bodies` DISABLE KEYS */;
INSERT INTO `bodies` VALUES (1,'Солнце',1,NULL),(2,'Юпитер',2,1),(3,'Сатурн',3,1),(4,'Уран',4,1),(5,'Нептун',5,1),(6,'Земля',6,1),(7,'Венера',7,1),(8,'Марс',8,1),(9,'Ганимед',9,2),(10,'Титан',10,3),(11,'Меркурий',11,1),(12,'Каллисто',12,2),(13,'Ио',13,2),(14,'Луна',14,6),(15,'Европа',15,2),(16,'Тритон',16,5),(17,'Титания',17,4),(18,'Рея',18,3),(19,'Оберон',19,4),(20,'Япет',20,4),(21,'Харон',21,3),(22,'Умбриэль',22,4),(23,'Ариэль',23,4),(24,'Диона',24,3),(25,'Тефия',25,3),(26,'Энцелад',26,3),(27,'Миранда',27,4),(28,'Протей',28,5);
/*!40000 ALTER TABLE `bodies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body_type`
--

DROP TABLE IF EXISTS `body_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `body_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_type`
--

LOCK TABLES `body_type` WRITE;
/*!40000 ALTER TABLE `body_type` DISABLE KEYS */;
INSERT INTO `body_type` VALUES (1,'Звезда'),(2,'Планета'),(3,'Спутник'),(4,'Карликовая планета');
/*!40000 ALTER TABLE `body_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chars`
--

DROP TABLE IF EXISTS `chars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `radius` float NOT NULL,
  `volume` float NOT NULL,
  `mass` float NOT NULL,
  `density` float NOT NULL,
  `gravity` float NOT NULL,
  `has_rings` enum('Да','Нет') NOT NULL,
  `body_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chars_body_type_idx` (`body_type_id`),
  CONSTRAINT `fk_chars_body_type` FOREIGN KEY (`body_type_id`) REFERENCES `body_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chars`
--

LOCK TABLES `chars` WRITE;
/*!40000 ALTER TABLE `chars` DISABLE KEYS */;
INSERT INTO `chars` VALUES (1,696000,1412000000,1989100000,1.409,274,'Нет',1),(2,69911,1431280,1898600,1.33,24.79,'Да',2),(3,58232,827130,568460,0.7,10.445,'Да',2),(4,25362,68340,86832,1.3,8.87,'Да',2),(5,24622,62540,102430,1.76,11.15,'Да',2),(6,6371,1083.21,5973.6,5.515,9.80665,'Нет',2),(7,6051.8,928.43,4868.5,5.24,8.872,'Нет',2),(8,3390,163.18,641.85,3.94,3.728,'Нет',2),(9,2631.2,76.3,148.2,1.936,1.428,'Нет',3),(10,2575.5,71.52,134.5,1.88,1.354,'Нет',3),(11,2439.7,60.83,330.2,5.43,3.7,'Нет',2),(12,2410.3,58.65,107.6,1.83,1.23603,'Нет',3),(13,1821.5,25.32,89.3,3.528,1.797,'Нет',3),(14,1737.1,21.958,73.5,3.3464,1.625,'Нет',3),(15,1561,15.93,48,3.01,1.314,'Нет',3),(16,1353.4,10.38,21.5,2.061,0.779,'Нет',3),(17,788.9,2.06,3.526,1.72,0.378,'Нет',3),(18,764.4,1.87,2.3166,1.23,0.265,'Нет',3),(19,761.4,1.85,3.014,1.63,0.347,'Нет',3),(20,735.6,1.55,1.9739,1.08,0.223,'Нет',3),(21,606,0.87,1.52,1.65,0.279,'Нет',3),(22,584.7,0.84,1.2,1.4,0.234,'Нет',3),(23,578.9,0.81,1.35,1.67,0.269,'Нет',3),(24,561.6,0.73,1.096,1.48,0.232,'Нет',3),(25,531.1,0.624,0.6173,1.15,0.145,'Нет',3),(26,252.1,0.067,0.108,1.61,0.111,'Нет',3),(27,235.7,0.055,0.0659,1.2,0.0791,'Нет',3),(28,210,0.038,0.05,1.3,0.0666,'Нет',3),(29,1188.3,7.15,13.105,2,0.658,'Нет',4);
/*!40000 ALTER TABLE `chars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historical_events`
--

DROP TABLE IF EXISTS `historical_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historical_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `article_url` varchar(255) NOT NULL,
  `bodies_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_history_events_bodies_idx` (`bodies_id`),
  CONSTRAINT `fk_history_events_bodies` FOREIGN KEY (`bodies_id`) REFERENCES `bodies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historical_events`
--

LOCK TABLES `historical_events` WRITE;
/*!40000 ALTER TABLE `historical_events` DISABLE KEYS */;
INSERT INTO `historical_events` VALUES (1,'1977-09-05','https://ru.wikipedia.org/wiki/Вояджер-1',3),(2,'1961-02-12','https://ru.wikipedia.org/wiki/Венера-1',7),(3,'1965-11-12','https://ru.wikipedia.org/wiki/Венера-2',7),(4,'1974-03-29','https://ru.wikipedia.org/wiki/Маринер-10',11),(5,'1969-07-16','ru.wikipedia.org/wiki/Аполлон-11',14);
/*!40000 ALTER TABLE `historical_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historical_events_people`
--

DROP TABLE IF EXISTS `historical_events_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historical_events_people` (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_events_id` int NOT NULL,
  `people_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_history_events_people_history_events_idx` (`history_events_id`),
  KEY `fk_history_events_people_people_idx` (`people_id`),
  CONSTRAINT `fk_history_events_people_history_events` FOREIGN KEY (`history_events_id`) REFERENCES `historical_events` (`id`),
  CONSTRAINT `fk_history_events_people_people` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historical_events_people`
--

LOCK TABLES `historical_events_people` WRITE;
/*!40000 ALTER TABLE `historical_events_people` DISABLE KEYS */;
INSERT INTO `historical_events_people` VALUES (1,2,1),(2,3,2),(3,5,3),(4,5,4),(5,5,5);
/*!40000 ALTER TABLE `historical_events_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `position_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_people_position_idx` (`position_id`),
  CONSTRAINT `fk_people_position` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Дональда Гарнетта',1),(2,'Борис Черток',1),(3,'Нил Армстронг',2),(4,'Майкл Коллинз',2),(5,'Эдвин Олдрин',2);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Учёный'),(2,'Космонавт');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30 21:08:42
