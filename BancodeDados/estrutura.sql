-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: locadoraveiculos
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `CPF` varchar(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacao` (
  `idLocacao` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `idPagamento` int NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` date NOT NULL,
  PRIMARY KEY (`idLocacao`),
  KEY `idCliente` (`idCliente`),
  KEY `idPagamento` (`idPagamento`),
  CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `locacao_ibfk_2` FOREIGN KEY (`idPagamento`) REFERENCES `pagamento` (`idPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locacaoveiculo`
--

DROP TABLE IF EXISTS `locacaoveiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacaoveiculo` (
  `idLocacao` int NOT NULL,
  `idVeiculo` int NOT NULL,
  PRIMARY KEY (`idLocacao`,`idVeiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `locacaoveiculo_ibfk_1` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`idLocacao`),
  CONSTRAINT `locacaoveiculo_ibfk_2` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idVeiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manutencao`
--

DROP TABLE IF EXISTS `manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutencao` (
  `idManutencao` int NOT NULL AUTO_INCREMENT,
  `idVeiculo` int NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `dataManutencao` date NOT NULL,
  `custo` decimal(7,2) NOT NULL,
  PRIMARY KEY (`idManutencao`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `manutencao_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idVeiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idPagamento` int NOT NULL AUTO_INCREMENT,
  `forma` enum('Cartão','PIX','Dinheiro') NOT NULL,
  `dataPagamento` date NOT NULL,
  `valorTotal` decimal(7,2) NOT NULL,
  `estado` enum('Pago','Pendente') NOT NULL,
  PRIMARY KEY (`idPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `idVeiculo` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `ano` int NOT NULL,
  `placa` varchar(10) NOT NULL,
  `valorDiaria` decimal(7,2) NOT NULL,
  `estado` enum('Disponível','Alugado','Manutenção') NOT NULL,
  PRIMARY KEY (`idVeiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-30 22:34:03
