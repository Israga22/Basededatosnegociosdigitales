use BDEJEMPLO2

--Ejerciciop 1
select * from Pedidos
select Num_Pedido,Cliente,Importe,Fecha_Pedido from  Pedidos where  Fecha_Pedido between '1990-01-01' and '1990-12-31'

--Ejercicio 2 
select * from Representantes
select * from Oficinas
select r.Jefe,r.Fecha_Contrato, r.Nombre,o.Ciudad,o.Jef  from Representantes as r inner join Oficinas as o
on r.Jefe = o.Jef where year(Fecha_Contrato)>=1988 and year(Fecha_Contrato)<=1990

--Ejercicio 3
select p.Id_producto from  Productos as p where Id_producto in ('2A44L','41004','2A44G') --opcion 1
select p.Id_fab, p.Id_producto, Descripcion, pd.Num_Pedido, pd.Fab from  Productos as p inner join Pedidos as pd on  p.Id_fab = pd.Fab --opcion 2
where Id_producto in ('2A44L','41004','2A44G')

--Ejercicio 4
