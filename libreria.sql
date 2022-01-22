-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2021 a las 00:58:50
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `comentario` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `puntuacion` int(1) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `comentario`, `puntuacion`, `id_libro`, `id_usuario`, `fecha_creacion`) VALUES
(3, 'Test', 4, 3, 1, '2021-11-22 10:28:32'),
(4, 'Test 2', 1, 3, 1, '2021-11-22 10:28:48'),
(5, 'Test 2', 1, 3, 1, '2021-11-22 10:29:24'),
(6, 'Test 3', 3, 3, 1, '2021-11-22 10:29:26'),
(7, 'Test 4', 2, 3, 1, '2021-11-22 10:29:28'),
(8, 'Test 5', 1, 3, 1, '2021-11-22 10:29:29'),
(14, 'test', 3, 3, 7, '2021-11-23 20:40:03'),
(15, 'test', 3, 3, 7, '2021-11-23 20:40:43'),
(16, 'test', 3, 3, 7, '2021-11-23 20:40:58'),
(17, 'Nuevo!', 3, 3, 7, '2021-11-23 20:51:52'),
(19, 'Nuevo!', 2, 6, 1, '2021-11-23 20:53:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escritores`
--

CREATE TABLE `escritores` (
  `id_escritor` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `biografia` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `escritores`
--

INSERT INTO `escritores` (`id_escritor`, `nombre`, `apellido`, `fecha_nacimiento`, `biografia`) VALUES
(2, 'Antoine', 'Antoine de Saint Exupery ', '1900-06-22', '                Antoine Marie Jean-Baptiste Roger Conde de Saint-Exupéry​, conocido como Antoine de Saint-Exupéry, fue un aviador y escritor francés, autor de la famosa obra El principito\r\n    \r\n    '),
(3, 'Joanne', 'Rowling', '1957-07-31', 'J.K. Rowling es la autora de los siete libros de la saga de Harry Potter, que han vendido más de 500 millones de ejemplares, se han traducido a más de ochenta idiomas y han inspirado ocho películas de gran éxito de taquilla. Rowling es coautora de Harry Potter y el legado maldito, una obra de teatro donde nos presenta a Harry ya adulto. También escribe los guiones de las películas de Animales fantásticos.\r\n\r\nEn 2020, J.K. Rowling volvió a escribir para niños con el cuento de hadas El ickabog, qu'),
(5, 'Stephen', 'King', '1947-09-24', 'Stephen Edwin King, más conocido como Stephen King y ocasionalmente por su seudónimo Richard Bachman, es un escritor estadounidense de novelas de terror, ficción sobrenatural, misterio, ciencia ficción y literatura fantástica'),
(6, 'Simone', 'de Beauvoir', '1908-01-09', 'Simone Lucie Ernestine Marie Bertrand de Beauvoir fue una filósofa, profesora y escritora francesa.​ Fue una luchadora por la igualdad de derechos de la mujer. Escribió novelas, ensayos, biografías y monografías sobre temas políticos, sociales y filosóficos.'),
(7, 'Eduardo', 'Galeano', '1940-09-03', 'Fue un periodista y escritor uruguayo, considerado uno de los escritores más influyentes de la izquierda latinoamericana.​Sus libros más conocidos, Las venas abiertas de América Latina y Memoria del fuego, han sido traducidos a veinte idiomas.'),
(12, 'pepito', 'prueba', '2021-05-19', '        bla bla bla lb a\r\n    \r\n    ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `sinopsis` varchar(500) NOT NULL,
  `genero` varchar(30) NOT NULL,
  `anio` year(4) NOT NULL,
  `id_escritor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `titulo`, `sinopsis`, `genero`, `anio`, `id_escritor`) VALUES
(3, 'Harry Potter y la Piedra Filosofal', '«Con las manos temblorosas, Harry le dio la vuelta al sobre y vio un sello de lacre púrpura con un escudo de armas: un león, un águila, un tejón y una serpiente, que rodeaban una gran letra H.»\r\n\r\nHarry Potter nunca ha oído hablar de Hogwarts hasta que empiezan a caer cartas en el felpudo del número 4 de Privet Drive. Llevan la dirección escrita con tinta verde en un sobre de pergamino amarillento con un sello de lacre púrpura, y sus horripilantes tíos se apresuran a confiscarlas. Más tarde, el ', 'Fantasia', 1999, 3),
(6, 'El Resplandor', 'Jack Torrance se convierte en cuidador de invierno en el Hotel Overlook, en Colorado, con la esperanza de vencer su bloqueo con la escritura. Se instala allí junto con su esposa, Wendy, y su hijo, Danny, que está plagado de premoniciones psíquicas. Mientras la escritura de Jack no fluye y las visiones de Danny se vuelven más preocupantes, Jack descubre oscuros secretos del hotel y comienza a convertirse en un maníaco homicida, empeñado en aterrorizar a su familia.', 'Terror', 1977, 5),
(7, 'El Segundo Sexo', 'Se trata de un estudio totalizador donde se investiga el porqué de la situación en que se encuentra esa mitad de la humanidad que somos las mujeres. ... Pensadora y novelista francesa, representante del movimiento existencialista ateo y figura importante en la reivindicación de los derechos de la mujer.', 'ensayo', 1949, 6),
(23, 'Carrie', 'Carrie White, una tímida adolescente críada por una fanática religosa es humillada constantemente por su compañeros de instituto. Sin embargo, Carrie no es una chica cualquiera, la joven posee poderes psíquicos que se manifiestan cuando se siente dominada por la ira.', 'Terror', 1977, 5),
(25, 'la sirenita', 'sfhdgjfhkfgkgf', 'Infantil', 1998, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `mail`, `clave`, `rol`) VALUES
(1, 'admin', 'admin@gmail.com', '$2a$12$PwKMSpX281sqINDPztJ0I.Jpp8awR3v2UKp/jn85PpC6TSfpMW82C', 'admin'),
(5, 'test4', 'test@test.com', '$2y$10$6c1zXXNnbHWoJa7mNFVnKOYdOvC1pwr5gEgjiokdvo90QzYloy4gC', 'no-admin'),
(6, 'prueba3', 'test55555555555@test.com', '$2y$10$SqTngyuqGvRB7z8KGk2vOO1vzRBnW54rLE0rdQZ6I0t8qZVeSgYve', 'admin'),
(7, 'usuarioNA', 'noadmin@gmail.com', '$2y$10$/2idoG1FF4ixDbtvTRPGMuXZzikBmPWLcnfdFVRvMyuI3ozbjV5Ga', 'no-admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `escritores`
--
ALTER TABLE `escritores`
  ADD PRIMARY KEY (`id_escritor`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `id_escritor` (`id_escritor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `escritores`
--
ALTER TABLE `escritores`
  MODIFY `id_escritor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_escritor`) REFERENCES `escritores` (`id_escritor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
