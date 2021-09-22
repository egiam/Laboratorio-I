--create database recibosCLC

use recibosCLC

create table tipos_doc
(id_tipo_doc int,
descripcion varchar(100)

Constraint pk_tipos_doc primary key (id_tipo_doc)
)


create table tipos_act
(id_tipo_act int,
descripcion varchar(100)

Constraint pk_tipos_act primary key (id_tipo_act)
)


create table periodos
(codigo_mes int,
nombre_mes varchar(20)

Constraint pk_periodos primary key (codigo_mes)
)


create table socios
(numero_socio int,
nombre varchar(25),
apellido varchar(25),
telefono int,
email varchar(75),
direccion varchar(75),
id_tipo_doc int,
numero_doc int,
fecha_nac smalldatetime

Constraint pk_socios primary key (numero_socio),
Constraint fk_tipos_doc foreign key (id_tipo_doc)
references tipos_doc (id_tipo_doc)
)


create table recibos
(numero_recibo int,
fecha_recibo smalldatetime,
numero_socio int

Constraint pk_recibos primary key (numero_recibo),
Constraint fk_socios foreign key (numero_socio)
references socios (numero_socio)
)


create table actividades
(cod_act int,
nombre_act varchar(50),
descripcion varchar(150),
id_tipo_act int,
precio decimal

Constraint pk_actividades primary key (cod_act),
Constraint fk_tipos_act foreign key (id_tipo_act)
references tipos_act (id_tipo_act)
)


create table det_recibos
(numero_detalle int,
numero_recibo int,
cod_act int,
codigo_mes int,
monto int

Constraint pk_det_recibos primary key (numero_detalle),
Constraint fk_recibos foreign key (numero_recibo)
references recibos (numero_recibo),
Constraint fk_actividades foreign key (cod_act)
references actividades (cod_act),
Constraint fk_periodos foreign key (codigo_mes)
references periodos (codigo_mes)
)