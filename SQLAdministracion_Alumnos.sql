create database Administracion_Alumnos
go

use Administracion_Alumnos


create table barrios
(id_barrio int
Constraint pk_barrios primary key (id_barrio),
nombre_barrio varchar(75) null
)


create table alumnos
(legajo int
Constraint pk_alumnos primary key(legajo),
nombre varchar(50),
apellido varchar(50),
calle varchar(50),
nro int,
id_barrio int
Constraint fk_barrios foreign key (id_barrio)
references barrios (id_barrio),
nro_dni varchar(8),
nro_tel varchar(12),
e_mail varchar(50),
fecha_nac smalldatetime
)

alter table alumnos
alter column fecha_nac varchar(15)

alter table barrios
alter column nombre_barrio varchar(50) null


Insert into barrios (id_barrio, nombre_barrio)
values (1, 'San Andres')

Insert into barrios (id_barrio, nombre_barrio)
values (2, 'Villa Cabrera')

Insert into barrios (id_barrio,nombre_barrio)
values (3,'Belgrano')

Insert into barrios (id_barrio,nombre_barrio)
values (4,'Nueva Cordoba')

Insert into barrios (id_barrio,nombre_barrio)
values (5,'Valle Escondido')

Insert into barrios (id_barrio,nombre_barrio)
values (6,'Valle cercano')

Insert into barrios (id_barrio,nombre_barrio)
values (7,'Villa Allende')

Insert into barrios (id_barrio,nombre_barrio)
values (8,'Las Palmas')

Insert into barrios (id_barrio,nombre_barrio)
values (9,'Don Bosco')

Insert into barrios (id_barrio,nombre_barrio)
values (10,'Teodoro fells')

select * from barrios


Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (106743, 'Martín', 'Pedraza', 'Los Olmos', 3422, 1, '12324566', '', Null, '13/05/1985')

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (1, 'Joaquin', 'Pedraza', 'Olemdo', 4332, 2, '12342577', '', Null, '13/05/1983')

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (2, 'Roberto', 'Pedraza', 'Madrid', 123, 3, '12234588', '', Null, '13/05/1981')

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (3, 'Martín', 'Pedraza', 'Francia', 321, 4, '12342599', '', Null, '13/05/1987')

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (4, 'Agustin', 'Pedraza', 'Colon', 345, 5, '12324500', '', Null, '13/05/1989')

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (5, 'Cristina', 'Pedraza', 'Don bosco', 543, 6, '12345211', '', Null, '13/05/1999')

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (6, 'Alberto', 'Pedraza', 'Duartes Quiroz', 567, 7, '12345222', '', Null, '13/05/1998')

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (7, 'Mauricio', 'Pedraza', 'Saens Peña', 9539, 8, '12234533', '', Null, '13/05/1997')

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (8, 'Leandro', 'Pedraza', 'San Juan', 789, 9, '12342523', '', Null, '13/05/1996')

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (9, 'Laura', 'Pedraza', 'Evita', 876, 10, '12345244', '', Null, '13/05/1995')

select * from alumnos


-- 2.2

Insert into barrios (id_barrio,nombre_barrio)
values (11,'Villa libertador')

select * from barrios

Insert into barrios (id_barrio,nombre_barrio)
values (12,'Alta Cordoba')

select * from barrios

Insert into barrios (id_barrio,nombre_barrio)
values (13,'Midgar')

select * from barrios

Insert into barrios (id_barrio,nombre_barrio)
values (14,'Azulado')

select * from barrios

Insert into barrios (id_barrio,nombre_barrio)
values (15,'Armado')

select * from barrios

Insert into barrios (id_barrio,nombre_barrio)
values (16,'Colon')

select * from barrios

Insert into barrios (id_barrio,nombre_barrio)
values (17,'New York')

select * from barrios

Insert into barrios (id_barrio,nombre_barrio)
values (18,'New Yersey')

select * from barrios

Insert into barrios (id_barrio,nombre_barrio)
values (19,'Villa 31')

select * from barrios


Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (10, 'Raul', 'Pedraza', 'Barcelona', 321, 11, '66625555', '', Null, '13/05/1994')

select * from alumnos

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (11, 'Pedro', 'Pedraza', 'Paris', 3211, 12, '66265544', '', Null, '13/05/1993')

select * from alumnos

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (12, 'Paulo', 'Pedraza', 'Venecia', 322, 13, '62665533', '', Null, '13/05/1992')

select * from alumnos

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (13, 'Fabricio', 'Pedraza', 'Roma', 3122, 14, '66625522', '', Null, '13/05/1991')

select * from alumnos

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (14, 'Fernanda', 'Pedraza', 'Moscu', 542, 15, '66625511', '', Null, '13/05/1990')

select * from alumnos

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (15, 'Facundo', 'Pedraza', 'Berlin', 5423, 16, '66625577', '', Null, '13/05/2000')

select * from alumnos

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (16, 'Emiliano', 'Pedraza', 'Lima', 5465, 17, '66655288', '', Null, '13/11/2000')

select * from alumnos

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (17, 'Emilio', 'Pedraza', 'Montevideo', 953, 18, '66652599', '', Null, '13/7/2000')

select * from alumnos

Insert into alumnos (Legajo, nombre, apellido, calle, nro, id_barrio, nro_dni, nro_tel, e_mail, fecha_nac)
values (18, 'Emilse', 'Pedraza', 'Londres', 9534, 19, '66655290', '', Null, '30/12/2000')

select * from alumnos


-- 3

-- 3.a

update alumnos 
set nro_tel = '5945566' 
where legajo = 106743 
select *from alumnos

update alumnos
set e_mail = 'mail@gmail.com'
where legajo = 106743
select * from alumnos

update alumnos
set calle = 'Caminoti', nro = 7689
where legajo = 106743
select * from alumnos

-- 1.d

update alumnos
set e_mail = 'mail2@gmail.com'
where legajo = 12
select * from alumnos

update alumnos
set e_mail = 'mail3@gmail.com'
where legajo = 15
select * from alumnos

update alumnos
set e_mail = 'mail4@gmail.com'
where legajo = 14
select * from alumnos

update alumnos
set e_mail = 'mail5@gmail.com'
where legajo = 13
select * from alumnos

update alumnos
set e_mail = 'mail6@gmail.com'
where legajo = 1
select * from alumnos



-- 4

delete alumnos where legajo = 106743

delete alumnos where legajo = 3

delete barrios where id_barrio = 4

delete barrios where id_barrio = 1


select * from alumnos
select * from barrios