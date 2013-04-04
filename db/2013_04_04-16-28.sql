-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.24-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-04-04 16:28:31
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_bloque: ~5 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_bloque` DISABLE KEYS */;
INSERT INTO `plc_cfg_bloque` (`id`, `n_bloque`, `d_bloque`) VALUES
	(1, 1, 'Bloque1'),
	(2, 2, 'Bloque2'),
	(3, 3, 'Bloque3'),
	(4, 4, 'Bloque4'),
	(5, 5, 'Bloque5');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_cabeceraxbloque: ~15 rows (approximately)
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
	(9, 3, 3, 'MicroWin.1200.Bloque3.OF_USER'),
	(10, 4, 1, 'MicroWin.1200.Bloque4.OF_PRODUCTO'),
	(11, 4, 2, 'MicroWin.1200.Bloque4.OF_LOTE'),
	(12, 4, 3, 'MicroWin.1200.Bloque4.OF_USER'),
	(13, 5, 1, 'MicroWin.1200.Bloque5.OF_PRODUCTO'),
	(14, 5, 2, 'MicroWin.1200.Bloque5.OF_LOTE'),
	(15, 5, 3, 'MicroWin.1200.Bloque5.OF_USER');
/*!40000 ALTER TABLE `plc_cfg_cabeceraxbloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_etapa
CREATE TABLE IF NOT EXISTS `plc_cfg_etapa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_etapa` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_etapa: ~6 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_etapa` DISABLE KEYS */;
INSERT INTO `plc_cfg_etapa` (`id`, `d_etapa`) VALUES
	(1, 'Mezclado Velocidad 1'),
	(2, 'Mezclado Velocidad 2'),
	(3, 'Chopper Velocidad 1'),
	(4, 'Chopper Velocidad 2'),
	(5, 'Disolvente Velocidad 1'),
	(6, 'Disolvente Velocidad 2');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_finxetapaxbloque: ~30 rows (approximately)
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
	(19, 1, 4, 109, 110, 111, 112, 113, 114),
	(20, 2, 4, 115, 116, 117, 118, 119, 120),
	(21, 3, 4, 121, 122, 123, 124, 125, 126),
	(22, 4, 4, 127, 128, 129, 130, 131, 132),
	(23, 5, 4, 133, 134, 135, 136, 137, 138),
	(24, 6, 4, 139, 140, 141, 142, 143, 144),
	(25, 1, 5, 145, 146, 147, 148, 149, 150),
	(26, 2, 5, 151, 152, 153, 154, 155, 156),
	(27, 3, 5, 157, 158, 159, 160, 161, 162),
	(28, 4, 5, 163, 164, 165, 166, 167, 168),
	(29, 5, 5, 169, 170, 171, 172, 173, 174),
	(30, 6, 5, 175, 176, 177, 178, 179, 180);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_inicioxbloque: ~5 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_inicioxbloque` DISABLE KEYS */;
