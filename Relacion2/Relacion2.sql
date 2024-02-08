drop database if exists Relacion2;
create database if not exists Relacion2;

use Relacion2; #habilita la base de datos

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

/*a) Obtener todos los datos de los productos de la tienda*/
SELECT * FROM articulos; 

/*b) Obtener los nombres de los productos de la tienda*/
SELECT nombre FROM articulos;

/*c) Obtener los nombres y precio de los productos de la tienda*/
SELECT nombre, precio FROM articulos;

/*d) Obtener los nombres de los artículos sin repeticiones*/
SELECT nombre FROM articulos
group by nombre;

/*e) Obtener todos los datos del artículo cuya clave de producto es ‘5’*/
SELECT * FROM articulos
where clave_articulo = 5; 

/*f) Obtener todos los datos del artículo cuyo nombre del producto es "Teclado”*/
SELECT * FROM articulos
where nombre = "teclado";

/*g) Obtener todos los datos de la Memoria RAM y memorias USB*/
SELECT * FROM articulos
where nombre = "Memoria RAM" or nombre = "Memoria USB"; #or = O

/*h) Obtener todos los datos de los artículos que empiezan con ‘M’*/
SELECT * FROM articulos
where nombre like "M%"; #like = como, %=donde esta el porcentaje puede haber cualquier cosa

/*i) Obtener el nombre de los productos donde el precio sea $ 100*/
SELECT nombre FROM articulos
where precio = 100;

/*j) Obtener el nombre de los productos donde el precio sea mayor a $ 200*/
SELECT nombre FROM articulos
where precio > 200;

/*k) Obtener todos los datos de los artículos cuyo precio este entre $100 y $350*/
SELECT * FROM articulos
where precio >= 100 and precio <=350; #and = y

/*l) Obtener el precio medio de todos los productos*/
SELECT AVG (precio) as medium_precio from articulos; 
#AVG= Media || as=alias cuando lo selecionas

/*m) Obtener el precio medio de los artículos cuyo código de fabricante sea 2*/
SELECT AVG (precio) as medium_precio from articulos
where clave_fabricante = 2;

/*n) Obtener el nombre y precio de los artículos ordenados por Nombre*/
SELECT nombre, precio FROM articulos
order by nombre; #order by= Lo ordena alfabeticamente

/*o) Obtener todos los datos de los productos ordenados descendentemente por Precio*/
SELECT * FROM articulos
order by precio desc; #desc= descendentemente || asc= ascendentemente

/*p) Obtener el nombre y precio de los artículos cuyo precio sea mayor a $ 250 
y ordenarlos descendentemente por precio y luego ascendentemente por nombre*/
SELECT nombre, precio FROM articulos
where precio > 250
order by precio desc, nombre asc;

/*q) Obtener un listado completo de los productos, incluyendo por cada articulo los 
datos del articulo y del fabricante*/
SELECT a.clave_articulo, a.nombre, a.precio, f.nombre as nombre_fabricante 
FROM articulos a
JOIN fabricantes f on a.clave_fabricante = f.clave_fabricante;

#JOIN = METE UNA TABLA DENTRO DE OTRA
#ON = En

/*r) Obtener la clave de producto, nombre del producto y nombre del fabricante de todos los productos en venta*/
SELECT a.clave_articulo, a.nombre, f.nombre FROM articulos a
JOIN fabricantes f on a.clave_fabricante = f.clave_fabircante;

/*s) Obtener el nombre y precio de los artículos donde el fabricante sea Logitech ordenarlos alfabéticamente por nombre
del producto*/

/*Obtener el nombre, precio y nombre de fabricante de los productos que son marca Lexar o Kingston ordenados
descendentemente por precio*/

/*u) Añade un nuevo producto: Clave del producto 11, Altavoces de $ 120 del fabricante 2*/

/*v) Cambia el nombre del producto 6 a ‘Impresora Laser’*/

/*w) Aplicar un descuento del 10% a todos los productos.*/

/*x) Aplicar un descuento de $ 10 a todos los productos cuyo precio sea mayor o igual a $ 300*/

/*y) Borra el producto numero 6*/