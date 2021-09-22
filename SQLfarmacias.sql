--Create database farmacia

use farmacy

Create table localidades
(id_localidad int,
localidad varchar(75)

Constraint pk_localidades primary key (id_localidad)

)


Create table barrios
(id_barrio int,
barrio varchar(75),
id_localidad int

Constraint pk_barrios primary key (id_barrio),
Constraint fk_localidades foreign key (id_localidad)
references localidades(id_localidad)

)


Create table laboratorios
(cod_lab int,
nombre_lab varchar(100),
direccion varchar(75),
telefono int,
email varchar(50),
id_barrio int

Constraint pk_laboratorios primary key (cod_lab),
Constraint fk_barrios foreign key (id_barrio)
References barrios(id_barrio)

)


Create table presentaciones
(id_present int,
tipo_present varchar(50)

Constraint pk_presentaciones primary key (id_present)

)


Create table medicamentos
(cod_med int,
nombre_med varchar(50),
precio float,
contenido float,
cod_lab int,
id_present int

Constraint pk_medicamentos primary key (cod_med),
Constraint fk_laboratorios foreign key (cod_lab)
references laboratorios(cod_lab),
Constraint fk_presentaciones foreign key (id_present)
references presentaciones(id_present)

)