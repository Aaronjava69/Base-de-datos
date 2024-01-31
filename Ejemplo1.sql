create database alumnos; #crear una base de datos nueva
use alumnos; #Usar la base de datos que acabamos de crear
create table alumnos( #creamos la tabla, y entre parentesis crearemos las columnas
asignatura varchar(30),   #Cada columna comenzará con, el nombre que queramos ponerle seguido del tipo de dato
id int auto_increment primary key, #para decir cual será la llave primaria de la tabla usaremos primary key
sexo char(1),
nombre varchar(50) 
);

create table profesores(
id int auto_increment primary key,
nombre varchar(50),
sexo char(1),
asignatura varchar(30),
id_alumno int,
foreign key (id_alumno) references alumnos(id) #En esta segunda tabla, haremos referencia (llave foranea) a la primera tabla
);