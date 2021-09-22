--Practica para parcial

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda;
USE tienda;
go


--CREATE TABLE fabricante (
--  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
--  nombre VARCHAR(100) NOT NULL
--);

CREATE TABLE producto (
  codigo INT  identity(1,1)
  Constraint pk_productos primary key (codigo),
  nombre VARCHAR(100) NOT NULL,
  precio decimal(8,2) NOT NULL,
  codigo_f INT NOT NULL,
  Constraint fk_prod_fab FOREIGN KEY (codigo_f) REFERENCES fabricante(codigo_f)
)

create table fabricante (
	codigo_f int identity(1,1)
	Constraint pk_fabricante primary key (codigo_f),
	nombre varchar(100) not null
)

drop table if exists fabricante;

INSERT INTO fabricante(nombre) VALUES('Asus');
INSERT INTO fabricante VALUES('Lenovo');
INSERT INTO fabricante VALUES('Hewlett-Packard');
INSERT INTO fabricante VALUES('Samsung');
INSERT INTO fabricante VALUES('Seagate');
INSERT INTO fabricante VALUES('Crucial');
INSERT INTO fabricante VALUES('Gigabyte');
INSERT INTO fabricante VALUES('Huawei');
INSERT INTO fabricante VALUES('Xiaomi');

INSERT INTO producto VALUES('Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES('Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES('Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES('GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES('GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES('Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES('Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES('Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES('Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES('Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES('Impresora HP Laserjet Pro M26nw', 180, 3);



---
select nombre from producto

select nombre, precio
from producto

select * from producto

select nombre, precio Dolares, precio*1.31 Euros from producto


	--Lista los nombres y los precios de todos los productos de la tabla producto, 
	--convirtiendo los nombres a mayúscula.
	select upper(nombre), precio
	from producto

	--Lista los nombres y los precios de todos los productos de la tabla producto, 
	--convirtiendo los nombres a minúscula.
	select lower(nombre), precio
	from producto

    --Lista el nombre de todos los fabricantes en una columna, 
	--y en otra columna obtenga en mayúsculas los dos primeros 
	--caracteres del nombre del fabricante.
	select nombre,upper(nombre)
	from fabricante

    --Lista los nombres y los precios de todos los productos de la tabla producto, 
	--redondeando el valor del precio.
	select nombre, round(precio,2)
	from producto

    --Lista los nombres y los precios de todos los productos de la tabla producto, 
	--truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
	select nombre, precio
	from producto

    --Lista el código de los fabricantes que tienen productos en la tabla producto.
	select *
	from fabricante, producto
	where fabricante.codigo_f = producto.codigo_f

    --Lista el código de los fabricantes que tienen productos en la tabla producto, 
	--eliminando los códigos que aparecen repetidos.
	select distinct *
	from fabricante, producto
	where fabricante.codigo_f = producto.codigo_f

    --Lista los nombres de los fabricantes ordenados de forma ascendente.
	select nombre
	from fabricante
	order by nombre asc

    --Lista los nombres de los fabricantes ordenados de forma descendente.
	select nombre
	from fabricante
	order by nombre desc

    --Lista los nombres de los productos ordenados en primer lugar por el nombre 
	--de forma ascendente y en segundo lugar por el precio de forma descendente.
	select nombre
	from producto
	order by nombre, precio desc

    --Devuelve una lista con las 5 primeras filas de la tabla fabricante.
	select top 5 *
	from fabricante

    --Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla 
	--fabricante. La cuarta fila también se debe incluir en la respuesta.
	select top 2 *
	from fabricante

    --Lista el nombre y el precio del producto más barato. 
	--(Utilice solamente las cláusulas ORDER BY y LIMIT)
	select top 1 nombre, precio
	from producto
	order by precio asc

    --Lista el nombre y el precio del producto más caro. 
	--(Utilice solamente las cláusulas ORDER BY y LIMIT)
	select top 1 nombre, precio
	from producto
	order by precio desc

    --Lista el nombre de todos los productos del fabricante 
	--cuyo código de fabricante es igual a 2.
	select p.nombre
	from producto p, fabricante f
	where f.codigo_f = 2

    --Lista el nombre de los productos que tienen un precio menor o igual a 120€.
	select nombre
	from producto
	where precio <= 120

    --Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
	select nombre 
	from producto
	where precio >= 400

    --Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
	select nombre
	from producto
	where precio < 400

    --Lista todos los productos que tengan un precio entre 80€ y 300€. 
	--Sin utilizar el operador BETWEEN.
	select *
	from producto
	where	precio >= 80 and
			precio <= 300

    --Lista todos los productos que tengan un precio entre 60€ y 200€. 
	--Utilizando el operador BETWEEN.
	select *
	from producto
	where precio between 60 and 200

    --Lista todos los productos que tengan un precio mayor que 200€ y 
	--que el código de fabricante sea igual a 6.
	select * from producto
	where precio > 200 and codigo_f = 6

    --Lista todos los productos donde el código de fabricante sea 1, 3 o 5. 
	--Sin utilizar el operador IN.
	select * from producto
	where	codigo_f = 1 or
			codigo_f = 3 or
			codigo_f = 5

    --Lista todos los productos donde el código de fabricante sea 1, 3 o 5. 
	--Utilizando el operador IN.
	select * from producto
	where codigo_f in(1,3,5)

    --Lista el nombre y el precio de los productos en céntimos 
	--(Habrá que multiplicar por 100 el valor del precio). 
	--Cree un alias para la columna que contiene el precio que se llame céntimos.
	select nombre, precio * 100 centimos
	from producto

    --Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
	select nombre
	from fabricante
	where nombre like 'S%'

    --Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
	select nombre from fabricante
	where nombre like '%e'

    --Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
	select nombre from fabricante
	where nombre like '%w%'

    --Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
	select nombre from fabricante
	where len(nombre) = 4

    --Devuelve una lista con el nombre de todos los productos que 
	--contienen la cadena Portátil en el nombre.
	select nombre from producto
	where nombre like '%Portatil%'

    --Devuelve una lista con el nombre de todos los productos que 
	--contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
	select nombre from producto
	where	nombre like '%Monitor%' and
			precio < 215

    --Lista el nombre y el precio de todos los productos que 
	--tengan un precio mayor o igual a 180€. Ordene el resultado en 
	--primer lugar por el precio (en orden descendente) y 
	--en segundo lugar por el nombre (en orden ascendente).
	select nombre, precio from producto
	where precio >= 180
	order by precio desc, nombre asc



	
 --   Devuelve una lista con el nombre del producto, precio y 
	--nombre de fabricante de todos los productos de la base de datos.
	select p.nombre, precio, f.nombre
	from	producto p inner join
			fabricante f on p.codigo_f = f.codigo_f

 --   Devuelve una lista con el nombre del producto, precio y 
	--nombre de fabricante de todos los productos de la base de datos. 
	--Ordene el resultado por el nombre del fabricante, por orden alfabético.
	select p.nombre, precio, f.nombre
	from	producto p inner join
			fabricante f on p.codigo_f = f.codigo_f
	order by f.nombre

 --   Devuelve una lista con el código del producto, nombre del producto, 
	--código del fabricante y nombre del fabricante, 
	--de todos los productos de la base de datos.
	select p.codigo,p.nombre,f.codigo_f,f.nombre
	from	producto p inner join
			fabricante f on p.codigo_f = f.codigo_f

 --   Devuelve el nombre del producto, su precio y el nombre de su fabricante, 
	--del producto más barato.
	select p.nombre, precio, f.nombre
	from	producto p inner join
			fabricante f on p.codigo_f = f.codigo_f

 --   Devuelve el nombre del producto, su precio y 
	--el nombre de su fabricante, del producto más caro.
	select top 1 p.nombre, precio, f.nombre
	from	producto p inner join
			fabricante f on p.codigo_f = f.codigo_f
	order by precio desc

 --   Devuelve una lista de todos los productos del fabricante Lenovo.
	select p.nombre, f.nombre
	from	fabricante f inner join
			producto p on f.codigo_f = p.codigo_f
	where f.nombre = 'Lenovo'

 --   Devuelve una lista de todos los productos del fabricante Crucial que 
	--tengan un precio mayor que 200€.
	select *
	from	fabricante f, producto p
	where	f.codigo_f = p.codigo_f and 
			precio > 200 and
			f.nombre = 'Crucial'

 --   Devuelve un listado con todos los productos de los fabricantes Asus, 
	--Hewlett-Packardy Seagate. Sin utilizar el operador IN.
	select * from fabricante f, producto p
	where	f.codigo_f = p.codigo_f and
			f.nombre = 'Asus' or
			f.nombre = 'Hewlett-Packard' or
			f.nombre = 'Seagate'

 --   Devuelve un listado con todos los productos de los fabricantes Asus, 
	--Hewlett-Packardy Seagate. Utilizando el operador IN.
	select * from fabricantes f, productos p
	where	f.codigo_f = p.codigo_f

 --   Devuelve un listado con el nombre y el precio de todos los productos de 
	--los fabricantes cuyo nombre termine por la vocal e.
	select p.nombre, precio, f.nombre
	from	fabricante f, producto p
	where	f.codigo_f = p.codigo_f and
			f.nombre like '%e'

 --   Devuelve un listado con el nombre y el precio de todos los productos 
	--cuyo nombre de fabricante contenga el carácter w en su nombre.
	select p.nombre, precio, f.nombre
	from	fabricante f, producto p
	where	f.codigo_f = p.codigo_f and
			f.nombre like '%w%'

 --   Devuelve un listado con el nombre de producto, precio y 
	--nombre de fabricante, de todos los productos que tengan 
	--un precio mayor o igual a 180€. Ordene el resultado en primer lugar por 
	--el precio (en orden descendente) y en segundo lugar por el nombre 
	--(en orden ascendente)
	select p.nombre, precio, f.nombre
	from	fabricante f inner join
			producto p on f.codigo_F = p.codigo_f
	where precio >= 180
	order by precio desc, p.nombre asc

 --   Devuelve un listado con el código y el nombre de fabricante, 
	--solamente de aquellos fabricantes que tienen productos asociados 
	--en la base de datos.
	select Distinct f.codigo_f, f.nombre, p.codigo_f
	from	producto p inner join
			fabricante f on p.codigo_f = f.codigo_f




 --   Devuelve un listado de todos los fabricantes que existen en la base de datos, 
	--junto con los productos que tiene cada uno de ellos. 
	--El listado deberá mostrar también aquellos fabricantes que 
	--no tienen productos asociados.
	   select f.nombre, p.nombre 
	   from fabricante f left join
			producto p on f.codigo_f = p.codigo_f

 --   Devuelve un listado donde sólo aparezcan aquellos fabricantes que 
	--no tienen ningún producto asociado.
	select f.nombre, p.nombre
	from	fabricante f left join
			producto p on f.codigo_f = p.codigo_f

 --   ¿Pueden existir productos que no estén relacionados con un fabricante? 
	--Justifique su respuesta.
	   select p.nombre, f.nombre
	   from	producto p left join
			fabricante f on p.codigo_f = f.codigo_f
		where p.codigo_f = null


	
 --   Calcula el número total de productos que hay en la tabla productos.
	select count(codigo) from producto

 --   Calcula el número total de fabricantes que hay en la tabla fabricante.
	select count(codigo_f) from fabricante

 --   Calcula el número de valores distintos de código de fabricante aparecen en 
	--la tabla productos.
	select count(codigo_f) from producto
	group by codigo_f

	select distinct codigo_f from producto

 --   Calcula la media del precio de todos los productos.
	select sum(precio)/count(codigo) from producto

	select precio, codigo from producto

 --   Calcula el precio más barato de todos los productos.
	select top 1 precio from producto
	order by precio

 --   Calcula el precio más caro de todos los productos.
 	select top 1 precio from producto
	order by precio desc

 --   Lista el nombre y el precio del producto más barato.
 	select top 1 precio, nombre from producto
	order by precio

 --   Lista el nombre y el precio del producto más caro.
 	select top 1 precio, nombre from producto
	order by precio desc

 --   Calcula la suma de los precios de todos los productos.
	select sum(precio) from producto

 --   Calcula el número de productos que tiene el fabricante Asus.
	select count(p.codigo_f)
	from	fabricante f, producto p
	where	f.codigo_f = p.codigo_f and
			f.nombre = 'Asus'

 --   Calcula la media del precio de todos los productos del fabricante Asus.
	select sum(p.precio)/count(p.codigo_f) Media
	from	fabricante f, producto p
	where	f.codigo_f = p.codigo_f and
			f.nombre = 'Asus' 

 --   Calcula el precio más barato de todos los productos del fabricante Asus.
	select top 1 precio
	from	fabricante f, producto p
	where	f.codigo_f = p.codigo_f and
			f.nombre = 'Asus'
	order by precio

 --   Calcula el precio más caro de todos los productos del fabricante Asus.
 select top 1 precio
	from	fabricante f, producto p
	where	f.codigo_f = p.codigo_f and
			f.nombre = 'Asus'
	order by precio desc

 --   Calcula la suma de todos los productos del fabricante Asus.
	select sum(precio)
	from	fabricante f, producto p
	where	f.codigo_f = p.codigo_f and
			f.nombre = 'Asus'

 --   Muestra el precio máximo, precio mínimo, precio medio y el número total de 
	--productos que tiene el fabricante Crucial.
	select max(precio),min(precio), sum(precio)/count(p.codigo_f), count(p.codigo_f)
	from	fabricante f, producto p
	where	f.codigo_f = p.codigo_f and
			f.nombre = 'Crucial'

 --   Muestra el número total de productos que tiene cada uno de los fabricantes. 
	--El listado también debe incluir los fabricantes que no tienen ningún producto.
	--El resultado mostrará dos columnas, una con el nombre del fabricante y 
	--otra con el número de productos que tiene. 
	--Ordene el resultado descendentemente por el número de productos.
	select count(codigo) Cantidad, f.nombre
	from	fabricante f left join 
			producto p on f.codigo_f = p.codigo_f
	group by f.nombre
	order by Cantidad desc

 --   Muestra el precio máximo, precio mínimo y precio medio de los productos de 
	--cada uno de los fabricantes. El resultado mostrará el nombre del fabricante 
	--junto con los datos que se solicitan.
	select max(precio) Maximo, min(precio) Minimo, sum(precio)/count(p.codigo_f) Medio, f.nombre
	from	fabricante f left join
			producto p on f.codigo_f = p.codigo_f
	group by f.nombre
	order by Medio

 --   Muestra el precio máximo, precio mínimo, precio medio y el número total de 
	--productos de los fabricantes que tienen un precio medio superior a 200€. 
	--No es necesario mostrar el nombre del fabricante, 
	--con el código del fabricante es suficiente.
	select count(codigo), max(precio) Maximo, min(precio) Minimo, sum(precio)/count(p.codigo_f) as Medio, f.nombre
	from	fabricante f left join
			producto p on f.codigo_f = p.codigo_f
	group by f.nombre
	having avg(precio) > 200
	order by Medio

 --   Muestra el nombre de cada fabricante, junto con el precio máximo, 
	--precio mínimo, precio medio y el número total de productos de 
	--los fabricantes que tienen un precio medio superior a 200€. 
	--Es necesario mostrar el nombre del fabricante.
	select max(precio) Maximo, min(precio) Minimo, avg(precio) Medio, f.nombre
	from	fabricante f left join
			producto p on f.codigo_f = p.codigo_f
	group by f.nombre
	having avg(precio) > 200
	order by Medio

 --   Calcula el número de productos que tienen un precio mayor o igual a 180€.
	select count(codigo) Cantidad
	from producto
	where precio >= 180

 --   Calcula el número de productos que tiene cada fabricante con 
	--un precio mayor o igual a 180€.
	select count(codigo) Cantidad, f.nombre
	from	fabricante f left join
			producto p on f.codigo_f = p.codigo_f
	where precio >= 180
	group by f.nombre

 --   Lista el precio medio los productos de cada fabricante, 
	--mostrando solamente el código del fabricante.
	select sum(precio)/count(p.codigo_f) Medio, f.codigo_f
	from	fabricante f left join
			producto p on f.codigo_f = p.codigo_f
	group by f.codigo_f

 --   Lista el precio medio los productos de cada fabricante, 
	--mostrando solamente el nombre del fabricante.
	select sum(precio)/count(p.codigo_f) Medio, f.nombre
	from	fabricante f left join
			producto p on f.codigo_f = p.codigo_f
	group by f.nombre

 --   Lista los nombres de los fabricantes cuyos productos tienen 
	--un precio medio mayor o igual a 150€.
	select f.nombre, sum(precio)/count(p.codigo_f) Medio
	from	fabricante f left join
			producto p on f.codigo_f = p.codigo_f
	group by f.nombre
	having sum(precio)/count(p.codigo_f) >= 150

 --   Devuelve un listado con los nombres de los fabricantes que tienen 
	--2 o más productos.
	select f.nombre, count(codigo) Cantidad
	from	fabricante f left join
			producto p on f.codigo_f = p.codigo_f
	group by f.nombre
	having count(codigo) >= 2

	select f.nombre, count(codigo) as 'Cantidad'
	from fabricante f, producto p
	where	f.codigo_f = p.codigo_f
	group by f.nombre
	having	count(codigo) >= 2


 --   Devuelve un listado con los nombres de los fabricantes y
	--el número de productos que tiene cada uno con 
	--un precio superior o igual a 220 €. 
	--No es necesario mostrar el nombre de los fabricantes que 
	--no tienen productos que cumplan la condición.
	select f.nombre, codigo, precio
	from	fabricante f inner join
			producto p on f.codigo_f = p.codigo_f
	where precio >= 220







