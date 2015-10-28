-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: a9914047_quentyd
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `valido` int(11) DEFAULT NULL,
  `categoriaID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`categoriaID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('Arte',NULL,1,1),('Comics',NULL,1,2),('Artesanías',NULL,1,3),('Baile',NULL,1,4),('Diseño',NULL,1,5),('Moda',NULL,1,6),('Cine y vídeo',NULL,1,7),('Comida',NULL,1,8),('Juegos',NULL,1,9),('Periodismo',NULL,1,10),('Música',NULL,1,11),('Fotografía',NULL,1,12),('Publicaciones',NULL,1,13),('Tecnología',NULL,1,14),('Teatro',NULL,1,15);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `nombre` varchar(50) DEFAULT NULL,
  `valido` int(11) DEFAULT NULL,
  `ciudadID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ciudadID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES ('Estados Unidos',1,1),('Luxemburgo',1,2),('Suiza',1,3),('Alemania',1,4),('España',1,5),('Bolivia',1,6);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `comentario` int(11) DEFAULT NULL,
  `valido` int(11) DEFAULT NULL,
  `comentarioID` int(11) NOT NULL AUTO_INCREMENT,
  `proyectoID` int(11) DEFAULT NULL,
  `usuarioID` int(11) DEFAULT NULL,
  PRIMARY KEY (`comentarioID`),
  KEY `FK_Comentario_Proyecto` (`proyectoID`),
  KEY `FK_Comentario_Usuario` (`usuarioID`),
  CONSTRAINT `FK_Comentario_Proyecto` FOREIGN KEY (`proyectoID`) REFERENCES `proyecto` (`proyectoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Comentario_Usuario` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribucion`
--

