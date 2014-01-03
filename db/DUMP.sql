-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.24-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-01-03 00:00:59
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for plc
CREATE DATABASE IF NOT EXISTS `plc` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `plc`;


-- Dumping structure for table plc.plc_cfg_bloque
CREATE TABLE IF NOT EXISTS `plc_cfg_bloque` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `n_bloque` int(2) NOT NULL,
  `d_bloque` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_bloque: ~3 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_bloque` DISABLE KEYS */;
INSERT INTO `plc_cfg_bloque` (`id`, `n_bloque`, `d_bloque`) VALUES
	(1, 1, 'Bloque1'),
	(2, 2, 'Bloque2'),
	(3, 3, 'Bloque3');
/*!40000 ALTER TABLE `plc_cfg_bloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_cabecera
CREATE TABLE IF NOT EXISTS `plc_cfg_cabecera` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_cabecera` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_cabecera: ~3 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_cabecera` DISABLE KEYS */;
INSERT INTO `plc_cfg_cabecera` (`id`, `d_cabecera`) VALUES
	(1, 'Nombre producto'),
	(2, 'Numero Lote'),
	(3, 'Nombre operario');
/*!40000 ALTER TABLE `plc_cfg_cabecera` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_cabeceraxbloque
CREATE TABLE IF NOT EXISTS `plc_cfg_cabeceraxbloque` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_bloque` int(10) NOT NULL,
  `id_cabecera` int(10) NOT NULL,
  `d_item` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cxb_bloque` (`id_bloque`),
  KEY `fk_cxb_cabecera` (`id_cabecera`),
  CONSTRAINT `fk_cxb_bloque` FOREIGN KEY (`id_bloque`) REFERENCES `plc_cfg_bloque` (`id`),
  CONSTRAINT `fk_cxb_cabecera` FOREIGN KEY (`id_cabecera`) REFERENCES `plc_cfg_cabecera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_cabeceraxbloque: ~9 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_cabeceraxbloque` DISABLE KEYS */;
INSERT INTO `plc_cfg_cabeceraxbloque` (`id`, `id_bloque`, `id_cabecera`, `d_item`) VALUES
	(1, 1, 1, 'MicroWin.1200.Bloque1.OF_PRODUCTO'),
	(2, 1, 2, 'MicroWin.1200.Bloque1.OF_LOTE'),
	(3, 1, 3, 'MicroWin.1200.Bloque1.OF_USER'),
	(4, 2, 1, 'MicroWin.1200.Bloque2.OF_PRODUCTO'),
	(5, 2, 2, 'MicroWin.1200.Bloque2.OF_LOTE'),
	(6, 2, 3, 'MicroWin.1200.Bloque2.OF_USER'),
	(7, 3, 1, 'MicroWin.1200.Bloque3.OF_PRODUCTO'),
	(8, 3, 2, 'MicroWin.1200.Bloque3.OF_LOTE'),
	(9, 3, 3, 'MicroWin.1200.Bloque3.OF_USER');
/*!40000 ALTER TABLE `plc_cfg_cabeceraxbloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_estado
CREATE TABLE IF NOT EXISTS `plc_cfg_estado` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_estado` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_estado: ~4 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_estado` DISABLE KEYS */;
INSERT INTO `plc_cfg_estado` (`id`, `d_estado`) VALUES
	(1, 'Proceso finalizado correctamente'),
	(2, 'Proceso cancelado: parada de emergencia activada'),
	(3, 'Proceso cancelado: apertura de bowl'),
	(4, 'Proceso cancelado: error de motor');
/*!40000 ALTER TABLE `plc_cfg_estado` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_estadoxbloque
CREATE TABLE IF NOT EXISTS `plc_cfg_estadoxbloque` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_bloque` int(10) NOT NULL,
  `d_item` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estadoxbloque_bloque` (`id_bloque`),
  CONSTRAINT `fk_estadoxbloque_bloque` FOREIGN KEY (`id_bloque`) REFERENCES `plc_cfg_bloque` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_estadoxbloque: ~3 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_estadoxbloque` DISABLE KEYS */;
INSERT INTO `plc_cfg_estadoxbloque` (`id`, `id_bloque`, `d_item`) VALUES
	(1, 1, 'MicroWin.1200.Bloque1.OF_Estado_Proceso'),
	(2, 2, 'MicroWin.1200.Bloque2.OF_Estado_Proceso'),
	(3, 3, 'MicroWin.1200.Bloque3.OF_Estado_Proceso');
/*!40000 ALTER TABLE `plc_cfg_estadoxbloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_etapa
CREATE TABLE IF NOT EXISTS `plc_cfg_etapa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_etapa` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_etapa: ~8 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_etapa` DISABLE KEYS */;
INSERT INTO `plc_cfg_etapa` (`id`, `d_etapa`) VALUES
	(1, 'Mezclado Velocidad 1'),
	(2, 'Mezclado Velocidad 2'),
	(3, 'Chopper Velocidad 1'),
	(4, 'Chopper Velocidad 2'),
	(5, 'Ingreso Disolvente 1'),
	(6, 'Ingreso Disolvente 2'),
	(7, 'Mezclado Velocidad 3'),
	(8, 'Chopper Velocidad 3');