INSERT INTO `plc_cfg_inicioxbloque` (`id`, `id_bloque`, `id_item_anio`, `id_item_mes`, `id_item_dia`, `id_item_hora`, `id_item_minuto`, `id_item_segundo`) VALUES
	(1, 1, 1, 2, 3, 4, 5, 6),
	(2, 2, 7, 8, 9, 10, 11, 12),
	(3, 3, 13, 14, 15, 16, 17, 18),
	(4, 4, 19, 20, 21, 22, 23, 24),
	(5, 5, 25, 26, 27, 28, 29, 30);
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
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_item_fin: ~180 rows (approximately)
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
	(109, 'MicroWin.1200.Bloque4.OF_HORA_M1 - AÑO'),
	(110, 'MicroWin.1200.Bloque4.OF_HORA_M1 - MES'),
	(111, 'MicroWin.1200.Bloque4.OF_HORA_M1 - DIA'),
	(112, 'MicroWin.1200.Bloque4.OF_HORA_M1 - HORA'),
	(113, 'MicroWin.1200.Bloque4.OF_HORA_M1 - MIN'),
	(114, 'MicroWin.1200.Bloque4.OF_HORA_M1 - SEG'),
	(115, 'MicroWin.1200.Bloque4.OF_HORA_M2 - AÑO'),
	(116, 'MicroWin.1200.Bloque4.OF_HORA_M2 - MES'),
	(117, 'MicroWin.1200.Bloque4.OF_HORA_M2 - DIA'),
	(118, 'MicroWin.1200.Bloque4.OF_HORA_M2 - HORA'),
	(119, 'MicroWin.1200.Bloque4.OF_HORA_M2 - MIN'),
	(120, 'MicroWin.1200.Bloque4.OF_HORA_M2 - SEG'),
	(121, 'MicroWin.1200.Bloque4.OF_HORA_C1 - AÑO'),
	(122, 'MicroWin.1200.Bloque4.OF_HORA_C1 - MES'),
	(123, 'MicroWin.1200.Bloque4.OF_HORA_C1 - DIA'),
	(124, 'MicroWin.1200.Bloque4.OF_HORA_C1 - HORA'),
	(125, 'MicroWin.1200.Bloque4.OF_HORA_C1 - MIN'),
	(126, 'MicroWin.1200.Bloque4.OF_HORA_C1 - SEG'),
	(127, 'MicroWin.1200.Bloque4.OF_HORA_C2 - AÑO'),
	(128, 'MicroWin.1200.Bloque4.OF_HORA_C2 - MES'),
	(129, 'MicroWin.1200.Bloque4.OF_HORA_C2 - DIA'),
	(130, 'MicroWin.1200.Bloque4.OF_HORA_C2 - HORA'),
	(131, 'MicroWin.1200.Bloque4.OF_HORA_C2 - MIN'),
	(132, 'MicroWin.1200.Bloque4.OF_HORA_C2 - SEG'),
	(133, 'MicroWin.1200.Bloque4.OF_HORA_D1 - AÑO'),
	(134, 'MicroWin.1200.Bloque4.OF_HORA_D1 - MES'),
	(135, 'MicroWin.1200.Bloque4.OF_HORA_D1 - DIA'),
	(136, 'MicroWin.1200.Bloque4.OF_HORA_D1 - HORA'),
	(137, 'MicroWin.1200.Bloque4.OF_HORA_D1 - MIN'),
	(138, 'MicroWin.1200.Bloque4.OF_HORA_D1 - SEG'),
	(139, 'MicroWin.1200.Bloque4.OF_HORA_D2 - AÑO'),
	(140, 'MicroWin.1200.Bloque4.OF_HORA_D2 - MES'),
	(141, 'MicroWin.1200.Bloque4.OF_HORA_D2 - DIA'),
	(142, 'MicroWin.1200.Bloque4.OF_HORA_D2 - HORA'),
	(143, 'MicroWin.1200.Bloque4.OF_HORA_D2 - MIN'),
	(144, 'MicroWin.1200.Bloque4.OF_HORA_D2 - SEG'),
	(145, 'MicroWin.1200.Bloque5.OF_HORA_M1 - AÑO'),
	(146, 'MicroWin.1200.Bloque5.OF_HORA_M1 - MES'),
	(147, 'MicroWin.1200.Bloque5.OF_HORA_M1 - DIA'),
	(148, 'MicroWin.1200.Bloque5.OF_HORA_M1 - HORA'),
	(149, 'MicroWin.1200.Bloque5.OF_HORA_M1 - MIN'),
	(150, 'MicroWin.1200.Bloque5.OF_HORA_M1 - SEG'),
	(151, 'MicroWin.1200.Bloque5.OF_HORA_M2 - AÑO'),
	(152, 'MicroWin.1200.Bloque5.OF_HORA_M2 - MES'),
	(153, 'MicroWin.1200.Bloque5.OF_HORA_M2 - DIA'),
	(154, 'MicroWin.1200.Bloque5.OF_HORA_M2 - HORA'),
	(155, 'MicroWin.1200.Bloque5.OF_HORA_M2 - MIN'),
	(156, 'MicroWin.1200.Bloque5.OF_HORA_M2 - SEG'),
	(157, 'MicroWin.1200.Bloque5.OF_HORA_C1 - AÑO'),
	(158, 'MicroWin.1200.Bloque5.OF_HORA_C1 - MES'),
	(159, 'MicroWin.1200.Bloque5.OF_HORA_C1 - DIA'),
	(160, 'MicroWin.1200.Bloque5.OF_HORA_C1 - HORA'),
	(161, 'MicroWin.1200.Bloque5.OF_HORA_C1 - MIN'),
	(162, 'MicroWin.1200.Bloque5.OF_HORA_C1 - SEG'),
	(163, 'MicroWin.1200.Bloque5.OF_HORA_C2 - AÑO'),
	(164, 'MicroWin.1200.Bloque5.OF_HORA_C2 - MES'),
	(165, 'MicroWin.1200.Bloque5.OF_HORA_C2 - DIA'),
	(166, 'MicroWin.1200.Bloque5.OF_HORA_C2 - HORA'),
	(167, 'MicroWin.1200.Bloque5.OF_HORA_C2 - MIN'),
	(168, 'MicroWin.1200.Bloque5.OF_HORA_C2 - SEG'),
	(169, 'MicroWin.1200.Bloque5.OF_HORA_D1 - AÑO'),
	(170, 'MicroWin.1200.Bloque5.OF_HORA_D1 - MES'),
	(171, 'MicroWin.1200.Bloque5.OF_HORA_D1 - DIA'),
	(172, 'MicroWin.1200.Bloque5.OF_HORA_D1 - HORA'),
	(173, 'MicroWin.1200.Bloque5.OF_HORA_D1 - MIN'),
	(174, 'MicroWin.1200.Bloque5.OF_HORA_D1 - SEG'),
	(175, 'MicroWin.1200.Bloque5.OF_HORA_D2 - AÑO'),
	(176, 'MicroWin.1200.Bloque5.OF_HORA_D2 - MES'),
	(177, 'MicroWin.1200.Bloque5.OF_HORA_D2 - DIA'),
	(178, 'MicroWin.1200.Bloque5.OF_HORA_D2 - HORA'),
	(179, 'MicroWin.1200.Bloque5.OF_HORA_D2 - MIN'),
	(180, 'MicroWin.1200.Bloque5.OF_HORA_D2 - SEG');
