-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: sena
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Career`
--

DROP TABLE IF EXISTS `Career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Career` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Career`
--

LOCK TABLES `Career` WRITE;
/*!40000 ALTER TABLE `Career` DISABLE KEYS */;
INSERT INTO `Career` VALUES (1,'Desarrollo de Software'),(2,'Electrónica'),(3,'Mecánica Automotriz'),(4,'Seguridad y Salud Ocupacional'),(5,'Soldadura');
/*!40000 ALTER TABLE `Career` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (1,'Matemáticas Básicas'),(2,'Algebra Computacional'),(3,'Programación Básica'),(4,'Inglés'),(5,'Electrónica Básica'),(6,'Motor de Cuatro Tiempos'),(7,'Enfermedades Laborales'),(8,'Higiene Postural en el Trabajo'),(9,'Ergonomía'),(10,'Legislación Laboral en Colombia'),(11,'Materiales de Soldadura'),(12,'Métodos de Soldadura'),(13,'Fusión de Metales'),(14,'Buceo 1'),(15,'Buceo 2'),(16,'Riesgo Eléctrico'),(17,'Bases de Datos Relacionales'),(18,'Bases de Datos NO Relacionales'),(19,'Electrónica Digital'),(20,'Microprocesadores');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseRoute`
--

DROP TABLE IF EXISTS `CourseRoute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CourseRoute` (
  `id_route` int NOT NULL,
  `id_course` int NOT NULL,
  `duration` double NOT NULL,
  KEY `courseRoute_id_route_fk` (`id_route`),
  KEY `courseRoute_id_course_fk` (`id_course`),
  CONSTRAINT `courseRoute_id_course_fk` FOREIGN KEY (`id_course`) REFERENCES `Course` (`id`),
  CONSTRAINT `courseRoute_id_route_fk` FOREIGN KEY (`id_route`) REFERENCES `Route` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseRoute`
--

LOCK TABLES `CourseRoute` WRITE;
/*!40000 ALTER TABLE `CourseRoute` DISABLE KEYS */;
INSERT INTO `CourseRoute` VALUES (1,1,2.5),(1,2,3),(1,3,2),(1,4,4),(1,17,3.5),(1,18,2.5),(2,1,3),(2,3,4),(2,4,5),(2,2,4.5),(8,4,5),(8,6,2),(10,11,3),(10,16,5),(11,13,6),(11,11,4),(3,3,5),(3,4,6),(3,17,4),(4,5,2.5),(4,19,5.5),(4,20,8),(5,5,2),(5,19,5),(5,20,10),(10,14,6);
/*!40000 ALTER TABLE `CourseRoute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseTrainer`
--

DROP TABLE IF EXISTS `CourseTrainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CourseTrainer` (
  `id_trainer` int NOT NULL,
  `id_course` int NOT NULL,
  `id` varchar(5) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `coursetrainer_id_trainer_fk` (`id_trainer`),
  KEY `coursetrainer_id_course_fk` (`id_course`),
  CONSTRAINT `coursetrainer_id_course_fk` FOREIGN KEY (`id_course`) REFERENCES `Course` (`id`),
  CONSTRAINT `coursetrainer_id_trainer_fk` FOREIGN KEY (`id_trainer`) REFERENCES `Trainer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseTrainer`
--

LOCK TABLES `CourseTrainer` WRITE;
/*!40000 ALTER TABLE `CourseTrainer` DISABLE KEYS */;
INSERT INTO `CourseTrainer` VALUES (1,2,'AC-1'),(2,18,'DBN-1'),(2,17,'DBR-1'),(7,5,'EB-1'),(6,19,'ED-1'),(3,13,'FM-1'),(5,4,'I-1'),(4,1,'MB-1'),(7,20,'MP-1'),(3,11,'MS-1'),(3,3,'PB-1');
/*!40000 ALTER TABLE `CourseTrainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupTrainee`
--

DROP TABLE IF EXISTS `GroupTrainee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GroupTrainee` (
  `id_group` varchar(5) NOT NULL,
  `id_trainee` int DEFAULT NULL,
  KEY `id_group` (`id_group`),
  KEY `id_trainee` (`id_trainee`),
  CONSTRAINT `GroupTrainee_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `CourseTrainer` (`id`),
  CONSTRAINT `GroupTrainee_ibfk_2` FOREIGN KEY (`id_trainee`) REFERENCES `Trainee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupTrainee`
--

LOCK TABLES `GroupTrainee` WRITE;
/*!40000 ALTER TABLE `GroupTrainee` DISABLE KEYS */;
INSERT INTO `GroupTrainee` VALUES ('DBR-1',1),('AC-1',1),('PB-1',1),('DBN-1',1),('MB-1',2),('AC-1',2),('PB-1',2),('I-1',2),('MB-1',3),('AC-1',3),('PB-1',3),('I-1',4),('MB-1',4),('AC-1',4),('PB-1',5),('I-1',5),('DBR-1',5),('EB-1',6),('ED-1',6),('MP-1',6),('EB-1',7),('ED-1',7),('MP-1',7),('EB-1',8),('ED-1',8),('EB-1',9),('ED-1',9),('MP-1',9),('MS-1',10),('FM-1',10),('MS-1',11);
/*!40000 ALTER TABLE `GroupTrainee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_course_for_trainee` BEFORE INSERT ON `GroupTrainee` FOR EACH ROW BEGIN

    SET @group = NEW.id_group;
    SET @trainee = NEW.id_trainee;

    IF validate_course_trainee(@group, @trainee) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT  = "El curso ya fue asignado al estudiante";
    end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_insert_group_trainee` AFTER INSERT ON `GroupTrainee` FOR EACH ROW BEGIN

    SET @group = NEW.id_group;
    SET @trainee = NEW.id_trainee;
    
    IF NOT validate_course_route(@group, @trainee) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT  = "El curso no pertenece a la ruta del estudiante";
    end if;
    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Register`
--

DROP TABLE IF EXISTS `Register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Register` (
  `id_trainee` int NOT NULL,
  `id_route` int NOT NULL,
  `state` enum('Activo','Terminado','Cancelado') DEFAULT NULL,
  KEY `register_id_route_fk` (`id_route`),
  KEY `register_id_trainee_pk` (`id_trainee`),
  CONSTRAINT `register_id_route_fk` FOREIGN KEY (`id_route`) REFERENCES `Route` (`id`),
  CONSTRAINT `register_id_trainee_pk` FOREIGN KEY (`id_trainee`) REFERENCES `Trainee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Register`
--

LOCK TABLES `Register` WRITE;
/*!40000 ALTER TABLE `Register` DISABLE KEYS */;
INSERT INTO `Register` VALUES (1,1,'Activo'),(2,1,'Activo'),(3,2,'Cancelado'),(4,2,'Activo'),(5,3,'Activo'),(6,4,'Terminado'),(7,4,'Terminado'),(8,5,'Terminado'),(9,5,'Cancelado'),(10,11,'Terminado'),(11,10,'Terminado');
/*!40000 ALTER TABLE `Register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Route`
--

DROP TABLE IF EXISTS `Route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `id_career` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `route_id_career_fk` (`id_career`),
  CONSTRAINT `route_id_career_fk` FOREIGN KEY (`id_career`) REFERENCES `Career` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Route`
--

LOCK TABLES `Route` WRITE;
/*!40000 ALTER TABLE `Route` DISABLE KEYS */;
INSERT INTO `Route` VALUES (1,'Sistemas de Información Empresariales',1),(2,'Videojuegos',1),(3,'Machine Learning',1),(4,'Microcontroladores',2),(5,'Robótica',2),(6,'Dispositivos Bio-médicos',2),(7,'Motores Hibridos',3),(8,'Vehículos de Uso Agrícola',3),(9,'Sistemas de Gestión en Seguridad Ocupacional',4),(10,'Soldadura Autógena Industrial',5),(11,'Soldadura Eléctrica Industrial',5),(12,'Soldadura Submarina',5);
/*!40000 ALTER TABLE `Route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specialty`
--

DROP TABLE IF EXISTS `Specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Specialty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specialty`
--

LOCK TABLES `Specialty` WRITE;
/*!40000 ALTER TABLE `Specialty` DISABLE KEYS */;
INSERT INTO `Specialty` VALUES (1,'Sistemas'),(2,'Salud Ocupacional'),(3,'Soldadura'),(4,'Mecánica'),(5,'Inglés'),(6,'Electrónica');
/*!40000 ALTER TABLE `Specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trainee`
--

DROP TABLE IF EXISTS `Trainee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trainee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trainee`
--

LOCK TABLES `Trainee` WRITE;
/*!40000 ALTER TABLE `Trainee` DISABLE KEYS */;
INSERT INTO `Trainee` VALUES (1,'Carlos Saúl','Gómez',20),(2,'Leyla María','Delgado Vargas',21),(3,'Juan José','Cardona',22),(4,'Sergio Augusto','Contreras Navas',23),(5,'Ana María','Velázquez Parra',24),(6,'Gustavo','Noriega Alzate',25),(7,'Pedro Nell','Gómez Díaz',26),(8,'Jairo Augusto','Castro Camargo',27),(9,'Henry','Soler Vega',28),(10,'Antonio','Cañate Cortés',26),(11,'Daniel','Simmancas Junior',21);
/*!40000 ALTER TABLE `Trainee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trainer`
--

DROP TABLE IF EXISTS `Trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trainer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `id_specialty` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainer_id_specialty_fk` (`id_specialty`),
  CONSTRAINT `trainer_id_specialty_fk` FOREIGN KEY (`id_specialty`) REFERENCES `Specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trainer`
--

LOCK TABLES `Trainer` WRITE;
/*!40000 ALTER TABLE `Trainer` DISABLE KEYS */;
INSERT INTO `Trainer` VALUES (1,'Ricardo Vicente Jaimes',1),(2,'Marinela Narvaez',2),(3,'Agustín Parra Granados',3),(4,'Nelson Raúl Buitrago',4),(5,'Roy Hernando Llamas',5),(6,'María Jimena Monsalve',6),(7,'Juan Carlos Cobos',6),(8,'Pedro Nell Santomaría',1),(9,'Andrea González',1),(10,'Marisela Sevilla',2);
/*!40000 ALTER TABLE `Trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `general_information_cursos_ruta`
--

DROP TABLE IF EXISTS `general_information_cursos_ruta`;
/*!50001 DROP VIEW IF EXISTS `general_information_cursos_ruta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `general_information_cursos_ruta` AS SELECT 
 1 AS `Estado`,
 1 AS `Nombre`,
 1 AS `Carrera`,
 1 AS `Ruta`,
 1 AS `Curso`,
 1 AS `Instructor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `general_information_register`
--

DROP TABLE IF EXISTS `general_information_register`;
/*!50001 DROP VIEW IF EXISTS `general_information_register`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `general_information_register` AS SELECT 
 1 AS `Estado`,
 1 AS `Nombre`,
 1 AS `Carrera`,
 1 AS `Ruta de Aprendizaje o Énfasis`,
 1 AS `Curso`,
 1 AS `Instructor`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `general_information_cursos_ruta`
--

/*!50001 DROP VIEW IF EXISTS `general_information_cursos_ruta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `general_information_cursos_ruta` AS select `R`.`state` AS `Estado`,concat(`A`.`first_name`,' ',`A`.`last_name`) AS `Nombre`,`C2`.`name` AS `Carrera`,`R2`.`name` AS `Ruta`,`C`.`name` AS `Curso`,`T`.`name` AS `Instructor` from (((((((`Trainee` `A` join `GroupTrainee` `GT` on((`A`.`id` = `GT`.`id_trainee`))) join `CourseTrainer` `CT` on((`CT`.`id` = `GT`.`id_group`))) join `Course` `C` on((`C`.`id` = `CT`.`id_course`))) join `Trainer` `T` on((`CT`.`id_trainer` = `T`.`id`))) join `Register` `R` on((`A`.`id` = `R`.`id_trainee`))) join `Route` `R2` on((`R2`.`id` = `R`.`id_route`))) join `Career` `C2` on((`C2`.`id` = `R2`.`id_career`))) order by `A`.`id`,`C`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `general_information_register`
--

/*!50001 DROP VIEW IF EXISTS `general_information_register`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `general_information_register` AS select `Register`.`state` AS `Estado`,concat(`TE`.`first_name`,' ',`TE`.`last_name`) AS `Nombre`,`C`.`name` AS `Carrera`,`RT`.`name` AS `Ruta de Aprendizaje o Énfasis`,`CE`.`name` AS `Curso`,`TR`.`name` AS `Instructor` from (((((((`Register` join `Route` `RT` on((`Register`.`id_route` = `RT`.`id`))) join `Career` `C` on((`RT`.`id_career` = `C`.`id`))) join `CourseRoute` `CR` on((`RT`.`id` = `CR`.`id_route`))) join `Course` `CE` on((`CR`.`id_course` = `CE`.`id`))) join `CourseTrainer` `CT` on((`CE`.`id` = `CT`.`id_course`))) join `Trainee` `TE` on((`Register`.`id_trainee` = `TE`.`id`))) join `Trainer` `TR` on((`CT`.`id_trainer` = `TR`.`id`))) order by `TE`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 19:36:59
