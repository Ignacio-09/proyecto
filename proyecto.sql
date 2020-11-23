-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2020 a las 01:36:13
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritos`
--

CREATE TABLE `carritos` (
  `id_car` int(11) NOT NULL,
  `user` varchar(150) NOT NULL,
  `nombre_prod` varchar(100) DEFAULT NULL,
  `precio_car` int(11) NOT NULL,
  `piezas_car` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_prod` int(11) NOT NULL,
  `nombre_prod` varchar(100) NOT NULL,
  `precio_prod` int(11) NOT NULL,
  `desc_prod` varchar(250) NOT NULL,
  `url_prod` varchar(100) NOT NULL,
  `tipo_prod` varchar(100) NOT NULL,
  `valor_prod` varchar(100) NOT NULL,
  `estado_prod` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_prod`, `nombre_prod`, `precio_prod`, `desc_prod`, `url_prod`, `tipo_prod`, `valor_prod`, `estado_prod`) VALUES
(13, 'ALIENWARE AURORA', 6800, 'Intel® Core™ i3-9100 de 9.ª\nWindows 10 Home de 64 bits\nMemoria HyperX™ FURY DDR4 y 8 GB\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', '../../assets/img/productos/alien/alien1.png', 'Computadora', 'Alienware', 'Nuevo'),
(14, 'HEADSET BLUE NACEB', 2, 'Sin descripcion', '../../assets/img/productos/acces/2.png', 'Accesorio', 'Pantalla', 'Nuevo'),
(15, 'MULTI RGB GABINETE', 61032, 'kit multi RGB incluido, espacio para grandes fuentes y el mejor water cooler de su preferencia mothersboard mas seguras', '../../assets/img/productos/gabinetes/6.jpg', 'Gabinete', 'Otro', 'Nuevo'),
(16, 'Fan con disipador', 1032, 'Disipador de la marca Corsair', '../../assets/img/productos/coolers/4.png', 'Water Cooling', 'Otro', 'Nuevo'),
(17, 'NACEB CPU RED', 5000, 'Soporte en placas atx.', '../../assets/img/productos/gabinetes/3.png', 'Gabinete', 'Otro', 'Nuevo'),
(18, 'Water Cooler Corsair', 2432, 'Ventilador corsair con disipador\nEnfriamiento liquido permitido', '../../assets/img/productos/coolers/2.png', 'Water Cooling', 'Otro', 'Nuevo'),
(19, 'VEGANCE 2X8GB', 4800, 'Sin descripcion', '../../assets/img/productos/tarjetas/4.png', 'Hardware', 'Tarjeta de video', 'Nuevo'),
(20, 'SILLA VERDE', 2461032, 'Sin descripcion', '../../assets/img/productos/acces/10.png', 'Accesorio', 'Silla gamer', 'Nuevo'),
(21, 'SILLA NARANJA', 2461032, 'Una poderosisima silla gamer', '../../assets/img/productos/acces/8.png', 'Accesorio', 'Silla gamer', 'Nuevo'),
(22, 'ASUS n56jr-ds71-c', 2461032, 'Intel® Core™ i3-9100 de 9.ª\nWindows 10 Home de 64 bitS\nMemoria HyperX™ FURY DDR4 y 8 GB\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', '../../assets/img/productos/asus/3.png', 'Computadora', 'Asus Gaming', 'Nuevo'),
(23, 'HEADSET ROJOS MARS', 2461032, 'Sin descripcion', '../../assets/img/productos/acces/5.png', 'Accesorio', 'Audio', 'Nuevo'),
(24, 'NACEB TECNO 8 GB', 4103, 'Sin descripcion', '../../assets/img/productos/tarjetas/5.png', 'Hardware', 'Tarjeta de video', 'Nuevo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `user` varchar(150) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `fecha_nac` date NOT NULL,
  `correo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`user`, `nombre`, `apellidos`, `fecha_nac`, `correo`) VALUES
('123', 'Ignacio', 'Luz', '2020-11-06', 'joscruz581@gmail.com'),
('beto', 'Beto', 'betillo', '2020-11-06', 'betin'),
('camacho', 'Edgar', 'Camacho', '2020-11-06', 'email.com'),
('ddd', 'ddd', 'ddd', '2020-11-04', 'ddd'),
('firu', 'Ignacio', 'Luz', '2020-11-20', 'joscruz581@gmail.com'),
('ignacio', 'Ignacio', 'Reyes', '2020-11-12', 'ignacio.luz99@gmail.com'),
('ignacio2', 'Ignacio', 'Reyes', '2020-11-12', 'ignacio.luz99@gmail.com'),
('josesin', 'Jose', 'perez', '2020-11-04', 'asdasd'),
('jsp2', 'Jesus Emmanuel', 'Garcia', '2020-11-04', 'jesusmartinez0257@gmail.com'),
('nach', 'Ignacio', 'Reyes', '2020-11-04', 'ignacio.luz99@gmail.com'),
('popoo', 'Ignacio', 'Luz', '2020-11-05', 'joscruz581@gmail.com'),
('popoos', 'Ignacio', 'Luz', '2020-11-05', 'ignacioluz58@gmail.com'),
('pp', 'pp', 'pp', '2020-11-06', 'pp'),
('sss', 'sss', 'sss', '2020-11-19', 'ssss'),
('test', 'Ignacio', 'Reyes', '2019-11-07', 'ignacio.luz99@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `user` varchar(150) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `tipo_user` char(1) NOT NULL,
  `nombre` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`user`, `pass`, `tipo_user`, `nombre`) VALUES
('123', 'asd', 'U', 'Jose'),
('admin', '123', 'A', 'admin'),
('admin2', '123', 'A', 'admin'),
('asd', 'asd', 'A', 'asdsad'),
('asdasd', 'asd', 'A', 'asd'),
('beto', '123', 'U', 'Beto'),
('camacho', '123', 'U', 'Edgar'),
('ddd', 'ddd', 'U', 'ddd'),
('firu', '123', 'U', 'Ignacio'),
('firu4', '123', 'A', 'Pepe'),
('ignacio', '1111', 'U', 'Ignacio'),
('ignacio2', '2222', 'U', 'Ignacio'),
('josesin', '9090', 'U', 'Jose'),
('nach', '123', 'U', 'Ignacio'),
('popo', '0909', 'U', 'Jose'),
('popoo', '123', 'U', 'Ignacio'),
('popoos', 'asd', 'U', 'Ignacio'),
('test', '123', 'U', 'Ignacio');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD PRIMARY KEY (`id_car`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_prod`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`user`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carritos`
--
ALTER TABLE `carritos`
  MODIFY `id_car` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
