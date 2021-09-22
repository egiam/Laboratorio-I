--Practico primer parcial

--Creacion de la base de datos
create database Veterinaria

use Veterinaria
go

create table Barrios
(
id_barrio int identity(1,1)
Constraint pk_barrios primary key (id_barrio),
barrio varchar(50)
)

create table Tipos(
id_tipo int identity(1,1)
Constraint pk_tipos primary key (id_tipo),
tipo varchar(50)
)

create table Razas(
id_raza int identity(1,1)
Constraint pk_razas primary key (id_raza),
raza varchar(50)
)

create table Medicos(
id_medico int identity(1,1)
Constraint pk_medicos primary key (id_medico),
nombre varchar(75),
apellido varchar(75),
fec_ingreso datetime,
matricula int,
telefono varchar(9)
)

create table Dueños(
id_dueño int identity(1,1)
Constraint pk_dueños primary key(id_dueño),
nombre varchar(75),
apellido varchar(75),
calle varchar(75),
altura int,
id_barrio int
Constraint fk_due_bar foreign key (id_barrio)
References Barrios(id_barrio),
telefono varchar(9)
)

create table Mascotas(
id_mascota int identity(1,1)
Constraint pk_mascotas primary key (id_mascota),
nombre varchar(75),
id_tipo int
Constraint fk_mas_tipo foreign key (id_tipo)
References Tipos(id_tipo),
id_raza int
Constraint fk_mas_raza foreign key (id_raza)
References Razas(id_raza),
fec_nac datetime,
id_dueño int
Constraint fk_mas_dueños foreign key (id_dueño)
References Dueños(id_dueño),
)

create table Consultas(
id_consulta int identity(1,1)
Constraint pk_consultas primary key (id_consulta),
id_medico int
Constraint fk_con_med foreign key(id_medico)
References Medicos(id_medico),
id_mascota int
Constraint fk_con_mas foreign key (id_mascota)
references Mascotas(id_mascota),
fecha datetime,
detalle_consulta varchar(150),
importe decimal(7,2)
)


--Insert de sentencias/registros

Insert into Barrios(barrio) values('Alto alverdi')
Insert into Barrios(barrio) values('Nueva Cordoba')
Insert into Barrios(barrio) values('Don Bosco')
Insert into Barrios(barrio) values('Theodoro fells')
Insert into Barrios(barrio) values('Las Palmas')

Insert into Razas(raza) values('Perro')
Insert into Razas(raza) values('Gato')
Insert into Razas(raza) values('Pez')
Insert into Razas(raza) values('Conejo')
Insert into Razas(raza) values('Serpiente')

Insert into Tipos(tipo) values('')
Insert into Tipos(tipo) values('')
Insert into Tipos(tipo) values('')
Insert into Tipos(tipo) values('')
Insert into Tipos(tipo) values('')

Insert into Medicos(nombre,apellido,fec_ingreso,matricula,telefono)
values('Juan','Perez','',1,'1236365')
Insert into Medicos(nombre,apellido,fec_ingreso,matricula,telefono)
values('Ramon','Ramirez','',2,'984902')
Insert into Medicos(nombre,apellido,fec_ingreso,matricula,telefono)
values('Valerie','Cornejo','',3,'5432345')
Insert into Medicos(nombre,apellido,fec_ingreso,matricula,telefono)
values('Sofia','Coria','',4,'5631896')
Insert into Medicos(nombre,apellido,fec_ingreso,matricula,telefono)
values('Morena','Velez','',5,'896535')

Insert into Dueños(nombre,apellido,calle,altura,id_barrio,telefono)
values('Ezequiel','Giampaoli','Lucas Fernandez',357,4,'789-2619')
Insert into Dueños(nombre,apellido,calle,altura,id_barrio,telefono)
values('Pablo','Perez','Bambi',234,5,'')
Insert into Dueños(nombre,apellido,calle,altura,id_barrio,telefono)
values('Pepe','Gujica','Caracas',1234,1,'')
Insert into Dueños(nombre,apellido,calle,altura,id_barrio,telefono)
values('Migel','Ruiz','madre mia',1200,2,'')
Insert into Dueños(nombre,apellido,calle,altura,id_barrio,telefono)
values('Agustin','Perez','Miami',350,4,'')

Insert into Mascotas(nombre,id_tipo,id_raza,fec_nac,id_dueño) 
values('Isis',1,4,'',3)
Insert into Mascotas(nombre,id_tipo,id_raza,fec_nac,id_dueño) 
values('Bastet',1,2,'',2)
Insert into Mascotas(nombre,id_tipo,id_raza,fec_nac,id_dueño) 
values('Polo',1,1,'',1)
Insert into Mascotas(nombre,id_tipo,id_raza,fec_nac,id_dueño) 
values('Africa',1,1,'',1)
Insert into Mascotas(nombre,id_tipo,id_raza,fec_nac,id_dueño) 
values('Kira',1,5,'',5)

Insert into Consultas(id_medico,id_mascota,fecha,detalle_consulta,importe)
values(1,5,'','Pepe',1200)
Insert into Consultas(id_medico,id_mascota,fecha,detalle_consulta,importe)
values(2,1,'','isis tenia Febricula',1450)
Insert into Consultas(id_medico,id_mascota,fecha,detalle_consulta,importe)
values(3,2,'','bastet tenia concutivitis',1500)
Insert into Consultas(id_medico,id_mascota,fecha,detalle_consulta,importe)
values(4,3,'','Polo tenia envenenamiento',1200)
Insert into Consultas(id_medico,id_mascota,fecha,detalle_consulta,importe)
values(5,4,'','Africa tiene cancer',2500)


--3
