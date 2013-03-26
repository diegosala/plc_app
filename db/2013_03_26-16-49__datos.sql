-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.24-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-03-26 16:49:15
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for plc
CREATE DATABASE IF NOT EXISTS `plc` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `plc`;


-- Dumping structure for table plc.plc_grupo
CREATE TABLE IF NOT EXISTS `plc_grupo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_grupo_opc` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_grupo: ~5 rows (approximately)
/*!40000 ALTER TABLE `plc_grupo` DISABLE KEYS */;
INSERT INTO `plc_grupo` (`id`, `d_grupo_opc`) VALUES
	(1, 'Bloque1'),
	(2, 'Bloque2'),
	(3, 'Bloque3'),
	(4, 'Bloque4'),
	(5, 'Bloque5');
/*!40000 ALTER TABLE `plc_grupo` ENABLE KEYS */;


-- Dumping structure for table plc.plc_item_bloque
CREATE TABLE IF NOT EXISTS `plc_item_bloque` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `n_bloque` tinyint(4) NOT NULL,
  `id_grupo_opc` int(10) NOT NULL,
  `d_item_opc` varchar(50) NOT NULL,
  `id_item_tipo_proceso` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_bloque_item_proceso` (`id_item_tipo_proceso`),
  KEY `fk_item_bloque_grupo` (`id_grupo_opc`),
  CONSTRAINT `fk_item_bloque_grupo` FOREIGN KEY (`id_grupo_opc`) REFERENCES `plc_grupo` (`id`),
  CONSTRAINT `fk_item_bloque_item_proceso` FOREIGN KEY (`id_item_tipo_proceso`) REFERENCES `plc_item_tipo_proceso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_item_bloque: ~4 rows (approximately)
/*!40000 ALTER TABLE `plc_item_bloque` DISABLE KEYS */;
INSERT INTO `plc_item_bloque` (`id`, `n_bloque`, `id_grupo_opc`, `d_item_opc`, `id_item_tipo_proceso`) VALUES
	(1, 1, 1, 'PLC.Bloque1.NombreProducto', 4),
	(2, 1, 1, 'PLC.Bloque1.NumeroLote', 6),
	(5, 1, 1, 'PLC.Bloque1.NombreOperario', 8),
	(6, 1, 1, 'PLC.Bloque1.MezcadorV1', 9);
/*!40000 ALTER TABLE `plc_item_bloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_item_configuracion
CREATE TABLE IF NOT EXISTS `plc_item_configuracion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_grupo_opc` varchar(50) NOT NULL,
  `d_item_opc` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_item_configuracion: ~0 rows (approximately)
/*!40000 ALTER TABLE `plc_item_configuracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `plc_item_configuracion` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_item_tipo_proceso: ~4 rows (approximately)
/*!40000 ALTER TABLE `plc_item_tipo_proceso` DISABLE KEYS */;
INSERT INTO `plc_item_tipo_proceso` (`id`, `id_tipo_proceso`, `n_item`, `d_item`, `id_tipo_dato`) VALUES
	(4, 1, 1, 'Nombre producto', 1),
	(6, 1, 2, 'Nro Lote', 4),
	(8, 1, 3, 'Nombre operario', 1),
	(9, 1, 4, 'Mezclador Velocidad 1', 4);
/*!40000 ALTER TABLE `plc_item_tipo_proceso` ENABLE KEYS */;


-- Dumping structure for table plc.plc_proceso
CREATE TABLE IF NOT EXISTS `plc_proceso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_tipo_proceso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proceso_tipo_proceso` (`id_tipo_proceso`),
  CONSTRAINT `fk_proceso_tipo_proceso` FOREIGN KEY (`id_tipo_proceso`) REFERENCES `plc_tipo_proceso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_proceso: ~0 rows (approximately)
/*!40000 ALTER TABLE `plc_proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `plc_proceso` ENABLE KEYS */;


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

-- Dumping data for table plc.plc_proceso_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `plc_proceso_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `plc_proceso_log` ENABLE KEYS */;


-- Dumping structure for table plc.plc_tipo_dato
CREATE TABLE IF NOT EXISTS `plc_tipo_dato` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_tipo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_tipo_dato: ~4 rows (approximately)
/*!40000 ALTER TABLE `plc_tipo_dato` DISABLE KEYS */;
INSERT INTO `plc_tipo_dato` (`id`, `d_tipo`) VALUES
	(1, 'string'),
	(2, 'byte'),
	(3, 'date'),
	(4, 'int');
/*!40000 ALTER TABLE `plc_tipo_dato` ENABLE KEYS */;


-- Dumping structure for table plc.plc_tipo_proceso
CREATE TABLE IF NOT EXISTS `plc_tipo_proceso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_tipo_proceso` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_tipo_proceso: ~1 rows (approximately)
/*!40000 ALTER TABLE `plc_tipo_proceso` DISABLE KEYS */;
INSERT INTO `plc_tipo_proceso` (`id`, `d_tipo_proceso`) VALUES
	(1, 'Comun');
/*!40000 ALTER TABLE `plc_tipo_proceso` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
