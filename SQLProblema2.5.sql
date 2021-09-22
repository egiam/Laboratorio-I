
use LIBRERIA
go


set dateformat dmy


select distinct articulos.cod_articulo, descripcion
from detalle_facturas,articulos
where detalle_facturas.cod_articulo = articulos.cod_articulo
order by 1

--10
select cod_cliente 'Codigo de cliente',nom_cliente+' '+upper(ape_cliente) Nombre,calle +' '+altura Direccion from clientes
where nom_cliente like 'c%' and ape_cliente like '%z'


--11
select cod_cliente 'Codigo de cliente',nom_cliente+' '+upper(ape_cliente) Nombre,calle +' '+altura Direccion from clientes
where nom_cliente not like '[a-g]%' and ape_cliente like '[d-l]%'


--12
select nom_vendedor+', '+upper(ape_vendedor), fec_nac Nombre from vendedores
where nom_vendedor not like '%z%' and fec_nac > 1/1/1970


--13
select * from facturas
where	(fecha between '1/1/2007' and '1/5/2009' and 
		cod_vendedor in(1,3,4)) or 
		(fecha between '1/1/2010' and '1/5/2011' and 
		cod_vendedor in(2,4))


--14
select distinct df.cod_articulo, round(a.pre_unitario*cantidad,2) Subtotal, descripcion, a.pre_unitario, cantidad 
from detalle_facturas df, articulos a
where df.cod_articulo = a.cod_articulo
order by a.descripcion, Subtotal


--15
select * 
from detalle_facturas
where pre_unitario >= 50 and
pre_unitario between 10 and 100 
or cod_articulo not in(2,5,6,8,10) and
pre_unitario between 10 and 100


--16
select *
from articulos
where stock_minimo > 10 and
	descripcion not like '[p,r]%' or
	pre_unitario < 20 and
	descripcion not like '[p,r]%'


--17
set dateformat dmy

select *
from vendedores
where	MONTH(fec_nac) = 2 or
		MONTH(fec_nac) = 4 or
		MONTH(fec_nac) = 5 or
		MONTH(fec_nac) = 9

select *
from vendedores
where	MONTH(fec_nac) in(2,4,5,9)


--18
select nro_factura, fecha, v.ape_vendedor+', '+v.nom_vendedor 'Nombre del Vendedor' 
from facturas f, vendedores v
where cod_cliente between 2 and 6


--19
set dateformat dmy

select nro_factura, fecha, c.nom_cliente+', '+c.ape_cliente Cliente, v.nom_vendedor+', '+v.ape_vendedor Vendedor
from facturas f, clientes c, vendedores v
where fecha between '1/2/2008' and '1/3/2010'


--20
set dateformat dmy

select f.fecha, a.descripcion, a.observaciones, a.pre_unitario
from facturas f, articulos a
where fecha between '1/1/2010' and '31/12/2010' or
fecha between '1/1/2015' and '31/12/2015' or
fecha between '1/1/2017' and '31/12/2017'


select f.fecha, a.descripcion, a.observaciones, a.pre_unitario
from facturas f, articulos a
where year(fecha) in(2010,2015,2017)


--21
select *
from articulos
where pre_unitario*0.85 not between 10 and 50


--22
select f.nro_factura, f.fecha, c.ape_cliente+', '+c.nom_cliente Cliente, v.ape_vendedor+', '+v.nom_vendedor Vendedor, 
a.descripcion Articulo, df.cantidad, a.pre_unitario, round(a.pre_unitario * cantidad,2) Subtotal
from facturas f, clientes c, vendedores v, articulos a, detalle_facturas df
where c.nro_tel is not null and c.[e-mail] is not null or
a.pre_unitario * cantidad > 250
order by f.nro_factura


--23
select f.nro_factura, f.fecha, c.ape_cliente+', '+c.nom_cliente Cliente, v.ape_vendedor+', '+v.nom_vendedor Vendedor,
b.barrio 'Barrio'
from clientes c, barrios b, vendedores v, facturas f
where nro_factura in(12,18,1,3,35,26,29)


--24
select distinct a.descripcion 'Descripcion del articulo',cantidad,(cantidad*df.pre_unitario) importe
from articulos a, facturas f, detalle_facturas df
where f.nro_factura not between 17 and 136
order by descripcion, cantidad


--25
select f.nro_factura, nom_cliente+' '+ape_cliente Cliente, f.fecha 'Fecah de factura', (cantidad*df.pre_unitario) importe 
from facturas f, clientes c, articulos a, detalle_facturas df
where	c.ape_cliente like '[l-s]%' or
		a.descripcion like '[l-s]%' 


