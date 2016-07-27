-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: books
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (19,'Contact','Carl Sagan','2016-07-26 13:16:39','2016-07-26 13:16:39'),(21,'Harry Potter and the Sorcerer\'s Stone','English Lady','2016-07-26 14:30:13','2016-07-26 14:30:13'),(22,'When You Are Engulfed In Flames','David Sedaris','2016-07-26 15:22:11','2016-07-26 15:22:11'),(23,'Ringworld','Larry Niven','2016-07-26 15:24:58','2016-07-26 15:24:58'),(24,'Water for Elephants','Sara Gruen','2016-07-26 15:26:03','2016-07-26 15:26:03'),(25,'Hitchhiker\'s Guide to the Galaxy','Douglas Adams','2016-07-26 15:27:31','2016-07-26 15:27:31'),(26,'Farenheit 451','Ray Bradbury','2016-07-26 15:28:48','2016-07-26 15:28:48'),(27,'Happy Days','The Fonze','2016-07-26 16:45:06','2016-07-26 16:45:06'),(28,'The Lion, the Witch, and the Wardrobe','Someone','2016-07-26 16:50:02','2016-07-26 16:50:02'),(30,'Star Wars','George Lucas','2016-07-26 17:19:00','2016-07-26 17:19:00'),(35,'Hunger Games','Suzanne Collins','2016-07-26 19:08:22','2016-07-26 19:08:22'),(36,'Dune','Frank Herbert','2016-07-26 20:57:53','2016-07-26 20:57:53'),(37,'Dune Messiah','Frank Herbert','2016-07-27 08:49:01','2016-07-27 08:49:01');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review` text,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_users_idx` (`user_id`),
  KEY `fk_reviews_books1_idx` (`book_id`),
  CONSTRAINT `fk_reviews_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_books1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (15,'Ooooo... Interesting',4,'2016-07-26 13:16:39','2016-07-26 13:16:39',1,19),(17,'Pabst hammock you probably haven\'t heard of them raw denim asymmetrical, gochujang salvia listicle squid. Pabst bespoke next level typewriter tattooed, VHS direct trade migas blue bottle lumbersexual XOXO shabby chic pork belly. Cardigan offal synth, tote bag yuccie mlkshk small batch tofu salvia echo park. 3 wolf moon hoodie literally, plaid semiotics green juice meh gluten-free wayfarers fanny pack organic affogato sartorial squid street art.',3,'2016-07-26 14:30:13','2016-07-26 14:30:13',3,21),(18,'Pithy and wickedly funny. Will catch you off guard with it\'s humor.',5,'2016-07-26 15:22:11','2016-07-26 15:22:11',1,22),(19,'Long and detailed, this book leaves you with a hunger for more stories.',5,'2016-07-26 15:24:58','2016-07-26 15:24:58',1,23),(21,'Slow to start, but surprisingly funny',3,'2016-07-26 15:27:31','2016-07-26 15:27:31',2,25),(22,'Devastatingly disturbing view of the not-so-distant future. ',4,'2016-07-26 15:28:48','2016-07-26 15:28:48',2,26),(23,'This was awesome and awful',3,'2016-07-26 16:16:35','2016-07-26 16:16:35',3,26),(24,'I loved looking at the cover. Reading... not so much.',2,'2016-07-26 16:20:32','2016-07-26 16:20:32',4,26),(25,'I hate this book and anyone who reads it!',1,'2016-07-26 16:27:11','2016-07-26 16:27:11',4,26),(26,'Loved this book',5,'2016-07-26 16:40:04','2016-07-26 16:40:04',4,24),(27,'Oh happy days!',1,'2016-07-26 16:45:06','2016-07-26 16:45:06',4,27),(28,'Fast-paced fantasy that keeps you on your toes',4,'2016-07-26 16:50:02','2016-07-26 16:50:02',4,28),(36,'I don\'t know how they made this into a book, but they did.. and it\'s awesome.',5,'2016-07-26 17:19:00','2016-07-26 17:19:00',1,30),(41,'The woman sounds pretty',4,'2016-07-26 18:00:50','2016-07-26 18:00:50',5,19),(42,'It was lovely. I could picture all the action.',5,'2016-07-26 19:08:22','2016-07-26 19:08:22',6,35),(43,'Wildly descriptive and emotional. The first few chapters were a tad slow, but once the stage was set, everything took off.',5,'2016-07-26 20:57:53','2016-07-26 20:57:53',3,36),(45,'Rocked my world...mentally.',5,'2016-07-26 20:59:13','2016-07-26 20:59:13',7,36),(46,'Quasi-philosophical thriller. Loved it.',5,'2016-07-27 08:49:01','2016-07-27 08:49:01',4,37),(50,'Wonderfully insightful about the future of space exploration',4,'2016-07-27 10:57:28','2016-07-27 10:57:28',8,19);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Patrick Todd','Dr.Cakes','patrick.a.todd@gmail.com','$2b$12$7BzWeY/GUx73jOx/eOOn4.X.zDNTRX9.MAkW97lsU66n/go6GVGq6','2016-07-25 20:28:51','2016-07-25 20:28:51'),(2,'Test Account','Tester','email@email.com','$2b$12$7h91ZswuEkRcWXeWM0/xgeouDhdIn0yhtWYHeq0/bkUuY.SvUUtCm','2016-07-25 20:31:30','2016-07-25 20:31:30'),(3,'Test Account','Test2','email2@email.com','$2b$12$gPZ3kFu9IbI2.KYH3H.7duQOogluFrMoqR1PV9vNMzqZrs64zBdEm','2016-07-25 20:34:56','2016-07-25 20:34:56'),(4,'Bridget Jones','Bridge','email3@email.com','$2b$12$otvIl45gpuk2praCreGMIu8Ge9nR27tv7Jwsxvc95z5e4ZyzrGLGa','2016-07-25 21:36:59','2016-07-25 21:36:59'),(5,'Daniel','Brewer','email7@email.com','$2b$12$snbpa3AU48hHv1sNsY1ZK.D7QccQ7on39WgHwnIjdO0G91o7m858e','2016-07-26 17:41:58','2016-07-26 17:41:58'),(6,'Allen Kim','ThatGuy','email8@email.com','$2b$12$XzmOao3vTXWIbYw/wQ2.LuN8mqqNGKM2TgkYziRQUuStxuEctifOW','2016-07-26 19:07:11','2016-07-26 19:07:11'),(7,'Samantha','SammyT','samantha.m.townsley@gmail.com','$2b$12$yGUEpAhpgu6YbtyeRubmNOf6OZDET0hbKJLdSmWQdBmz5.pxLRYWW','2016-07-26 20:36:38','2016-07-26 20:36:38'),(8,'Minh Nguyen','Minimus','mnguyen@codingdojo.com','$2b$12$mJYwSkXioMfBAecUyqCEaekiR7QvDNA98SeYqq14cpxvMlewtPf2W','2016-07-27 10:38:54','2016-07-27 10:38:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-27 11:58:02
