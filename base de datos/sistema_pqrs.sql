-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_pqrs
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `ID_Comentario` int NOT NULL AUTO_INCREMENT,
  `solicitud` int DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `comentario` text,
  PRIMARY KEY (`ID_Comentario`),
  KEY `usuario` (`usuario`),
  KEY `solicitud` (`solicitud`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`solicitud`) REFERENCES `solicitud` (`ID_Solicitud`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (10,5,8,'Recibido'),(11,5,8,'Aun estoy esperando'),(12,5,2,'Tranquilo ya casi esta'),(13,5,2,'Listo tu solicitud a terminado'),(14,3,4,'Se completo'),(15,5,8,'Muchas gracias'),(16,5,8,'Gracias'),(17,5,8,'s'),(18,5,8,'s'),(19,4,2,'Listo'),(20,3,2,'Listo puede revisar'),(21,3,4,'Si, muchas gracias');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `ID_Estado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Activa'),(2,'En proceso'),(3,'Terminada');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `ID_Rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Persona natural'),(2,'Administrativo');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `ID_Solicitud` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `tipo` int DEFAULT NULL,
  `descripcion` text,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaCierre` datetime DEFAULT NULL,
  `fechaRespuesta` date DEFAULT NULL,
  `estado` int DEFAULT NULL,
  `documento` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_Solicitud`),
  KEY `usuario` (`usuario`),
  KEY `tipo` (`tipo`),
  KEY `estado` (`estado`),
  CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE,
  CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`ID_Tipo`) ON DELETE CASCADE,
  CONSTRAINT `solicitud_ibfk_3` FOREIGN KEY (`estado`) REFERENCES `estado` (`ID_Estado`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (3,'Mal servicio ofrecido',4,2,'Quiero presentar una queja por el mal servicio que han ofrecido para atenderme','2024-05-17 15:30:40',NULL,'2024-06-01',3,'documentos/4'),(4,'Reclamo por cancelacion del pago',4,3,'Quiero realizar un reclamo por cancelarme el pago','2024-05-17 15:38:13',NULL,'2024-06-01',3,'documentos/4Tabla-z-distribución-normal-estandarizada-MateMovil.pdf'),(5,'Ingreso a victimas',8,1,'Este es mi documento','2024-05-19 19:56:42',NULL,'2024-06-03',3,'documentos/8Matricula 2023-2.pdf'),(6,'Mal servicio ofrecido',8,1,'malo malo','2024-05-21 00:20:00',NULL,'2024-06-05',1,'documentos/Tabla-z-distribución-normal-estandarizada-MateMovil.pdf');
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `ID_Tipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Petición'),(2,'Queja'),(3,'Reclamo'),(4,'Sugerencia');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(10) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `contrasena` varchar(64) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `fechaEliminacion` datetime DEFAULT NULL,
  `rol` int NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  KEY `rol` (`rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`ID_Rol`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'1080831081','Adrian ','Castillo','adrianangulo1080@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','2024-05-15 12:19:35',NULL,2),(4,'1080831083','Deander','Angulo','accastillo222@umariana.edu.co','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','2024-05-16 01:59:12',NULL,1),(5,'1080831021','Dahiam','Klinger','Dahiam@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','2024-05-16 23:13:12',NULL,1),(7,'1080831342','Edrien','Castillo','adcastillo@unal.edu.co','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','2024-05-17 16:10:23',NULL,1),(8,'1080831092','David','Salazar','bowleskamilo@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','2024-05-17 16:13:18',NULL,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-21 22:22:17
