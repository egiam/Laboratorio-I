--create database personal_docente


use personal_docente --1

create table docentes --2
(legajo_docente int,
nombre varchar(25),
apellido varchar(25),
email varchar(75)
)

alter table docentes --3
alter column legajo_docente int not null

alter table docentes --4
add constraint pk_docentes primary key (legajo_docente)


create table titulos --5
(id_titulo int,
descripcion varchar(150)
)

select * from titulos
select * from docentes

alter table titulos --6
alter column id_titulo int not null

alter table titulos --7
add constraint pk_titulos primary key (id_titulo)

alter table docentes --8 y 9
add id_titulo int

alter table docentes --10
add constraint fk_titulos foreign key (id_titulo)
references titulos (id_titulo)

alter table docentes --12
drop constraint fk_titulos

alter table titulos --13
drop constraint pk_titulos

drop table titulos --14


create table autores --??
(id_autor int,
nombre varchar(25)
)

drop table autores


--drop database personal_docente