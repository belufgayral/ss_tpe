-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2021 a las 01:04:07
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE `recursos` (
  `id_recurso` int(11) NOT NULL,
  `recurso` varchar(45) NOT NULL,
  `germinacion` varchar(45) DEFAULT NULL,
  `id_zona` int(11) NOT NULL,
  `imagen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recursos`
--

INSERT INTO `recursos` (`id_recurso`, `recurso`, `germinacion`, `id_zona`, `imagen`) VALUES
(1, 'Corteza de sauce', 'Perenne', 6, NULL),
(2, 'Corteza de cerezo', 'Primavera', 3, NULL),
(3, 'Carbón activado', '', 4, NULL),
(4, 'Escama de nishikigoi', '', 1, NULL),
(5, 'Flor de cerezo', 'Primavera', 5, NULL),
(6, 'Semilla de girasol', 'Verano', 2, NULL),
(7, 'Campanilla de invierno', 'Invierno', 7, NULL),
(8, 'Cono de pino', 'Perenne', 3, NULL),
(9, 'Lavanda', 'Primavera', 7, NULL),
(10, 'Áloe vera', 'Perenne', 8, NULL),
(11, 'Romero', 'Otoño', 5, NULL),
(12, 'Hoja de menta', 'Invierno', 5, NULL),
(13, 'Manzanilla', 'Verano', 6, NULL),
(14, 'Caléndula', 'Primavera', 1, NULL),
(15, 'Diente de león', 'Primavera', 2, NULL),
(16, 'Árnica', 'Verano', 2, NULL),
(17, 'Lirio cala', 'Primavera', 3, NULL),
(18, 'Margarita', 'Verano', 6, NULL),
(19, 'Corteza de bambú', 'Perenne', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reseñas`
--

CREATE TABLE `reseñas` (
  `id_review` int(11) NOT NULL,
  `review` varchar(500) NOT NULL,
  `valoracion` int(11) NOT NULL,
  `id_recurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reseñas`
--

INSERT INTO `reseñas` (`id_review`, `review`, `valoracion`, `id_recurso`) VALUES
(1, 'Muy saludable!', 3, 10),
(3, 'Aromática y agradable', 4, 16),
(4, 'Ideal para quemaduras', 4, 10),
(5, 'Es muy viscoso', 2, 10),
(6, 'Queda muy rica con el arroz', 4, 16),
(7, 'Puede ser tóxica, no la recomiendo cerca de los niños', 2, 16),
(8, 'No me gusta nada', 1, 16),
(9, 'Genial para quemaduras y raspones', 4, 14),
(10, 'Queda muy rica en el té!', 3, 14),
(11, 'Es de las plantas más bonitas que he visto', 4, 7),
(12, 'Ideal para resfríos ', 5, 7),
(13, 'Es muy difícil conseguirla', 1, 7),
(14, 'Lima asperezas de la piel', 3, 3),
(15, 'Podría ser mejor para tratar la piel', 2, 3),
(16, 'Muy bueno!', 4, 3),
(17, 'Abundan en cantidad, muy fáciles de conseguir', 3, 8),
(18, 'Buenos para generar fuego', 3, 8),
(19, 'No los veo muy útiles', 2, 8),
(20, 'Versátil y duradera', 4, 19),
(21, 'De mis favoritas!', 5, 19),
(22, 'Aromática y resistente', 4, 2),
(23, 'No me parece muy útil', 1, 2),
(24, 'Está genial, de gran calidad', 4, 1),
(25, 'Bastante endeble', 2, 1),
(26, 'De muy fácil acceso', 3, 15),
(27, 'No me resulta muy aromática', 2, 15),
(28, 'Me encanta usarlas en joyas', 5, 4),
(29, 'Le dan un bonito toque para decorar', 4, 4),
(30, 'Muy aromática en té', 4, 5),
(31, 'Grandes propiedades medicinales', 4, 5),
(32, 'Dura muy poco', 2, 5),
(33, 'Ideal en té y diversas bebidas, tragos también', 4, 12),
(34, 'Se puede congelar y usar luego, es genial', 5, 12),
(35, 'Crecen demasiado y son molestas', 2, 12),
(36, 'Atrae muchas abejas', 2, 9),
(37, 'De aroma precioso e imagen amable', 4, 9),
(38, 'Es algo difícil de conseguir', 2, 17),
(39, 'Se ahogan con facilidad', 1, 17),
(40, 'Posee grandes propiedades medicinales!', 4, 17),
(41, 'Riquísima en té ', 4, 13),
(42, 'Muy rico aroma!', 4, 13),
(43, 'No me gustan mucho', 2, 13),
(44, 'De fácil acceso, muy versátiles', 4, 18),
(45, 'Suelen estar infectadas por otros animales', 2, 18),
(46, 'No las uso mucho', 2, 18),
(47, 'Muy aromática ', 3, 11),
(48, 'Queda rica en muchas comidas', 4, 11),
(49, 'Detesto su sabor', 1, 11),
(50, 'Ricas y abundantes ', 4, 6),
(51, 'Con grandes capacidades medicinales!', 4, 6),
(52, 'Tostadas son lo mejor', 5, 6),
(53, 'Hay semillas mucho más ricas', 2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(150) NOT NULL,
  `administrador` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `email`, `pass`, `administrador`) VALUES
(1, 'belen@gmail.com', '$2y$10$O/yfgmTnX5suUhHRvFi1ReJVgHX9Nvh9gylM1Yg559dqpQxy.xAGC', 0),
(2, 'manuel@gmail.com', '$2y$10$JG/qWkESgqjfIxncudE1E.sCc7E6C8dw1uefJq6MfFhj9x3bScOQK', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `id_zona` int(11) NOT NULL,
  `zona` varchar(50) NOT NULL,
  `prefectura` varchar(45) NOT NULL,
  `ciudad_cercana` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`id_zona`, `zona`, `prefectura`, `ciudad_cercana`) VALUES
(1, 'Estanque azul', 'Hokkaido', 'Kamikawa'),
(2, 'Monte Tokachi', 'Hokkaido', 'Daisetsuzan'),
(3, 'Bosque Sagano', 'Kioto', 'Arashiyama'),
(4, 'Volcán Aogashima', 'Izu', 'Aogashima'),
(5, 'Monte Koya', 'Wakayama', 'Osaka'),
(6, 'Bosque de Shikoku', 'Shikoku', NULL),
(7, 'Prado Kenrokuen', 'Ishikawa', 'Kanazawa'),
(8, 'Cascada Nachi', 'Wakayama', 'Higashimuro');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`id_recurso`),
  ADD KEY `index` (`id_zona`);

--
-- Indices de la tabla `reseñas`
--
ALTER TABLE `reseñas`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `id_recurso` (`id_recurso`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`id_zona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `recursos`
--
ALTER TABLE `recursos`
  MODIFY `id_recurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `reseñas`
--
ALTER TABLE `reseñas`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `zonas`
--
ALTER TABLE `zonas`
  MODIFY `id_zona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD CONSTRAINT `recursos_ibfk_1` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reseñas`
--
ALTER TABLE `reseñas`
  ADD CONSTRAINT `reseñas_ibfk_1` FOREIGN KEY (`id_recurso`) REFERENCES `recursos` (`id_recurso`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
