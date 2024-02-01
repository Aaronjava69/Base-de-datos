DROP DATABASE IF EXISTS relacion1;
CREATE DATABASE IF NOT EXISTS relacion1;

USE relacion1;

CREATE TABLE IF NOT EXISTS alumnos (
id_alumno CHAR (3) PRIMARY KEY,
nombre_alumno VARCHAR (40),
fecha_alumno DATE,
telefono_alumno VARCHAR (9)
);

CREATE TABLE IF NOT EXISTS profesores (
id_profesor CHAR (3) PRIMARY KEY,
nombre_profesor VARCHAR (40),
fecha_profesor DATE,
telefono_profesor VARCHAR (9)
);

CREATE TABLE IF NOT EXISTS relaciones (
id_alumno CHAR (3),
id_profesor CHAR (3),
nota DOUBLE,
PRIMARY KEY(id_alumno, id_profesor),
FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor) 
ON DELETE RESTRICT
ON UPDATE CASCADE
);

INSERT INTO alumnos (id_alumno, nombre_alumno, fecha_alumno, telefono_alumno) VALUES
('A01', 'Juan Muñoz', '1978-09-04', '676543456'),
('A02', 'ANA TORRES', '1980-12-05', '654786756'),
('A03', 'PEPE GARCIA', '1982-08-09', '950441234'),
('A04', 'JULIO GOMEZ', '1983-12-23', '678909876'),
('A05', 'KIKO ANDRADES', '1979-01-30', '666123456');

INSERT INTO profesores (id_profesor, nombre_profesor, fecha_profesor, telefono_profesor) VALUES
("P01", "CARMEN TORRES", "1966-09-08", "654789654"),
("P02", "FERNANDO GARCIA", "1961-07-09", "656894123");

INSERT INTO relaciones (id_alumno, id_profesor, nota) VALUES
('A01', 'P01', 3.56),
('A01', 'P02', 4.57),
('A02', 'P01', 5.78),
('A02', 'P02', 7.80),
('A03', 'P01', 4.55),
('A03', 'P02', 5),
('A04', 'P02', 10),
('A05', 'P01', 2.75),
('A05', 'P02', 8.45);