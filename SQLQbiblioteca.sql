-- Problema 6

-- create database biblioteca

use biblioteca

create table generos
(id_genero int
constraint pk_generos primary key (id_genero),
genero varchar(20)
)


create table paises
(id_pais int
constraint pk_paises primary key (id_pais),
pais varchar(100)
)


create table autores
(id_autor int
constraint pk_autores primary key (id_autor),
nombre_autor varchar (75),
id_pais int
constraint fk_paises foreign key (id_pais)
references paises (id_pais),
-- poner int si te pide solamente el anio
anio_nac int,
anio_def int
)


create table libros
(cod_libro int
constraint pk_libros primary key (cod_libro),
titulo varchar(100),
id_genero int
constraint fk_generos foreign key (id_genero)
references generos (id_genero),
id_autor int
constraint fk_autores foreign key (id_autor)
references autores (id_autor),
tapa varchar(100),
precio decimal(7,2),
fecha smalldatetime
)


-- Modificacion de las tablas

alter table libros
add fecha datetime

alter table autores
add id_pais_origen int not null

alter table autores
add anio_nac int null,
anio_def int null

alter table libros
alter column genero int

alter table autores
alter column nombre_autor varchar(80)

alter table libros
add precio int

alter table libros
alter column precio decimal(10,2)

alter table libros
drop column cant_pag

alter table autores
drop column seudonimo

alter table generos
alter column id_genero int not null

alter table generos
add constraint pk_generos primary key (id_genero)

alter table paises
alter column id_pais int not null

alter table paises
add constraint pk_paises primary key (id_pais)

alter table libros
add constraint fk_libros_generos foreign key (id_genero)
references generos(id_genero)