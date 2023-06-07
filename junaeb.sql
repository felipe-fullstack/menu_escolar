-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2023 a las 22:33:29
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `junaeb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `is_rectified` int(11) NOT NULL DEFAULT 0,
  `observation` text DEFAULT NULL,
  `id_schools` int(11) DEFAULT NULL,
  `vegetarian` int(11) DEFAULT NULL,
  `vegetarian_real` int(11) DEFAULT NULL,
  `celiac` int(11) DEFAULT NULL,
  `celiac_real` int(11) DEFAULT NULL,
  `standard` int(11) DEFAULT NULL,
  `standard_real` int(11) DEFAULT NULL,
  `caloric` int(11) DEFAULT NULL,
  `caloric_real` int(11) DEFAULT NULL,
  `ethnic` int(11) DEFAULT NULL,
  `ethnic_real` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `fecha`, `is_rectified`, `observation`, `id_schools`, `vegetarian`, `vegetarian_real`, `celiac`, `celiac_real`, `standard`, `standard_real`, `caloric`, `caloric_real`, `ethnic`, `ethnic_real`) VALUES
(1, '2023-06-03', 0, NULL, NULL, 32, NULL, 32, NULL, 32, NULL, 32, NULL, 32, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `schools`
--

INSERT INTO `schools` (`id`, `name`, `email`, `PASSWORD`) VALUES
(8, 'alejandra', 'alejandra@gmail.com', '1234'),
(9, 'Felipe', 'floyola@afpmodelo.cl', '1234'),
(10, 'Felipe', 'floyola@afpmodelo.cl', '1234'),
(11, 'Felipe', 'floyola@afpmodelo.cl', '1234'),
(12, 'Felipe', 'floyola@afpmodelo.cl', '12345'),
(13, 'andres', 'andres@gmail.com', '12345'),
(14, 'andres', 'andres@gmail.com', '12345'),
(15, 'andres', 'andres@gmail.com', '12345'),
(16, 'mati', 'mati@gmail.com', '12345'),
(17, 'carlos', 'carlos@gmail.com', '1234'),
(18, 'carlos', 'carlos@gmail.com', '1234'),
(19, 'carlos', 'carlos@gmail.com', '123'),
(20, 'carlos', 'carlos@gmail.com', '123'),
(21, 'admin', 'admin@admin.cl', '1234'),
(22, 'admin2', 'admin2@gmail.com', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_schools` (`id_schools`);

--
-- Indices de la tabla `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_schools`) REFERENCES `schools` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