/*!40000 ALTER TABLE `plc_cfg_etapa` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_finxetapaxbloque
CREATE TABLE IF NOT EXISTS `plc_cfg_finxetapaxbloque` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_etapa` int(10) NOT NULL,
  `id_bloque` int(10) NOT NULL,
  `id_item_anio_fin` int(10) NOT NULL,
  `id_item_mes_fin` int(10) NOT NULL,
  `id_item_dia_fin` int(10) NOT NULL,
  `id_item_hora_fin` int(10) NOT NULL,
  `id_item_min_fin` int(10) NOT NULL,
  `id_item_seg_fin` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plc_cfg_txexb_etapa` (`id_etapa`),
  KEY `plc_cfg_txexb_bloque` (`id_bloque`),
  KEY `fk_cfg_txexb_i_anio` (`id_item_anio_fin`),
  KEY `fk_cfg_txexb_i_mes` (`id_item_mes_fin`),
  KEY `fk_cfg_txexb_i_dia` (`id_item_dia_fin`),
  KEY `fk_cfg_txexb_i_hora` (`id_item_hora_fin`),
  KEY `fk_cfg_txexb_i_min` (`id_item_min_fin`),
  KEY `fk_cfg_txexb_i_seg` (`id_item_seg_fin`),
  CONSTRAINT `fk_cfg_txexb_i_anio` FOREIGN KEY (`id_item_anio_fin`) REFERENCES `plc_cfg_item_fin` (`id`),
  CONSTRAINT `fk_cfg_txexb_i_dia` FOREIGN KEY (`id_item_dia_fin`) REFERENCES `plc_cfg_item_fin` (`id`),
  CONSTRAINT `fk_cfg_txexb_i_hora` FOREIGN KEY (`id_item_hora_fin`) REFERENCES `plc_cfg_item_fin` (`id`),
  CONSTRAINT `fk_cfg_txexb_i_mes` FOREIGN KEY (`id_item_mes_fin`) REFERENCES `plc_cfg_item_fin` (`id`),
  CONSTRAINT `fk_cfg_txexb_i_min` FOREIGN KEY (`id_item_min_fin`) REFERENCES `plc_cfg_item_fin` (`id`),
  CONSTRAINT `fk_cfg_txexb_i_seg` FOREIGN KEY (`id_item_seg_fin`) REFERENCES `plc_cfg_item_fin` (`id`),
  CONSTRAINT `plc_cfg_txexb_bloque` FOREIGN KEY (`id_bloque`) REFERENCES `plc_cfg_bloque` (`id`),
  CONSTRAINT `plc_cfg_txexb_etapa` FOREIGN KEY (`id_etapa`) REFERENCES `plc_cfg_etapa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_finxetapaxbloque: ~24 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_finxetapaxbloque` DISABLE KEYS */;
INSERT INTO `plc_cfg_finxetapaxbloque` (`id`, `id_etapa`, `id_bloque`, `id_item_anio_fin`, `id_item_mes_fin`, `id_item_dia_fin`, `id_item_hora_fin`, `id_item_min_fin`, `id_item_seg_fin`) VALUES
	(1, 1, 1, 1, 2, 3, 4, 5, 6),
	(2, 2, 1, 7, 8, 9, 10, 11, 12),
	(3, 3, 1, 13, 14, 15, 16, 17, 18),
	(4, 4, 1, 19, 20, 21, 22, 23, 24),
	(5, 5, 1, 25, 26, 27, 28, 29, 30),
	(6, 6, 1, 31, 32, 33, 34, 35, 36),
	(7, 1, 2, 37, 38, 39, 40, 41, 42),
	(8, 2, 2, 43, 44, 45, 46, 47, 48),
	(9, 3, 2, 49, 50, 51, 52, 53, 54),
	(10, 4, 2, 55, 56, 57, 58, 59, 60),
	(11, 5, 2, 61, 62, 63, 64, 65, 66),
	(12, 6, 2, 67, 68, 69, 70, 71, 72),
	(13, 1, 3, 73, 74, 75, 76, 77, 78),
	(14, 2, 3, 79, 80, 81, 82, 83, 84),
	(15, 3, 3, 85, 86, 87, 88, 89, 90),
	(16, 4, 3, 91, 92, 93, 94, 95, 96),
	(17, 5, 3, 97, 98, 99, 100, 101, 102),
	(18, 6, 3, 103, 104, 105, 106, 107, 108),
	(32, 7, 1, 181, 182, 183, 184, 185, 186),
	(33, 7, 2, 187, 188, 189, 190, 191, 192),
	(34, 7, 3, 193, 194, 195, 196, 197, 198),
	(35, 8, 1, 199, 200, 201, 202, 203, 204),
	(36, 8, 2, 205, 206, 207, 208, 209, 210),
	(37, 8, 3, 211, 212, 213, 214, 215, 216);
/*!40000 ALTER TABLE `plc_cfg_finxetapaxbloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_inicioxbloque
CREATE TABLE IF NOT EXISTS `plc_cfg_inicioxbloque` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_bloque` int(10) NOT NULL,
  `id_item_anio` int(10) NOT NULL,
  `id_item_mes` int(10) NOT NULL,
  `id_item_dia` int(10) NOT NULL,
  `id_item_hora` int(10) NOT NULL,
  `id_item_minuto` int(10) NOT NULL,
  `id_item_segundo` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inixblo_bloque` (`id_bloque`),
  KEY `fk_inixblo_anio` (`id_item_anio`),
  KEY `fk_inixblo_mes` (`id_item_mes`),
  KEY `fk_inixblo_dia` (`id_item_dia`),
  KEY `fk_inixblo_hora` (`id_item_hora`),
  KEY `fk_inixblo_minuto` (`id_item_minuto`),
  KEY `fk_inixblo_segundo` (`id_item_segundo`),
  CONSTRAINT `fk_inixblo_anio` FOREIGN KEY (`id_item_anio`) REFERENCES `plc_cfg_item_inicio` (`id`),
  CONSTRAINT `fk_inixblo_bloque` FOREIGN KEY (`id_bloque`) REFERENCES `plc_cfg_bloque` (`id`),
  CONSTRAINT `fk_inixblo_dia` FOREIGN KEY (`id_item_dia`) REFERENCES `plc_cfg_item_inicio` (`id`),
  CONSTRAINT `fk_inixblo_hora` FOREIGN KEY (`id_item_hora`) REFERENCES `plc_cfg_item_inicio` (`id`),
  CONSTRAINT `fk_inixblo_mes` FOREIGN KEY (`id_item_mes`) REFERENCES `plc_cfg_item_inicio` (`id`),
  CONSTRAINT `fk_inixblo_minuto` FOREIGN KEY (`id_item_minuto`) REFERENCES `plc_cfg_item_inicio` (`id`),
  CONSTRAINT `fk_inixblo_segundo` FOREIGN KEY (`id_item_segundo`) REFERENCES `plc_cfg_item_inicio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_inicioxbloque: ~3 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_inicioxbloque` DISABLE KEYS */;
INSERT INTO `plc_cfg_inicioxbloque` (`id`, `id_bloque`, `id_item_anio`, `id_item_mes`, `id_item_dia`, `id_item_hora`, `id_item_minuto`, `id_item_segundo`) VALUES
	(1, 1, 1, 2, 3, 4, 5, 6),
	(2, 2, 7, 8, 9, 10, 11, 12),
	(3, 3, 13, 14, 15, 16, 17, 18);
/*!40000 ALTER TABLE `plc_cfg_inicioxbloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_item_control
CREATE TABLE IF NOT EXISTS `plc_cfg_item_control` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_grupo_opc` varchar(50) NOT NULL,
  `d_item_opc` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_item_control: ~3 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_item_control` DISABLE KEYS */;
