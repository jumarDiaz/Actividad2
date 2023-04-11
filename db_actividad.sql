-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-04-2023 a las 17:32:44
-- Versión del servidor: 10.9.3-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbactividad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `NIT_C` int(11) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `APELLIDO` varchar(45) NOT NULL,
  `DIRECCION` varchar(45) DEFAULT NULL,
  `CIUDAD` varchar(45) DEFAULT NULL,
  `CODIGO_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`NIT_C`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `CIUDAD`, `CODIGO_CLIENTE`) VALUES
(1, 'Juan', 'Pérez', NULL, 'Bogotá', 100),
(2, 'María', 'García', NULL, 'Medellín', 101),
(3, 'Carlos', 'Sánchez', NULL, 'Bogotá', 102),
(4, 'Ana', 'Martínez', NULL, 'Cali', 103),
(5, 'Pedro', 'Gómez', NULL, 'Barranquilla', 104),
(6, 'Sofía', 'Hernández', NULL, 'Cartagena', 105),
(7, 'Luis', 'Ramírez', NULL, 'Bogotá', 106),
(8, 'Lucía', 'Rodríguez', NULL, 'Cali', 107),
(9, 'Javier', 'Pardo', NULL, 'Medellín', 108),
(10, 'Martha', 'López', NULL, 'Bogotá', 109);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_has_coches`
--

CREATE TABLE `clientes_has_coches` (
  `ID` int(11) NOT NULL,
  `CLIENTES_NIT_C` int(11) NOT NULL,
  `COCHES_ID` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `clientes_has_coches`
--

INSERT INTO `clientes_has_coches` (`ID`, `CLIENTES_NIT_C`, `COCHES_ID`, `total`) VALUES
(1, 1, 11, 55000),
(2, 2, 12, 35000),
(3, 3, 13, 70000),
(4, 4, 14, 60000),
(5, 5, 15, 55000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coches`
--

CREATE TABLE `coches` (
  `ID` int(11) NOT NULL,
  `MATRICULA` varchar(45) NOT NULL,
  `NIT_C` int(11) NOT NULL,
  `CODIGO_M` int(11) NOT NULL,
  `MODELO` varchar(45) NOT NULL,
  `COLOR` varchar(45) NOT NULL,
  `PVC` varchar(45) NOT NULL,
  `MARCA_CODIGO_M` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='\n';

--
-- Volcado de datos para la tabla `coches`
--

INSERT INTO `coches` (`ID`, `MATRICULA`, `NIT_C`, `CODIGO_M`, `MODELO`, `COLOR`, `PVC`, `MARCA_CODIGO_M`) VALUES
(11, 'ABC-123', 1, 1, 'Sedan', 'Azul', '50000', 1),
(12, 'DEF-456', 2, 2, 'Hatchback', 'Rojo', '35000', 2),
(13, 'GHI-789', 3, 3, 'SUV', 'Blanco', '70000', 1),
(14, 'JKL-012', 4, 4, 'Convertible', 'Negro', '60000', 3),
(15, 'MNO-345', 5, 5, 'Pickup', 'Gris', '55000', 4),
(16, 'PQR-678', 6, 6, 'Coupe', 'Verde', '45000', 3),
(17, 'STU-901', 7, 7, 'Hatchback', 'Azul', '30000', 2),
(18, 'VWX-234', 8, 8, 'Sedan', 'Rojo', '40000', 1),
(19, 'YZA-567', 9, 9, 'SUV', 'Negro', '65000', 4),
(20, 'BCD-890', 10, 10, 'Convertible', 'Blanco', '60000', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `CODIGO_M` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`CODIGO_M`, `DESCRIPCION`) VALUES
(1, 'Marca 1'),
(2, 'Marca 2'),
(3, 'Marca 3'),
(4, 'Marca 4'),
(5, 'Marca 5'),
(6, 'Marca 6'),
(7, 'Marca 7'),
(8, 'Marca 8'),
(9, 'Marca 9'),
(10, 'Marca 10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`NIT_C`),
  ADD UNIQUE KEY `CODIGO_CLIENTE_UNIQUE` (`CODIGO_CLIENTE`);

--
-- Indices de la tabla `clientes_has_coches`
--
ALTER TABLE `clientes_has_coches`
  ADD PRIMARY KEY (`ID`,`CLIENTES_NIT_C`,`COCHES_ID`),
  ADD KEY `fk_CLIENTES_has_COCHES_COCHES1_idx` (`COCHES_ID`),
  ADD KEY `fk_CLIENTES_has_COCHES_CLIENTES1_idx` (`CLIENTES_NIT_C`);

--
-- Indices de la tabla `coches`
--
ALTER TABLE `coches`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_COCHES_MARCA_idx` (`MARCA_CODIGO_M`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`CODIGO_M`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes_has_coches`
--
ALTER TABLE `clientes_has_coches`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `coches`
--
ALTER TABLE `coches`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes_has_coches`
--
ALTER TABLE `clientes_has_coches`
  ADD CONSTRAINT `fk_CLIENTES_has_COCHES_CLIENTES1` FOREIGN KEY (`CLIENTES_NIT_C`) REFERENCES `clientes` (`NIT_C`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CLIENTES_has_COCHES_COCHES1` FOREIGN KEY (`COCHES_ID`) REFERENCES `coches` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `coches`
--
ALTER TABLE `coches`
  ADD CONSTRAINT `fk_COCHES_MARCA` FOREIGN KEY (`MARCA_CODIGO_M`) REFERENCES `marca` (`CODIGO_M`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
