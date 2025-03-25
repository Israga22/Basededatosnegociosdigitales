# Ejercicio de pedidos con Store Procedures
- Este ejercicio permite realizar un pediddo, verificar si el pedido no existe, si hay suficiente stock, insertar el pedido y calcular - el importe (multiplicando el precio del producto 
- por cantidad vendida), Actualizar el stock de producto (restando el stock menos la cantidad vendida)

``` sql

create or alter procedure spu_realizae_pedido
@numPedido int,
@cliente int,
@repre int, @fab char(3),
@producto char(5), @cantidad int
as
begin
if exists (select 1 from Pedidos where  Num_Pedido= @numPedido)
 begin
	 print 'El pedido ya existe' 
	 return 
	 end
if not exists (select 1 from Clientes where Num_Cli = @cliente ) or
not exists (select 1 from Representantes where Num_Empl = @repre ) or 
not exists (select 1 from Productos where Id_fab = @fab and Id_producto=@producto)
	 begin
	 print 'Los datos no son validos' 
	 return 
	 end
if @cantidad <= 0
         begin
         print 'La cantidad no puede ser negativo'
         return
         end
declare @stockValido int
select @stockValido=Stock from Productos where Id_fab = @fab and Id_producto = @producto
if @cantidad < @stockValido
     begin
	 print 'No hay suficiente stock'
	 return
	 end

	 declare @precio money
	 declare @importe money

	 select @precio = precio from Productos where Id_fab = @fab and Id_producto=@producto
	 set @importe = @cantidad * @precio

begin try 
--Se inserto un pedido	 
insert into Pedidos
values (@numPedido, getdate(), @cliente, @repre,@fab,@producto,@cantidad,(@cantidad))
update Productos
set Stock=Stock - @Cantidad
where id_fab = @fab and Id_producto = @producto;


end try 
begin catch
 print 'error al acutualizar datos ' 
end catch

end;


exec spu_realizae_pedido @numPedido=113070, @cliente = 2000,
@repre = 106 , @fab = 'RE1',
@producto = '2A44L', @cantidad = 20

exec spu_realizae_pedido @numPedido=113070, @cliente = 2000,
@repre = 111 , @fab = 'RE1',
@producto = '2A44L', @cantidad = 20

exec spu_realizae_pedido @numPedido=113070, @cliente = 2017,
@repre = 111 , @fab = 'RE1',
@producto = '2A44L', @cantidad = 20

select * from Pedidos
select * from Representantes


exec spu_realizae_pedido @numPedido=113070, @cliente = 2117,
@repre = 101 , @fab = 'ACI',
@producto = '4100X', @cantidad = 20

select * from Productos
where Id_fab ='ACI' and Id_producto = '4100X'




```