INSERT INTO `plc_cfg_item_control` (`id`, `d_grupo_opc`, `d_item_opc`) VALUES
	(1, 'Control', 'MicroWin.1200.Control.OL'),
	(2, 'Control', 'MicroWin.1200.Control.RE'),
	(3, 'Control', 'MicroWin.1200.Control.MP');
/*!40000 ALTER TABLE `plc_cfg_item_control` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_item_fin
CREATE TABLE IF NOT EXISTS `plc_cfg_item_fin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_item` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_item_fin: ~144 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_item_fin` DISABLE KEYS */;
INSERT INTO `plc_cfg_item_fin` (`id`, `d_item`) VALUES
	(1, 'MicroWin.1200.Bloque1.OF_HORA_M1 - AÑO'),
	(2, 'MicroWin.1200.Bloque1.OF_HORA_M1 - MES'),
	(3, 'MicroWin.1200.Bloque1.OF_HORA_M1 - DIA'),
	(4, 'MicroWin.1200.Bloque1.OF_HORA_M1 - HORA'),
	(5, 'MicroWin.1200.Bloque1.OF_HORA_M1 - MIN'),
	(6, 'MicroWin.1200.Bloque1.OF_HORA_M1 - SEG'),
	(7, 'MicroWin.1200.Bloque1.OF_HORA_M2 - AÑO'),
	(8, 'MicroWin.1200.Bloque1.OF_HORA_M2 - MES'),
	(9, 'MicroWin.1200.Bloque1.OF_HORA_M2 - DIA'),
	(10, 'MicroWin.1200.Bloque1.OF_HORA_M2 - HORA'),
	(11, 'MicroWin.1200.Bloque1.OF_HORA_M2 - MIN'),
	(12, 'MicroWin.1200.Bloque1.OF_HORA_M2 - SEG'),
	(13, 'MicroWin.1200.Bloque1.OF_HORA_C1 - AÑO'),
	(14, 'MicroWin.1200.Bloque1.OF_HORA_C1 - MES'),
	(15, 'MicroWin.1200.Bloque1.OF_HORA_C1 - DIA'),
	(16, 'MicroWin.1200.Bloque1.OF_HORA_C1 - HORA'),
	(17, 'MicroWin.1200.Bloque1.OF_HORA_C1 - MIN'),
	(18, 'MicroWin.1200.Bloque1.OF_HORA_C1 - SEG'),
	(19, 'MicroWin.1200.Bloque1.OF_HORA_C2 - AÑO'),
	(20, 'MicroWin.1200.Bloque1.OF_HORA_C2 - MES'),
	(21, 'MicroWin.1200.Bloque1.OF_HORA_C2 - DIA'),
	(22, 'MicroWin.1200.Bloque1.OF_HORA_C2 - HORA'),
	(23, 'MicroWin.1200.Bloque1.OF_HORA_C2 - MIN'),
	(24, 'MicroWin.1200.Bloque1.OF_HORA_C2 - SEG'),
	(25, 'MicroWin.1200.Bloque1.OF_HORA_D1 - AÑO'),
	(26, 'MicroWin.1200.Bloque1.OF_HORA_D1 - MES'),
	(27, 'MicroWin.1200.Bloque1.OF_HORA_D1 - DIA'),
	(28, 'MicroWin.1200.Bloque1.OF_HORA_D1 - HORA'),
	(29, 'MicroWin.1200.Bloque1.OF_HORA_D1 - MIN'),
	(30, 'MicroWin.1200.Bloque1.OF_HORA_D1 - SEG'),
	(31, 'MicroWin.1200.Bloque1.OF_HORA_D2 - AÑO'),
	(32, 'MicroWin.1200.Bloque1.OF_HORA_D2 - MES'),
	(33, 'MicroWin.1200.Bloque1.OF_HORA_D2 - DIA'),
	(34, 'MicroWin.1200.Bloque1.OF_HORA_D2 - HORA'),
	(35, 'MicroWin.1200.Bloque1.OF_HORA_D2 - MIN'),
	(36, 'MicroWin.1200.Bloque1.OF_HORA_D2 - SEG'),
	(37, 'MicroWin.1200.Bloque2.OF_HORA_M1 - AÑO'),
	(38, 'MicroWin.1200.Bloque2.OF_HORA_M1 - MES'),
	(39, 'MicroWin.1200.Bloque2.OF_HORA_M1 - DIA'),
	(40, 'MicroWin.1200.Bloque2.OF_HORA_M1 - HORA'),
	(41, 'MicroWin.1200.Bloque2.OF_HORA_M1 - MIN'),
	(42, 'MicroWin.1200.Bloque2.OF_HORA_M1 - SEG'),
	(43, 'MicroWin.1200.Bloque2.OF_HORA_M2 - AÑO'),
	(44, 'MicroWin.1200.Bloque2.OF_HORA_M2 - MES'),
	(45, 'MicroWin.1200.Bloque2.OF_HORA_M2 - DIA'),
	(46, 'MicroWin.1200.Bloque2.OF_HORA_M2 - HORA'),
	(47, 'MicroWin.1200.Bloque2.OF_HORA_M2 - MIN'),
	(48, 'MicroWin.1200.Bloque2.OF_HORA_M2 - SEG'),
	(49, 'MicroWin.1200.Bloque2.OF_HORA_C1 - AÑO'),
	(50, 'MicroWin.1200.Bloque2.OF_HORA_C1 - MES'),
	(51, 'MicroWin.1200.Bloque2.OF_HORA_C1 - DIA'),
	(52, 'MicroWin.1200.Bloque2.OF_HORA_C1 - HORA'),
	(53, 'MicroWin.1200.Bloque2.OF_HORA_C1 - MIN'),
	(54, 'MicroWin.1200.Bloque2.OF_HORA_C1 - SEG'),
	(55, 'MicroWin.1200.Bloque2.OF_HORA_C2 - AÑO'),
	(56, 'MicroWin.1200.Bloque2.OF_HORA_C2 - MES'),
	(57, 'MicroWin.1200.Bloque2.OF_HORA_C2 - DIA'),
	(58, 'MicroWin.1200.Bloque2.OF_HORA_C2 - HORA'),
	(59, 'MicroWin.1200.Bloque2.OF_HORA_C2 - MIN'),
	(60, 'MicroWin.1200.Bloque2.OF_HORA_C2 - SEG'),
	(61, 'MicroWin.1200.Bloque2.OF_HORA_D1 - AÑO'),
	(62, 'MicroWin.1200.Bloque2.OF_HORA_D1 - MES'),
	(63, 'MicroWin.1200.Bloque2.OF_HORA_D1 - DIA'),
	(64, 'MicroWin.1200.Bloque2.OF_HORA_D1 - HORA'),
	(65, 'MicroWin.1200.Bloque2.OF_HORA_D1 - MIN'),
	(66, 'MicroWin.1200.Bloque2.OF_HORA_D1 - SEG'),
	(67, 'MicroWin.1200.Bloque2.OF_HORA_D2 - AÑO'),
	(68, 'MicroWin.1200.Bloque2.OF_HORA_D2 - MES'),
	(69, 'MicroWin.1200.Bloque2.OF_HORA_D2 - DIA'),
	(70, 'MicroWin.1200.Bloque2.OF_HORA_D2 - HORA'),
	(71, 'MicroWin.1200.Bloque2.OF_HORA_D2 - MIN'),
	(72, 'MicroWin.1200.Bloque2.OF_HORA_D2 - SEG'),
	(73, 'MicroWin.1200.Bloque3.OF_HORA_M1 - AÑO'),
	(74, 'MicroWin.1200.Bloque3.OF_HORA_M1 - MES'),
	(75, 'MicroWin.1200.Bloque3.OF_HORA_M1 - DIA'),
	(76, 'MicroWin.1200.Bloque3.OF_HORA_M1 - HORA'),
	(77, 'MicroWin.1200.Bloque3.OF_HORA_M1 - MIN'),
	(78, 'MicroWin.1200.Bloque3.OF_HORA_M1 - SEG'),
	(79, 'MicroWin.1200.Bloque3.OF_HORA_M2 - AÑO'),
	(80, 'MicroWin.1200.Bloque3.OF_HORA_M2 - MES'),
	(81, 'MicroWin.1200.Bloque3.OF_HORA_M2 - DIA'),
	(82, 'MicroWin.1200.Bloque3.OF_HORA_M2 - HORA'),
	(83, 'MicroWin.1200.Bloque3.OF_HORA_M2 - MIN'),
	(84, 'MicroWin.1200.Bloque3.OF_HORA_M2 - SEG'),
	(85, 'MicroWin.1200.Bloque3.OF_HORA_C1 - AÑO'),
	(86, 'MicroWin.1200.Bloque3.OF_HORA_C1 - MES'),
	(87, 'MicroWin.1200.Bloque3.OF_HORA_C1 - DIA'),
	(88, 'MicroWin.1200.Bloque3.OF_HORA_C1 - HORA'),
	(89, 'MicroWin.1200.Bloque3.OF_HORA_C1 - MIN'),
	(90, 'MicroWin.1200.Bloque3.OF_HORA_C1 - SEG'),
	(91, 'MicroWin.1200.Bloque3.OF_HORA_C2 - AÑO'),
	(92, 'MicroWin.1200.Bloque3.OF_HORA_C2 - MES'),
	(93, 'MicroWin.1200.Bloque3.OF_HORA_C2 - DIA'),
	(94, 'MicroWin.1200.Bloque3.OF_HORA_C2 - HORA'),
	(95, 'MicroWin.1200.Bloque3.OF_HORA_C2 - MIN'),
	(96, 'MicroWin.1200.Bloque3.OF_HORA_C2 - SEG'),
	(97, 'MicroWin.1200.Bloque3.OF_HORA_D1 - AÑO'),
	(98, 'MicroWin.1200.Bloque3.OF_HORA_D1 - MES'),
	(99, 'MicroWin.1200.Bloque3.OF_HORA_D1 - DIA'),
	(100, 'MicroWin.1200.Bloque3.OF_HORA_D1 - HORA'),
	(101, 'MicroWin.1200.Bloque3.OF_HORA_D1 - MIN'),
	(102, 'MicroWin.1200.Bloque3.OF_HORA_D1 - SEG'),
	(103, 'MicroWin.1200.Bloque3.OF_HORA_D2 - AÑO'),
	(104, 'MicroWin.1200.Bloque3.OF_HORA_D2 - MES'),
	(105, 'MicroWin.1200.Bloque3.OF_HORA_D2 - DIA'),
	(106, 'MicroWin.1200.Bloque3.OF_HORA_D2 - HORA'),
	(107, 'MicroWin.1200.Bloque3.OF_HORA_D2 - MIN'),
	(108, 'MicroWin.1200.Bloque3.OF_HORA_D2 - SEG'),
	(181, 'MicroWin.1200.Bloque1.OF_HORA_M3 - AÑO'),
	(182, 'MicroWin.1200.Bloque1.OF_HORA_M3 - MES'),
	(183, 'MicroWin.1200.Bloque1.OF_HORA_M3 - DIA'),
	(184, 'MicroWin.1200.Bloque1.OF_HORA_M3 - HORA'),
	(185, 'MicroWin.1200.Bloque1.OF_HORA_M3 - MIN'),
	(186, 'MicroWin.1200.Bloque1.OF_HORA_M3 - SEG'),
	(187, 'MicroWin.1200.Bloque2.OF_HORA_M3 - AÑO'),
	(188, 'MicroWin.1200.Bloque2.OF_HORA_M3 - MES'),
	(189, 'MicroWin.1200.Bloque2.OF_HORA_M3 - DIA'),
	(190, 'MicroWin.1200.Bloque2.OF_HORA_M3 - HORA'),
	(191, 'MicroWin.1200.Bloque2.OF_HORA_M3 - MIN'),
	(192, 'MicroWin.1200.Bloque2.OF_HORA_M3 - SEG'),
	(193, 'MicroWin.1200.Bloque3.OF_HORA_M3 - AÑO'),
	(194, 'MicroWin.1200.Bloque3.OF_HORA_M3 - MES'),
	(195, 'MicroWin.1200.Bloque3.OF_HORA_M3 - DIA'),
	(196, 'MicroWin.1200.Bloque3.OF_HORA_M3 - HORA'),
	(197, 'MicroWin.1200.Bloque3.OF_HORA_M3 - MIN'),
	(198, 'MicroWin.1200.Bloque3.OF_HORA_M3 - SEG'),
	(199, 'MicroWin.1200.Bloque1.OF_HORA_C3 - AÑO'),
	(200, 'MicroWin.1200.Bloque1.OF_HORA_C3 - MES'),
	(201, 'MicroWin.1200.Bloque1.OF_HORA_C3 - DIA'),
	(202, 'MicroWin.1200.Bloque1.OF_HORA_C3 - HORA'),
	(203, 'MicroWin.1200.Bloque1.OF_HORA_C3 - MIN'),
	(204, 'MicroWin.1200.Bloque1.OF_HORA_C3 - SEG'),
	(205, 'MicroWin.1200.Bloque2.OF_HORA_C3 - AÑO'),
	(206, 'MicroWin.1200.Bloque2.OF_HORA_C3 - MES'),
	(207, 'MicroWin.1200.Bloque2.OF_HORA_C3 - DIA'),
	(208, 'MicroWin.1200.Bloque2.OF_HORA_C3 - HORA'),
	(209, 'MicroWin.1200.Bloque2.OF_HORA_C3 - MIN'),
	(210, 'MicroWin.1200.Bloque2.OF_HORA_C3 - SEG'),
	(211, 'MicroWin.1200.Bloque3.OF_HORA_C3 - AÑO'),
	(212, 'MicroWin.1200.Bloque3.OF_HORA_C3 - MES'),
	(213, 'MicroWin.1200.Bloque3.OF_HORA_C3 - DIA'),
	(214, 'MicroWin.1200.Bloque3.OF_HORA_C3 - HORA'),
	(215, 'MicroWin.1200.Bloque3.OF_HORA_C3 - MIN'),
	(216, 'MicroWin.1200.Bloque3.OF_HORA_C3 - SEG');
