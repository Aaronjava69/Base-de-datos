DROP DATABASE IF EXISTS Relacion1;
CREATE DATABASE IF NOT EXISTS Relacion1;

USE Relacion1;

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

/*3.- Mostrar todos los nombres de los alumnos con sus teléfonos.*/
SELECT nombre_alumno, telefono_alumno FROM alumnos;

/*4.- Mostrar los nombres de los alumnos ordenados en orden creciente y decreciente.*/
SELECT nombre_alumno FROM alumnos
ORDER BY nombre_alumno DESC;

SELECT nombre_alumno FROM alumnos
ORDER BY nombre_alumno ASC;

/*5.- Mostrar los alumnos ordenados por edad.*/
SELECT * FROM alumnos
order by fecha_alumno;

/*6.- Mostrar nombre de alumnos que contengan alguna ‘A’ en el nombre.*/
SELECT nombre_alumno AS nombre FROM alumnos
WHERE nombre_alumno like "%A%";

/*7.- Mostrar id_al ordenado por nota.*/
SELECT id_alumno FROM relaciones
order by nota;

/*8.- Mostrar nombre alumno y nombre de sus respectivos profesores.*/
SELECT a.nombre_alumno as nombre_alumno, p.nombre_profesor as nombre_profesor FROM alumnos a
JOIN relaciones r on a.id_alumno = r.id_alumno
JOIN profesores p on p.id_profesor = r.id_profesor;

/*9.- Mostrar el nombre de los alumnos que les de clase el profesor P01*/
SELECT a.nombre_alumno as nombre_alumno FROM alumnos a
JOIN relaciones r on a.id_alumno = r.id_alumno
WHERE r.id_profesor LIKE 'P01';

/*10.- Mostrar el nombre y la nota de los alumnos que les de clase el profesor ‘FERNAND0 GARCIA’.*/
SELECT a.nombre_alumno as nombre_alumno, r.nota FROM alumnos a
JOIN relaciones r on a.id_alumno = r.id_alumno
JOIN profesores p on p.nombre_profesor = "FERNANDO GARCIA";

/*11.- Mostrar todos los alumnos (codigo) que hayan aprobado con el profesor P01.*/
SELECT id_alumno
FROM relaciones
WHERE nota >= 5
AND id_profesor LIKE 'P01';

/*12.- Mostrar todos los alumnos (nombre) que hayan aprobado con el profesor P01.*/
SELECT a.nombre_alumno as nombre_alumno FROM alumnos a 
JOIN relaciones r on a.id_alumno = r.id_alumno
JOIN profesores p on p.id_profesor = "P01"
WHERE r.nota >=5;

/*13.- Mostrar todos los alumnos (nombre) que hayan aprobado con el profesor ‘CARMEN TORRES’.*/
SELECT a.nombre_alumno as nombre_alumno FROM alumnos a
JOIN relaciones r on a.id_alumno = r.id_alumno
JOIN profesores p on p.nombre_profesor = "CARMEN TORRES";

/*14.- Mostrar el alumno/s que haya obtenido la nota más alta con ‘P01’,*/
SELECT a.nombre_alumno as nombre_alumno FROM alumnos a
JOIN relaciones r on a.id_alumno = r.id_alumno
JOIN profesores p on p.id_profesor = "P01"
ORDER BY r.nota DESC
LIMIT 1; #La cláusula "limit" se usa para restringir los registros que se retornan en una consulta "select".

/*15.- Mostrar los alumnos (nombre y codigo) que hayan aprobado todo.*/
SELECT DISTINCT a.id_alumno as id_alumno, a.nombre_alumno as nombre_alumno FROM alumnos a
JOIN relaciones r on r.id_alumno = a.id_alumno
WHERE NOT EXISTS (
			SELECT 1 FROM relaciones r2
            WHERE r2.id_alumno = a.id_alumno AND r2.nota < 5
            );