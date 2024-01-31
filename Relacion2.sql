drop database if exists relacion2;
create database if not exists Relacion2;

use relacion2; #habilita la base de datos

create table if not exists fabricantes (
clave_fabricante integer primary key,
nombre varchar (30)
);

create table if not exists articulos (
clave_articulo integer primary key,
nombre varchar (30),
precio integer,
clave_fabricante integer,
foreign key (clave_fabricante) references fabricantes (clave_fabricante)
on delete cascade
on update cascade
);

insert into fabricantes (clave_fabricante, nombre) values
(1, "Kingston"),
(2, "Adata"),
(3, "Logitech"),
(4, "Lexar"),
(5, "Seagate");

insert into articulos (clave_articulo, nombre, precio, clave_fabricante) values
(1, "Teclado", 100, 3),
(2, "Disco duro 300gb", 500, 5),
(3, "Mouse", 80, 3),
(4, "Memoria USB", 140, 4),
(5, "Memoria RAM", 290, 1),
(6, "Disco duro extraíble 250 Gb", 650, 5),
(7, "Memoria USB", 279, 1),
(8, "DVD Rom", 450, 2),
(9, "CD Rom", 200, 2),
(10, "Tarjeta de red", 180, 3);

SELECT * FROM articulos; #Obtener todos los datos de los productos de la tienda

SELECT nombre FROM articulos; #Obtener los nombres de los productos de la tienda

SELECT nombre, precio FROM articulos; #Obtener los nombres y precio de los productos de la tienda

SELECT nombre FROM articulos
group by nombre; #Obtener los nombres de los artículos sin repeticiones

SELECT * FROM articulos
where clave_articulo = 5; #Obtener todos los datos del artículo cuya clave de producto es ‘5’

SELECT * FROM articulos
where nombre = "teclado";

SELECT * FROM articulos
where nombre = "Memoria RAM" or nombre = "Memoria USB"; #or = O

SELECT * FROM articulos
where nombre like "M%"; #like = como, %=donde esta el porcentaje puede haber cualquier cosa

SELECT nombre FROM articulos
where precio = 100;

SELECT nombre FROM articulos
where precio > 200;

SELECT * FROM articulos
where precio >= 100 and precio <=350; #and = y

SELECT AVG (precio) as medium_precio from articulos; 
#AVG= Media || as=alias cuando lo selecionas

SELECT AVG (precio) as medium_precio from articulos
where clave_fabricante = 2;

SELECT nombre, precio FROM articulos
order by nombre; #order by= Lo ordena alfabeticamente

SELECT * FROM articulos
order by precio desc; #desc= descendentemente || asc= ascendentemente

SELECT nombre, precio FROM articulos
where precio > 250
order by precio desc, nombre asc;

SELECT * FROM articulos;
SELECT a.clave_articulo, a.nombre, a.precio, f.nombre as nombre_fabricante 
FROM articulos a
JOIN fabricantes f on a.clave_fabricante = f.clave_fabricante

#JOIN = METE UNA TABLA DENTRO DE OTRA
#ON = En