/*!40000 ALTER TABLE `plc_cfg_item_fin` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_item_inicio
CREATE TABLE IF NOT EXISTS `plc_cfg_item_inicio` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_item` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_item_inicio: ~18 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_item_inicio` DISABLE KEYS */;
INSERT INTO `plc_cfg_item_inicio` (`id`, `d_item`) VALUES
	(1, 'MicroWin.1200.Bloque1.OF_HORA_IN - AÑO'),
	(2, 'MicroWin.1200.Bloque1.OF_HORA_IN - MES'),
	(3, 'MicroWin.1200.Bloque1.OF_HORA_IN - DIA'),
	(4, 'MicroWin.1200.Bloque1.OF_HORA_IN - HORA'),
	(5, 'MicroWin.1200.Bloque1.OF_HORA_IN - MIN'),
	(6, 'MicroWin.1200.Bloque1.OF_HORA_IN - SEG'),
	(7, 'MicroWin.1200.Bloque2.OF_HORA_IN - AÑO'),
	(8, 'MicroWin.1200.Bloque2.OF_HORA_IN - MES'),
	(9, 'MicroWin.1200.Bloque2.OF_HORA_IN - DIA'),
	(10, 'MicroWin.1200.Bloque2.OF_HORA_IN - HORA'),
	(11, 'MicroWin.1200.Bloque2.OF_HORA_IN - MIN'),
	(12, 'MicroWin.1200.Bloque2.OF_HORA_IN - SEG'),
	(13, 'MicroWin.1200.Bloque3.OF_HORA_IN - AÑO'),
	(14, 'MicroWin.1200.Bloque3.OF_HORA_IN - MES'),
	(15, 'MicroWin.1200.Bloque3.OF_HORA_IN - DIA'),
	(16, 'MicroWin.1200.Bloque3.OF_HORA_IN - HORA'),
	(17, 'MicroWin.1200.Bloque3.OF_HORA_IN - MIN'),
	(18, 'MicroWin.1200.Bloque3.OF_HORA_IN - SEG');
