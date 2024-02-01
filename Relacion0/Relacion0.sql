DROP DATABASE IF EXISTS relacion0;
CREATE DATABASE IF NOT EXISTS relacion0;

USE relacion0;

CREATE TABLE IF NOT EXISTS clientes (
nif CHAR(9) PRIMARY KEY,
nombre VARCHAR(25) NOT NULL,
domicilio VARCHAR(100),
tlf VARCHAR(25),
ciudad VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS productos (
	codigo CHAR(4) PRIMARY KEY,
	descripcion VARCHAR(100) NOT NULL,
    precio FLOAT,
    stock FLOAT,
    minimo FLOAT,
    CHECK (precio > 0)
);

CREATE TABLE IF NOT EXISTS facturas (
numero INTEGER PRIMARY KEY,
fecha DATE,
pagado BOOLEAN,
total_precio FLOAT,
nif_cliente CHAR(9),
FOREIGN KEY (nif_cliente) REFERENCES clientes(nif)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS detalles (
numero INTEGER,
codigo CHAR(4),
unidades INTEGER,
PRIMARY KEY(numero, codigo),
FOREIGN KEY (numero) REFERENCES facturas(numero)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (codigo) REFERENCES productos(codigo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

insert into clientes (nif, nombre , domicilio, telefono, ciudad) values
("43434343A", "DELGADO PEREZ MARISA", "C/ MIRAMAR, 84 3ªA", "925-200-967", "TOLEDO"),
("51592939K", "LOPEZ VAL SOLEDAD", "C/PEZ, 54 4ºC",  "915-829-394", "MADRID"),
("51639989K", "DELGADO ROBLES MIGUEL", "C/ OCA, 54 5ºC", "913-859-293", "MADRID"),
("51664372R", "GUTIERREZ PEREZ ROSA", "C/ CASTILLA, 4 4ºA", "919-592-932", "MADRID");

INSERT INTO productos (codigo, descripcion, precio, stock, minimo) VALUES
("CAJ1", "CAJA DE HERRAMIENTAS DE PLASTICO", 8.50, 4.00, 3),
("CAJ2", "CAJA DE HERRAMIENTAS DE METAL", 12.30, 3.00, 2),
("MAR1", "MARTILLO PEQUEÑO", 3.50, 5, 10),
("MAR2", "MARTILLO GRANDE", 6.50, 12, 10),
("TOR7", "CAJA 100 TORNILLOS DEL 7", 0.80, 20, 100),
("TOR8", "CAJA 100 TORNILLOS DEL 9", 0.80, 25, 100),
("TUE1", "TUERCAS DEL 7", 0.50, 40, 100),
("TUE2", "TUERCAS DEL 9", 0.50, 54, 100),
("TUE3", "CAJA 100 TUERCAS DEL 12", 0.50, 60, 100);

INSERT INTO facturas (numero, fecha, pagado, total_precio, nif_cliente) VALUES
(5440, "2017-09-05", TRUE,  345, "51664372R"),
(5441, "2017-09-06", FALSE, 1000, "51592939K"),
(5442, "2017-09-07", FALSE, 789, "43434343A"),
(5443, "2017-09-08", TRUE, 123.78, "51639989K"),
(5444, "2017-09-09", TRUE, 567, "51639989K"),
(5445, "2017-09-10", TRUE, 100, "51592939K");

INSERT INTO detalles (numero, codigo, unidades) VALUES
(5440, "CAJ2", 2),
(5440, "MAR1", 1),
(5440, "TOR7", 2),
(5440, "TOR8", 2),
(5441, "CAJ1", 1),
(5442, "CAJ1", 1),
(5442, "MAR1", 2),
(5443, "TOR7", 1),
(5443, "TUE1", 1),
(5444, "MAR2", 1),
(5445, "TOR7", 5),
(5445, "TOR8", 5),
(5445, "TUE2", 5),
(5445, "TUE3", 5);

/* a. Mostrar todos los datos introducidos en cada una de las tablas */ 
SELECT * FROM productos;
SELECT * FROM clientes;
SELECT * FROM facturas;
SELECT * FROM detalles;

/* b. Reemplazar la ciudad del cliente con DNI 51664372R por Granada. */
UPDATE clientes
SET ciudad = "Granada"
WHERE nif = "51664372R";

/* c. Actualizar todos los precios de los productos con un aumento del 10% */
UPDATE productos
SET precio = precio * 1.1;

/* d. Aumentar el stock en 20 unidades para todos los productos y disminuir
el precio de los productos en un 30% */

UPDATE productos
SET stock = stock + 20, precio = precio * 0.70;

/*e. A los productos en los que haya un mínimo de 100 unidades, hacerle un
descuento al precio del 50%*/
UPDATE productos
SET precio = precio * 0.5
WHERE stock >= 100;

/*f. Eliminar al cliente cuyo dni sea 51664372R*/
DELETE FROM clientes
WHERE nif = "51664372R";
