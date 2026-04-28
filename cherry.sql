-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2026 a las 21:14:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cherry`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_camisas`
--

CREATE TABLE `catalogo_camisas` (
  `camisas` int(11) NOT NULL,
  `manga_corta` varchar(50) DEFAULT NULL,
  `manga_larga` varchar(50) DEFAULT NULL,
  `esqueletos` varchar(60) DEFAULT NULL,
  `ombligueras` varchar(60) DEFAULT NULL,
  `blazers` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_pantalones`
--

CREATE TABLE `catalogo_pantalones` (
  `id_pedido` int(11) NOT NULL,
  `bermudas` varchar(50) DEFAULT NULL,
  `skinny` varchar(50) DEFAULT NULL,
  `cargos` varchar(50) DEFAULT NULL,
  `baggys` varchar(60) DEFAULT NULL,
  `campana` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dress`
--

CREATE TABLE `dress` (
  `faldas` int(11) NOT NULL,
  `mini_faldas` varchar(60) DEFAULT NULL,
  `faldas_rodilla` varchar(60) DEFAULT NULL,
  `vestidos` varchar(60) DEFAULT NULL,
  `Faldas_maxi` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` varchar(50) NOT NULL,
  `id_cliente` varchar(60) DEFAULT NULL,
  `cantidad_total` varchar(60) DEFAULT NULL,
  `saldo_pendiente` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_cliente`, `cantidad_total`, `saldo_pendiente`) VALUES
('01', '2', '78000', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_clientes` varchar(40) NOT NULL,
  `id_pedido` varchar(50) NOT NULL,
  `id_factura` varchar(49) DEFAULT NULL,
  `direccion_pedido` varchar(50) DEFAULT NULL,
  `precio_pagar` varchar(73) DEFAULT NULL,
  `fecha_pedido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_clientes`, `id_pedido`, `id_factura`, `direccion_pedido`, `precio_pagar`, `fecha_pedido`) VALUES
('1', '01', '01', 'kr 45 h 34-56 sur', '78.000', '13/06/26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_Cliente` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_Cliente`, `nombre`, `apellido`, `Telefono`, `correo`) VALUES
(0, 'Luisa', 'Londoño', '323214210', 'lui_londoño@outlook.com'),
(1, 'Maria', 'Rodriguez', '312325854', 'mar_rodrigue@gmail.com'),
(2, 'Jesus', 'Martinez', '314414532', 'jesusmartinez2@hotmail.com'),
(3, 'Jose', 'Lincon', '310247882', 'joseln@outlook.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zapatos`
--

CREATE TABLE `zapatos` (
  `tennis` int(11) NOT NULL,
  `tenis_deportivos` varchar(60) DEFAULT NULL,
  `fomales` varchar(60) DEFAULT NULL,
  `casuales` varchar(60) DEFAULT NULL,
  `botas` varchar(60) DEFAULT NULL,
  `chanclas` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogo_camisas`
--
ALTER TABLE `catalogo_camisas`
  ADD PRIMARY KEY (`camisas`);

--
-- Indices de la tabla `catalogo_pantalones`
--
ALTER TABLE `catalogo_pantalones`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `dress`
--
ALTER TABLE `dress`
  ADD PRIMARY KEY (`faldas`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_clientes`,`id_pedido`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_Cliente`);

--
-- Indices de la tabla `zapatos`
--
ALTER TABLE `zapatos`
  ADD PRIMARY KEY (`tennis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