/*!40000 ALTER TABLE `plc_cfg_item_inicio` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_retencion
CREATE TABLE IF NOT EXISTS `plc_cfg_retencion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_retencion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table plc.plc_cfg_retencion: ~3 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_retencion` DISABLE KEYS */;
INSERT INTO `plc_cfg_retencion` (`id`, `d_retencion`) VALUES
	(1, 'Retención C1'),
	(2, 'Retención C2'),
	(3, 'Retención C3');
/*!40000 ALTER TABLE `plc_cfg_retencion` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_retencionxbloque
CREATE TABLE IF NOT EXISTS `plc_cfg_retencionxbloque` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_retencion` int(10) NOT NULL,
  `id_bloque` int(10) NOT NULL,
  `d_item` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vxb_velocidad` (`id_retencion`),
  KEY `fk_vxb_bloque` (`id_bloque`),
  CONSTRAINT `plc_cfg_retencionxbloque_ibfk_1` FOREIGN KEY (`id_bloque`) REFERENCES `plc_cfg_bloque` (`id`),
  CONSTRAINT `plc_cfg_retencionxbloque_ibfk_2` FOREIGN KEY (`id_retencion`) REFERENCES `plc_cfg_retencion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table plc.plc_cfg_retencionxbloque: ~9 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_retencionxbloque` DISABLE KEYS */;
INSERT INTO `plc_cfg_retencionxbloque` (`id`, `id_retencion`, `id_bloque`, `d_item`) VALUES
	(1, 1, 1, 'MicroWin.1200.Bloque1.OF_RET_C1'),
	(2, 2, 1, 'MicroWin.1200.Bloque1.OF_RET_C2'),
	(3, 3, 1, 'MicroWin.1200.Bloque1.OF_RET_C3'),
	(4, 1, 2, 'MicroWin.1200.Bloque2.OF_RET_C1'),
	(5, 2, 2, 'MicroWin.1200.Bloque2.OF_RET_C2'),
	(6, 3, 2, 'MicroWin.1200.Bloque2.OF_RET_C3'),
	(7, 1, 3, 'MicroWin.1200.Bloque3.OF_RET_C1'),
	(8, 2, 3, 'MicroWin.1200.Bloque3.OF_RET_C2'),
	(9, 3, 3, 'MicroWin.1200.Bloque3.OF_RET_C3');
/*!40000 ALTER TABLE `plc_cfg_retencionxbloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_velocidad
CREATE TABLE IF NOT EXISTS `plc_cfg_velocidad` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_velocidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_velocidad: ~6 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_velocidad` DISABLE KEYS */;
INSERT INTO `plc_cfg_velocidad` (`id`, `d_velocidad`) VALUES
	(1, 'Velocidad Mezclado 1'),
	(2, 'Velocidad Mezclado 2'),
	(3, 'Velocidad Mezclado 3'),
	(4, 'Velocidad Chopper 1'),
	(5, 'Velocidad Chopper 2'),
	(6, 'Velocidad Chopper 3');
/*!40000 ALTER TABLE `plc_cfg_velocidad` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_velocidadxbloque
CREATE TABLE IF NOT EXISTS `plc_cfg_velocidadxbloque` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_velocidad` int(10) NOT NULL,
  `id_bloque` int(10) NOT NULL,
  `d_item` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vxb_velocidad` (`id_velocidad`),
  KEY `fk_vxb_bloque` (`id_bloque`),
  CONSTRAINT `fk_vxb_bloque` FOREIGN KEY (`id_bloque`) REFERENCES `plc_cfg_bloque` (`id`),
  CONSTRAINT `fk_vxb_velocidad` FOREIGN KEY (`id_velocidad`) REFERENCES `plc_cfg_velocidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_velocidadxbloque: ~18 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_velocidadxbloque` DISABLE KEYS */;
