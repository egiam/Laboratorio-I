CREATE DATABASE LIBRERIA
GO

USE LIBRERIA
GO

--Crear tablas

CREATE TABLE barrios 
(cod_barrio int NOT NULL ,
barrio nvarchar (50) NULL ,
CONSTRAINT PK_barrios PRIMARY KEY (cod_barrio))


CREATE TABLE articulos 
(cod_articulo int IDENTITY (1, 1) NOT NULL ,
descripcion nvarchar (50) NULL ,
stock_minimo smallint NULL ,
pre_unitario decimal(10, 2) NOT NULL ,
observaciones nvarchar (50)NULL ,
CONSTRAINT PK_articulos PRIMARY KEY (cod_articulo))


CREATE TABLE clientes (cod_cliente int IDENTITY (1, 1) NOT NULL ,
nom_cliente nvarchar (50) NOT NULL ,
ape_cliente nvarchar (50) NOT NULL ,
calle nvarchar (50) NOT NULL ,
altura int,cod_barrio int NOT NULL,
nro_tel bigint NULL ,
[e-mail] nvarchar (50) NULL,
CONSTRAINT PK_clientes PRIMARY KEY (cod_cliente),
CONSTRAINT FK_clientes_barrios FOREIGN KEY (cod_barrio) 
REFERENCES barrios (cod_barrio))


CREATE TABLE vendedores 
(cod_vendedor int IDENTITY (1, 1) NOT NULL ,
nom_vendedor nvarchar (50) NOT NULL ,
ape_vendedor nvarchar(50) not null,
calle nvarchar (50) NOT NULL ,
altura int,cod_barrio int NOT NULL,
nro_tel bigint NULL ,
[e-mail] nvarchar (50) NULL ,
fec_nac smalldatetime NULL ,
CONSTRAINT PK_vendedores PRIMARY KEY(cod_vendedor),
CONSTRAINT FK_vendedores_barrios FOREIGN KEY (cod_barrio)
REFERENCES barrios (cod_barrio))


CREATE TABLE facturas 
(nro_factura int IDENTITY (1, 1) NOT NULL ,
fecha smalldatetime NOT NULL ,
cod_cliente int NOT NULL ,
cod_vendedor int NOT NULL ,
CONSTRAINT PK_facturas PRIMARY KEY (nro_factura),
CONSTRAINT FK_facturas_clientes FOREIGN KEY (cod_cliente) 
REFERENCES clientes (cod_cliente),
CONSTRAINT FK_facturas_vendedores FOREIGN KEY (cod_vendedor) 
REFERENCES vendedores (cod_vendedor))


CREATE TABLE detalle_facturas 
(nro_factura int NOT NULL ,
cod_articulo int NOT NULL ,
pre_unitario numeric(18, 2) NOT NULL ,
cantidad smallint NOT NULL ,
CONSTRAINT PK_detalle PRIMARY KEY  (nro_factura, cod_articulo),
CONSTRAINT FK_detalle_articulos FOREIGN KEY (cod_articulo) 
REFERENCES articulos (cod_articulo),
CONSTRAINT FK_detalle_facturas FOREIGN KEY (nro_factura) 
REFERENCES facturas (nro_factura))


Insert into articulos (descripcion, pre_unitario)
values ('Lapices Color largos x 12u. Bic', 101.5)

select * from articulos

Insert into articulos (descripcion, pre_unitario)
values ('Conjunto Geometrico Maped', 20.5)

select * from articulos

Insert into articulos (descripcion, pre_unitario)
values ('Repuesto Gloria rallado', 326,3)

select * from articulos

Insert into articulos (descripcion, pre_unitario)
values ('Repuesto Rivadavia', 465,9)

select * from articulos


-- 2

insert into vendedores (ape_vendedor,nom_vendedor,calle,altura,nro_tel,[e-mail],fec_nac,cod_barrio)
values ('Monti', 'Juan', 'Altoaguirre', 1245,'4522122','','',5)

insert into vendedores (ape_vendedor,nom_vendedor,calle,altura,nro_tel,[e-mail],fec_nac,cod_barrio)
values ('Sena', 'Rosa', 'Av. Velez Sarsfield', 25,'','rsena@hotmail.com','15/5/1968',1)

select * from vendedores


-- 3

select * 
from articulos
where descripcion like 'conjunto%'

Update articulos
set descripcion = 'Conjunto geometrico de plastico'
where cod_articulo = 29

update articulos
set descripcion = 'Repuesto Rivadavia cuadriculado', observaciones = '48 hojas'
where descripcion = 'Repuesto Rivadavia'

update vendedores
set fec_nac = '10/10/1970', [e-mail] = 'montijuan@hotmail.com'
where ape_vendedor = 'Monti' and nom_vendedor = 'Juan'

update vendedores
set nro_tel = '3512333423', calle = 'Av. Velez Sarsfield 125 - centro'
where ape_vendedor = 'Sena' and nom_vendedor = 'Rosa'

update articulos
set pre_unitario = pre_unitario*1.15
where pre_unitario < 20

update articulos
set pre_unitario = pre_unitario*1.10
where pre_unitario >= 20 and pre_unitario <= 30

select * from vendedores
select * from articulos



-- 4

delete vendedores
where ape_vendedor = 'Sena'and nom_vendedor = 'Rosa'

delete articulos
where descripcion = 'Repuesto Gloria rallado'


select * from vendedores
select * from articulos


delete vendedores
where cod_vendedor = 1

delete articulos
where cod_articulo = 1

