-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2026 at 01:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cherry_pro`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'Camisas'),
(2, 'Pantalones'),
(3, 'Faldas y Vestidos'),
(4, 'Zapatos'),
(5, 'Camisas'),
(6, 'Pantalones'),
(7, 'Vestidos'),
(8, 'Zapatos'),
(9, 'Accesorios'),
(10, 'Deportiva'),
(11, 'Formal'),
(12, 'Casual'),
(13, 'Ropa interior'),
(14, 'Ofertas');

-- --------------------------------------------------------

--
-- Table structure for table `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 1, 2, 35000.00),
(2, 2, 2, 1, 40000.00),
(3, 3, 3, 1, 90000.00),
(4, 4, 4, 2, 95000.00),
(5, 5, 5, 1, 120000.00),
(6, 6, 6, 1, 150000.00),
(7, 7, 7, 2, 180000.00),
(8, 8, 8, 1, 200000.00),
(9, 9, 9, 3, 25000.00),
(10, 10, 10, 1, 85000.00);

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `metodo_pago` enum('efectivo','tarjeta','transferencia') DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`id_factura`, `id_pedido`, `total`, `metodo_pago`, `fecha`) VALUES
(1, 1, 70000.00, 'efectivo', '2026-04-09 17:59:46'),
(2, 2, 40000.00, 'tarjeta', '2026-04-09 17:59:46'),
(3, 3, 90000.00, 'transferencia', '2026-04-09 17:59:46'),
(4, 4, 190000.00, 'efectivo', '2026-04-09 17:59:46'),
(5, 5, 120000.00, 'tarjeta', '2026-04-09 17:59:46'),
(6, 6, 150000.00, 'transferencia', '2026-04-09 17:59:46'),
(7, 7, 360000.00, 'efectivo', '2026-04-09 17:59:46'),
(8, 8, 200000.00, 'tarjeta', '2026-04-09 17:59:46'),
(9, 9, 75000.00, 'transferencia', '2026-04-09 17:59:46'),
(10, 10, 85000.00, 'efectivo', '2026-04-09 17:59:46');

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT current_timestamp(),
  `estado` enum('pendiente','enviado','entregado') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_usuario`, `direccion`, `fecha_pedido`, `estado`) VALUES
(1, 1, 'Calle 1 #10-20', '2026-04-09 17:59:46', 'pendiente'),
(2, 2, 'Calle 2 #20-30', '2026-04-09 17:59:46', 'enviado'),
(3, 3, 'Calle 3 #30-40', '2026-04-09 17:59:46', 'entregado'),
(4, 4, 'Calle 4 #40-50', '2026-04-09 17:59:46', 'pendiente'),
(5, 5, 'Calle 5 #50-60', '2026-04-09 17:59:46', 'enviado'),
(6, 6, 'Calle 6 #60-70', '2026-04-09 17:59:46', 'entregado'),
(7, 7, 'Calle 7 #70-80', '2026-04-09 17:59:46', 'pendiente'),
(8, 8, 'Calle 8 #80-90', '2026-04-09 17:59:46', 'enviado'),
(9, 9, 'Calle 9 #90-100', '2026-04-09 17:59:46', 'entregado'),
(10, 10, 'Calle 10 #100-110', '2026-04-09 17:59:46', 'pendiente');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `imagen` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `id_categoria`, `estado`, `fecha_creacion`) VALUES
(1, 'Blusa de mujer', 'Blusa de fibra delgada', 42000.00, 10, 'imagenes/blusa mujer de fibra delgada.webp', 1, 'activo', '2026-04-09 17:51:40'),
(2, 'Camisa negra', 'Camisa elegante negra', 65000.00, 10, 'imagenes/imagen 5.PNG', 1, 'activo', '2026-04-09 17:51:40'),
(3, 'Camisa blanca', 'Camisa clásica blanca', 30000.00, 10, 'imagenes/imagen 4.PNG', 1, 'activo', '2026-04-09 17:51:40'),
(4, 'Jean tiro alto azul', 'Jean moderno', 63000.00, 10, 'imagenes/jeans tirom alto azul.webp', 2, 'activo', '2026-04-09 17:51:40'),
(5, 'Pantalon ancho recto', 'Estilo urbano', 42000.00, 10, 'imagenes/pantalon rectos anchos.png', 2, 'activo', '2026-04-09 17:51:40'),
(6, 'Falda mini', 'Falda moderna', 40000.00, 10, 'imagenes/falda.webp', 3, 'activo', '2026-04-09 17:51:40'),
(7, 'Zapatos casuales', 'Comodos y modernos', 45000.00, 10, 'imagenes/zapatos casuales blancas.webp', 4, 'activo', '2026-04-09 17:51:40'),
(8, 'Tenis deportivos', 'Para deporte', 75000.00, 10, 'imagenes/Zapatos deportivos mujer.webp', 4, 'activo', '2026-04-09 17:51:40'),
(9, 'Camiseta blanca', 'Camiseta básica algodón', 35000.00, 50, 'camiseta1.jpg', 1, 'activo', '2026-04-09 17:59:46'),
(10, 'Camiseta negra', 'Camiseta estampada', 40000.00, 40, 'camiseta2.jpg', 1, 'activo', '2026-04-09 17:59:46'),
(11, 'Jean skinny', 'Pantalón ajustado azul', 90000.00, 30, 'jean1.jpg', 2, 'activo', '2026-04-09 17:59:46'),
(12, 'Jean baggy', 'Pantalón ancho', 95000.00, 20, 'jean2.jpg', 2, 'activo', '2026-04-09 17:59:46'),
(13, 'Vestido rojo', 'Vestido elegante', 120000.00, 15, 'vestido1.jpg', 3, 'activo', '2026-04-09 17:59:46'),
(14, 'Vestido negro', 'Vestido formal', 150000.00, 10, 'vestido2.jpg', 3, 'activo', '2026-04-09 17:59:46'),
(15, 'Tenis deportivos', 'Zapatos deportivos', 180000.00, 25, 'tenis1.jpg', 4, 'activo', '2026-04-09 17:59:46'),
(16, 'Zapatos formales', 'Zapatos elegantes', 200000.00, 20, 'zapatos1.jpg', 4, 'activo', '2026-04-09 17:59:46'),
(17, 'Gorra', 'Accesorio casual', 25000.00, 60, 'gorra.jpg', 5, 'activo', '2026-04-09 17:59:46'),
(18, 'Sudadera', 'Ropa deportiva', 85000.00, 35, 'sudadera.jpg', 6, 'activo', '2026-04-09 17:59:46');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `estado` enum('activo','inactivo') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `correo`, `password`, `fecha_registro`, `estado`) VALUES
(1, 'Ana', 'Gomez', '3001234567', 'ana@gmail.com', '123456', '2026-04-09 17:59:46', 'activo'),
(2, 'Luis', 'Perez', '3002345678', 'luis@gmail.com', '123456', '2026-04-09 17:59:46', 'activo'),
(3, 'Carlos', 'Rodriguez', '3003456789', 'carlos@gmail.com', '123456', '2026-04-09 17:59:46', 'activo'),
(4, 'Maria', 'Lopez', '3004567890', 'maria@gmail.com', '123456', '2026-04-09 17:59:46', 'activo'),
(5, 'Sofia', 'Martinez', '3005678901', 'sofia@gmail.com', '123456', '2026-04-09 17:59:46', 'activo'),
(6, 'Jorge', 'Ramirez', '3006789012', 'jorge@gmail.com', '123456', '2026-04-09 17:59:46', 'activo'),
(7, 'Laura', 'Torres', '3007890123', 'laura@gmail.com', '123456', '2026-04-09 17:59:46', 'activo'),
(8, 'Andres', 'Vargas', '3008901234', 'andres@gmail.com', '123456', '2026-04-09 17:59:46', 'activo'),
(9, 'Valentina', 'Rojas', '3009012345', 'valentina@gmail.com', '123456', '2026-04-09 17:59:46', 'activo'),
(10, 'Daniel', 'Castro', '3010123456', 'daniel@gmail.com', '123456', '2026-04-09 17:59:46', 'activo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