INSERT INTO `plc_cfg_velocidadxbloque` (`id`, `id_velocidad`, `id_bloque`, `d_item`) VALUES
	(1, 1, 1, 'MicroWin.1200.Bloque1.OF_RPM_V1'),
	(2, 2, 1, 'MicroWin.1200.Bloque1.OF_RPM_V2'),
	(3, 1, 2, 'MicroWin.1200.Bloque2.OF_RPM_V1'),
	(4, 2, 2, 'MicroWin.1200.Bloque2.OF_RPM_V2'),
	(5, 1, 3, 'MicroWin.1200.Bloque3.OF_RPM_V1'),
	(6, 2, 3, 'MicroWin.1200.Bloque3.OF_RPM_V2'),
	(11, 3, 1, 'MicroWin.1200.Bloque1.OF_RPM_V3'),
	(12, 3, 2, 'MicroWin.1200.Bloque2.OF_RPM_V3'),
	(13, 3, 3, 'MicroWin.1200.Bloque3.OF_RPM_V3'),
	(14, 4, 1, 'MicroWin.1200.Bloque1.OF_RPM_C1'),
	(15, 5, 1, 'MicroWin.1200.Bloque1.OF_RPM_C2'),
	(16, 6, 1, 'MicroWin.1200.Bloque1.OF_RPM_C3'),
	(17, 4, 2, 'MicroWin.1200.Bloque2.OF_RPM_C1'),
	(18, 5, 2, 'MicroWin.1200.Bloque2.OF_RPM_C2'),
	(19, 6, 2, 'MicroWin.1200.Bloque2.OF_RPM_C3'),
	(20, 4, 3, 'MicroWin.1200.Bloque3.OF_RPM_C1'),
	(21, 5, 3, 'MicroWin.1200.Bloque3.OF_RPM_C2'),
	(22, 6, 3, 'MicroWin.1200.Bloque3.OF_RPM_C3');
/*!40000 ALTER TABLE `plc_cfg_velocidadxbloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_log_proceso
CREATE TABLE IF NOT EXISTS `plc_log_proceso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_producto` varchar(50) DEFAULT NULL,
  `d_lote` varchar(50) DEFAULT NULL,
  `d_operario` varchar(50) DEFAULT NULL,
  `f_inicio` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_log_proceso: ~25 rows (approximately)
/*!40000 ALTER TABLE `plc_log_proceso` DISABLE KEYS */;
INSERT INTO `plc_log_proceso` (`id`, `d_producto`, `d_lote`, `d_operario`, `f_inicio`) VALUES
	(2, 'Producto 1', 'Lote 1', 'Chuche', '2013-04-04 16:25:00'),
	(3, 'Producto 2', 'Lote 2', 'Pablo', '2012-04-04 16:30:50'),
	(4, 'Producto 3', 'Lote 3', 'Diego', '2013-04-04 16:32:50'),
	(5, 'Producto 4', NULL, NULL, NULL),
	(6, 'Producto 5', NULL, NULL, NULL),
	(7, 'Producto 6', NULL, NULL, NULL),
	(8, 'Producto 7', NULL, NULL, NULL),
	(9, 'Producto 8', NULL, NULL, NULL),
	(10, 'Producto 9', NULL, NULL, NULL),
	(11, 'Producto 10', NULL, NULL, NULL),
	(12, 'Producto 11', NULL, NULL, NULL),
	(19, 'Producto 1', 'N° Lote 1', 'Juan', '2013-04-18 19:31:51'),
	(21, 'Producto 2', 'LOT2', 'Supervisor', '2013-04-18 19:44:26'),
	(22, 'Producto 1', 'N° Lote', 'S', '2013-07-06 08:18:56'),
	(23, 'Producto 1', 'N° Lote', 'S', '2013-07-06 09:10:18'),
	(24, 'Producto 1', 'N° Lote', 'S', '2013-07-06 09:10:18'),
	(25, 'Producto 1', 'EST01', 'S', '2013-07-06 09:17:34'),
	(26, 'Producto 1', 'EST02', 'S', '2013-07-06 09:21:43'),
	(27, 'Producto 1', 'EST02', 'S', '2013-07-06 09:38:27'),
	(28, 'Producto 1', 'EST02', 'S', '2013-07-06 09:40:02'),
	(29, 'Producto 1', 'LALA', 'S', '2013-07-06 09:41:08'),
	(30, 'Producto 2', 'RED', 'S', '2013-07-06 10:09:49'),
	(31, 'Producto 2', 'RED', 'S', '2013-07-06 10:11:42'),
	(32, 'PRI', '1', 'MAN', '1970-01-01 00:48:05'),
	(33, 'SEG', 'PANCHO', 'MAN', '2013-10-26 19:19:34');
/*!40000 ALTER TABLE `plc_log_proceso` ENABLE KEYS */;