DROP TABLE IF EXISTS `contribucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contribucion` (
  `valido` int(11) DEFAULT NULL,
  `visible` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `contribucionID` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioID` int(11) DEFAULT NULL,
  `proyectoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`contribucionID`),
  KEY `FK_Contribucion_Usuario` (`usuarioID`),
  KEY `FK_Contribucion_Proyecto` (`proyectoID`),
  CONSTRAINT `FK_Contribucion_Proyecto` FOREIGN KEY (`proyectoID`) REFERENCES `proyecto` (`proyectoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Contribucion_Usuario` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribucion`
--

LOCK TABLES `contribucion` WRITE;
/*!40000 ALTER TABLE `contribucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `contribucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `valido` int(11) DEFAULT NULL,
  `estadoID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`estadoID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES ('APROBADO','El proyecto fue aprobado por los administradores y está visible a todos',1,1),('RECHAZADO','El proyecto fue rechazado por los administradores y está visible a todos',1,2),('BORRADOR','El proyecto se encuentra en desarrollo',1,3),('PENDIENTE','El proyecto esta en proceso de aprobación',1,4);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorito` (
  `favoritoID` int(11) NOT NULL AUTO_INCREMENT,
  `proyectoID` int(11) DEFAULT NULL,
  `usuarioID` int(11) DEFAULT NULL,
  PRIMARY KEY (`favoritoID`),
  KEY `FK_Favorito_Proyecto` (`proyectoID`),
  KEY `FK_Favorito_Usuario` (`usuarioID`),
  CONSTRAINT `FK_Favorito_Proyecto` FOREIGN KEY (`proyectoID`) REFERENCES `proyecto` (`proyectoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Favorito_Usuario` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediaitem`
--

DROP TABLE IF EXISTS `mediaitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mediaitem` (
  `imageFile` varchar(500) DEFAULT NULL,
  `videoFile` varchar(500) DEFAULT NULL,
  `contenido` varchar(500) DEFAULT NULL,
  `mediaItemID` int(11) NOT NULL AUTO_INCREMENT,
  `proyectoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`mediaItemID`),
  KEY `FK_MediaItem_Proyecto` (`proyectoID`),
  CONSTRAINT `FK_MediaItem_Proyecto` FOREIGN KEY (`proyectoID`) REFERENCES `proyecto` (`proyectoID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediaitem`
--

LOCK TABLES `mediaitem` WRITE;
/*!40000 ALTER TABLE `mediaitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mediaitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `mensaje` varchar(200) DEFAULT NULL,
  `valido` int(11) DEFAULT NULL,
  `mensajeID` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioID` int(11) DEFAULT NULL,
  PRIMARY KEY (`mensajeID`),
  KEY `FK_Mensaje_Usuario` (`usuarioID`),
  CONSTRAINT `FK_Mensaje_Usuario` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion_larga` varchar(4000) DEFAULT NULL,
  `descripcion_corta` varchar(300) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `diasvigencia` int(11) DEFAULT NULL,
  `url_image` varchar(200) DEFAULT NULL,
  `proyectoID` int(11) NOT NULL AUTO_INCREMENT,
  `categoriaID` int(11) DEFAULT NULL,
  `ciudadID` int(11) DEFAULT NULL,
  `estadoID` int(11) DEFAULT NULL,
  `usuarioID` int(11) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  PRIMARY KEY (`proyectoID`),
  KEY `FK_Proyecto_Categoria` (`categoriaID`),
  KEY `FK_Proyecto_Ciudad` (`ciudadID`),
  KEY `FK_Proyecto_Estado` (`estadoID`),
  KEY `FK_Proyecto_Usuario` (`usuarioID`),
  CONSTRAINT `FK_Proyecto_Categoria` FOREIGN KEY (`categoriaID`) REFERENCES `categoria` (`categoriaID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Proyecto_Ciudad` FOREIGN KEY (`ciudadID`) REFERENCES `ciudad` (`ciudadID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Proyecto_Estado` FOREIGN KEY (`estadoID`) REFERENCES `estado` (`estadoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Proyecto_Usuario` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES ('Super Dungeon Explore: Legends','Super Dungeon Explore is a combat board game inspired by classic hack-and-slash video games. But that is only the beginning. Super Dungeon is also built upon a deep love for classic Japanese roleplaying games (JRPGs), adventure games, and traditional pencil-and-paper tabletop games. Super Dungeon Legends draws its inspiration from these well loved genres to allow players to craft their own stories in the world of Crystalia.','Super Dungeon Explore, the chibi board game, returns with LEGENDS — featuring a new starter box, campaign play, and RPG action!',80000,30,'Super_dungeon.jpg',2,9,2,1,8,NULL),('Toys 2.0: Smart Toy Robots, Built by Kids - Cannybots','Dear Parents - Meet Cannybots! The smart robotic toy car to introduce your little genius to programming, robotics, A.I. and 3D printing.','LEGO compatible, smart robotic toy car. Give your child a head start in programming, robotics, A.I. and 3D printing.',40000,30,'Cannybots.jpg',5,14,5,1,9,NULL),('HUDWAY Glass: keeps your eyes on the road while driving','We introduced the early prototype of HUDWAY Glass at CeBIT 2015 in Hannover for the first time. It is a simple accessory, which turns any smartphone into a head-up display. Moreover, it eliminates many issues associated with projecting an image onto a windshield, including doubling of the image, lack of reflection during daytime, image size and a few others. We received very positive response from potential customers, dealers and retailers, as well as from many major representatives of the automotive industry.','A universal vehicle accessory turning your smartphone into a head-up display (HUD) for any car',100000,30,'headup.jpg',6,14,6,1,8,NULL),('Range Dial. Better looking, smarter cooking thermometer','Cooking can be a joy when you make a delicious meal, a disappointment when you get it wrong, and disaster when you present the charred, leathery wreckage to your hungry friends and family. That\'s why we created Range Dial — a precision cooking thermometer that works with or without your smartphone. Range helps you achieve that kitchen joy whether it\'s grilling, baking, brewing, or candymaking. Range Dial is the evolution of our previously Kickstarted thermometer, Range. We\'ve learned a lot from how our customers use Range, and added the top requests: Bluetooth for wireless monitoring, and a second probe for ambient temperature. But we also thought carefully about the friction points and how we could address them. Range Dial works with or without a smartphone. Having a connected device shouldn\'t mean you have to mess with an app for the most basic functions. Just plug in the probe and turn the dial to a preset—Range Dial will beep at you, and you\'ll also get a push notification on your phone when your food is done. Or open the app to have full control. It\'s the best of both worlds.','A precision Bluetooth cooking tool with or without your iPhone. Tinker with your recipes, not your tools.',60000,30,'cooking.jpg',7,14,3,1,8,'2015-10-26');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recompensa`
--

DROP TABLE IF EXISTS `recompensa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recompensa` (
  `cant_recompensa` int(11) DEFAULT NULL,
  `contribucion` int(11) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `recompensaID` int(11) NOT NULL AUTO_INCREMENT,
  `proyectoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`recompensaID`),
  KEY `FK_Recompensa_Proyecto` (`proyectoID`),
  CONSTRAINT `FK_Recompensa_Proyecto` FOREIGN KEY (`proyectoID`) REFERENCES `proyecto` (`proyectoID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recompensa`
--

LOCK TABLES `recompensa` WRITE;
/*!40000 ALTER TABLE `recompensa` DISABLE KEYS */;
/*!40000 ALTER TABLE `recompensa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripcion`
--

DROP TABLE IF EXISTS `suscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suscripcion` (
  `valido` int(11) DEFAULT NULL,
  `suscripcionID` int(11) NOT NULL AUTO_INCREMENT,
  `categoriaID` int(11) DEFAULT NULL,
  `usuarioID` int(11) DEFAULT NULL,
  PRIMARY KEY (`suscripcionID`),
  KEY `FK_Suscripcion_Categoria` (`categoriaID`),
  KEY `FK_Suscripcion_Usuario` (`usuarioID`),
  CONSTRAINT `FK_Suscripcion_Categoria` FOREIGN KEY (`categoriaID`) REFERENCES `categoria` (`categoriaID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Suscripcion_Usuario` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripcion`
--

LOCK TABLES `suscripcion` WRITE;
/*!40000 ALTER TABLE `suscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `nombre` varchar(50) DEFAULT NULL,
  `tipoUsuarioID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tipoUsuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES ('ADMINISTRADOR',1),('USUARIO',2);
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userquenty`
--

DROP TABLE IF EXISTS `userquenty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userquenty` (
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userquenty`
--

LOCK TABLES `userquenty` WRITE;
/*!40000 ALTER TABLE `userquenty` DISABLE KEYS */;
/*!40000 ALTER TABLE `userquenty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `nro_telefono` int(11) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `socialID` int(11) DEFAULT NULL,
  `usuarioID` int(11) NOT NULL AUTO_INCREMENT,
  `ciudadID` int(11) DEFAULT NULL,
  `tipoUsuarioID` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usuarioID`),
  KEY `FK_Usuario_Ciudad` (`ciudadID`),
  KEY `FK_Usuario_TipoUsuario` (`tipoUsuarioID`),
  CONSTRAINT `FK_Usuario_Ciudad` FOREIGN KEY (`ciudadID`) REFERENCES `ciudad` (`ciudadID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Usuario_TipoUsuario` FOREIGN KEY (`tipoUsuarioID`) REFERENCES `tipousuario` (`tipoUsuarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (73872876,'Av. St. Louis No.315','Alexander','Robles',4367,8,1,2,NULL),(74782693,'Av. Illinois','Benjamin ','Alvarez',2375,9,2,2,NULL),(94639876,'Av. Alemania','Roger','Alcantara',2341,10,3,2,NULL),(12739876,'Av. Jhonny R. No 2345','Felipe','Brahim',7685,11,4,2,NULL),(49848798,'Av. Luxemburgo','Daniela','Nogales',2323,12,5,2,NULL),(42098078,'Av. Jaramillo No 3298','Alejandra','Herrera',3467,13,6,2,NULL),(29879032,'Av. Turquia','Fernanda','Rivera',6532,14,6,1,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_proyecto`
--

DROP TABLE IF EXISTS `v_proyecto`;
/*!50001 DROP VIEW IF EXISTS `v_proyecto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_proyecto` AS SELECT 
 1 AS `proyectoID`,
 1 AS `nombre`,
 1 AS `descripcion_larga`,
 1 AS `descripcion_corta`,
 1 AS `monto`,
 1 AS `diasvigencia`,
 1 AS `url_image`,
 1 AS `categoria`,
 1 AS `ciudad`,
 1 AS `estado`,
 1 AS `usuarioID`,
 1 AS `usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'a9914047_quentyd'
--
/*!50003 DROP PROCEDURE IF EXISTS `p_comentar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_comentar`(in v_comentario varchar(300),  in v_proyectoID INT(11), in v_socialID int(11) )
BEGIN
	declare usuarioID int(11);
    select u.usuarioID into usuarioID
    from usuario u
    where u.socialID=v_socialID;
    
	insert into comentario(comentario, valido, proyectoID, usuarioID)
    values(v_comentario,1,v_proyectoID,usuarioID);
    
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_create_project` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_create_project`(in v_nombre varchar(100), in v_descripcionLarga varchar(4000), in v_descripcionCorta varchar(200), in v_monto int(11), in v_diasvigencia int(11), in v_url_image varchar(200),IN v_categoria varchar(100), IN v_ciudad varchar(100), in v_estado varchar(100), in v_socialID int)
BEGIN
   	declare categoriaID , ciudadID,estadoID, usuarioID int;
    
    select cat.categoriaID into categoriaID
			from categoria cat
			where cat.nombre=v_categoria;
            
	select ci.ciudadID into ciudadID
			from ciudad ci
			where ci.nombre=v_ciudad;
            
	select e.estadoID into estadoID
			from estado e
			where e.nombre=v_estado;		

	select u.usuarioID into usuarioID
			from usuario u
			where u.socialID=v_socialID;
            
	insert into proyecto(nombre, descripcion_larga,descripcion_corta,monto,diasvigencia,
 						url_image, categoriaID, ciudadID, estadoID, usuarioID, fecha_registro)
 	values(v_nombre,v_descripcionLarga,v_descripcionCorta,v_monto,v_diasvigencia,v_url_image,categoriaID,ciudadID,estadoID,usuarioID,curdate())
 	;			
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_donar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_donar`(v_monto int(11),v_social_id int(11),v_proyecto_id int(11))
BEGIN
	declare usuario_id int(11);
    
    select usuarioID into usuario_id
    from usuario u
    where u.socialID=v_social_id;
    
	insert into contribucion(valido, visible, estado, monto, contribucionID, usuarioID, proyectoID)
    values(1,1,1,v_monto,null,usuario_id,v_proyecto_id);
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_registrar_datos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_registrar_datos`(v_nro_telefono int(11),
										v_direccion varchar(50),
										v_nombre varchar(50),
										v_apellidos varchar(50),
										v_socialID int(11),
                                        v_email varchar(50),
										v_ciudad varchar(50))
BEGIN
		declare _usuarioID,_ciudadID int(11);
        
		select u.usuarioID into _usuarioID
        from usuario u
        where u.socialID=v_social_id;
        
        select ci.ciudadID into _ciudadID
        from ciudad ci
        where ci.nombre=v_ciudad;
        
        update usuario set nro_telefono=v_nro_telefono,
							direccion=v_direccion,
                            nombre=v_nombre,
                            apellidos=v_apellidos,
                            ciudadID=_ciudadID,
                            email=v_email
					   where usuarioID=_usuarioID;
                       
commit;                       
                            
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_proyecto`
--

/*!50001 DROP VIEW IF EXISTS `v_proyecto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_proyecto` AS select `p`.`proyectoID` AS `proyectoID`,`p`.`nombre` AS `nombre`,`p`.`descripcion_larga` AS `descripcion_larga`,`p`.`descripcion_corta` AS `descripcion_corta`,`p`.`monto` AS `monto`,`p`.`diasvigencia` AS `diasvigencia`,`p`.`url_image` AS `url_image`,`c`.`nombre` AS `categoria`,`c`.`nombre` AS `ciudad`,`e`.`nombre` AS `estado`,`u`.`usuarioID` AS `usuarioID`,`u`.`nombre` AS `usuario` from ((((`proyecto` `p` join `estado` `e`) join `categoria` `c`) join `usuario` `u`) join `ciudad` `ci`) where ((`e`.`nombre` = 'APROBADO') and (`p`.`estadoID` = `e`.`estadoID`) and (`p`.`categoriaID` = `c`.`categoriaID`) and (`p`.`ciudadID` = `ci`.`ciudadID`) and (`p`.`usuarioID` = `u`.`usuarioID`)) */;
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

-- Dump completed on 2015-10-27  0:31:39
