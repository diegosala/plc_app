-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.24-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-03-26 14:53:12
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for plc
CREATE DATABASE IF NOT EXISTS `plc` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `plc`;


-- Dumping structure for table plc.plc_item_bloque
CREATE TABLE IF NOT EXISTS `plc_item_bloque` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `n_bloque` tinyint(4) NOT NULL,
  `d_item_opc` varchar(50) NOT NULL,
  `id_item_tipo_proceso` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_bloque_item_proceso` (`id_item_tipo_proceso`),
  CONSTRAINT `fk_item_bloque_item_proceso` FOREIGN KEY (`id_item_tipo_proceso`) REFERENCES `plc_item_tipo_proceso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table plc.plc_item_configuracion
CREATE TABLE IF NOT EXISTS `plc_item_configuracion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_item_opc` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table plc.plc_item_tipo_proceso
CREATE TABLE IF NOT EXISTS `plc_item_tipo_proceso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_tipo_proceso` int(10) NOT NULL,
  `n_item` int(10) NOT NULL,
  `d_item` varchar(50) NOT NULL,
  `id_tipo_dato` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_tipo_proceso_n_item` (`id_tipo_proceso`,`n_item`),
  KEY `fk_item_tipo_proceso_tipo_dato` (`id_tipo_dato`),
  CONSTRAINT `fk_item_tipo_proceso_tipo_dato` FOREIGN KEY (`id_tipo_dato`) REFERENCES `plc_tipo_dato` (`id`),
  CONSTRAINT `fk_item_tipo_proceso_tipo_proceso` FOREIGN KEY (`id_tipo_proceso`) REFERENCES `plc_tipo_proceso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table plc.plc_proceso
CREATE TABLE IF NOT EXISTS `plc_proceso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_tipo_proceso` int(11) NOT NULL,
  `f_inicio_log` timestamp NULL DEFAULT NULL,
  `f_fin_log` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proceso_tipo_proceso` (`id_tipo_proceso`),
  CONSTRAINT `fk_proceso_tipo_proceso` FOREIGN KEY (`id_tipo_proceso`) REFERENCES `plc_tipo_proceso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table plc.plc_proceso_log
CREATE TABLE IF NOT EXISTS `plc_proceso_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_proceso` int(10) NOT NULL,
  `id_item` int(10) NOT NULL,
  `d_valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proceso_log_proceso` (`id_proceso`),
  KEY `fk_proceso_log_item` (`id_item`),
  CONSTRAINT `fk_proceso_log_proceso` FOREIGN KEY (`id_proceso`) REFERENCES `plc_proceso` (`id`),
  CONSTRAINT `fk_proceso_log_item` FOREIGN KEY (`id_item`) REFERENCES `plc_item_tipo_proceso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table plc.plc_tipo_dato
CREATE TABLE IF NOT EXISTS `plc_tipo_dato` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_tipo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table plc.plc_tipo_proceso
CREATE TABLE IF NOT EXISTS `plc_tipo_proceso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_tipo_proceso` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
