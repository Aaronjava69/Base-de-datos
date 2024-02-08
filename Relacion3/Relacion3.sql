DROP DATABASE IF EXISTS Relacion3;
CREATE DATABASE IF NOT EXISTS Relacion3;

USE Relacion3;

CREATE TABLE IF NOT EXISTS provincia (
id_provincia char (3) PRIMARY KEY,
nom_prov varchar (15)
);

CREATE TABLE IF NOT EXISTS ciudad (
id_ciudad char (3) PRIMARY KEY,
id_provincia char (3),
nom_ciud varchar (20),
num_hab INTEGER,
FOREIGN KEY (id_provincia) REFERENCES provincia (id_provincia)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS zona (
id_zona char (3),
id_ciudad char (3),
nom_zona varchar (10),
PRIMARY KEY (id_zona, id_ciudad),
FOREIGN KEY (id_ciudad) REFERENCES ciudad (id_ciudad)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS cartero (
id_cart char (3) PRIMARY KEY,
nom_cart varchar (25),
sueldo INTEGER
);

CREATE TABLE IF NOT EXISTS periodos (
id_per char (3) PRIMARY KEY,
fecha_ini date,
fecha_fin date
);

CREATE TABLE IF NOT EXISTS Relacion2 (
id_zona char (3),
FOREIGN KEY (id_zona) REFERENCES zona (id_zona)
ON DELETE CASCADE
ON UPDATE CASCADE,

id_ciudad char (3),
FOREIGN KEY (id_ciudad) REFERENCES ciudad (id_ciudad)
ON DELETE CASCADE
ON UPDATE CASCADE,

id_cart char (3),
FOREIGN KEY (id_cart) REFERENCES cartero (id_cart)
ON DELETE CASCADE
ON UPDATE CASCADE,

id_per char (3),
FOREIGN KEY (id_per) REFERENCES periodos (id_per)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO provincia (id_provincia, nom_prov) VALUES
("P01", "SEVILLA"),
("P02", "GRANADA"),
("P03", "ALMERIA");

INSERT INTO ciudad (id_ciudad, nom_ciud, num_hab, id_provincia) VALUES
("C01", "CIUDAD1", "890000", "P01"),
("C02", "CIUDAD2", "110000", "P02"),
("C03", "CIUDAD3", "98000", "P03"),
("C04", "CIUDAD4", "65000", "P01");

INSERT INTO zona (id_zona, nom_zona, id_ciudad) VALUES
("Z01", "CENTRO", "C01"),
("Z02", "ESTE", "C01"),
("Z03", "OESTE", "C01"),
("Z04", "NORTE", "C01"),
("Z05", "SUR", "C01"),
("Z01", "CENTRO", "C02"),
("Z02", "POLIGONO", "C02"),
("Z03", "OESTE", "C02"),
("Z04", "NORTE", "C02"),
("Z05", "SUR", "C02"),
("Z01", "CENTRO", "C03"),
("Z02", "ESTE", "C03"),
("Z03", "BARRIADAS", "C03"),
("Z04", "NORTE", "C03"),
("Z05", "SUR", "C03"),
("Z01", "CENTRO", "C04"),
("Z02", "BULEVARD", "C04"),
("Z03", "OESTE", "C04"),
("Z04", "NORTE", "C04"),
("Z05", "RIVERA", "C04");

INSERT INTO cartero (id_cart, nom_cart, sueldo) VALUES
("CT1", "JUAN PEREZ", "1100"),
("CT2", "ANA TORRES", "1080"),
("CT3", "PEPA FERNANDEZ", "1100"),
("CT4", "VICENTE VALLES", "1790"),
("CT5", "FERNANDO GINES", "1013"),
("CT6", "LISA TORMES", "897"),
("CT7", "WALDO PEREZ", "899"),
("CT8", "KIKA GARCIA", "987"),
("CT9", "LOLA JIMENEZ", "1123");

INSERT INTO periodos (id_per, fecha_ini, fecha_fin) VALUES
("PE1", "2000-05-01", "2000-03-30"),
("PE2", "2000-03-30", "2000-08-15"),
("PE3", "2000-08-15", "2000-11-20"),
("PE4", "2000-11-20", "2000-12-25"),
("PE5", "2000-12-25", "2001-03-03");

INSERT INTO Relacion2 (id_zona, id_ciudad, id_cart, id_per) VALUES
("Z01", "C01", "CT1", "PE1"),
("Z01", "C02", "CT2", "PE1"),
("Z01", "C03", "CT3", "PE1"),
("Z01", "C04", "CT4", "PE1"),
("Z02", "C01", "CT5", "PE1"),
("Z02", "C02", "CT6", "PE1"),
("Z02", "C03", "CT7", "PE1"),
("Z02", "C04", "CT8", "PE1"),
("Z03", "C01", "CT9", "PE1"),
("Z03", "C02", "CT1", "PE2"),
("Z03", "C03", "CT2", "PE2"),
("Z03", "C04", "CT3", "PE2"),
("Z04", "C01", "CT4", "PE2"),
("Z04", "C02", "CT5", "PE2"),
("Z04", "C03", "CT6", "PE2"),
("Z04", "C04", "CT7", "PE2"),
("Z05", "C01", "CT8", "PE2"),
("Z05", "C02", "CT9", "PE2"),
("Z05", "C03", "CT1", "PE3"),
("Z05", "C04", "CT2", "PE3"),
("Z01", "C01", "CT3", "PE3"),
("Z02", "C02", "CT4", "PE3"),
("Z03", "C01", "CT5", "PE3"),
("Z04", "C01", "CT6", "PE3"),
("Z05", "C01", "CT7", "PE3"),
("Z01", "C01", "CT8", "PE4"),
("Z02", "C03", "CT9", "PE3"),
("Z03", "C04", "CT1", "PE4"),
("Z04", "C01", "CT2", "PE4"),
("Z05", "C01", "CT3", "PE4");

/*CONSULTAS: 
1.-NOMBRE DE CIUDAD CON MÁS HABITANTES/
