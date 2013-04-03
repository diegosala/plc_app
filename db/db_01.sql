-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.24-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-04-02 17:31:00
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

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

-- Dumping data for table plc.plc_item_bloque: ~3 rows (approximately)
/*!40000 ALTER TABLE `plc_item_bloque` DISABLE KEYS */;
INSERT INTO `plc_item_bloque` (`id`, `n_bloque`, `id_grupo_opc`, `d_item_opc`, `id_item_tipo_proceso`) VALUES
	(1, 1, 1, 'PLC.Bloque1.NombreProducto', 4),
	(2, 1, 1, 'PLC.Bloque1.NumeroLote', 6),
	(5, 1, 1, 'PLC.Bloque1.NombreOperario', 8);
/*!40000 ALTER TABLE `plc_item_bloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_item_control
CREATE TABLE IF NOT EXISTS `plc_item_control` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_grupo_opc` varchar(50) NOT NULL,
  `d_item_opc` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_item_control: ~0 rows (approximately)
/*!40000 ALTER TABLE `plc_item_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `plc_item_control` ENABLE KEYS */;


-- Dumping structure for table plc.plc_item_tipo_proceso
CREATE TABLE IF NOT EXISTS `plc_item_tipo_proceso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_tipo_proceso` int(10) NOT NULL DEFAULT '1',
  `n_item` int(10) NOT NULL,
  `d_item` varchar(50) NOT NULL,
  `id_tipo_dato` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_tipo_proceso_n_item` (`id_tipo_proceso`,`n_item`),
  KEY `fk_item_tipo_proceso_tipo_dato` (`id_tipo_dato`),
  CONSTRAINT `fk_item_tipo_proceso_tipo_dato` FOREIGN KEY (`id_tipo_dato`) REFERENCES `plc_tipo_dato` (`id`),
  CONSTRAINT `fk_item_tipo_proceso_tipo_proceso` FOREIGN KEY (`id_tipo_proceso`) REFERENCES `plc_tipo_proceso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_item_tipo_proceso: ~3 rows (approximately)
/*!40000 ALTER TABLE `plc_item_tipo_proceso` DISABLE KEYS */;
INSERT INTO `plc_item_tipo_proceso` (`id`, `id_tipo_proceso`, `n_item`, `d_item`, `id_tipo_dato`) VALUES
	(4, 1, 1, 'Nombre producto', 1),
	(6, 1, 2, 'Nro Lote', 4),
	(8, 1, 3, 'Nombre operario', 1),
	(20, 1, 4, 'Inicio de proceso - Año', 1),
	(21, 1, 5, 'Inicio de proceso - Mes', 1),
	(22, 1, 6, 'Inicio de proceso - Día', 1),
	(23, 1, 7, 'Inicio de proceso - Hora', 1),
	(24, 1, 8, 'Inicio de proceso - Minuto', 1),
	(25, 1, 9, 'Inicio de proceso - Segundo', 1),
	(26, 1, 10, 'Fin mezclador velocidad 1 - Año', 1),
	(27, 1, 11, 'Fin mezclador velocidad 1 - Mes', 1),
	(28, 1, 12, 'Fin mezclador velocidad 1 - Día', 1),
	(29, 1, 13, 'Fin mezclador velocidad 1 - Hora', 1),
	(30, 1, 14, 'Fin mezclador velocidad 1 - Minuto', 1),
	(31, 1, 15, 'Fin mezclador velocidad 1 - Segundo', 1),
	(32, 1, 16, 'Fin mezclador velocidad 2 - Año', 1),
	(33, 1, 17, 'Fin mezclador velocidad 2 - Mes', 1),
	(34, 1, 18, 'Fin mezclador velocidad 2 - Día', 1),
	(35, 1, 19, 'Fin mezclador velocidad 2 - Hora', 1),
	(36, 1, 20, 'Fin mezclador velocidad 2 - Minuto', 1),
	(37, 1, 21, 'Fin mezclador velocidad 2 - Segundo', 1),
	(38, 1, 22, 'Fin chopper velocidad 1 - Año', 1),
	(39, 1, 23, 'Fin chopper velocidad 1 - Mes', 1),
	(40, 1, 24, 'Fin chopper velocidad 1 - Día', 1),
	(41, 1, 25, 'Fin chopper velocidad 1 - Hora', 1),
	(42, 1, 26, 'Fin chopper velocidad 1 - Minuto', 1),
	(43, 1, 27, 'Fin chopper velocidad 1 - Segundo', 1),
	(44, 1, 28, 'Fin chopper velocidad 2 - Año', 1),
	(45, 1, 29, 'Fin chopper velocidad 2 - Mes', 1),
	(46, 1, 30, 'Fin chopper velocidad 2 - Día', 1),
	(47, 1, 31, 'Fin chopper velocidad 2 - Hora', 1),
	(48, 1, 32, 'Fin chopper velocidad 2 - Minuto', 1),
	(49, 1, 33, 'Fin chopper velocidad 2 - Segundo', 1),
	(50, 1, 34, 'Fin ingreso disolvente 1 - Año', 1),
	(51, 1, 35, 'Fin ingreso disolvente 1 - Mes', 1),
	(52, 1, 36, 'Fin ingreso disolvente 1 - Día', 1),
	(53, 1, 37, 'Fin ingreso disolvente 1 - Hora', 1),
	(54, 1, 38, 'Fin ingreso disolvente 1 - Minuto', 1),
	(55, 1, 39, 'Fin ingreso disolvente 1 - Segundo', 1),
	(56, 1, 40, 'Fin ingreso disolvente 2 - Año', 1),
	(57, 1, 41, 'Fin ingreso disolvente 2 - Mes', 1),
	(58, 1, 42, 'Fin ingreso disolvente 2 - Día', 1),
	(59, 1, 43, 'Fin ingreso disolvente 2 - Hora', 1),
	(60, 1, 44, 'Fin ingreso disolvente 2 - Minuto', 1),
	(61, 1, 45, 'Fin ingreso disolvente 2 - Segundo', 1);
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
  CONSTRAINT `fk_proceso_log_item` FOREIGN KEY (`id_item`) REFERENCES `plc_item_tipo_proceso` (`id`),
  CONSTRAINT `fk_proceso_log_proceso` FOREIGN KEY (`id_proceso`) REFERENCES `plc_proceso` (`id`)
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


-- Dumping structure for view plc.v_proceso
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_proceso` (
	`id_proceso` INT(10) NOT NULL DEFAULT '0',
	`n_item` INT(10) NOT NULL,
	`d_item` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`d_valor` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view plc.v_proceso
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_proceso`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_proceso` AS select p.id id_proceso, itp.n_item, itp.d_item, pl.d_valor
from plc_proceso p
join plc_proceso_log pl on pl.id_proceso = p.id
join plc_item_bloque ib on ib.id = pl.id_item
join plc_item_tipo_proceso itp on ib.id_item_tipo_proceso = itp.id ;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