--26
select distinct a.descripcion 'Descripcion del articulo',
				f.nro_factura 'Numero de factura',
				f.fecha 'Fecha de facturacion',
				df.cantidad 'Cantidad de articulos comprada',
				df.pre_unitario 'Precio por unidad de cada articulo',
				(df.cantidad*df.pre_unitario) 'Importe total'
from articulos a, facturas f, detalle_facturas df
where year(f.fecha) = 2021
order by f.nro_factura, [Fecha de facturacion]


--27
select	distinct f.nro_factura, f.fecha, 
		c.ape_cliente+', '+c.nom_cliente Cliente,
		v.ape_vendedor+', '+v.nom_vendedor Vendedor,
		a.descripcion Articulo
from clientes c, facturas f, detalle_facturas df, articulos a, vendedores v
where year(v.fec_nac) <= 1995


--28
select	f.nro_factura, f.fecha, a.descripcion, a.pre_unitario,
		v.ape_vendedor+', '+v.nom_vendedor Vendedor,
		(df.cantidad*df.pre_unitario) 'Importe total'
from facturas f, articulos a, vendedores v, detalle_facturas df
where	a.pre_unitario between 50 and 100 and
		v.ape_vendedor not like '[l-m]%'


--29
select	c.ape_cliente+', '+c.nom_cliente Cliente,
		a.descripcion Articulo,
		(df.cantidad*df.pre_unitario) 'Importe total / Gasto',
		f.fecha Fecha
from clientes c, articulos a, facturas f, detalle_facturas df
where month(f.fecha) = 1


--30
select	a.descripcion, 
		f.fecha 'Fecha de facturacion',
		a.pre_unitario 'Precio actual',
		df.pre_unitario 'Precio de facturacion',
		round((a.pre_unitario/df.pre_unitario)*100,2) 'Pocentaje de incremento'
from articulos a, facturas f, detalle_facturas df
where year(f.fecha) = 2010


--31
select	v.ape_vendedor+', '+v.nom_vendedor Vendedor,
		c.ape_cliente+', '+c.nom_cliente Cliente
from vendedores v, clientes c
where	c.nom_cliente like 'C%' or
		c.ape_cliente like 'C%'


--32
select f.fecha, df.pre_unitario 'Precio de facturacion', a.descripcion Articulo, a.observaciones
from articulos a, facturas f, detalle_facturas df
where	year(f.fecha) <= 2015 and 
		df.pre_unitario <= 20
order by f.fecha


select distinct ape_cliente+', '+nom_cliente Cliente, barrio
from	clientes c inner join barrios b on c.cod_barrio = b.cod_barrio
		inner join facturas f on c.cod_cliente = f.cod_cliente
where year(fecha) = year(getdate())-1


select year(getdate())-1
--devuelve el año anterior al actual


--Capitalize
/*
Select upper(left(columna1, 1)) + lower(substring(columna1, 2, Len(columna1)))
from [tutabla]
*/

--select * from detalle_facturas

set dateformat dmy

select descripcion articulo
from	articulos a inner join detalle_facturas df on a.cod_articulo = df.cod_articulo
		inner join facturas f on df.nro_factura = f.nro_factura
		inner join vendedores v on f.cod_vendedor = v.cod_vendedor
where	year(f.fecha) = year(dateadd(month,-1,getdate())) and
		month(f.fecha) = month(dateadd(month,-1,getdate()))

select distinct descripcion articulo
from	articulos a inner join detalle_facturas df on a.cod_articulo = df.cod_articulo
		inner join facturas f on df.nro_factura = f.nro_factura
		inner join vendedores v on f.cod_vendedor = v.cod_vendedor
where	datediff(month, fecha,getdate()) = 1

--

select DATEPART(year,fecha) as año, DATEPART(month, fecha) as mes
from facturas

--Es lo mismo que lo siguiente

select year(fecha) año, month(fecha) mes
from facturas

select datename(month,fecha) mes from facturas

select DATEPART(year,fecha) as año, datename(month,fecha) mes
from facturas

select datename(month,dateadd(month,1,fecha)) mes
from facturas

select datediff(year,fecha,getdate()) as diferencia, fecha, getdate() 'fecha actual'
from facturas
order by diferencia

select format(fecha,'dd/MM/yyyy') as fechita from facturas

select * from barrios
where barrio like 'Centro'

select distinct count(a.cod_articulo)
from articulos a, detalle_facturas df
where a.cod_articulo = df.cod_articulo

select count(cantidad)
from detalle_facturas
