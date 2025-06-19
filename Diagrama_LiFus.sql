CREATE TABLE `Colegios` (
  `nombre` VARCHAR(255) PRIMARY KEY,
  `escudo_url` VARCHAR(255),
  `frase` VARCHAR(255),
  `palmares` TEXT
);

CREATE TABLE `Equipos` (
  `colegio` VARCHAR(255),
  `categoria` VARCHAR(255),
  PRIMARY KEY (`colegio`, `categoria`),
  FOREIGN KEY (`colegio`) REFERENCES `Colegios` (`nombre`)
);

CREATE TABLE `Jugadores` (
  `nombre` VARCHAR(255) PRIMARY KEY,
  `equipo_colegio` VARCHAR(255),
  `equipo_categoria` VARCHAR(255),
  `posicion` VARCHAR(255),
  FOREIGN KEY (`equipo_colegio`, `equipo_categoria`) REFERENCES `Equipos` (`colegio`, `categoria`)
);

CREATE TABLE `Partidos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `fecha` DATE,
  `equipo_local_colegio` VARCHAR(255),
  `equipo_local_categoria` VARCHAR(255),
  `equipo_visitante_colegio` VARCHAR(255),
  `equipo_visitante_categoria` VARCHAR(255),
  `arbitro` VARCHAR(255),
  `goles_local` INT,
  `goles_visitante` INT,
  `estado` ENUM('pendiente','jugado'),
  `comentarios` TEXT,
  FOREIGN KEY (`equipo_local_colegio`, `equipo_local_categoria`) REFERENCES `Equipos` (`colegio`, `categoria`),
  FOREIGN KEY (`equipo_visitante_colegio`, `equipo_visitante_categoria`) REFERENCES `Equipos` (`colegio`, `categoria`)
);

CREATE TABLE `Eventos` (
  `partido_id` INT,
  `jugador_nombre` VARCHAR(255),
  `tipo` ENUM('gol','tarjeta_amarilla','tarjeta_roja'),
  `minuto` INT,
  `descripcion` TEXT,
  FOREIGN KEY (`partido_id`) REFERENCES `Partidos` (`id`),
  FOREIGN KEY (`jugador_nombre`) REFERENCES `Jugadores` (`nombre`)
);

CREATE TABLE `Estadisticas` (
  `colegio` VARCHAR(255),
  `categoria` VARCHAR(255),
  `goles_a_favor` INT,
  `goles_en_contra` INT,
  `tarjetas_totales` INT,
  `partidos_jugados` INT,
  `partidos_ganados` INT,
  `partidos_empatados` INT,
  `partidos_perdidos` INT,
  `fair_play_score` INT,
  PRIMARY KEY (`colegio`, `categoria`),
  FOREIGN KEY (`colegio`) REFERENCES `Colegios` (`nombre`)
);

CREATE TABLE `Noticias` (
  `titulo` VARCHAR(255) PRIMARY KEY,
  `contenido` TEXT,
  `fecha_publicacion` DATE
);

CREATE TABLE `Galeria` (
  `partido_id` INT,
  `imagen_url` VARCHAR(255) PRIMARY KEY,
  `descripcion` TEXT,
  `fecha_subida` DATE,
  `subido_por` VARCHAR(255),
  FOREIGN KEY (`partido_id`) REFERENCES `Partidos` (`id`)
);

CREATE TABLE `Encuestas` (
  `pregunta` VARCHAR(255) PRIMARY KEY,
  `fecha_creacion` DATE
);

CREATE TABLE `OpcionesEncuesta` (
  `encuesta_pregunta` VARCHAR(255),
  `opcion_texto` VARCHAR(255) PRIMARY KEY,
  `votos` INT,
  FOREIGN KEY (`encuesta_pregunta`) REFERENCES `Encuestas` (`pregunta`)
);
