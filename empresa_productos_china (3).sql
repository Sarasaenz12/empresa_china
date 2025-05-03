-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2025 a las 02:35:25
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
-- Base de datos: `empresa_productos_china`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `imagen_categoria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `imagen_categoria`) VALUES
(1, 'Tecnología', 'img/categorias/tecnologia.png'),
(2, 'Ropa', 'img/categorias/ropa.png'),
(3, 'Juguetes', 'img/categorias/juguetes.png'),
(4, 'Herramientas', 'img/categorias/herramienta.png'),
(5, 'Cocina', 'img/categorias/cocina.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dislikes`
--

CREATE TABLE `dislikes` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dislikes`
--

INSERT INTO `dislikes` (`id`, `producto_id`, `ciudad`, `ip`, `fecha`) VALUES
(1, 2, 'Madrid', '192.168.1.18', '2025-04-30 18:58:09'),
(2, 2, 'Barcelona', '192.168.1.19', '2025-04-30 18:58:09'),
(3, 4, 'Madrid', '192.168.1.20', '2025-04-30 18:58:09'),
(4, 4, 'Barcelona', '192.168.1.21', '2025-04-30 18:58:09'),
(6, 10, 'Madrid', '192.168.1.23', '2025-04-30 18:58:09'),
(7, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:43:59'),
(8, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:00'),
(9, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:00'),
(10, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:00'),
(11, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:01'),
(12, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:01'),
(13, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:01'),
(14, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:01'),
(15, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:03'),
(16, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:03'),
(17, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:04'),
(18, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:07'),
(19, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:44:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_producto`
--

CREATE TABLE `imagenes_producto` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `url_imagen` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `imagenes_producto`
--

