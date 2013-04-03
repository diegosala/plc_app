-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.24-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-04-03 11:59:41
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
  `item_anio_fin` varchar(50) NOT NULL,
  `item_mes_fin` varchar(50) NOT NULL,
  `item_dia_fin` varchar(50) NOT NULL,
  `item_hora_fin` varchar(50) NOT NULL,
  `item_minuto_fin` varchar(50) NOT NULL,
  `item_segundo_fin` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plc_cfg_txexb_etapa` (`id_etapa`),
  KEY `plc_cfg_txexb_bloque` (`id_bloque`),
  CONSTRAINT `plc_cfg_txexb_etapa` FOREIGN KEY (`id_etapa`) REFERENCES `plc_cfg_etapa` (`id`),
  CONSTRAINT `plc_cfg_txexb_bloque` FOREIGN KEY (`id_bloque`) REFERENCES `plc_cfg_bloque` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_finxetapaxbloque: ~30 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_finxetapaxbloque` DISABLE KEYS */;
INSERT INTO `plc_cfg_finxetapaxbloque` (`id`, `id_etapa`, `id_bloque`, `item_anio_fin`, `item_mes_fin`, `item_dia_fin`, `item_hora_fin`, `item_minuto_fin`, `item_segundo_fin`) VALUES
	(1, 1, 1, 'MicroWin.1200.Bloque1.OF_HORA_M1 - AÑO', 'MicroWin.1200.Bloque1.OF_HORA_M1 - MES', 'MicroWin.1200.Bloque1.OF_HORA_M1 - DIA', 'MicroWin.1200.Bloque1.OF_HORA_M1 - HORA', 'MicroWin.1200.Bloque1.OF_HORA_M1 - MIN', 'MicroWin.1200.Bloque1.OF_HORA_M1 - SEG'),
	(2, 2, 1, 'MicroWin.1200.Bloque1.OF_HORA_M2 - AÑO', 'MicroWin.1200.Bloque1.OF_HORA_M2 - MES', 'MicroWin.1200.Bloque1.OF_HORA_M2 - DIA', 'MicroWin.1200.Bloque1.OF_HORA_M2 - HORA', 'MicroWin.1200.Bloque1.OF_HORA_M2 - MIN', 'MicroWin.1200.Bloque1.OF_HORA_M2 - SEG'),
	(3, 3, 1, 'MicroWin.1200.Bloque1.OF_HORA_C1 - AÑO', 'MicroWin.1200.Bloque1.OF_HORA_C1 - MES', 'MicroWin.1200.Bloque1.OF_HORA_C1 - DIA', 'MicroWin.1200.Bloque1.OF_HORA_C1 - HORA', 'MicroWin.1200.Bloque1.OF_HORA_C1 - MIN', 'MicroWin.1200.Bloque1.OF_HORA_C1 - SEG'),
	(4, 4, 1, 'MicroWin.1200.Bloque1.OF_HORA_C2 - AÑO', 'MicroWin.1200.Bloque1.OF_HORA_C2 - MES', 'MicroWin.1200.Bloque1.OF_HORA_C2 - DIA', 'MicroWin.1200.Bloque1.OF_HORA_C2 - HORA', 'MicroWin.1200.Bloque1.OF_HORA_C2 - MIN', 'MicroWin.1200.Bloque1.OF_HORA_C2 - SEG'),
	(5, 5, 1, 'MicroWin.1200.Bloque1.OF_HORA_D1 - AÑO', 'MicroWin.1200.Bloque1.OF_HORA_D1 - MES', 'MicroWin.1200.Bloque1.OF_HORA_D1 - DIA', 'MicroWin.1200.Bloque1.OF_HORA_D1 - HORA', 'MicroWin.1200.Bloque1.OF_HORA_D1 - MIN', 'MicroWin.1200.Bloque1.OF_HORA_D1 - SEG'),
	(6, 6, 1, 'MicroWin.1200.Bloque1.OF_HORA_D2 - AÑO', 'MicroWin.1200.Bloque1.OF_HORA_D2 - MES', 'MicroWin.1200.Bloque1.OF_HORA_D2 - DIA', 'MicroWin.1200.Bloque1.OF_HORA_D2 - HORA', 'MicroWin.1200.Bloque1.OF_HORA_D2 - MIN', 'MicroWin.1200.Bloque1.OF_HORA_D2 - SEG'),
	(7, 1, 2, 'MicroWin.1200.Bloque2.OF_HORA_M1 - AÑO', 'MicroWin.1200.Bloque2.OF_HORA_M1 - MES', 'MicroWin.1200.Bloque2.OF_HORA_M1 - DIA', 'MicroWin.1200.Bloque2.OF_HORA_M1 - HORA', 'MicroWin.1200.Bloque2.OF_HORA_M1 - MIN', 'MicroWin.1200.Bloque2.OF_HORA_M1 - SEG'),
	(8, 2, 2, 'MicroWin.1200.Bloque2.OF_HORA_M2 - AÑO', 'MicroWin.1200.Bloque2.OF_HORA_M2 - MES', 'MicroWin.1200.Bloque2.OF_HORA_M2 - DIA', 'MicroWin.1200.Bloque2.OF_HORA_M2 - HORA', 'MicroWin.1200.Bloque2.OF_HORA_M2 - MIN', 'MicroWin.1200.Bloque2.OF_HORA_M2 - SEG'),
	(9, 3, 2, 'MicroWin.1200.Bloque2.OF_HORA_C1 - AÑO', 'MicroWin.1200.Bloque2.OF_HORA_C1 - MES', 'MicroWin.1200.Bloque2.OF_HORA_C1 - DIA', 'MicroWin.1200.Bloque2.OF_HORA_C1 - HORA', 'MicroWin.1200.Bloque2.OF_HORA_C1 - MIN', 'MicroWin.1200.Bloque2.OF_HORA_C1 - SEG'),
	(10, 4, 2, 'MicroWin.1200.Bloque2.OF_HORA_C2 - AÑO', 'MicroWin.1200.Bloque2.OF_HORA_C2 - MES', 'MicroWin.1200.Bloque2.OF_HORA_C2 - DIA', 'MicroWin.1200.Bloque2.OF_HORA_C2 - HORA', 'MicroWin.1200.Bloque2.OF_HORA_C2 - MIN', 'MicroWin.1200.Bloque2.OF_HORA_C2 - SEG'),
	(11, 5, 2, 'MicroWin.1200.Bloque2.OF_HORA_D1 - AÑO', 'MicroWin.1200.Bloque2.OF_HORA_D1 - MES', 'MicroWin.1200.Bloque2.OF_HORA_D1 - DIA', 'MicroWin.1200.Bloque2.OF_HORA_D1 - HORA', 'MicroWin.1200.Bloque2.OF_HORA_D1 - MIN', 'MicroWin.1200.Bloque2.OF_HORA_D1 - SEG'),
	(12, 6, 2, 'MicroWin.1200.Bloque2.OF_HORA_D2 - AÑO', 'MicroWin.1200.Bloque2.OF_HORA_D2 - MES', 'MicroWin.1200.Bloque2.OF_HORA_D2 - DIA', 'MicroWin.1200.Bloque2.OF_HORA_D2 - HORA', 'MicroWin.1200.Bloque2.OF_HORA_D2 - MIN', 'MicroWin.1200.Bloque2.OF_HORA_D2 - SEG'),
	(13, 1, 3, 'MicroWin.1200.Bloque3.OF_HORA_M1 - AÑO', 'MicroWin.1200.Bloque3.OF_HORA_M1 - MES', 'MicroWin.1200.Bloque3.OF_HORA_M1 - DIA', 'MicroWin.1200.Bloque3.OF_HORA_M1 - HORA', 'MicroWin.1200.Bloque3.OF_HORA_M1 - MIN', 'MicroWin.1200.Bloque3.OF_HORA_M1 - SEG'),
	(14, 2, 3, 'MicroWin.1200.Bloque3.OF_HORA_M2 - AÑO', 'MicroWin.1200.Bloque3.OF_HORA_M2 - MES', 'MicroWin.1200.Bloque3.OF_HORA_M2 - DIA', 'MicroWin.1200.Bloque3.OF_HORA_M2 - HORA', 'MicroWin.1200.Bloque3.OF_HORA_M2 - MIN', 'MicroWin.1200.Bloque3.OF_HORA_M2 - SEG'),
	(15, 3, 3, 'MicroWin.1200.Bloque3.OF_HORA_C1 - AÑO', 'MicroWin.1200.Bloque3.OF_HORA_C1 - MES', 'MicroWin.1200.Bloque3.OF_HORA_C1 - DIA', 'MicroWin.1200.Bloque3.OF_HORA_C1 - HORA', 'MicroWin.1200.Bloque3.OF_HORA_C1 - MIN', 'MicroWin.1200.Bloque3.OF_HORA_C1 - SEG'),
	(16, 4, 3, 'MicroWin.1200.Bloque3.OF_HORA_C2 - AÑO', 'MicroWin.1200.Bloque3.OF_HORA_C2 - MES', 'MicroWin.1200.Bloque3.OF_HORA_C2 - DIA', 'MicroWin.1200.Bloque3.OF_HORA_C2 - HORA', 'MicroWin.1200.Bloque3.OF_HORA_C2 - MIN', 'MicroWin.1200.Bloque3.OF_HORA_C2 - SEG'),
	(17, 5, 3, 'MicroWin.1200.Bloque3.OF_HORA_D1 - AÑO', 'MicroWin.1200.Bloque3.OF_HORA_D1 - MES', 'MicroWin.1200.Bloque3.OF_HORA_D1 - DIA', 'MicroWin.1200.Bloque3.OF_HORA_D1 - HORA', 'MicroWin.1200.Bloque3.OF_HORA_D1 - MIN', 'MicroWin.1200.Bloque3.OF_HORA_D1 - SEG'),
	(18, 6, 3, 'MicroWin.1200.Bloque3.OF_HORA_D2 - AÑO', 'MicroWin.1200.Bloque3.OF_HORA_D2 - MES', 'MicroWin.1200.Bloque3.OF_HORA_D2 - DIA', 'MicroWin.1200.Bloque3.OF_HORA_D2 - HORA', 'MicroWin.1200.Bloque3.OF_HORA_D2 - MIN', 'MicroWin.1200.Bloque3.OF_HORA_D2 - SEG'),
	(19, 1, 4, 'MicroWin.1200.Bloque4.OF_HORA_M1 - AÑO', 'MicroWin.1200.Bloque4.OF_HORA_M1 - MES', 'MicroWin.1200.Bloque4.OF_HORA_M1 - DIA', 'MicroWin.1200.Bloque4.OF_HORA_M1 - HORA', 'MicroWin.1200.Bloque4.OF_HORA_M1 - MIN', 'MicroWin.1200.Bloque4.OF_HORA_M1 - SEG'),
	(20, 2, 4, 'MicroWin.1200.Bloque4.OF_HORA_M2 - AÑO', 'MicroWin.1200.Bloque4.OF_HORA_M2 - MES', 'MicroWin.1200.Bloque4.OF_HORA_M2 - DIA', 'MicroWin.1200.Bloque4.OF_HORA_M2 - HORA', 'MicroWin.1200.Bloque4.OF_HORA_M2 - MIN', 'MicroWin.1200.Bloque4.OF_HORA_M2 - SEG'),
	(21, 3, 4, 'MicroWin.1200.Bloque4.OF_HORA_C1 - AÑO', 'MicroWin.1200.Bloque4.OF_HORA_C1 - MES', 'MicroWin.1200.Bloque4.OF_HORA_C1 - DIA', 'MicroWin.1200.Bloque4.OF_HORA_C1 - HORA', 'MicroWin.1200.Bloque4.OF_HORA_C1 - MIN', 'MicroWin.1200.Bloque4.OF_HORA_C1 - SEG'),
	(22, 4, 4, 'MicroWin.1200.Bloque4.OF_HORA_C2 - AÑO', 'MicroWin.1200.Bloque4.OF_HORA_C2 - MES', 'MicroWin.1200.Bloque4.OF_HORA_C2 - DIA', 'MicroWin.1200.Bloque4.OF_HORA_C2 - HORA', 'MicroWin.1200.Bloque4.OF_HORA_C2 - MIN', 'MicroWin.1200.Bloque4.OF_HORA_C2 - SEG'),
	(23, 5, 4, 'MicroWin.1200.Bloque4.OF_HORA_D1 - AÑO', 'MicroWin.1200.Bloque4.OF_HORA_D1 - MES', 'MicroWin.1200.Bloque4.OF_HORA_D1 - DIA', 'MicroWin.1200.Bloque4.OF_HORA_D1 - HORA', 'MicroWin.1200.Bloque4.OF_HORA_D1 - MIN', 'MicroWin.1200.Bloque4.OF_HORA_D1 - SEG'),
	(24, 6, 4, 'MicroWin.1200.Bloque4.OF_HORA_D2 - AÑO', 'MicroWin.1200.Bloque4.OF_HORA_D2 - MES', 'MicroWin.1200.Bloque4.OF_HORA_D2 - DIA', 'MicroWin.1200.Bloque4.OF_HORA_D2 - HORA', 'MicroWin.1200.Bloque4.OF_HORA_D2 - MIN', 'MicroWin.1200.Bloque4.OF_HORA_D2 - SEG'),
	(25, 1, 5, 'MicroWin.1200.Bloque5.OF_HORA_M1 - AÑO', 'MicroWin.1200.Bloque5.OF_HORA_M1 - MES', 'MicroWin.1200.Bloque5.OF_HORA_M1 - DIA', 'MicroWin.1200.Bloque5.OF_HORA_M1 - HORA', 'MicroWin.1200.Bloque5.OF_HORA_M1 - MIN', 'MicroWin.1200.Bloque5.OF_HORA_M1 - SEG'),
	(26, 2, 5, 'MicroWin.1200.Bloque5.OF_HORA_M2 - AÑO', 'MicroWin.1200.Bloque5.OF_HORA_M2 - MES', 'MicroWin.1200.Bloque5.OF_HORA_M2 - DIA', 'MicroWin.1200.Bloque5.OF_HORA_M2 - HORA', 'MicroWin.1200.Bloque5.OF_HORA_M2 - MIN', 'MicroWin.1200.Bloque5.OF_HORA_M2 - SEG'),
	(27, 3, 5, 'MicroWin.1200.Bloque5.OF_HORA_C1 - AÑO', 'MicroWin.1200.Bloque5.OF_HORA_C1 - MES', 'MicroWin.1200.Bloque5.OF_HORA_C1 - DIA', 'MicroWin.1200.Bloque5.OF_HORA_C1 - HORA', 'MicroWin.1200.Bloque5.OF_HORA_C1 - MIN', 'MicroWin.1200.Bloque5.OF_HORA_C1 - SEG'),
	(28, 4, 5, 'MicroWin.1200.Bloque5.OF_HORA_C2 - AÑO', 'MicroWin.1200.Bloque5.OF_HORA_C2 - MES', 'MicroWin.1200.Bloque5.OF_HORA_C2 - DIA', 'MicroWin.1200.Bloque5.OF_HORA_C2 - HORA', 'MicroWin.1200.Bloque5.OF_HORA_C2 - MIN', 'MicroWin.1200.Bloque5.OF_HORA_C2 - SEG'),
	(29, 5, 5, 'MicroWin.1200.Bloque5.OF_HORA_D1 - AÑO', 'MicroWin.1200.Bloque5.OF_HORA_D1 - MES', 'MicroWin.1200.Bloque5.OF_HORA_D1 - DIA', 'MicroWin.1200.Bloque5.OF_HORA_D1 - HORA', 'MicroWin.1200.Bloque5.OF_HORA_D1 - MIN', 'MicroWin.1200.Bloque5.OF_HORA_D1 - SEG'),
	(30, 6, 5, 'MicroWin.1200.Bloque5.OF_HORA_D2 - AÑO', 'MicroWin.1200.Bloque5.OF_HORA_D2 - MES', 'MicroWin.1200.Bloque5.OF_HORA_D2 - DIA', 'MicroWin.1200.Bloque5.OF_HORA_D2 - HORA', 'MicroWin.1200.Bloque5.OF_HORA_D2 - MIN', 'MicroWin.1200.Bloque5.OF_HORA_D2 - SEG');
/*!40000 ALTER TABLE `plc_cfg_finxetapaxbloque` ENABLE KEYS */;


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
  CONSTRAINT `fk_vxb_velocidad` FOREIGN KEY (`id_velocidad`) REFERENCES `plc_cfg_velocidad` (`id`),
  CONSTRAINT `fk_vxb_bloque` FOREIGN KEY (`id_bloque`) REFERENCES `plc_cfg_bloque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table plc.plc_cfg_velocidadxbloque: ~0 rows (approximately)
/*!40000 ALTER TABLE `plc_cfg_velocidadxbloque` DISABLE KEYS */;
/*!40000 ALTER TABLE `plc_cfg_velocidadxbloque` ENABLE KEYS */;


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
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