-- Dumping structure for table plc.plc_log_proceso_estado
CREATE TABLE IF NOT EXISTS `plc_log_proceso_estado` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_proceso` int(10) NOT NULL,
  `id_estado` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proceso_s_proceso` (`id_proceso`),
  KEY `fk_proceso_s_estado` (`id_estado`),
  CONSTRAINT `fk_proceso_s_estado` FOREIGN KEY (`id_estado`) REFERENCES `plc_cfg_estado` (`id`),
  CONSTRAINT `fk_proceso_s_proceso` FOREIGN KEY (`id_proceso`) REFERENCES `plc_log_proceso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_log_proceso_estado: ~10 rows (approximately)
/*!40000 ALTER TABLE `plc_log_proceso_estado` DISABLE KEYS */;
INSERT INTO `plc_log_proceso_estado` (`id`, `id_proceso`, `id_estado`) VALUES
	(2, 24, 4),
	(3, 25, 4),
	(4, 26, 1),
	(5, 27, 2),
	(6, 28, 3),
	(7, 29, 1),
	(8, 30, 1),
	(9, 31, 1),
	(10, 32, 1),
	(11, 33, 1);
/*!40000 ALTER TABLE `plc_log_proceso_estado` ENABLE KEYS */;


-- Dumping structure for table plc.plc_log_proceso_etapa
CREATE TABLE IF NOT EXISTS `plc_log_proceso_etapa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_proceso` int(10) NOT NULL,
  `id_etapa` int(10) NOT NULL,
  `f_fin` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proceso_e_proceso` (`id_proceso`),
  KEY `fk_proceso_e_etapa` (`id_etapa`),
  CONSTRAINT `fk_proceso_e_etapa` FOREIGN KEY (`id_etapa`) REFERENCES `plc_cfg_etapa` (`id`),
  CONSTRAINT `fk_proceso_e_proceso` FOREIGN KEY (`id_proceso`) REFERENCES `plc_log_proceso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_log_proceso_etapa: ~71 rows (approximately)
/*!40000 ALTER TABLE `plc_log_proceso_etapa` DISABLE KEYS */;
INSERT INTO `plc_log_proceso_etapa` (`id`, `id_proceso`, `id_etapa`, `f_fin`) VALUES
	(7, 2, 1, '2013-04-04 16:32:12'),
	(8, 2, 5, '2013-04-04 16:31:28'),
	(9, 2, 4, '2013-04-04 16:32:42'),
	(10, 3, 1, '2013-04-04 16:32:58'),
	(11, 19, 1, '2013-04-18 19:31:57'),
	(12, 19, 2, '2013-04-18 19:32:17'),
	(13, 19, 3, '2013-04-18 19:32:07'),
	(14, 19, 4, '2013-04-18 19:32:22'),
	(15, 19, 5, '2013-04-18 19:32:02'),
	(16, 19, 6, '2013-04-18 19:32:12'),
	(23, 21, 1, '2013-04-18 19:44:36'),
	(24, 21, 2, '2013-04-18 19:45:16'),
	(25, 21, 3, '2013-04-18 19:44:56'),
	(26, 21, 4, '2013-04-18 19:45:26'),
	(27, 21, 5, '2013-04-18 19:44:46'),
	(28, 21, 6, '2013-04-18 19:45:06'),
	(29, 22, 1, '2013-07-06 08:19:01'),
	(30, 22, 2, '2013-07-06 08:19:21'),
	(31, 22, 3, '2013-07-06 08:19:11'),
	(32, 22, 4, '2013-07-06 08:19:26'),
	(33, 22, 5, '2013-07-06 08:19:06'),
	(34, 22, 6, '2013-07-06 08:19:16'),
	(35, 23, 1, '2013-07-06 09:10:23'),
	(36, 23, 2, '2013-07-06 09:10:43'),
	(37, 23, 3, '2013-07-06 09:10:33'),
	(38, 23, 4, '2013-07-06 09:10:48'),
	(39, 23, 5, '2013-07-06 09:10:28'),
	(40, 23, 6, '2013-07-06 09:10:38'),
	(41, 24, 1, '2013-07-06 09:10:23'),
	(42, 24, 2, '2013-07-06 09:10:43'),
	(43, 24, 3, '2013-07-06 09:10:33'),
	(44, 24, 4, '2013-07-06 09:10:48'),
	(45, 24, 5, '2013-07-06 09:10:28'),
	(46, 24, 6, '2013-07-06 09:10:38'),
	(47, 25, 1, '2013-07-06 09:17:39'),
	(48, 25, 2, '2013-07-06 09:17:59'),
	(49, 25, 3, '2013-07-06 09:17:49'),
	(50, 25, 4, '2013-07-06 09:18:04'),
	(51, 25, 5, '2013-07-06 09:17:44'),
	(52, 25, 6, '2013-07-06 09:17:54'),
	(53, 26, 1, '2013-07-06 09:21:48'),
	(54, 26, 2, '2013-07-06 09:22:08'),
	(55, 26, 3, '2013-07-06 09:21:58'),
	(56, 26, 4, '2013-07-06 09:22:13'),
	(57, 26, 5, '2013-07-06 09:21:53'),
	(58, 26, 6, '2013-07-06 09:22:03'),
	(59, 29, 1, '2013-07-06 09:41:13'),
	(60, 29, 2, '2013-07-06 09:41:33'),
	(61, 29, 3, '2013-07-06 09:41:23'),
	(62, 29, 4, '2013-07-06 09:41:38'),
	(63, 29, 5, '2013-07-06 09:41:18'),
	(64, 29, 6, '2013-07-06 09:41:28'),
	(65, 30, 1, '2013-07-06 10:09:59'),
	(66, 30, 2, '2013-07-06 10:10:39'),
	(67, 30, 3, '2013-07-06 10:10:19'),
	(68, 30, 4, '2013-07-06 10:10:49'),
	(69, 30, 5, '2013-07-06 10:10:09'),
	(70, 30, 6, '2013-07-06 10:10:29'),
	(71, 31, 1, '2013-07-06 10:11:52'),
	(72, 31, 2, '2013-07-06 10:12:22'),
	(73, 31, 3, '2013-07-06 10:12:02'),
	(74, 31, 4, '2013-07-06 10:12:32'),
	(75, 31, 6, '2013-07-06 10:12:12'),
	(76, 33, 1, '2013-10-26 19:19:44'),
	(77, 33, 2, '2013-10-26 19:19:56'),
	(78, 33, 3, '2013-10-26 19:20:40'),
	(79, 33, 4, '2013-10-26 19:20:58'),
	(80, 33, 5, '2013-10-26 19:20:25'),
	(81, 33, 6, '2013-10-26 19:20:30'),
	(82, 33, 7, '2013-10-26 19:20:10'),
	(83, 33, 8, '2013-10-26 19:21:05');
/*!40000 ALTER TABLE `plc_log_proceso_etapa` ENABLE KEYS */;


-- Dumping structure for table plc.plc_log_proceso_retencion
CREATE TABLE IF NOT EXISTS `plc_log_proceso_retencion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_proceso` int(10) NOT NULL,
  `id_retencion` int(10) NOT NULL,
  `v_retencion` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_v_velocidad` (`id_retencion`),
  KEY `fk_log_v_proceso` (`id_proceso`),
  CONSTRAINT `plc_log_proceso_retencion_ibfk_1` FOREIGN KEY (`id_proceso`) REFERENCES `plc_log_proceso` (`id`),
  CONSTRAINT `plc_log_proceso_retencion_ibfk_2` FOREIGN KEY (`id_retencion`) REFERENCES `plc_cfg_retencion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table plc.plc_log_proceso_retencion: ~7 rows (approximately)
/*!40000 ALTER TABLE `plc_log_proceso_retencion` DISABLE KEYS */;
INSERT INTO `plc_log_proceso_retencion` (`id`, `id_proceso`, `id_retencion`, `v_retencion`) VALUES
	(1, 31, 1, 1),
	(2, 32, 1, 0),
	(3, 32, 2, 0),
	(4, 32, 3, 0),
	(5, 33, 1, 0),
	(6, 33, 2, 0),
	(7, 33, 3, 0);
/*!40000 ALTER TABLE `plc_log_proceso_retencion` ENABLE KEYS */;


-- Dumping structure for table plc.plc_log_proceso_velocidad
CREATE TABLE IF NOT EXISTS `plc_log_proceso_velocidad` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_proceso` int(10) NOT NULL,
  `id_velocidad` int(10) NOT NULL,
  `n_velocidad` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_v_velocidad` (`id_velocidad`),
  KEY `fk_log_v_proceso` (`id_proceso`),
  CONSTRAINT `fk_log_v_proceso` FOREIGN KEY (`id_proceso`) REFERENCES `plc_log_proceso` (`id`),
  CONSTRAINT `fk_log_v_velocidad` FOREIGN KEY (`id_velocidad`) REFERENCES `plc_cfg_velocidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_log_proceso_velocidad: ~34 rows (approximately)
