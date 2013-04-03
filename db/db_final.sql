-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.24-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-04-02 19:51:10
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_item_bloque: ~90 rows (approximately)
/*!40000 ALTER TABLE `plc_item_bloque` DISABLE KEYS */;
INSERT INTO `plc_item_bloque` (`id`, `n_bloque`, `id_grupo_opc`, `d_item_opc`, `id_item_tipo_proceso`) VALUES
	(1, 1, 1, 'MicroWin.1200.Bloque1.OF_PRODUCTO', 4),
	(2, 1, 1, 'MicroWin.1200.Bloque1.OF_USER', 8),
	(3, 1, 1, 'MicroWin.1200.Bloque1.OF_LOTE', 6),
	(4, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_IN - AÑO', 20),
	(5, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_IN - MES', 21),
	(6, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_IN - DIA', 22),
	(7, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_IN - HORA', 23),
	(8, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_IN - MIN', 24),
	(9, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_IN - SEG', 25),
	(10, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M1 - AÑO', 26),
	(11, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M1 - MES', 27),
	(12, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M1 - DIA', 28),
	(13, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M1 - HORA', 29),
	(14, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M1 - MIN', 30),
	(15, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M1 - SEG', 31),
	(16, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M2 - AÑO', 32),
	(17, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M2 - MES', 33),
	(18, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M2 - DIA', 34),
	(19, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M2 - HORA', 35),
	(20, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M2 - MIN', 36),
	(21, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M2 - SEG', 37),
	(22, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C1 - AÑO', 38),
	(23, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C1 - MES', 39),
	(24, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C1 - DIA', 40),
	(25, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C1 - HORA', 41),
	(26, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C1 - MIN', 42),
	(27, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C1 - SEG', 43),
	(28, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C2 - AÑO', 44),
	(29, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C2 - MES', 45),
	(30, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C2 - DIA', 46),
	(31, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C2 - HORA', 47),
	(32, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C2 - MIN', 48),
	(33, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_C2 - SEG', 49),
	(34, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D1 - AÑO', 50),
	(35, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D1 - MES', 51),
	(36, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D1 - DIA', 52),
	(37, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D1 - HORA', 53),
	(38, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D1 - MIN', 54),
	(39, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D1 - SEG', 55),
	(40, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D2 - AÑO', 56),
	(41, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D2 - MES', 57),
	(42, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D2 - DIA', 58),
	(43, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D2 - HORA', 59),
	(44, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D2 - MIN', 60),
	(45, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_D2 - SEG', 61),
	(46, 2, 2, 'MicroWin.1200.Bloque2.OF_PRODUCTO', 4),
	(47, 2, 2, 'MicroWin.1200.Bloque2.OF_USER', 8),
	(48, 2, 2, 'MicroWin.1200.Bloque2.OF_LOTE', 6),
	(49, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_IN - AÑO', 20),
	(50, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_IN - MES', 21),
	(51, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_IN - DIA', 22),
	(52, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_IN - HORA', 23),
	(53, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_IN - MIN', 24),
	(54, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_IN - SEG', 25),
	(55, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M1 - AÑO', 26),
	(56, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M1 - MES', 27),
	(57, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M1 - DIA', 28),
	(58, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M1 - HORA', 29),
	(59, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M1 - MIN', 30),
	(60, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M1 - SEG', 31),
	(61, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M2 - AÑO', 32),
	(62, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M2 - MES', 33),
	(63, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M2 - DIA', 34),
	(64, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M2 - HORA', 35),
	(65, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M2 - MIN', 36),
	(66, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M2 - SEG', 37),
	(67, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C1 - AÑO', 38),
	(68, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C1 - MES', 39),
	(69, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C1 - DIA', 40),
	(70, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C1 - HORA', 41),
	(71, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C1 - MIN', 42),
	(72, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C1 - SEG', 43),
	(73, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C2 - AÑO', 44),
	(74, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C2 - MES', 45),
	(75, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C2 - DIA', 46),
	(76, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C2 - HORA', 47),
	(77, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C2 - MIN', 48),
	(78, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_C2 - SEG', 49),
	(79, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D1 - AÑO', 50),
	(80, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D1 - MES', 51),
	(81, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D1 - DIA', 52),
	(82, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D1 - HORA', 53),
	(83, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D1 - MIN', 54),
	(84, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D1 - SEG', 55),
	(85, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D2 - AÑO', 56),
	(86, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D2 - MES', 57),
	(87, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D2 - DIA', 58),
	(88, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D2 - HORA', 59),
	(89, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D2 - MIN', 60),
	(90, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_D2 - SEG', 61);
/*!40000 ALTER TABLE `plc_item_bloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_item_control
CREATE TABLE IF NOT EXISTS `plc_item_control` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_grupo_opc` varchar(50) NOT NULL,
  `d_item_opc` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_item_control: ~3 rows (approximately)
/*!40000 ALTER TABLE `plc_item_control` DISABLE KEYS */;
INSERT INTO `plc_item_control` (`id`, `d_grupo_opc`, `d_item_opc`) VALUES
	(1, 'Control', 'MicroWin.1200.Control.OL'),
	(2, 'Control', 'MicroWin.1200.Control.RE'),
	(3, 'Control', 'MicroWin.1200.Control.MP');
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

-- Dumping data for table plc.plc_item_tipo_proceso: ~45 rows (approximately)
/*!40000 ALTER TABLE `plc_item_tipo_proceso` DISABLE KEYS */;
INSERT INTO `plc_item_tipo_proceso` (`id`, `id_tipo_proceso`, `n_item`, `d_item`, `id_tipo_dato`) VALUES
	(4, 1, 1, 'Nombre producto', 1),
	(6, 1, 2, 'Nro Lote', 1),
	(8, 1, 3, 'Nombre operario', 1),
	(20, 1, 4, 'Inicio de proceso - Año', 4),
	(21, 1, 5, 'Inicio de proceso - Mes', 4),
	(22, 1, 6, 'Inicio de proceso - Día', 4),
	(23, 1, 7, 'Inicio de proceso - Hora', 4),
	(24, 1, 8, 'Inicio de proceso - Minuto', 4),
	(25, 1, 9, 'Inicio de proceso - Segundo', 4),
	(26, 1, 10, 'Fin mezclador velocidad 1 - Año', 4),
	(27, 1, 11, 'Fin mezclador velocidad 1 - Mes', 4),
	(28, 1, 12, 'Fin mezclador velocidad 1 - Día', 4),
	(29, 1, 13, 'Fin mezclador velocidad 1 - Hora', 4),
	(30, 1, 14, 'Fin mezclador velocidad 1 - Minuto', 4),
	(31, 1, 15, 'Fin mezclador velocidad 1 - Segundo', 4),
	(32, 1, 16, 'Fin mezclador velocidad 2 - Año', 4),
	(33, 1, 17, 'Fin mezclador velocidad 2 - Mes', 4),
	(34, 1, 18, 'Fin mezclador velocidad 2 - Día', 4),
	(35, 1, 19, 'Fin mezclador velocidad 2 - Hora', 4),
	(36, 1, 20, 'Fin mezclador velocidad 2 - Minuto', 4),
	(37, 1, 21, 'Fin mezclador velocidad 2 - Segundo', 4),
	(38, 1, 22, 'Fin chopper velocidad 1 - Año', 4),
	(39, 1, 23, 'Fin chopper velocidad 1 - Mes', 4),
	(40, 1, 24, 'Fin chopper velocidad 1 - Día', 4),
	(41, 1, 25, 'Fin chopper velocidad 1 - Hora', 4),
	(42, 1, 26, 'Fin chopper velocidad 1 - Minuto', 4),
	(43, 1, 27, 'Fin chopper velocidad 1 - Segundo', 4),
	(44, 1, 28, 'Fin chopper velocidad 2 - Año', 4),
	(45, 1, 29, 'Fin chopper velocidad 2 - Mes', 4),
	(46, 1, 30, 'Fin chopper velocidad 2 - Día', 4),
	(47, 1, 31, 'Fin chopper velocidad 2 - Hora', 4),
	(48, 1, 32, 'Fin chopper velocidad 2 - Minuto', 4),
	(49, 1, 33, 'Fin chopper velocidad 2 - Segundo', 4),
	(50, 1, 34, 'Fin ingreso disolvente 1 - Año', 4),
	(51, 1, 35, 'Fin ingreso disolvente 1 - Mes', 4),
	(52, 1, 36, 'Fin ingreso disolvente 1 - Día', 4),
	(53, 1, 37, 'Fin ingreso disolvente 1 - Hora', 4),
	(54, 1, 38, 'Fin ingreso disolvente 1 - Minuto', 4),
	(55, 1, 39, 'Fin ingreso disolvente 1 - Segundo', 4),
	(56, 1, 40, 'Fin ingreso disolvente 2 - Año', 4),
	(57, 1, 41, 'Fin ingreso disolvente 2 - Mes', 4),
	(58, 1, 42, 'Fin ingreso disolvente 2 - Día', 4),
	(59, 1, 43, 'Fin ingreso disolvente 2 - Hora', 4),
	(60, 1, 44, 'Fin ingreso disolvente 2 - Minuto', 4),
	(61, 1, 45, 'Fin ingreso disolvente 2 - Segundo', 4);
/*!40000 ALTER TABLE `plc_item_tipo_proceso` ENABLE KEYS */;


-- Dumping structure for table plc.plc_proceso
CREATE TABLE IF NOT EXISTS `plc_proceso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_tipo_proceso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proceso_tipo_proceso` (`id_tipo_proceso`),
  CONSTRAINT `fk_proceso_tipo_proceso` FOREIGN KEY (`id_tipo_proceso`) REFERENCES `plc_tipo_proceso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_proceso: ~7 rows (approximately)
/*!40000 ALTER TABLE `plc_proceso` DISABLE KEYS */;
INSERT INTO `plc_proceso` (`id`, `id_tipo_proceso`) VALUES
	(102, 1),
	(103, 1),
	(104, 1),
	(105, 1),
	(106, 1),
	(107, 1),
	(108, 1),
	(109, 1),
	(110, 1),
	(111, 1),
	(112, 1),
	(113, 1),
	(114, 1);
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
  CONSTRAINT `fk_proceso_log_item` FOREIGN KEY (`id_item`) REFERENCES `plc_item_bloque` (`id`),
  CONSTRAINT `fk_proceso_log_proceso` FOREIGN KEY (`id_proceso`) REFERENCES `plc_proceso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_proceso_log: ~315 rows (approximately)
/*!40000 ALTER TABLE `plc_proceso_log` DISABLE KEYS */;
INSERT INTO `plc_proceso_log` (`id`, `id_proceso`, `id_item`, `d_valor`) VALUES
	(1, 102, 1, '\nProducto 1\0\0\0\0\0\0\0'),
	(2, 102, 2, 'Juanrvisor\0\0\0\0\0\0\0'),
	(3, 102, 3, 'CHU123e\0\0'),
	(4, 102, 4, '2013'),
	(5, 102, 5, '4'),
	(6, 102, 6, '2'),
	(7, 102, 7, '19'),
	(8, 102, 8, '4'),
	(9, 102, 9, '28'),
	(10, 102, 10, '2013'),
	(11, 102, 11, '4'),
	(12, 102, 12, '2'),
	(13, 102, 13, '19'),
	(14, 102, 14, '4'),
	(15, 102, 15, '33'),
	(16, 102, 16, '2013'),
	(17, 102, 17, '4'),
	(18, 102, 18, '2'),
	(19, 102, 19, '19'),
	(20, 102, 20, '4'),
	(21, 102, 21, '53'),
	(22, 102, 22, '2013'),
	(23, 102, 23, '4'),
	(24, 102, 24, '2'),
	(25, 102, 25, '19'),
	(26, 102, 26, '4'),
	(27, 102, 27, '43'),
	(28, 102, 28, '2013'),
	(29, 102, 29, '4'),
	(30, 102, 30, '2'),
	(31, 102, 31, '19'),
	(32, 102, 32, '4'),
	(33, 102, 33, '58'),
	(34, 102, 34, '2013'),
	(35, 102, 35, '4'),
	(36, 102, 36, '2'),
	(37, 102, 37, '19'),
	(38, 102, 38, '4'),
	(39, 102, 39, '38'),
	(40, 102, 40, '2013'),
	(41, 102, 41, '4'),
	(42, 102, 42, '2'),
	(43, 102, 43, '19'),
	(44, 102, 44, '4'),
	(45, 102, 45, '48'),
	(46, 103, 1, '\nProducto 1\0\0\0\0\0\0\0'),
	(47, 103, 2, 'Juanrvisor\0\0\0\0\0\0\0'),
	(48, 103, 3, 'CHU124e\0\0'),
	(49, 103, 4, '2013'),
	(50, 103, 5, '4'),
	(51, 103, 6, '2'),
	(52, 103, 7, '19'),
	(53, 103, 8, '8'),
	(54, 103, 9, '51'),
	(55, 103, 10, '2013'),
	(56, 103, 11, '4'),
	(57, 103, 12, '2'),
	(58, 103, 13, '19'),
	(59, 103, 14, '8'),
	(60, 103, 15, '56'),
	(61, 103, 16, '2013'),
	(62, 103, 17, '4'),
	(63, 103, 18, '2'),
	(64, 103, 19, '19'),
	(65, 103, 20, '9'),
	(66, 103, 21, '16'),
	(67, 103, 22, '2013'),
	(68, 103, 23, '4'),
	(69, 103, 24, '2'),
	(70, 103, 25, '19'),
	(71, 103, 26, '9'),
	(72, 103, 27, '6'),
	(73, 103, 28, '2013'),
	(74, 103, 29, '4'),
	(75, 103, 30, '2'),
	(76, 103, 31, '19'),
	(77, 103, 32, '9'),
	(78, 103, 33, '21'),
	(79, 103, 34, '2013'),
	(80, 103, 35, '4'),
	(81, 103, 36, '2'),
	(82, 103, 37, '19'),
	(83, 103, 38, '9'),
	(84, 103, 39, '1'),
	(85, 103, 40, '2013'),
	(86, 103, 41, '4'),
	(87, 103, 42, '2'),
	(88, 103, 43, '19'),
	(89, 103, 44, '9'),
	(90, 103, 45, '11'),
	(91, 104, 1, '\nProducto 1\0\0\0\0\0\0\0'),
	(92, 104, 2, 'Juan\0\0\0\0\0\0\0\0\0\0\0\0\0'),
	(93, 104, 3, 'EZE44\0\0\0\0'),
	(94, 104, 4, '2013'),
	(95, 104, 5, '4'),
	(96, 104, 6, '2'),
	(97, 104, 7, '19'),
	(98, 104, 8, '18'),
	(99, 104, 9, '1'),
	(100, 104, 10, '2013'),
	(101, 104, 11, '4'),
	(102, 104, 12, '2'),
	(103, 104, 13, '19'),
	(104, 104, 14, '18'),
	(105, 104, 15, '6'),
	(106, 104, 16, '2013'),
	(107, 104, 17, '4'),
	(108, 104, 18, '2'),
	(109, 104, 19, '19'),
	(110, 104, 20, '18'),
	(111, 104, 21, '26'),
	(112, 104, 22, '2013'),
	(113, 104, 23, '4'),
	(114, 104, 24, '2'),
	(115, 104, 25, '19'),
	(116, 104, 26, '18'),
	(117, 104, 27, '16'),
	(118, 104, 28, '2013'),
	(119, 104, 29, '4'),
	(120, 104, 30, '2'),
	(121, 104, 31, '19'),
	(122, 104, 32, '18'),
	(123, 104, 33, '31'),
	(124, 104, 34, '2013'),
	(125, 104, 35, '4'),
	(126, 104, 36, '2'),
	(127, 104, 37, '19'),
	(128, 104, 38, '18'),
	(129, 104, 39, '11'),
	(130, 104, 40, '2013'),
	(131, 104, 41, '4'),
	(132, 104, 42, '2'),
	(133, 104, 43, '19'),
	(134, 104, 44, '18'),
	(135, 104, 45, '21'),
	(136, 105, 1, '\nProducto 1\0\0\0\0\0\0\0'),
	(137, 105, 2, 'Juan\0\0\0\0\0\0\0\0\0\0\0\0\0'),
	(138, 105, 3, 'PEPE12\0\0\0'),
	(139, 105, 4, '2013'),
	(140, 105, 5, '4'),
	(141, 105, 6, '2'),
	(142, 105, 7, '19'),
	(143, 105, 8, '22'),
	(144, 105, 9, '5'),
	(145, 105, 10, '2013'),
	(146, 105, 11, '4'),
	(147, 105, 12, '2'),
	(148, 105, 13, '19'),
	(149, 105, 14, '22'),
	(150, 105, 15, '10'),
	(151, 105, 16, '2013'),
	(152, 105, 17, '4'),
	(153, 105, 18, '2'),
	(154, 105, 19, '19'),
	(155, 105, 20, '22'),
	(156, 105, 21, '30'),
	(157, 105, 22, '2013'),
	(158, 105, 23, '4'),
	(159, 105, 24, '2'),
	(160, 105, 25, '19'),
	(161, 105, 26, '22'),
	(162, 105, 27, '20'),
	(163, 105, 28, '2013'),
	(164, 105, 29, '4'),
	(165, 105, 30, '2'),
	(166, 105, 31, '19'),
	(167, 105, 32, '22'),
	(168, 105, 33, '35'),
	(169, 105, 34, '2013'),
	(170, 105, 35, '4'),
	(171, 105, 36, '2'),
	(172, 105, 37, '19'),
	(173, 105, 38, '22'),
	(174, 105, 39, '15'),
	(175, 105, 40, '2013'),
	(176, 105, 41, '4'),
	(177, 105, 42, '2'),
	(178, 105, 43, '19'),
	(179, 105, 44, '22'),
	(180, 105, 45, '25'),
	(181, 106, 1, 'PEPE13to 1\0\0\0\0\0\0\0'),
	(182, 106, 2, 'Juan\0\0\0\0\0\0\0\0\0\0\0\0\0'),
	(183, 106, 3, 'PEPE12\0\0\0'),
	(184, 106, 4, '2013'),
	(185, 106, 5, '4'),
	(186, 106, 6, '2'),
	(187, 106, 7, '19'),
	(188, 106, 8, '24'),
	(189, 106, 9, '1'),
	(190, 106, 10, '2013'),
	(191, 106, 11, '4'),
	(192, 106, 12, '2'),
	(193, 106, 13, '19'),
	(194, 106, 14, '24'),
	(195, 106, 15, '6'),
	(196, 106, 16, '2013'),
	(197, 106, 17, '4'),
	(198, 106, 18, '2'),
	(199, 106, 19, '19'),
	(200, 106, 20, '24'),
	(201, 106, 21, '26'),
	(202, 106, 22, '2013'),
	(203, 106, 23, '4'),
	(204, 106, 24, '2'),
	(205, 106, 25, '19'),
	(206, 106, 26, '24'),
	(207, 106, 27, '16'),
	(208, 106, 28, '2013'),
	(209, 106, 29, '4'),
	(210, 106, 30, '2'),
	(211, 106, 31, '19'),
	(212, 106, 32, '24'),
	(213, 106, 33, '31'),
	(214, 106, 34, '2013'),
	(215, 106, 35, '4'),
	(216, 106, 36, '2'),
	(217, 106, 37, '19'),
	(218, 106, 38, '24'),
	(219, 106, 39, '11'),
	(220, 106, 40, '2013'),
	(221, 106, 41, '4'),
	(222, 106, 42, '2'),
	(223, 106, 43, '19'),
	(224, 106, 44, '24'),
	(225, 106, 45, '21'),
	(226, 107, 1, ' Producto 1\0\0\0\0\0\0'),
	(227, 107, 2, ' Juan\0\0\0\0\0\0\0\0\0\0\0\0'),
	(228, 107, 3, ' POPO33\0\0'),
	(229, 107, 4, '2013'),
	(230, 107, 5, '4'),
	(231, 107, 6, '2'),
	(232, 107, 7, '19'),
	(233, 107, 8, '30'),
	(234, 107, 9, '20'),
	(235, 107, 10, '2013'),
	(236, 107, 11, '4'),
	(237, 107, 12, '2'),
	(238, 107, 13, '19'),
	(239, 107, 14, '30'),
	(240, 107, 15, '25'),
	(241, 107, 16, '2013'),
	(242, 107, 17, '4'),
	(243, 107, 18, '2'),
	(244, 107, 19, '19'),
	(245, 107, 20, '30'),
	(246, 107, 21, '45'),
	(247, 107, 22, '2013'),
	(248, 107, 23, '4'),
	(249, 107, 24, '2'),
	(250, 107, 25, '19'),
	(251, 107, 26, '30'),
	(252, 107, 27, '35'),
	(253, 107, 28, '2013'),
	(254, 107, 29, '4'),
	(255, 107, 30, '2'),
	(256, 107, 31, '19'),
	(257, 107, 32, '30'),
	(258, 107, 33, '50'),
	(259, 107, 34, '2013'),
	(260, 107, 35, '4'),
	(261, 107, 36, '2'),
	(262, 107, 37, '19'),
	(263, 107, 38, '30'),
	(264, 107, 39, '30'),
	(265, 107, 40, '2013'),
	(266, 107, 41, '4'),
	(267, 107, 42, '2'),
	(268, 107, 43, '19'),
	(269, 107, 44, '30'),
	(270, 107, 45, '40'),
	(271, 108, 1, ' CHUCHEto 1\0\0\0\0\0\0'),
	(272, 108, 2, ' Juan\0\0\0\0\0\0\0\0\0\0\0\0'),
	(273, 108, 3, ' PEP133\0\0'),
	(274, 108, 4, '2013'),
	(275, 108, 5, '4'),
	(276, 108, 6, '2'),
	(277, 108, 7, '19'),
	(278, 108, 8, '32'),
	(279, 108, 9, '12'),
	(280, 108, 10, '2013'),
	(281, 108, 11, '4'),
	(282, 108, 12, '2'),
	(283, 108, 13, '19'),
	(284, 108, 14, '32'),
	(285, 108, 15, '17'),
	(286, 108, 16, '2013'),
	(287, 108, 17, '4'),
	(288, 108, 18, '2'),
	(289, 108, 19, '19'),
	(290, 108, 20, '32'),
	(291, 108, 21, '37'),
	(292, 108, 22, '2013'),
	(293, 108, 23, '4'),
	(294, 108, 24, '2'),
	(295, 108, 25, '19'),
	(296, 108, 26, '32'),
	(297, 108, 27, '27'),
	(298, 108, 28, '2013'),
	(299, 108, 29, '4'),
	(300, 108, 30, '2'),
	(301, 108, 31, '19'),
	(302, 108, 32, '32'),
	(303, 108, 33, '42'),
	(304, 108, 34, '2013'),
	(305, 108, 35, '4'),
	(306, 108, 36, '2'),
	(307, 108, 37, '19'),
	(308, 108, 38, '32'),
	(309, 108, 39, '22'),
	(310, 108, 40, '2013'),
	(311, 108, 41, '4'),
	(312, 108, 42, '2'),
	(313, 108, 43, '19'),
	(314, 108, 44, '32'),
	(315, 108, 45, '32'),
	(316, 109, 1, ' CHUCHE'),
	(317, 110, 1, 'Producto 1'),
	(318, 110, 2, 'Juan'),
	(319, 111, 1, 'Producto 1'),
	(320, 111, 3, 'N° Lote'),
	(321, 111, 2, 'Juan'),
	(322, 111, 4, '2013'),
	(323, 111, 5, '4'),
	(324, 111, 6, '2'),
	(325, 111, 7, '19'),
	(326, 111, 8, '45'),
	(327, 111, 9, '19'),
	(328, 111, 10, '2013'),
	(329, 111, 11, '4'),
	(330, 111, 12, '2'),
	(331, 111, 13, '19'),
	(332, 111, 14, '45'),
	(333, 111, 15, '24'),
	(334, 111, 16, '2013'),
	(335, 111, 17, '4'),
	(336, 111, 18, '2'),
	(337, 111, 19, '19'),
	(338, 111, 20, '45'),
	(339, 111, 21, '44'),
	(340, 111, 22, '2013'),
	(341, 111, 23, '4'),
	(342, 111, 24, '2'),
	(343, 111, 25, '19'),
	(344, 111, 26, '45'),
	(345, 111, 27, '34'),
	(346, 111, 28, '2013'),
	(347, 111, 29, '4'),
	(348, 111, 30, '2'),
	(349, 111, 31, '19'),
	(350, 111, 32, '45'),
	(351, 111, 33, '49'),
	(352, 111, 34, '2013'),
	(353, 111, 35, '4'),
	(354, 111, 36, '2'),
	(355, 111, 37, '19'),
	(356, 111, 38, '45'),
	(357, 111, 39, '29'),
	(358, 111, 40, '2013'),
	(359, 111, 41, '4'),
	(360, 111, 42, '2'),
	(361, 111, 43, '19'),
	(362, 111, 44, '45'),
	(363, 111, 45, '39'),
	(364, 112, 1, 'DIEGO'),
	(365, 112, 3, 'PA12'),
	(366, 112, 2, 'Juan'),
	(367, 112, 4, '2013'),
	(368, 112, 5, '4'),
	(369, 112, 6, '2'),
	(370, 112, 7, '19'),
	(371, 112, 8, '49'),
	(372, 112, 9, '8'),
	(373, 112, 10, '2013'),
	(374, 112, 11, '4'),
	(375, 112, 12, '2'),
	(376, 112, 13, '19'),
	(377, 112, 14, '49'),
	(378, 112, 15, '13'),
	(379, 112, 16, '2013'),
	(380, 112, 17, '4'),
	(381, 112, 18, '2'),
	(382, 112, 19, '19'),
	(383, 112, 20, '49'),
	(384, 112, 21, '33'),
	(385, 112, 22, '2013'),
	(386, 112, 23, '4'),
	(387, 112, 24, '2'),
	(388, 112, 25, '19'),
	(389, 112, 26, '49'),
	(390, 112, 27, '23'),
	(391, 112, 28, '2013'),
	(392, 112, 29, '4'),
	(393, 112, 30, '2'),
	(394, 112, 31, '19'),
	(395, 112, 32, '49'),
	(396, 112, 33, '38'),
	(397, 112, 34, '2013'),
	(398, 112, 35, '4'),
	(399, 112, 36, '2'),
	(400, 112, 37, '19'),
	(401, 112, 38, '49'),
	(402, 112, 39, '18'),
	(403, 112, 40, '2013'),
	(404, 112, 41, '4'),
	(405, 112, 42, '2'),
	(406, 112, 43, '19'),
	(407, 112, 44, '49'),
	(408, 112, 45, '28'),
	(409, 113, 46, 'Producto 2'),
	(410, 113, 48, 'OED'),
	(411, 113, 47, 'Juan'),
	(412, 113, 49, '2013'),
	(413, 113, 50, '4'),
	(414, 113, 51, '2'),
	(415, 113, 52, '19'),
	(416, 113, 53, '51'),
	(417, 113, 54, '58'),
	(418, 113, 55, '2013'),
	(419, 113, 56, '4'),
	(420, 113, 57, '2'),
	(421, 113, 58, '19'),
	(422, 113, 59, '52'),
	(423, 113, 60, '8'),
	(424, 113, 61, '2013'),
	(425, 113, 62, '4'),
	(426, 113, 63, '2'),
	(427, 113, 64, '19'),
	(428, 113, 65, '52'),
	(429, 113, 66, '48'),
	(430, 113, 67, '2013'),
	(431, 113, 68, '4'),
	(432, 113, 69, '2'),
	(433, 113, 70, '19'),
	(434, 113, 71, '52'),
	(435, 113, 72, '28'),
	(436, 113, 73, '2013'),
	(437, 113, 74, '4'),
	(438, 113, 75, '2'),
	(439, 113, 76, '19'),
	(440, 113, 77, '52'),
	(441, 113, 78, '58'),
	(442, 113, 79, '2013'),
	(443, 113, 80, '4'),
	(444, 113, 81, '2'),
	(445, 113, 82, '19'),
	(446, 113, 83, '52'),
	(447, 113, 84, '18'),
	(448, 113, 85, '2013'),
	(449, 113, 86, '4'),
	(450, 113, 87, '2'),
	(451, 113, 88, '19'),
	(452, 113, 89, '52'),
	(453, 113, 90, '38'),
	(454, 114, 1, 'DIEGO'),
	(455, 114, 3, 'PA12'),
	(456, 114, 2, 'Juan'),
	(457, 114, 4, '2013'),
	(458, 114, 5, '4'),
	(459, 114, 6, '2'),
	(460, 114, 7, '19'),
	(461, 114, 8, '50'),
	(462, 114, 9, '49'),
	(463, 114, 10, '2013'),
	(464, 114, 11, '4'),
	(465, 114, 12, '2'),
	(466, 114, 13, '19'),
	(467, 114, 14, '50'),
	(468, 114, 15, '54'),
	(469, 114, 16, '2013'),
	(470, 114, 17, '4'),
	(471, 114, 18, '2'),
	(472, 114, 19, '19'),
	(473, 114, 20, '51'),
	(474, 114, 21, '14'),
	(475, 114, 22, '2013'),
	(476, 114, 23, '4'),
	(477, 114, 24, '2'),
	(478, 114, 25, '19'),
	(479, 114, 26, '51'),
	(480, 114, 27, '4'),
	(481, 114, 28, '2013'),
	(482, 114, 29, '4'),
	(483, 114, 30, '2'),
	(484, 114, 31, '19'),
	(485, 114, 32, '51'),
	(486, 114, 33, '19'),
	(487, 114, 34, '2013'),
	(488, 114, 35, '4'),
	(489, 114, 36, '2'),
	(490, 114, 37, '19'),
	(491, 114, 38, '50'),
	(492, 114, 39, '59'),
	(493, 114, 40, '2013'),
	(494, 114, 41, '4'),
	(495, 114, 42, '2'),
	(496, 114, 43, '19'),
	(497, 114, 44, '51'),
	(498, 114, 45, '9');
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
join plc_item_tipo_proceso itp on ib.id_item_tipo_proceso = itp.id 
order by id_proceso, n_item ;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
