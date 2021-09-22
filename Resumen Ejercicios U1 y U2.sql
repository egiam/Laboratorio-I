--Resumen o Ejercicios de Unidad 1 y 2

--Unidad 1

/*
Problema 1Se  tiene  el  diagrama  de  una  base  de  datos  de  una  biblioteca 
barrial  que necesita  registrar  los  datos  de  los  libros  y  
los  datos  de  sus  escritores  donde  cada libro tiene un solo escritor y 
el escritor puede tener publicado varios libros, se necesita es la construcción 
de esta base de dato en el SGBDR.
*/

--create database Biblioteca

use biblioteca
go


create table escritores
(
cod_escritor int identity(1,1)
Constraint pk_escritores primary key (cod_escritor),
nombre varchar(75),
apellido varchar(75),
nacionalidad varchar(75),
fecha_nac datetime,
fecha_def datetime
)

create table libros
(
legajo int identity(1,1)
Constraint pk_libros primary key (legajo),
titulo varchar(75),
genero varchar(25),
editorial varchar(75),
edicion varchar(50),
cod_escritor int
Constraint fk_libros_escritoes foreign key (cod_escritor)
references escritores (cod_escritor)
)

alter table libros
add fecha datetime

alter table escritores
add id_pais int not null

alter table escritores
add an_nac datetime, fec_def datetime

alter table libros
alter column genero int

alter table escritores
alter column nombre varchar(80)

alter table libros
add precio decimal

alter table libros
alter column precio decimal(10,2)

alter table libros
drop column cant_pag

alter table escritores
drop column seudonimo




