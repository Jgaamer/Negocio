CREATE DATABASE  IF NOT EXISTS `negocio_juegos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `negocio_juegos`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: negocio_juegos
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `CAT_id` int NOT NULL AUTO_INCREMENT,
  `CAT_Tipo` varchar(50) DEFAULT NULL,
  `CAT_Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CAT_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Aventura','Juegos de Aventura'),(2,'Acción','Juegos de Acción'),(3,'Terror','Juegos de Terror'),(4,'Deportes','Juegos de Deportes'),(5,'Estrategia','Juegos de Estrategia'),(6,'Simulación','Juegos de Simulación'),(7,'Puzzle','Juegos de Puzzle'),(8,'RPG','Juegos de Rol (RPG)');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `CLT_id` int NOT NULL AUTO_INCREMENT,
  `CLT_Nombre` varchar(100) DEFAULT NULL,
  `CLT_Apellido` varchar(100) DEFAULT NULL,
  `CLT_Telefono` varchar(20) DEFAULT NULL,
  `CLT_Mail` varchar(100) DEFAULT NULL,
  `CLT_Direccion` varchar(200) DEFAULT NULL,
  `CLT_idLocalidad` int DEFAULT NULL,
  PRIMARY KEY (`CLT_id`),
  KEY `CLT_idLocalidad` (`CLT_idLocalidad`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`CLT_idLocalidad`) REFERENCES `localidades` (`LOC_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Laura','Gómez','555-1111','laura.gomez@example.com','Calle Falsa 123',1),(2,'Javier','Ruiz','555-2222','javier.ruiz@example.com','Avenida Siempre Viva 456',2),(3,'Carolina','Martínez','555-3333','carolina.martinez@example.com','Plaza Mayor 789',3),(4,'Alberto','Fernández','555-4444','alberto.fernandez@example.com','Calle de la Libertad 101',4),(5,'Mónica','Sánchez','555-5555','monica.sanchez@example.com','Avenida del Sol 202',5),(6,'Sergio','López','555-6666','sergio.lopez@example.com','Calle Secundaria 303',1),(7,'Lucía','Pérez','555-7777','lucia.perez@example.com','Boulevard Sur 404',2),(8,'Rodrigo','Vázquez','555-8888','rodrigo.vazquez@example.com','Calle del Norte 505',3),(9,'Beatriz','Hernández','555-9999','beatriz.hernandez@example.com','Plaza Central 606',4),(10,'Daniel','Méndez','555-1010','daniel.mendez@example.com','Avenida Libertad 707',5);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallespedidos`
--

DROP TABLE IF EXISTS `detallespedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallespedidos` (
  `DP_id` int NOT NULL AUTO_INCREMENT,
  `DP_idProductos` int DEFAULT NULL,
  `DP_idPedidos` int DEFAULT NULL,
  `DP_Cantidad` int DEFAULT NULL,
  PRIMARY KEY (`DP_id`),
  KEY `DP_idProductos` (`DP_idProductos`),
  KEY `DP_idPedidos` (`DP_idPedidos`),
  CONSTRAINT `detallespedidos_ibfk_1` FOREIGN KEY (`DP_idProductos`) REFERENCES `productos` (`PRO_id`),
  CONSTRAINT `detallespedidos_ibfk_2` FOREIGN KEY (`DP_idPedidos`) REFERENCES `pedidos` (`PED_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallespedidos`
--

LOCK TABLES `detallespedidos` WRITE;
/*!40000 ALTER TABLE `detallespedidos` DISABLE KEYS */;
INSERT INTO `detallespedidos` VALUES (1,1,1,2),(2,2,1,1),(3,3,2,1),(4,4,2,2),(5,5,3,3),(6,6,3,1),(7,7,4,1),(8,8,4,2),(9,9,5,1),(10,10,5,4);
/*!40000 ALTER TABLE `detallespedidos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Actualizar_Stock_After_Insert` AFTER INSERT ON `detallespedidos` FOR EACH ROW BEGIN
    UPDATE productos
    SET Stock = Stock - NEW.DP_cantidad
    WHERE PROD_id = NEW.DP_idProductos;
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Restaurar_Stock_After_Delete` AFTER DELETE ON `detallespedidos` FOR EACH ROW BEGIN
    UPDATE productos
    SET Stock = Stock + OLD.DP_cantidad
    WHERE PROD_id = OLD.DP_idProductos;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `EMP_id` int NOT NULL AUTO_INCREMENT,
  `EMP_Nombre` varchar(100) DEFAULT NULL,
  `EMP_Apellido` varchar(100) DEFAULT NULL,
  `EMP_Telefono` varchar(20) DEFAULT NULL,
  `EMP_Mail` varchar(100) DEFAULT NULL,
  `EMP_Direccion` varchar(200) DEFAULT NULL,
  `EMP_idLocalidad` int DEFAULT NULL,
  `EMP_FechaNacimiento` date DEFAULT NULL,
  PRIMARY KEY (`EMP_id`),
  KEY `EMP_idLocalidad` (`EMP_idLocalidad`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`EMP_idLocalidad`) REFERENCES `localidades` (`LOC_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (11,'Juan','Pérez','555-1234','juan.perez@example.com','Calle Falsa 123',1,'1985-06-15'),(12,'María','García','555-5678','maria.garcia@example.com','Avenida Siempre Viva 742',2,'1990-02-20'),(13,'Pedro','López','555-8765','pedro.lopez@example.com','Calle Mayor 55',3,'1988-11-05'),(14,'Ana','Martínez','555-4321','ana.martinez@example.com','Avenida Libertad 99',4,'1992-03-12'),(15,'Luis','Hernández','555-6789','luis.hernandez@example.com','Calle Secundaria 66',5,'1987-09-25'),(16,'Elena','González','555-2468','elena.gonzalez@example.com','Calle Principal 23',1,'1983-08-30'),(17,'Carlos','Ramírez','555-1357','carlos.ramirez@example.com','Plaza Central 14',2,'1995-12-02'),(18,'Sofía','Rodríguez','555-9753','sofia.rodriguez@example.com','Avenida del Sol 18',3,'1989-04-22'),(19,'David','Sánchez','555-8642','david.sanchez@example.com','Calle del Norte 10',4,'1984-07-18'),(20,'Lucía','Fernández','555-7531','lucia.fernandez@example.com','Boulevard Sur 89',5,'1993-05-11');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `LOC_id` int NOT NULL AUTO_INCREMENT,
  `LOC_CodigoPostal` varchar(10) DEFAULT NULL,
  `LOC_Localidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LOC_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'28001','Madrid'),(2,'08001','Barcelona'),(3,'41001','Sevilla'),(4,'46001','Valencia'),(5,'50001','Zaragoza');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `PED_id` int NOT NULL AUTO_INCREMENT,
  `PED_idCliente` int DEFAULT NULL,
  `PED_idProducto` int DEFAULT NULL,
  `PED_idEmpleado` int DEFAULT NULL,
  `PED_FechaPedido` date DEFAULT NULL,
  PRIMARY KEY (`PED_id`),
  KEY `PED_idCliente` (`PED_idCliente`),
  KEY `PED_idProducto` (`PED_idProducto`),
  KEY `PED_idEmpleado` (`PED_idEmpleado`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`PED_idCliente`) REFERENCES `clientes` (`CLT_id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`PED_idProducto`) REFERENCES `productos` (`PRO_id`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`PED_idEmpleado`) REFERENCES `empleados` (`EMP_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,1,11,'2024-10-01'),(2,2,2,12,'2024-10-02'),(3,3,3,13,'2024-10-03'),(4,4,4,14,'2024-10-04'),(5,5,5,15,'2024-10-05'),(6,6,6,16,'2024-10-06'),(7,7,7,17,'2024-10-07'),(8,8,8,18,'2024-10-08'),(9,9,9,19,'2024-10-09'),(10,10,10,20,'2024-10-10'),(12,1,2,14,'2024-11-05');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `PRO_id` int NOT NULL AUTO_INCREMENT,
  `PRO_Nombre` varchar(100) DEFAULT NULL,
  `PRO_Precio` decimal(10,2) DEFAULT NULL,
  `PRO_idCategoria` int DEFAULT NULL,
  `PRO_idProveedor` int DEFAULT NULL,
  PRIMARY KEY (`PRO_id`),
  KEY `PRO_idCategoria` (`PRO_idCategoria`),
  KEY `PRO_idProveedor` (`PRO_idProveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`PRO_idCategoria`) REFERENCES `categoria` (`CAT_id`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`PRO_idProveedor`) REFERENCES `proveedores` (`PRV_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'The Legend of Zelda: Breath of the Wild',99.99,1,21),(2,'Super Mario Odyssey',49.99,1,21),(3,'Grand Theft Auto V',39.99,2,24),(4,'Red Dead Redemption 2',69.99,2,24),(5,'Resident Evil Village',59.99,3,25),(6,'FIFA 24',59.99,4,25),(7,'NBA 2K24',69.99,4,25),(8,'Civilization VI',49.99,5,26),(9,'The Sims 4',39.99,6,25),(10,'Tetris Effect',29.99,7,29),(11,'The Witcher 3: Wild Hunt',39.99,8,26);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `PRV_id` int NOT NULL AUTO_INCREMENT,
  `PRV_nombres` varchar(100) DEFAULT NULL,
  `PRV_Sede` varchar(100) DEFAULT NULL,
  `PRV_idLocalidad` int DEFAULT NULL,
  `PRV_Direccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PRV_id`),
  KEY `PRV_idLocalidad` (`PRV_idLocalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (21,'Nintendo Co., Ltd.','Kyoto',1,'11-1 Kamitoba Hokotate-cho, Minami-ku, Kyoto, Japón'),(22,'Sony Interactive Entertainment','Tokio',2,'1-7-1 Konan, Minato-ku, Tokio, Japón'),(23,'Microsoft Corporation','Redmond',3,'One Microsoft Way, Redmond, WA, EE. UU.'),(24,'Rockstar Games','Nueva York',4,'622 Broadway, Nueva York, NY, EE. UU.'),(25,'Electronic Arts','Redwood City',5,'209 Redwood Shores Parkway, Redwood City, CA, EE. UU.'),(26,'CD Projekt','Varsovia',6,'Jagiellonska 74, Varsovia, Polonia'),(27,'Ubisoft Entertainment','París',7,'28 Rue Armand Carrel, Montreuil, Francia'),(28,'Epic Games','Cary',8,'620 Crossroads Blvd, Cary, NC, EE. UU.'),(29,'Square Enix','Shinjuku',9,'1-6-1 Yotsuya, Shinjuku, Tokio, Japón'),(30,'Activision Blizzard','Santa Mónica',10,'3100 Ocean Park Blvd, Santa Mónica, CA, EE. UU.');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_clientes_frecuentes`
--

DROP TABLE IF EXISTS `vista_clientes_frecuentes`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_frecuentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_frecuentes` AS SELECT 
 1 AS `CLT_id`,
 1 AS `CLT_Nombre`,
 1 AS `CLT_Apellido`,
 1 AS `Cantidad_Pedidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_clientes_localidad`
--

DROP TABLE IF EXISTS `vista_clientes_localidad`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_localidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_localidad` AS SELECT 
 1 AS `CLT_id`,
 1 AS `CLT_Nombre`,
 1 AS `CLT_Apellido`,
 1 AS `CLT_Telefono`,
 1 AS `CLT_Direccion`,
 1 AS `Localidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pedidos_detalles`
--

DROP TABLE IF EXISTS `vista_pedidos_detalles`;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_detalles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pedidos_detalles` AS SELECT 
 1 AS `PED_id`,
 1 AS `PED_FechaPedido`,
 1 AS `CLT_Nombre`,
 1 AS `CLT_Apellido`,
 1 AS `PRO_Nombre`,
 1 AS `PRO_Precio`,
 1 AS `Categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pedidos_por_cliente`
--

DROP TABLE IF EXISTS `vista_pedidos_por_cliente`;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_por_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pedidos_por_cliente` AS SELECT 
 1 AS `ClienteID`,
 1 AS `ClienteNombre`,
 1 AS `PedidoID`,
 1 AS `FechaPedido`,
 1 AS `TotalGastado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_categorias`
--

DROP TABLE IF EXISTS `vista_productos_categorias`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_categorias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_categorias` AS SELECT 
 1 AS `PRO_id`,
 1 AS `PRO_Nombre`,
 1 AS `PRO_Precio`,
 1 AS `Categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_mas_pedidos`
--

DROP TABLE IF EXISTS `vista_productos_mas_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_mas_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_mas_pedidos` AS SELECT 
 1 AS `PRO_id`,
 1 AS `PRO_Nombre`,
 1 AS `Cantidad_Pedidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_vendidos`
--

DROP TABLE IF EXISTS `vista_productos_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_vendidos` AS SELECT 
 1 AS `ProductoID`,
 1 AS `ProductoNombre`,
 1 AS `PrecioUnitario`,
 1 AS `TotalVendidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_resumen_pedidos`
--

DROP TABLE IF EXISTS `vista_resumen_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_resumen_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_resumen_pedidos` AS SELECT 
 1 AS `PedidoID`,
 1 AS `ClienteID`,
 1 AS `ClienteNombre`,
 1 AS `EmpleadoID`,
 1 AS `EmpleadoNombre`,
 1 AS `FechaPedido`,
 1 AS `TotalVenta`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'negocio_juegos'
--

--
-- Dumping routines for database 'negocio_juegos'
--
/*!50003 DROP FUNCTION IF EXISTS `cantidad_pedidos_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad_pedidos_producto`(producto_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    
    SELECT IFNULL(COUNT(*), 0) INTO cantidad
    FROM pedidos
    WHERE PED_idProducto = producto_id;

    RETURN cantidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_gastado_por_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_gastado_por_cliente`(cliente_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT IFNULL(SUM(pr.PRO_Precio), 0) INTO total
    FROM pedidos p
    JOIN productos pr ON p.PED_idProducto = pr.PRO_id
    WHERE p.PED_idCliente = cliente_id;

    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Total_Pedidos_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Total_Pedidos_Cliente`(cliente_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_pedidos INT;

    SELECT COUNT(*) INTO total_pedidos
    FROM Pedidos
    WHERE PED_idCliente = cliente_id;

    RETURN IFNULL(total_pedidos, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Total_Ventas_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Total_Ventas_Producto`(prod_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total_ventas DECIMAL(10,2);

    SELECT SUM(dp.DP_cantidad * pr.Precio) INTO total_ventas
    FROM detallespedidos dp
    JOIN productos pr ON dp.DP_idProductos = pr.PROD_id
    WHERE pr.PROD_id = prod_id;

    RETURN IFNULL(total_ventas, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_precio_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_precio_producto`(
    IN p_idProducto INT,
    IN p_nuevoPrecio DECIMAL(10,2)
)
BEGIN
    UPDATE productos
    SET PRO_Precio = p_nuevoPrecio
    WHERE PRO_id = p_idProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_pedido`(
    IN p_idCliente INT,
    IN p_idProducto INT,
    IN p_idEmpleado INT,
    IN p_fechaPedido DATE
)
BEGIN
    INSERT INTO pedidos (PED_idCliente, PED_idProducto, PED_idEmpleado, PED_FechaPedido)
    VALUES (p_idCliente, p_idProducto, p_idEmpleado, p_fechaPedido);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_clientes_frecuentes`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_frecuentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_frecuentes` AS select `cl`.`CLT_id` AS `CLT_id`,`cl`.`CLT_Nombre` AS `CLT_Nombre`,`cl`.`CLT_Apellido` AS `CLT_Apellido`,count(`p`.`PED_idCliente`) AS `Cantidad_Pedidos` from (`pedidos` `p` join `clientes` `cl` on((`p`.`PED_idCliente` = `cl`.`CLT_id`))) group by `cl`.`CLT_id` order by `Cantidad_Pedidos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_clientes_localidad`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_localidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_localidad` AS select `cl`.`CLT_id` AS `CLT_id`,`cl`.`CLT_Nombre` AS `CLT_Nombre`,`cl`.`CLT_Apellido` AS `CLT_Apellido`,`cl`.`CLT_Telefono` AS `CLT_Telefono`,`cl`.`CLT_Direccion` AS `CLT_Direccion`,`l`.`LOC_Localidad` AS `Localidad` from (`clientes` `cl` join `localidades` `l` on((`cl`.`CLT_idLocalidad` = `l`.`LOC_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pedidos_detalles`
--

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_detalles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pedidos_detalles` AS select `p`.`PED_id` AS `PED_id`,`p`.`PED_FechaPedido` AS `PED_FechaPedido`,`cl`.`CLT_Nombre` AS `CLT_Nombre`,`cl`.`CLT_Apellido` AS `CLT_Apellido`,`pr`.`PRO_Nombre` AS `PRO_Nombre`,`pr`.`PRO_Precio` AS `PRO_Precio`,`c`.`CAT_Nombre` AS `Categoria` from (((`pedidos` `p` join `clientes` `cl` on((`p`.`PED_idCliente` = `cl`.`CLT_id`))) join `productos` `pr` on((`p`.`PED_idProducto` = `pr`.`PRO_id`))) join `categoria` `c` on((`pr`.`PRO_idCategoria` = `c`.`CAT_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pedidos_por_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_por_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pedidos_por_cliente` AS select `c`.`CLT_id` AS `ClienteID`,concat(`c`.`CLT_Nombre`,' ',`c`.`CLT_Apellido`) AS `ClienteNombre`,`p`.`PED_id` AS `PedidoID`,`p`.`PED_FechaPedido` AS `FechaPedido`,sum((`dp`.`DP_Cantidad` * `pr`.`PRO_Precio`)) AS `TotalGastado` from (((`clientes` `c` join `pedidos` `p` on((`c`.`CLT_id` = `p`.`PED_idCliente`))) join `detallespedidos` `dp` on((`p`.`PED_id` = `dp`.`DP_idPedidos`))) join `productos` `pr` on((`dp`.`DP_idProductos` = `pr`.`PRO_id`))) group by `p`.`PED_id`,`c`.`CLT_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_categorias`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_categorias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_categorias` AS select `p`.`PRO_id` AS `PRO_id`,`p`.`PRO_Nombre` AS `PRO_Nombre`,`p`.`PRO_Precio` AS `PRO_Precio`,`c`.`CAT_Nombre` AS `Categoria` from (`productos` `p` join `categoria` `c` on((`p`.`PRO_idCategoria` = `c`.`CAT_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_mas_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_mas_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_mas_pedidos` AS select `pr`.`PRO_id` AS `PRO_id`,`pr`.`PRO_Nombre` AS `PRO_Nombre`,count(`p`.`PED_idProducto`) AS `Cantidad_Pedidos` from (`pedidos` `p` join `productos` `pr` on((`p`.`PED_idProducto` = `pr`.`PRO_id`))) group by `pr`.`PRO_id` order by `Cantidad_Pedidos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_vendidos` AS select `pr`.`PRO_id` AS `ProductoID`,`pr`.`PRO_Nombre` AS `ProductoNombre`,`pr`.`PRO_Precio` AS `PrecioUnitario`,sum(`dp`.`DP_Cantidad`) AS `TotalVendidos` from (`productos` `pr` join `detallespedidos` `dp` on((`pr`.`PRO_id` = `dp`.`DP_idProductos`))) group by `pr`.`PRO_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_resumen_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_resumen_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_resumen_pedidos` AS select `p`.`PED_id` AS `PedidoID`,`c`.`CLT_id` AS `ClienteID`,concat(`c`.`CLT_Nombre`,' ',`c`.`CLT_Apellido`) AS `ClienteNombre`,`e`.`EMP_id` AS `EmpleadoID`,concat(`e`.`EMP_Nombre`,' ',`e`.`EMP_Apellido`) AS `EmpleadoNombre`,`p`.`PED_FechaPedido` AS `FechaPedido`,sum((`dp`.`DP_Cantidad` * `pr`.`PRO_Precio`)) AS `TotalVenta` from ((((`pedidos` `p` join `clientes` `c` on((`p`.`PED_idCliente` = `c`.`CLT_id`))) join `empleados` `e` on((`p`.`PED_idEmpleado` = `e`.`EMP_id`))) join `detallespedidos` `dp` on((`p`.`PED_id` = `dp`.`DP_idPedidos`))) join `productos` `pr` on((`dp`.`DP_idProductos` = `pr`.`PRO_id`))) group by `p`.`PED_id` */;
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

-- Dump completed on 2024-11-04 18:32:50
