--create database pagoscuotas

use pagoscuotas

create table docentes
(id_docente int,
nombre varchar(25),
apellido varchar(25)

Constraint pk_docentes primary key (id_docente)
)


create table provincias
(id_provincia int,
nom_provincia varchar(25)

Constraint pk_provincias primary key (id_provincia)
)


create table localidades
(id_localidad int,
nom_localidad varchar(25),
id_provincia int

Constraint pk_localidades primary key (id_localidad),
Constraint fk_provincias foreign key (id_provincia)
references provincias (id_provincia)
)


create table barrios
(id_barrio int,
nom_barrio varchar(25),
id_localidad int

Constraint pk_barrios primary key (id_barrio),
Constraint fk_localidad foreign key (id_localidad)
references localidades (id_localidad)
)


create table cursos
(cod_curso int,
descripcion varchar(100),
nivel varchar(5),
id_docente int,
horario int,  --horario militar, 1100 = 11 am --> 2200 = 22pm
extras varchar(150)

Constraint pk_cursos primary key (cod_curso),
Constraint fk_docentes foreign key (id_docente)
references docentes (id_docente)
)


create table alumnos
(legajo int,
nombre varchar(25),
apellido varchar(25),
id_barrio int,
calle varchar(75),
nro_calle int,
telefono int,
email varchar(75),
extras varchar(150)

Constraint pk_alumnos primary key (legajo),
Constraint fk_barrios foreign key (id_barrio)
references barrios (id_barrio)
)


create table pagos
(legajo int,
cod_curso int,
mes_año smalldatetime,
fecha smalldatetime,
monto decimal

Constraint pk_alumnos_cursos_pagos primary key (legajo,cod_curso,mes_año),
Constraint fk_alumnos foreign key (legajo)
references alumnos (legajo),
Constraint fk_cursos foreign key (cod_curso)
references cursos (cod_curso)
)