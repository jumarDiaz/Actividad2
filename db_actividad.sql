-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-04-2023 a las 02:17:10
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
-- Base de datos: `db_actividad`
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
  `CODIGO_CLIENTE` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coches`
--

CREATE TABLE `coches` (
  `MATRICULA` varchar(45) NOT NULL,
  `NIT_C` int(11) NOT NULL,
  `CODIGO_M` int(11) NOT NULL,
  `MODELO` varchar(45) NOT NULL,
  `COLOR` varchar(45) NOT NULL,
  `PVC` varchar(45) NOT NULL,
  `MARCA_CODIGO_M` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='\n';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `CODIGO_M` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID` int(10) UNSIGNED NOT NULL,
  `COCHES_MATRICULA` varchar(45) NOT NULL,
  `CLIENTES_NIT_C` int(11) NOT NULL,
  `PRECIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
-- Indices de la tabla `coches`
--
ALTER TABLE `coches`
  ADD PRIMARY KEY (`MATRICULA`),
  ADD KEY `fk_COCHES_MARCA_idx` (`MARCA_CODIGO_M`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`CODIGO_M`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID`,`COCHES_MATRICULA`,`CLIENTES_NIT_C`),
  ADD KEY `fk_COCHES_has_CLIENTES_CLIENTES1_idx` (`CLIENTES_NIT_C`),
  ADD KEY `fk_COCHES_has_CLIENTES_COCHES1_idx` (`COCHES_MATRICULA`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `coches`
--
ALTER TABLE `coches`
  ADD CONSTRAINT `fk_COCHES_MARCA` FOREIGN KEY (`MARCA_CODIGO_M`) REFERENCES `marca` (`CODIGO_M`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_COCHES_has_CLIENTES_CLIENTES1` FOREIGN KEY (`CLIENTES_NIT_C`) REFERENCES `clientes` (`NIT_C`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_COCHES_has_CLIENTES_COCHES1` FOREIGN KEY (`COCHES_MATRICULA`) REFERENCES `coches` (`MATRICULA`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
