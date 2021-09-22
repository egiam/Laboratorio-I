--Create database supermercado

use supermarket

Create table barrios
(id_barrio int,
nombre_barrio varchar(50),

Constraint pk_barrios primary key (id_barrio)

)


Create table proveedores
(cod_prov int,
nombre varchar(50),
direccion varchar(100),
tel int,
email varchar(50),
id_barrio int,

Constraint pk_proveedores primary key (cod_prov),
Constraint fk_barrios foreign key (id_barrio)
references barrios(id_barrio)

)


Create table marcas
(id_marca int,
nombre_marca varchar(50),

Constraint pk_marcas primary key (id_marca)

)

Create table rubros
(id_rubro int,
nombre_rubro varchar(50),

Constraint pk_rubros primary key (id_rubro)

)


Create table productos
(cod_prod int,
descripcion varchar(150),
id_marca int,
id_rubro int,
precio float,

Constraint pk_productos primary key (cod_prod),
Constraint fk_marcas foreign key (id_marca)
references marcas(id_marca),
Constraint fk_rubros foreign key (id_rubro)
references rubros(id_rubro)

)