/*!40000 ALTER TABLE `plc_log_proceso_velocidad` DISABLE KEYS */;
INSERT INTO `plc_log_proceso_velocidad` (`id`, `id_proceso`, `id_velocidad`, `n_velocidad`) VALUES
	(1, 21, 1, 1500),
	(2, 21, 2, 3000),
	(3, 22, 1, 1500),
	(4, 22, 2, 3000),
	(5, 23, 1, 1500),
	(6, 23, 2, 3000),
	(7, 24, 1, 1500),
	(8, 24, 2, 3000),
	(9, 25, 1, 1500),
	(10, 25, 2, 3000),
	(11, 26, 1, 1500),
	(12, 26, 2, 3000),
	(13, 27, 1, 1500),
	(14, 27, 2, 3000),
	(15, 28, 1, 1500),
	(16, 28, 2, 3000),
	(17, 29, 1, 1500),
	(18, 29, 2, 3000),
	(19, 30, 1, 1500),
	(20, 30, 2, 3000),
	(21, 31, 1, 1500),
	(22, 31, 2, 3000),
	(23, 32, 1, 100),
	(24, 32, 2, 100),
	(25, 32, 3, 100),
	(26, 32, 4, 1500),
	(27, 32, 5, 0),
	(28, 32, 6, 0),
	(29, 33, 1, 100),
	(30, 33, 2, 500),
	(31, 33, 3, 900),
	(32, 33, 4, 1500),
	(33, 33, 5, 3000),
	(34, 33, 6, 3000);
/*!40000 ALTER TABLE `plc_log_proceso_velocidad` ENABLE KEYS */;


-- Dumping structure for view plc.v_cfg_finxetapaxbloque
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_cfg_finxetapaxbloque` (
	`id_etapa` INT(10) NOT NULL,
	`id_bloque` INT(10) NOT NULL,
	`id_item_anio` INT(10) NOT NULL DEFAULT '0',
	`d_item_anio` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_item_mes` INT(10) NOT NULL DEFAULT '0',
	`d_item_mes` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_item_dia` INT(10) NOT NULL DEFAULT '0',
	`d_item_dia` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_item_hora` INT(10) NOT NULL DEFAULT '0',
	`d_item_hora` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_item_minuto` INT(10) NOT NULL DEFAULT '0',
	`d_item_minuto` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_item_segundo` INT(10) NOT NULL DEFAULT '0',
	`d_item_segundo` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view plc.v_cfg_inicioxbloque
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_cfg_inicioxbloque` (
	`id_bloque` INT(10) NOT NULL,
	`id_item_anio` INT(10) NOT NULL DEFAULT '0',
	`d_item_anio` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_item_mes` INT(10) NOT NULL DEFAULT '0',
	`d_item_mes` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_item_dia` INT(10) NOT NULL DEFAULT '0',
	`d_item_dia` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_item_hora` INT(10) NOT NULL DEFAULT '0',
	`d_item_hora` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_item_minuto` INT(10) NOT NULL DEFAULT '0',
	`d_item_minuto` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_item_segundo` INT(10) NOT NULL DEFAULT '0',
	`d_item_segundo` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view plc.v_cfg_finxetapaxbloque
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_cfg_finxetapaxbloque`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_cfg_finxetapaxbloque` AS SELECT 	fxexb.id_etapa, 
			fxexb.id_bloque, 
			anio.id id_item_anio, anio.d_item d_item_anio,
			mes.id id_item_mes, mes.d_item d_item_mes,
			dia.id id_item_dia, dia.d_item d_item_dia,
			hora.id id_item_hora, hora.d_item d_item_hora,
			minuto.id id_item_minuto, minuto.d_item d_item_minuto,
			seg.id id_item_segundo, seg.d_item d_item_segundo															
FROM plc_cfg_finxetapaxbloque fxexb
JOIN plc_cfg_item_fin anio ON fxexb.id_item_anio_fin = anio.id
JOIN plc_cfg_item_fin mes ON fxexb.id_item_mes_fin = mes.id
JOIN plc_cfg_item_fin dia ON fxexb.id_item_dia_fin = dia.id
JOIN plc_cfg_item_fin hora ON fxexb.id_item_hora_fin = hora.id
JOIN plc_cfg_item_fin minuto ON fxexb.id_item_min_fin = minuto.id
JOIN plc_cfg_item_fin seg ON fxexb.id_item_seg_fin = seg.id ;


-- Dumping structure for view plc.v_cfg_inicioxbloque
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_cfg_inicioxbloque`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_cfg_inicioxbloque` AS SELECT 	ixb.id_bloque, 
			anio.id id_item_anio, anio.d_item d_item_anio,
			mes.id id_item_mes, mes.d_item d_item_mes,
			dia.id id_item_dia, dia.d_item d_item_dia,
			hora.id id_item_hora, hora.d_item d_item_hora,
			minuto.id id_item_minuto, minuto.d_item d_item_minuto,
			seg.id id_item_segundo, seg.d_item d_item_segundo															
FROM plc_cfg_inicioxbloque ixb
JOIN plc_cfg_item_inicio anio ON ixb.id_item_anio = anio.id
JOIN plc_cfg_item_inicio mes ON ixb.id_item_mes = mes.id
JOIN plc_cfg_item_inicio dia ON ixb.id_item_dia = dia.id
JOIN plc_cfg_item_inicio hora ON ixb.id_item_hora = hora.id
JOIN plc_cfg_item_inicio minuto ON ixb.id_item_minuto = minuto.id
JOIN plc_cfg_item_inicio seg ON ixb.id_item_segundo = seg.id ;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