/*!40000 ALTER TABLE `plc_cfg_item_fin` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_item_inicio
CREATE TABLE IF NOT EXISTS `plc_cfg_item_inicio` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_item` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_item_inicio: ~30 rows (approximately)
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
	(18, 'MicroWin.1200.Bloque3.OF_HORA_IN - SEG'),
	(19, 'MicroWin.1200.Bloque4.OF_HORA_IN - AÑO'),
	(20, 'MicroWin.1200.Bloque4.OF_HORA_IN - MES'),
	(21, 'MicroWin.1200.Bloque4.OF_HORA_IN - DIA'),
	(22, 'MicroWin.1200.Bloque4.OF_HORA_IN - HORA'),
	(23, 'MicroWin.1200.Bloque4.OF_HORA_IN - MIN'),
	(24, 'MicroWin.1200.Bloque4.OF_HORA_IN - SEG'),
	(25, 'MicroWin.1200.Bloque5.OF_HORA_IN - AÑO'),
	(26, 'MicroWin.1200.Bloque5.OF_HORA_IN - MES'),
	(27, 'MicroWin.1200.Bloque5.OF_HORA_IN - DIA'),
	(28, 'MicroWin.1200.Bloque5.OF_HORA_IN - HORA'),
	(29, 'MicroWin.1200.Bloque5.OF_HORA_IN - MIN'),
	(30, 'MicroWin.1200.Bloque5.OF_HORA_IN - SEG');
/*!40000 ALTER TABLE `plc_cfg_item_inicio` ENABLE KEYS */;


-- Dumping structure for table plc.plc_cfg_velocidad
CREATE TABLE IF NOT EXISTS `plc_cfg_velocidad` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_velocidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_velocidad: ~0 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_velocidad` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_velocidadxbloque: ~0 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_velocidadxbloque` DISABLE KEYS */;
/*!40000 ALTER TABLE `plc_cfg_velocidadxbloque` ENABLE KEYS */;


-- Dumping structure for table plc.plc_log_proceso
CREATE TABLE IF NOT EXISTS `plc_log_proceso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `d_producto` varchar(50) DEFAULT NULL,
  `d_lote` varchar(50) DEFAULT NULL,
  `d_operario` varchar(50) DEFAULT NULL,
  `f_inicio` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_log_proceso: ~0 rows (approximately)
/*!40000 ALTER TABLE `plc_log_proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `plc_log_proceso` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_log_proceso_etapa: ~0 rows (approximately)
/*!40000 ALTER TABLE `plc_log_proceso_etapa` DISABLE KEYS */;
/*!40000 ALTER TABLE `plc_log_proceso_etapa` ENABLE KEYS */;


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_log_proceso_velocidad: ~0 rows (approximately)
/*!40000 ALTER TABLE `plc_log_proceso_velocidad` DISABLE KEYS */;
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