INSERT INTO `imagenes_producto` (`id`, `producto_id`, `url_imagen`, `descripcion`) VALUES
(1, 1, 'img/productos/1/iphone.png', 'Vista del iphone'),
(2, 1, 'img/productos/1/iphoneAtras.png', 'Vista trasera del smartphone'),
(3, 1, 'img/productos/1/iphoneFrontal.png', 'Vista frontal del iphone16'),
(4, 2, 'img/productos/2/taladro.png', 'imagen y descripcion del taladro'),
(5, 2, 'img/productos/2/taladroComple.png', 'Todas las partes del Taladro'),
(6, 3, 'img/productos/3/juegoComplet.png', 'Presentación del juego Completo '),
(7, 3, 'img/productos/3/juegoInstruc.png', 'Instrucciones del juego'),
(9, 1, 'img/productos/1/iphoneModelos.png', 'Modelos Diferentes Iphone16'),
(10, 2, 'img/productos/2/taladroEspe.png', 'Especificaciones de algunas partes'),
(11, 2, 'img/productos/2/taladroPunta.png', 'Especificacion Punta'),
(12, 3, 'img/productos/3/juegoAbi.png', 'Juego Abierto'),
(13, 3, 'img/productos/3/juegoFami.png', 'Juego en familia'),
(14, 4, 'img/productos/4/chaquetaCompl.png', 'chaqueta imagen completa'),
(16, 4, 'img/productos/4/chaquetaAtra.png', 'chaqueta parte de atras'),
(17, 4, 'img/productos/4/chaquetaBols.png', 'chaqueta bolsillo'),
(18, 4, 'img/productos/4/chaquetaFront.png', 'chaqueta forntal con modelo'),
(19, 5, 'img/productos/5/licuadoraPor.png', 'Portada de licuadora'),
(20, 5, 'img/productos/5/LicuaVaci.png', 'Licuadora '),
(21, 5, 'img/productos/5/LicuaPeq.png', 'licuadora pequeña'),
(22, 5, 'img/productos/5/LicuaGran.png', 'Licuadora Grande'),
(23, 6, 'img/productos/6/parlanteFrom.png', 'parlante parte frontal'),
(24, 6, 'img/productos/6/parlanteAba.png', 'parte de abajo del parlante '),
(25, 6, 'img/productos/6/parlanteLate.png', 'parte lateral del parlante '),
(26, 6, 'img/productos/6/parlanteImg.png', 'parlante imagen '),
(27, 8, 'img/productos/8/bebelloronaPot.png', 'bebe llorona'),
(28, 8, 'img/productos/8/bebellorona2.png', 'bebe llorona sin chupete'),
(29, 8, 'img/productos/8/partesBebellorona.png', 'partes de la bebe llorona'),
(30, 8, 'img/productos/8/bebellorona3.png', 'bebe llorona pelo suelto'),
(31, 9, 'img/productos/9/zapatillas1.png', 'zapatillas frontal'),
(32, 9, 'img/productos/9/suelazapatillas.png', 'suela zapatillas'),
(33, 9, 'img/productos/9/zapatillasF.png', 'zapatillas frontal\r\n'),
(34, 9, 'img/productos/9/zapatillasLa.png', 'zapatillas laterales'),
(35, 10, 'img/productos/10/herramientasFro.png', 'herramientas'),
(36, 10, 'img/productos/10/herramientasKir.png', 'herramientas kit'),
(37, 10, 'img/productos/10/reseñaHerramienta.png', 'reseñas herramientas'),
(38, 10, 'img/productos/10/herramientas.png', 'herramientas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `likes`
--

INSERT INTO `likes` (`id`, `producto_id`, `ciudad`, `ip`, `fecha`) VALUES
(1, 1, 'Madrid', '192.168.1.1', '2025-04-30 18:57:42'),
(2, 1, 'Barcelona', '192.168.1.2', '2025-04-30 18:57:42'),
(3, 1, 'Valencia', '192.168.1.3', '2025-04-30 18:57:42'),
(4, 1, 'Sevilla', '192.168.1.4', '2025-04-30 18:57:42'),
(5, 1, 'Bilbao', '192.168.1.5', '2025-04-30 18:57:42'),
(6, 6, 'Madrid', '192.168.1.6', '2025-04-30 18:57:42'),
(7, 6, 'Barcelona', '192.168.1.7', '2025-04-30 18:57:42'),
(8, 6, 'Valencia', '192.168.1.8', '2025-04-30 18:57:42'),
(9, 6, 'Sevilla', '192.168.1.9', '2025-04-30 18:57:42'),
(10, 3, 'Madrid', '192.168.1.10', '2025-04-30 18:57:42'),
(11, 3, 'Barcelona', '192.168.1.11', '2025-04-30 18:57:42'),
(12, 3, 'Valencia', '192.168.1.12', '2025-04-30 18:57:42'),
(16, 8, 'Madrid', '192.168.1.16', '2025-04-30 18:57:42'),
(17, 9, 'Madrid', '192.168.1.17', '2025-04-30 18:57:42'),
(18, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:43:57'),
(19, 1, '127.0.0.1', '127.0.0.1', '2025-05-01 22:47:38'),
(20, 1, '127.0.0.1', '127.0.0.1', '2025-05-02 07:28:53'),
(21, 1, '127.0.0.1', '127.0.0.1', '2025-05-02 14:14:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestras`
--

CREATE TABLE `muestras` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `muestras`
--

INSERT INTO `muestras` (`id`, `producto_id`, `cantidad`) VALUES
(1, 1, 10),
(2, 3, 5),
(4, 6, 15),
(5, 9, 20),
(6, 1, 10),
(7, 2, 10),
(8, 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `ficha_tecnica` text DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `ficha_tecnica`, `referencia`) VALUES
(1, 'iPhone 16', 'iPhone de última generación con pantalla Super Retina XDR, Dynamic Island y cámara de 48 MP.', 'Pantalla: 6.1\", RAM: 8GB, Almacenamiento: 128GB, Cámara: 48MP, Chip A18, USB-C, iOS 18', 'IP16-2024'),
(2, 'Taladro Eléctrico Pro', 'Taladro profesional para todo tipo de superficies', 'CAPACIDAD (MADERA): 1-1/2 IN, FRECUENCIA: 60 Hz, VELOCIDAD SIN CARGA (RPM): 0 – 3000 rev/min, PESO: 4.84 Lbs., TAMAÑO DEL PLATO: 1/2 IN., POTENCIA: 850 W , VOLTAJE: 120V, AMPERAJE: 5 A, MAX. CAPACIDAD (CONCRETO): 3/4 PULG.', 'TE-PRO'),
(3, 'Monopoly Juego de mesa', 'En Monopoly Billetes Falsos, todo vale... siempre que no te atrapen. Usa billetes falsos, roba propiedades y pon a prueba tu astucia en este divertido juego familiar con reglas poco convencionales.\r\n\r\n', 'Juego de mesa para 2 a 6 jugadores, recomendado para mayores de 8 años, con partidas de 45 a 60 minutos. Incluye tablero, billetes falsos y reales, cartas especiales, esposas de juguete y fichas. Ideal para jugar en familia o con amigos, mezclando estrategia, humor y trampas.', 'JM-AVENT'),
(4, 'Chaqueta Impermeable', 'Chaqueta resistente al agua y al viento', 'Material: Nylon, Disponible en varios colores', 'CH-IMP'),
(5, '\r\nLICUADORA MULTI-BLEND PRO', 'El combo perfecto que llevará tu extracción al siguiente nivel con la versatilidad de una jarra de 1.5 L, vaso de 800 ml y un vaso de una sola porción (400 ml), libres de BPA. Pantalla LED y un panel táctil equipado con la tecnología Smart-Blend que te ofrece dos velocidades de precisión, con una modalidad de triturado multinivel, y una función de pulso ofrecen un control total perfecto para licuar, mezclar, triturar, picar y más. ', '*Panel táctil digital y pantalla LED indicadora\r\n*Motor de 1000W para licuados perfectos y rápidos\r\n*6 aspas de acero inoxidable, resistentes y de larga duración\r\n*Patas antideslizantes que evitan el movimiento durante su uso\r\n*Sistema de seguridad a presión: Licúa solo cuando el contenedor está firmemente colocado en la base\r\n*Smart-Blend: Panel con 3 funciones inteligentes', 'LIC-CO1'),
(6, 'parlante JBL Go 4', 'Llévate el gran sonido JBL Pro donde quiera que vayas. El atrevido y colorido altavoz Bluetooth ultraportátil JBL Go 4 cabe en la palma de la mano y ofrece un sonido JBL Pro Sound nítido y alto con graves potentes y potentes', 'Altavoz portátil Bluetooth con sonido JBL Pro, hasta 7 horas de batería, resistente al agua y polvo (IP67), Bluetooth 5.3, compatible con Auracast™, entrada USB-C, diseño compacto y liviano.', 'BT-SPK'),
(8, 'Bebés Llorones Dressy Lala', 'Conoce a la nueva Lala de los Bebés Llorones, ahora con cabello enraizado, ojos de vidrio, cabeza más suave y mejorada, peso más liviano y, por primera vez, ¡usa ropa elegante! Como todos los Bebés Llorones, ¡llora lágrimas de verdad y hace sonidos de bebé sin su chupete!', 'Item 83301\r\nNo. Lote: 20671102\r\nFabricado Por: Zhongshan Jun Cheng Plastic Electronic Toys. Ltd\r\nPaís de Fabricación: China\r\nImportador por: Continente S.A.S. NIT: 890101279\r\nEdad Mínima Sugerida: 19 Meses\r\nAdvertencias y recomendaciones: ¡ATENCIÓN! este producto no es apto para niños y niñas menores de 3 años. Remueva todo material de empaque y etiquetas antes de entregar este producto a los niños. No comestible. Riesgo de ahogamiento. Utilizar bajo la vigilancia de un adulto.', 'MI-TALK'),
(9, 'Zapatillas Deportivas', 'Zapatillas para correr con amortiguación', 'Material transpirable, Disponible en varias tallas', 'ZD-RUN'),
(10, 'Kit de Herramientas', 'Kit completo con herramientas básicas', '45 piezas, Incluye estuche de transporte', 'KH-45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_categoria`
--

CREATE TABLE `producto_categoria` (
  `producto_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_categoria`
--

INSERT INTO `producto_categoria` (`producto_id`, `categoria_id`) VALUES
(1, 1),
(2, 4),
(3, 3),
(4, 2),
(5, 5),
(6, 1),
(8, 3),
(9, 2),
(10, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenas`
--

CREATE TABLE `resenas` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `puntuacion` int(11) DEFAULT NULL CHECK (`puntuacion` between 1 and 5),
  `estrellas` int(11) DEFAULT NULL CHECK (`estrellas` between 1 and 5),
  `ciudad` varchar(100) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resenas`
--

INSERT INTO `resenas` (`id`, `producto_id`, `contenido`, `puntuacion`, `estrellas`, `ciudad`, `ip`, `fecha`) VALUES
(1, 1, 'Excelente smartphone, la batería dura mucho.', 5, 5, 'Madrid', '192.168.1.100', '2025-04-30 18:58:09'),
(2, 1, 'Buena calidad de cámara pero un poco lento.', 4, 4, 'Barcelona', '192.168.1.101', '2025-04-30 18:58:09'),
(3, 3, 'Divertido juego para toda la familia.', 5, 5, 'Valencia', '192.168.1.102', '2025-04-30 18:58:09'),
(5, 6, 'Buen sonido y batería duradera.', 4, 4, 'Bilbao', '192.168.1.104', '2025-04-30 18:58:09'),
(6, 8, 'A mi hija le encanta esta muñeca.', 5, 5, 'Madrid', '192.168.1.105', '2025-04-30 18:58:09'),
(7, 2, 'jasdnsj', 5, 5, 'Armenia', '127.0.0.1', '2025-05-01 22:41:59'),
(8, 1, 'malo', 3, 3, 'Cali', '127.0.0.1', '2025-05-02 07:29:12'),
(9, 1, 'jsahkjwhlq', 5, 5, 'Medellín', '127.0.0.1', '2025-05-02 14:14:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos_producto`
--

CREATE TABLE `videos_producto` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `url_video` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `videos_producto`
--

INSERT INTO `videos_producto` (`id`, `producto_id`, `url_video`, `descripcion`) VALUES
(1, 1, 'https://co.tiendasishop.com/cdn/shop/videos/c/vp/559a051344e2428eb91f21f7c724010b/559a051344e2428eb91f21f7c724010b.HD-1080p-7.2Mbps-34742022.mp4?v=0', 'Video demostrativo del iphone16'),
(2, 2, 'https://www.youtube.com/embed/SQD-Q5Aw9kU\r\n', 'Video de demostración del taladro'),
(3, 3, 'https://www.youtube.com/embed/N0c8P4y382c', 'Video explicativo del juego'),
(4, 4, 'https://moncler-cdn.thron.com/static/2TRYJ7_K10911A0017059889207_v2_Z5MMUS.mp4?xseo=', 'Video de la chaqueta '),
(5, 5, 'https://www.youtube.com/embed/9kawPXQIlxI\r\n', 'Video demostartivo de la licuadora '),
(6, 6, 'https://www.youtube.com/embed/RYHBQTi2mqk\r\n', 'video descriptivo parlante'),
(7, 8, 'https://www.youtube.com/embed/PNvsAxG8rbw\r\n', 'Video bebe llorones'),
(8, 9, 'https://www.youtube.com/embed/iGS8Vq47910\r\n', 'zapatillas nike'),
(9, 10, 'https://www.youtube.com/embed/htIKIxZGZQs\r\n', 'video herramientas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `dislikes`
--
ALTER TABLE `dislikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `imagenes_producto`
--
ALTER TABLE `imagenes_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `muestras`
--
ALTER TABLE `muestras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto_categoria`
--
ALTER TABLE `producto_categoria`
  ADD PRIMARY KEY (`producto_id`,`categoria_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `videos_producto`
--
ALTER TABLE `videos_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `dislikes`
--
ALTER TABLE `dislikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `imagenes_producto`
--
ALTER TABLE `imagenes_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `muestras`
--
ALTER TABLE `muestras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `resenas`
--
ALTER TABLE `resenas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `videos_producto`
--
ALTER TABLE `videos_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dislikes`
--
ALTER TABLE `dislikes`
  ADD CONSTRAINT `dislikes_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `imagenes_producto`
--
ALTER TABLE `imagenes_producto`
  ADD CONSTRAINT `imagenes_producto_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `muestras`
--
ALTER TABLE `muestras`
  ADD CONSTRAINT `muestras_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `producto_categoria`
--
ALTER TABLE `producto_categoria`
  ADD CONSTRAINT `producto_categoria_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `producto_categoria_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `videos_producto`
--
ALTER TABLE `videos_producto`
  ADD CONSTRAINT `videos_producto_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
