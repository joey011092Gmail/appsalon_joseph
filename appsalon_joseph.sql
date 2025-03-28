-- -------------------------------------------------------------
-- TablePlus 5.6.0(514)
--
-- https://tableplus.com/
--
-- Database: appsalon_joseph
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;;

CREATE TABLE `citasServicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citaId` int DEFAULT NULL,
  `servicioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citaId` (`citaId`),
  KEY `servicioId` (`servicioId`),
  CONSTRAINT `citasservicios_ibfk_3` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `citasservicios_ibfk_4` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;;

CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` decimal(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;;

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;;

INSERT INTO `citas` (`id`, `fecha`, `hora`, `usuarioId`) VALUES
(22, '2025-03-29', '10:30:00', 9);

INSERT INTO `citasServicios` (`id`, `citaId`, `servicioId`) VALUES
(18, 22, 2);

INSERT INTO `servicios` (`id`, `nombre`, `precio`) VALUES
(1, 'Corte de Cabello Mujer ACTUALIZADO', 80000.00),
(2, 'Corte de Cabello Hombre', 25000.00),
(3, 'Corte de Cabello Niño', 20000.00),
(4, 'Peinado Mujer', 120000.00),
(5, 'Peinado Hombre', 50000.00),
(6, 'Peinado Niño', 40000.00),
(7, 'Corte de Barba', 15000.00),
(8, 'Tinte Mujer', 80000.00),
(9, 'Uñas', 120000.00),
(10, 'Lavado de Cabello', 20000.00),
(11, 'Tratamiento Capilar', 100000.00);

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `telefono`, `admin`, `confirmado`, `token`) VALUES
(9, ' Joseph', 'Molina', 'jomolina15@poligran.edu.co', '$2y$10$9TTiKdZXQaUQaSbVKd7wPOucLusU8ebkv2h2IgqNjQXs.uLTW7CAq', '123456', 0, 1, '');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;