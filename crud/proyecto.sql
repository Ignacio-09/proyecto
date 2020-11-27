-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2020 a las 21:42:10
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
  `precio_car` float NOT NULL,
  `piezas_car` int(11) NOT NULL,
  `id_prod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carritos`
--

INSERT INTO `carritos` (`id_car`, `user`, `nombre_prod`, `precio_car`, `piezas_car`, `id_prod`) VALUES
(1, 'test', 'NACEB ATX ROJO', 2414, 2, 26),
(10, 'firu', 'Ventilador NZXT', 2432, 1, 27),
(11, 'beto', 'ALIENWARE AURORA', 6800, 4, 13),
(13, 'beto', 'ASUS Q504UA 2', 2461030, 2, 30),
(17, 'pando', 'HEADSET BLUE NACEB', 2100, 1, 14),
(19, 'pando', 'HEADSET AZULES G', 2461030, 2, 53),
(20, 'pando', 'ALIENWARE AURORA', 6800, 2, 13),
(21, 'pando', 'MULTI RGB GABINETE', 61032, 2, 15),
(22, 'firu', 'ASUS ROG gl552', 2461030, 1, 33),
(23, 'tre', 'SILLA VERDE', 2461030, 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_prod` int(11) NOT NULL,
  `nombre_prod` varchar(100) NOT NULL,
  `precio_prod` float NOT NULL,
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
(14, 'HEADSET BLUE NACEB', 2100, 'Sin descripcion', '../../assets/img/productos/acces/2.png', 'Hardware', 'Pantalla', 'Nuevo'),
(15, 'MULTI RGB GABINETE', 61032, 'kit multi RGB incluido, espacio para grandes fuentes y el mejor water cooler de su preferencia mothersboard mas seguras', '../../assets/img/productos/gabinetes/6.jpg', 'Gabinete', 'Otro', 'Nuevo'),
(16, 'Fan con disipador', 1032, 'Disipador de la marca Corsair', '../../assets/img/productos/coolers/4.png', 'Water Cooling', 'Otro', 'Nuevo'),
(17, 'NACEB CPU RED', 5000, 'Soporte en placas atx.', '../../assets/img/productos/gabinetes/3.png', 'Gabinete', 'Otro', 'Nuevo'),
(18, 'Water Cooler Corsair', 2432, 'Ventilador corsair con disipador\nEnfriamiento liquido permitido', '../../assets/img/productos/coolers/2.png', 'Water Cooling', 'Otro', 'Nuevo'),
(19, 'VEGANCE 2X8GB', 4800, 'Sin descripcion', '../../assets/img/productos/tarjetas/4.png', 'Tarjetas', 'RAM', 'Nuevo'),
(20, 'SILLA VERDE', 2461030, 'Sin descripcion', '../../assets/img/productos/acces/10.png', 'Accesorio', 'Silla gamer', 'Nuevo'),
(21, 'SILLA NARANJA', 2461030, 'Una poderosisima silla gamer', '../../assets/img/productos/acces/8.png', 'Accesorio', 'Silla gamer', 'Nuevo'),
(22, 'ASUS n56jr-ds71-c', 2461030, 'Intel® Core™ i3-9100 de 9.ª\nWindows 10 Home de 64 bitS\nMemoria HyperX™ FURY DDR4 y 8 GB\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', '../../assets/img/productos/asus/3.png', 'Computadora', 'Asus Gaming', 'Nuevo'),
(23, 'HEADSET ROJOS MARS', 2461030, 'Sin descripcion', '../../assets/img/productos/acces/5.png', 'Hardware', 'Audio', 'Nuevo'),
(24, 'NACEB TECNO 8 GB', 4103, 'Sin descripcion', '../../assets/img/productos/tarjetas/5.png', 'Tarjetas', 'RAM', 'Nuevo'),
(25, 'BLUE GAMING CPU', 3800, 'Cristal templado, tres coolers incluidos', '../../assets/img/productos/gabinetes/2.png', 'Gabinete', 'Otro', 'Mas vendido'),
(26, 'NACEB ATX ROJO', 2414, 'RGB ROJO FRONTAL USB Y AUDIO', '../../assets/img/productos/gabinetes/1.png', 'Gabinete', 'Otro', 'Mas vendido'),
(27, 'Ventilador NZXT', 2432, 'Excelente ventilador 4 tiempos con luz RGB\nMulticolor con una excelente iluminacion de tu PC', '../../assets/img/productos/coolers/3.png', 'Water Cooling', 'Otro', 'Mas vendido'),
(29, 'MANDO PLAY', 2000, 'Sin descripcion', '../../assets/img/productos/acces/1.png', 'Accesorio', 'Mandos', 'Mas vendido'),
(30, 'ASUS Q504UA 2', 2461030, 'Intel Core i7 Gen 8th\nWindows 10 Home de 64 bits\n8GB RAM\n1TB DD + 128GB SSD', '../../assets/img/productos/asus/1.png', 'Computadora', 'Asus Gaming', 'Mas vendido'),
(31, 'PANTALLA ASUS ROG', 2458, 'Sin descripcion', '../../assets/img/productos/hardware/2.png', 'Hardware', 'Pantalla', 'Mas vendido'),
(32, 'Water Cooler Corsair', 2432, 'Ventilador corsair con disipador\nEnfriamiento liquido permitido', '../../assets/img/productos/coolers/2.png', 'Water Cooling', 'Otro', 'Mas vendido'),
(33, 'ASUS ROG gl552', 2461030, 'Intel® Core™ i3-9100 de 9.ª\nWindows 10 Home de 64 bitS\nMemoria HyperX™ FURY DDR4 y 8 GB\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', '../../assets/img/productos/asus/2.png', 'Computadora', 'Asus Gaming', 'Mas vendido'),
(34, 'PANTALLA ASUS EDITION ESTRAL', 41031, 'Sin descripcion', '../../assets/img/productos/hardware/11.png', 'Hardware', 'Pantalla', 'Mas vendido'),
(35, 'TECKNET Ratón Inalámbrico Bluetooth', 379, 'Mouse Inalámbrico Bluetooth, 3000DPI 5 Niveles  Ajustable Compatible con Laptop, PC, Ordenador, Chromebook, Notebook 24 Meses Duración de Batería', '../../assets/img/productos/acces/2.jpg', 'Hardware', 'Mouse', 'Mas vendido'),
(37, 'Logitech G403 Hero Mouse Gaming', 780, 'Sensor HERO 16K de próxima generación,  \nnuestro sensor más avanzado, con seguimiento                                      1:1, 400  IPS y una sensibilidad máxima                                          de 100-16.000 dpi', '../../assets/img/productos/hardware/1.jpeg', 'Hardware', 'Mouse', 'Destacado'),
(38, 'SPACES PEGASO', 2461030, 'Intel® Core™ i3-9100 de 9.ª\nWindows 10 Home de 64 bits\nMemoria HyperX™ FURY DDR4 y 8 GB\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', '../../assets/img/productos/spaces/1.jpg', 'Computadora', 'Spaces series', 'Destacado'),
(40, 'Cooler master', 4612, 'Cooler con disipador aliance', '../../assets/img/productos/coolers/1.png', 'Water Cooling', 'Otro', 'Destacado'),
(41, 'VicTsing Ratón Bluetooth Inalámbrico', 394, 'Mouse Inalámbrico Bluetooth, 3000DPI 5 Niveles Ajustable Compatible con Laptop, PC, Ordenador, Chromebook, Notebook 24 Meses Duración de Batería', '../../assets/img/productos/acces/3.jpg', 'Hardware', 'Mouse', 'Destacado'),
(42, 'SPACES PIXIS', 2461030, 'Intel® Core™ i3-9100 de 9.ª\nWindows 10 Home de 64 bits\nMemoria HyperX™ FURY DDR4 y 8 GB\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', '../../assets/img/productos/spaces/2.jpg', 'Computadora', 'Spaces series', 'Destacado'),
(43, 'ASUS ROG G752VTT', 2461030, 'Intel® Core™ i3-9100 de 9.ª\nWindows 10 Home de 64 bits\nMemoria HyperX™ FURY DDR4 y 8 GB\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', '../../assets/img/productos/asus/4.png', 'Computadora', 'Asus Gaming', 'Otro'),
(44, 'SPACES CRATER', 2461030, 'Intel® Core™ i3-9100 de 9.ª\nWindows 10 Home de 64 bits\nMemoria HyperX™ FURY DDR4 y 8 GB\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', '../../assets/img/productos/spaces/4.jpg', 'Computadora', 'Spaces series', 'Otro'),
(45, 'SPACES GRUS', 2461030, 'Intel® Core™ i3-9100 de 9.ª\nWindows 10 Home de 64 bits\nMemoria HyperX™ FURY DDR4 y 8 GB\nGeForce GTX® 1650 con memoria GDDR5 de 4 GB', '../../assets/img/productos/spaces/3.jpg', 'Computadora', 'Spaces series', 'Otro'),
(46, 'ALIENWARE M17 R2', 5909900, 'Intel® Core™ i7-9750H de 9.ª \nWindows 10 Home de 64 bits\nMemoria DDR4 de 16 GBB\nGeForce RTX™ 2060 con memoria GDDR6 de 6 GB \nSSD PCIe M.2 de 256 GB', '../../assets/img/productos/alien/alienware_m15.png', 'Computadora', 'Alienware', 'Otro'),
(47, 'ALIEN AREA 51M', 7772420, 'Intel® Core™ i9-9900HK de 9.ª\nWindows 10 Home de 64 bits\n16 GB, 2 de 8 GB, DDR4\nGeForce RTX™ 2070 con GDDR6 de 8 GB', '../../assets/img/productos/alien/alienware-area-51m.png', 'Computadora', 'Alienware', 'Otro'),
(48, 'ALIENWARE M15 R2', 5540400, 'Intel® Core™ i7-9750H de 9.ª\nWindows 10 Home de 64 bits\nMemoria DDR4 de 16 G\nSSD PCIe M.2 de 256 GB\nGeForce RTX™ 2060 con memoria GDDR6 de 6 GB', '../../assets/img/productos/alien/alienware-m17.png', 'Computadora', 'Alienware', 'Otro'),
(49, 'MANDO XBOX ONE', 1800, 'Sin descripcion', '../../assets/img/productos/acces/3.png', 'Accesorio', 'Mandos', 'Nuevo'),
(50, 'SILLA ROJA', 2461030, 'Sin descripcion', '../../assets/img/productos/acces/9.png', 'Accesorio', 'Silla gamer', 'Otro'),
(51, 'SILLA AZUL', 2461030, 'Sin descripcion', '../../assets/img/productos/acces/7.png', 'Accesorio', 'Silla gamer', 'Otro'),
(52, 'HEADSET AZUL CORSAIR', 2461030, 'Sin descripcion', '../../assets/img/productos/acces/4.png', 'Hardware', 'Audio', 'Otro'),
(53, 'HEADSET AZULES G', 2461030, 'Sin descripcion', '../../assets/img/productos/acces/6.png', 'Hardware', 'Audio', 'Destacado'),
(54, 'PLASMA LED MSI 24', 61031, 'Sin descripcion', '../../assets/img/productos/hardware/1.png', 'Hardware', 'Pantalla', 'Otro'),
(55, 'Tarjetas de Video AMD Radeon Pro WX 8200', 19900.5, '8GB 2048-bit HBM2, PCI Express  x16 3.0', '../../assets/img/productos/tarjetas/9.jpg', 'Tarjetas', 'Tarjeta de video', 'Otro'),
(56, 'Sapphire Radeon Nitro  RX 5700 XT 8GB GDDR6 Dual', 11500, 'Reloj base: 1770 MHz. Game Clock: hasta 1902 MHz; Boost Clock: 2010 MHz. Velocidad de memoria: 14 huecos. Pcie 4.0; 4 Salidas: 2 x DisplayPort 1.4, 2 x HDMI 2.0', '../../assets/img/productos/tarjetas/10.jpg', 'Tarjetas', 'Tarjeta de video', 'Destacado'),
(57, 'HYPER FURY  8GB', 2700, 'Sin descripcion', '../../assets/img/productos/tarjetas/2.png', 'Tarjetas', 'RAM', 'Otro');

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
('pando', 'Ignacio', 'Reyes', '2020-11-04', 'ignacio.luz99@gmail.com'),
('popoo', 'Ignacio', 'Luz', '2020-11-05', 'joscruz581@gmail.com'),
('popoos', 'Ignacio', 'Luz', '2020-11-05', 'ignacioluz58@gmail.com'),
('pp', 'pp', 'pp', '2020-11-06', 'pp'),
('sss', 'sss', 'sss', '2020-11-19', 'ssss'),
('test', 'Ignacio', 'Reyes', '2019-11-07', 'ignacio.luz99@gmail.com'),
('tre', 'Ignacio', 'Reyes', '2020-11-05', 'ignacio.luz99@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguidores`
--

CREATE TABLE `seguidores` (
  `id_seg` int(11) NOT NULL,
  `correo_seg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seguidores`
--

INSERT INTO `seguidores` (`id_seg`, `correo_seg`) VALUES
(1, 'ignacioluz58@gmail.com'),
(3, 'ignacio.luz99@gmail.com'),
(5, 'uno.com');

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
('pando', '123', 'U', 'Ignacio'),
('popo', '0909', 'U', 'Jose'),
('popoo', '123', 'U', 'Ignacio'),
('popoos', 'asd', 'U', 'Ignacio'),
('test', '123', 'U', 'Ignacio'),
('tre', '123', 'U', 'Ignacio');

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
-- Indices de la tabla `seguidores`
--
ALTER TABLE `seguidores`
  ADD PRIMARY KEY (`id_seg`);

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
  MODIFY `id_car` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `seguidores`
--
ALTER TABLE `seguidores`
  MODIFY `id_seg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
