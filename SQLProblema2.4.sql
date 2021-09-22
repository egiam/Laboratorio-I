
use LIBRERIA

--2
select * from facturas f
inner join vendedores v on f.cod_vendedor = v.cod_vendedor
inner join clientes c on f.cod_cliente = c.cod_cliente
where fecha like '%2006%' or
fecha like '%2007%' or
fecha like '%2009%' or
fecha like '%2012%'


select distinct fecha, ape_cliente+', '+nom_cliente Cliente,
				ape_vendedor+', '+nom_vendedor Vendedor
				from facturas f
inner join vendedores v on f.cod_vendedor = v.cod_vendedor
inner join clientes c on f.cod_cliente = c.cod_cliente
where year(fecha) in (2006,2007,2009,2012)


--3
select * from facturas
where fecha like '%2021-02%'

select * 
from	facturas f inner join detalle_facturas df on df.nro_factura = f.nro_factura
		inner join articulos a on df.cod_articulo = a.cod_articulo
where datediff(month, getdate(),fecha) = 1


--4
select distinct fecha ,ape_vendedor+', '+nom_vendedor Vendedor
from	vendedores v inner join facturas f on v.cod_vendedor = f.cod_vendedor
where year(fecha) = year(getdate())


--5
select descripcion, cantidad, cantidad * df.pre_unitario Importe
from articulos a inner join detalle_facturas df on a.cod_articulo = df.cod_articulo


--6
select	distinct fecha, 
		ape_cliente+', '+nom_cliente Cliente,
		ape_vendedor+', '+nom_vendedor Vendedor,
		descripcion Articulo, 
		cantidad * df.pre_unitario Importe
from	facturas f inner join vendedores v on f.cod_vendedor = v.cod_vendedor
		inner join clientes c on f.cod_cliente = c.cod_cliente
		inner join detalle_facturas df on f.nro_factura = df.nro_factura
		inner join articulos a on df.cod_articulo = a.cod_articulo
where	year(fecha) in(2006,2007) and 
		month(fecha) in(2,3) and
		descripcion like '[a-m]%'
order by fecha, Cliente, Articulo


--7
select	ape_cliente+', '+nom_cliente Cliente, fecha, nro_factura
from	clientes c inner join facturas f on c.cod_cliente = f.cod_cliente
where	year(fecha) = 2007


--8
select nom_cliente from clientes

select	descripcion, observaciones, cantidad * df.pre_unitario Importe
from	articulos a inner join detalle_facturas df on a.cod_articulo = df.cod_articulo
		inner join facturas f on df.nro_factura = f.nro_factura
		inner join clientes c on f.cod_cliente = c.cod_cliente
where	nom_cliente = 'Elvira Josefa'


--9
select	distinct 
		ape_cliente+', '+nom_cliente Cliente,
		descripcion Articulo,
		cantidad Cantidad,
		cantidad * df.pre_unitario Importe
from	articulos a inner join detalle_facturas df on a.cod_articulo = df.cod_articulo
		inner join facturas f on df.nro_factura = f.nro_factura
		inner join clientes c on f.cod_cliente = c.cod_cliente
where ape_cliente like 'p%'
order by Cliente, Articulo



