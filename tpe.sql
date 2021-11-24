-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2021 a las 23:17:30
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
(7, 'Campanilla de invierno', 'Invierno', 6, ''),
(8, 'Cono de pino', 'Perenne', 2, ''),
(13, 'Manzanilla', 'Verano', 7, ''),
(19, 'Laurel', 'Invierno', 2, ''),
(20, 'Pétalos de rosa', 'Primavera', 7, ''),
(23, 'Lágrima ceniza', 'Otoño', 2, ''),
(24, 'Lágrima gris', 'Otoño', 11, ''),
(26, 'Carne de jabalí', '', 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reseñas`
--

CREATE TABLE `reseñas` (
  `id_review` int(11) NOT NULL,
  `review` varchar(500) NOT NULL,
  `valoracion` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_recurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reseñas`
--

INSERT INTO `reseñas` (`id_review`, `review`, `valoracion`, `id_user`, `id_recurso`) VALUES
(1, 'esta flor es la mejor', 0, 0, 7),
(3, 'aguante la manzanilla Nico Dazeo', 0, 0, 9),
(4, 'Dottori volve', 0, 0, 12),
(5, 'hola Franco', 0, 0, 13),
(7, 'a ver si se agrega esta poronga carcomida por murcielagos', 0, 0, 15),
(8, 'cuando el tiempo pasa y nos hacemos viejos', 0, 0, 19),
(13, 'pino erere', 3, 0, 22),
(16, 'bife de perro', 1, 0, 26),
(18, 'laurel hermoso', 4, 0, 19);

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
(1, 'kohaku_kun@gmail.com', 'zeoQsYW0zXncI', 0),
(2, 'hideyoshi_soga@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$eUlJRE04NTFxQlVFQVhvRg$8vN4P00ve6GROVQhmgNTT/0XtEedwaI0lXgRK9tvEXU', 1),
(3, 'takeda_minamoto@gmail.com', '$2y$10$mxfNfse4dJLFDJX6xp1KDurGSGpmFHKzVoB.C3LfhhOLik9H/2crS', 0);

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
(2, 'Bosque Sagano', 'Kioto', 'Nara'),
(3, 'Cascada Nachi', 'Wakayama', 'Higashimuro'),
(6, 'Monte Tokachi', 'Hokkaido', 'Daisetsuzan'),
(7, 'Prado Kenrokuen', 'Ishikawa', 'Kanazawa'),
(11, 'Volcán Aogashine', 'Izu', 'Aogashima'),
(15, 'Bosque de Kamakura', 'Kanegawa', 'Kamakura');

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
  ADD KEY `id_user` (`id_user`),
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
  MODIFY `id_recurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `reseñas`
--
ALTER TABLE `reseñas`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `zonas`
--
ALTER TABLE `zonas`
  MODIFY `id_zona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD CONSTRAINT `recursos_ibfk_1` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
