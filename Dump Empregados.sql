CREATE DATABASE  IF NOT EXISTS `empregados` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `empregados`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: empregados
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `nome` varchar(50) DEFAULT NULL,
  `numero` int NOT NULL AUTO_INCREMENT,
  `cpf_gerente` bigint DEFAULT NULL,
  `data_inicio_gerente` date DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `cpf_gerente` (`cpf_gerente`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`cpf_gerente`) REFERENCES `empregado` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES ('research',5,333445555,'1988-05-22');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependente` (
  `cpf_empregados` bigint NOT NULL AUTO_INCREMENT,
  `nome_dependente` varchar(50) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `relacionamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cpf_empregados`),
  CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`cpf_empregados`) REFERENCES `empregado` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=333445556 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (333445555,'Alice','f','1986-04-05','filha');
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregado`
--

DROP TABLE IF EXISTS `empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empregado` (
  `nome` varchar(50) DEFAULT NULL,
  `incial_meio` char(1) DEFAULT NULL,
  `sobrenome` varchar(50) DEFAULT NULL,
  `cpf` bigint NOT NULL AUTO_INCREMENT,
  `data_nasc` date DEFAULT NULL,
  `endereço` varchar(50) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `salario` decimal(10,0) DEFAULT NULL,
  `cpf_gerente` bigint DEFAULT NULL,
  `departamento` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `cpf_gerente` (`cpf_gerente`),
  CONSTRAINT `empregado_ibfk_1` FOREIGN KEY (`cpf_gerente`) REFERENCES `empregado` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=999887778 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregado`
--

LOCK TABLES `empregado` WRITE;
/*!40000 ALTER TABLE `empregado` DISABLE KEYS */;
INSERT INTO `empregado` VALUES ('John','B','Smith',123456789,'1965-01-09','731 Fondren Houston TX','M',30000,333445555,5),('Franklin','T','Wong',333445555,'1955-12-08','638 Voss Houston TX','M',40000,888665555,5),('Joyce','A','English',453453453,'1972-07-31','5631 Rice Houston TX','F',25000,333445555,5),('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak Humble TX','M',38000,333445555,5),('James','E','Borg',888665555,'1937-11-10','450 Stone Houston TX','M',55000,NULL,1),('Jennifer','S','Wallace',987654321,'1941-06-20','291 Barry Bellaire TX','F',43000,888665555,4),('Ahmad','V','Jabarb',987987987,'1969-03-29','980 Dallas Houston TX','M',25000,987654321,4),('Alicia','J','Zelaia',999887777,'1968-01-19','3321 Castle Spring TX','F',25000,987654321,4);
/*!40000 ALTER TABLE `empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacao_departamento`
--

DROP TABLE IF EXISTS `localizacao_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacao_departamento` (
  `numero` int DEFAULT NULL,
  `localizacao` varchar(50) DEFAULT NULL,
  KEY `numero` (`numero`),
  CONSTRAINT `localizacao_departamento_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `departamento` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacao_departamento`
--

LOCK TABLES `localizacao_departamento` WRITE;
/*!40000 ALTER TABLE `localizacao_departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `localizacao_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `nome_projeto` varchar(50) DEFAULT NULL,
  `numero_projeto` int NOT NULL AUTO_INCREMENT,
  `localizacao_projeto` varchar(50) DEFAULT NULL,
  `numero_departamento` int DEFAULT NULL,
  PRIMARY KEY (`numero_projeto`),
  KEY `numero_departamento` (`numero_departamento`),
  CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`numero_departamento`) REFERENCES `departamento` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES ('projetcX',1,'Bellaire',5);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalha_em`
--

DROP TABLE IF EXISTS `trabalha_em`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabalha_em` (
  `cpf` bigint DEFAULT NULL,
  `numero_projeto` int DEFAULT NULL,
  `horas` time DEFAULT NULL,
  KEY `cpf` (`cpf`),
  KEY `numero_projeto` (`numero_projeto`),
  CONSTRAINT `trabalha_em_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `empregado` (`cpf`),
  CONSTRAINT `trabalha_em_ibfk_2` FOREIGN KEY (`numero_projeto`) REFERENCES `projeto` (`numero_projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalha_em`
--

LOCK TABLES `trabalha_em` WRITE;
/*!40000 ALTER TABLE `trabalha_em` DISABLE KEYS */;
INSERT INTO `trabalha_em` VALUES (123456789,1,'00:00:33');
/*!40000 ALTER TABLE `trabalha_em` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-06  0:18:32
