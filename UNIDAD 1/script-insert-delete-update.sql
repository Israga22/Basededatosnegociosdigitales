--lenguaje SQL de manipulacion de datos (SQL -LMD)(iinsert, delete, update, select)
--Seleccionar todos los datos de categoria

select *from Categoria
--Agregar una sola fila a una tabla (Categoria)
insert into Categoria
values (1,'Carnes Frias')
insert into Categoria
values (2,'Lacteos')
insert into Categoria
values (3,'Vinos y Licores')
insert into Categoria
values (4,'Ropa')


insert into Categoria(IdCategoria,Descripcion)
values(5,'Linea Blanca')

insert into Categoria(IdCategoria,Descripcion)
values(6,'Electronica')

--Insertar varios registros a la vez
insert into Categoria
values(7,'Carnes Buenas'),
(8,'Dulces'),
(9,'Panaderia'),
(10,'Salchichoneria')



--Insert apartir de una consulta

select IdCategoria, Descripcion from  Categoria
create table CategoriaCopia(
IdCategoria int not null primary key,
nombre varchar(100) not null
)


use ejemploentornos
--insertar datos a partir de una consulta
select *from CategoriaCopia
insert into CategoriaCopia(IdCategoria,Nombre)
select IdCategoria, Descripcion from Categoria

--Actualizacion  de datos sql-lmd
select * from Producto
insert into Producto
values (1,'Salchicha',600,12,1)
insert into Producto
values (1,'Paleta de pollo',22,56,8)
insert into Producto
values (3,'Refrigerador',3000,22,5),
(3,'Chilindrina',23,43,9),
(3,'Terrible Mezcal',200,12,3),
(3,'Leche de Burra',2350,3,2)

update Producto
set IdProducto = 2
WHERE Nombre = 'Paleta de Pollo'
update Producto
set IdProducto = 4
WHERE Nombre = 'Chilindrina'
update Producto
set IdProducto = 5
WHERE Nombre = 'Terrible Mezcal'
update Producto
set IdProducto = 6
WHERE Nombre = 'Leche de Burra'
update Producto
set Nombre='Salchica Grande ',
Existencia =20
where IdProducto = 1

alter table Producto
add constraint pk_Producto
Primary key (IdProducto)
--Eliminar registros de una tabla
/*
delete from tabla
where  expresion
*/

select * from Producto
delete from Producto
where  IdProducto =4
delete from Producto
where  Nombre ='Salchicha Grande'
delete from Producto
Where Precio >=3 and Precio<=22
delete from Producto
where Existencia >=3 and Existencia<=12