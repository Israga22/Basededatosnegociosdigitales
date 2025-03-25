#Inner Join
![Inner Join] (../img/inner join.jpg)



-- Joins
--			Syntaxis 
--	select * from TableA
--	inner join TableB
--	on PrimaryKey = Foreign Key

-- Seleccionar todas las categor�as y productos
use Northwind
select C.CategoryID AS [Numero de Categoria], C.CategoryName as 'Nombre de Categoria', P.ProductName as 'Nombre de Producto', P.UnitsInStock as Existencia, P.UnitPrice as [Precio] from Categories as C
inner join Products as P
on C.CategoryID = P.CategoryID;

-- Seleccionar los productos de la categor�a beverages y condiments donde la existencia est� entre 18 y 30
select CategoryName as [Nombre de categoria], P.ProductName as [Nombre de Producto] ,UnitsInStock as [Unidades en stock]  from Products as P
inner join Categories as C
on C.CategoryID= P.CategoryID
where (CategoryName in ('Beverages', 'Condiments')) and UnitsInStock between '18' and '30'

-- Seleccionar los productos y sus importes realizados de marzo a junio de 1996, mostrando la fecha de la orden,
-- el id del producto y el importe
select OrderDate, Id from Orders as O
inner join [Order Details] as OD
on O.OrderID = OD.OrderID
where OrderDate between '1996-03-01' and '1996-07-31'

-- Consultar el formato de fecha 
select GETDATE()

select O.OrderID, O.OrderDate, OD.ProductID, (OD.UnitPrice * OD.Quantity) from Orders as O
inner join [Order Details] as OD
on O.OrderID = OD.OrderID
where O.OrderDate between '1996-07-01' and '1996-10-31'

-- Seleccionar el importe total de ventas de la consulta anterior
select sum(OD.UnitPrice * OD.Quantity) as 'Dinero total' from Orders as O
inner join [Order Details] as OD
on O.OrderID = OD.OrderID
where O.OrderDate between '1996-07-01' and '1996-10-31'

-- 1. Obtener el nombre de los clientes y los paises a los que se enviaron sus pedidos 
select c.CustomerID, o.ShipCountry from Orders as o inner join Customers as c on  c.CustomerID = o.CustomerID order by 2 desc
-- 2. Obtener los productos y sus respectivos proveedores 
select  p.ProductName, s.CompanyName from Products as p inner join Suppliers as s on p.SupplierID = s.SupplierID
--3. Obtener los pedidos y los empleados que gestionaron 

-- 4. Listar los`productos junto a sus precios y la categoria a la que pertenecen 
select c.CategoryName, p.UnitPrice, p.ProductName from Products as p inner join Categories as c on  c. CategoryID = p.CategoryID
where c.CategoryName =''
--5. Obtener el nombre del cliente el numero de orden y la fecha de orden

--6. lostar las ordenes mostrando el numero de orden el nombre del`rpoducto y la cantidad que se vendio 


--7. Obtener los empleados y sus respectivos jefes 




-- 11 Listar los clientes y la cantidad y pedidos que han realizado 
select c.CompanyName, count(*)
from Customers as c 
inner join Orders as o 
on c.CustomerID = o.CustomerID
 group by c.CompanyName

-- 12. obtener los empleados que han gestionado pedidos emviados a alemania 
select CONCAT(FirstName, '', LastName) as 'Nombre', o.CustomerID, o.ShipCountry from Employees as e
inner join Orders as o 
on e.EmployeeID = o.EmployeeID
where o.ShipCountry = 'Germany'

-- 13
select ProductName as [Nombre Producto], CompanyName as [Nombre proveedor], Country as [Pais] from Products as P 
inner join Suppliers as S
on P.SupplierID = S. SupplierID

--14 Obtener los pedidos  agrupados por pais de envio
Select o.ShipCountry as [Pa�s de Envio], count (o.OrderID) as [Numero de Ordenes] from Orders as o group by o. ShipCountry

--15 obtener los empleados y lam cantidad de territorios en losm que trabaja 
select concat(e.FirstName, '', e.LastName) as [Nombre],
t. TerritoryDescription
, count(et. TerritoryID) as [Cantidad Territorios]
from Employees as e
inner join EmployeeTerritories as et
on e.EmployeeID = et.EmployeeID
INNER JOIN Territories as t
on et. TerritoryID = t. TerritoryID
group by e. FirstName, e.LastName, t. TerritoryDescription order by [Nombre], t. TerritoryDescription desc
--16 Listar las categorias y la cantidad de productos que contienen 
select c.CategoryName as [Categoria], count (p.ProductID) as [Cantidad de Productos]
from Categories as c
inner join Products as p
on c. CategoryID = p.CategoryID
group by c.CategoryName
order by 2 desc

-- 17. Obtener la cantidad total de productos vendidos por
-- proveedor
select s. CompanyName as [Proveedor), sum(od.Quantity) as [Total de productos Vendidos] from Suppliers as s inner join Products as p
on S. SupplierID = p.SupplierID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by s.CompanyName
-- 18. Obtener la cantidad de pedidos enviados por cada
-- empresa de transporte
-- Consultas Avanzadas
select s.CompanyName as 'Transportista', count(*) as 'Total de Pedidos' from Orders as o inner join Shippers as s on o.ShipVia = s.ShipperID group by s.CompanyName

select c.CompanyName, COUNT( distinct productID)
from Customers as c
inner join Orders as o
on c.CustomerID = o. CustomerID
inner join [Order Details] as od
on od.OrderID =o.OrderID
group by c.CompanyName
order by 2 desc

--20 Listar los empleados con la cantidad total de pedidos que han gestionado, y a que
--citentes les han vendido, agrupandolos por nombre completo y dentro de este nombre porcliente, ordenadolos por la cantidad de mayor de pedidos|
select concat(e.FirstName, 
 e.LastName) as [Nombre],
C.CompanyName as [Cliente]
, count (OrderID) as [N�mero de Ordenes]  from Orders as o
Inner join Employees as e
on o. EmployeeID = e.EmployeeID
inner join Customers as c
on o.CustomerID = c.CustomerID
group by e.FirstName, e.LastName, c.CompanyName order by [Nombre] asc, [Cliente] 

--21 Listar las categorias con el total de ingresos generados por sus productos 
select c. CategoryName, sum(od.Quantity * od.UnitPrice) as [Total] from categories as c inner join Products as p
on c. CategoryID = p. CategoryID
inner join [Order Details] as od
on od. ProductID = p.ProductID 
group by c. CategoryName

--22Listar los clientes con el total ($) gastado en pedidos
select c.CompanyName, sum(od. Quantity * od. UnitPrice) as [Total]
from customers as c
inner join Orders as o
on c. CustomerID = o. CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
group by c.CompanyName

--23

--24. Listar los productos con las categorias Beverages, seafood, confections
select p.ProductName, c. CategoryName
from Categories as c inner join Products as p
on c. CategoryID = p. CategoryID
where c. CategoryName in ('Beverages', 'seafood', 'confections')


-- 26. Listar los clientes que han realizado pedidos con un total entre $500 y $2000
select c.CompanyName, sum(od.Quantity * od.UnitPrice)
from Customers as c
inner join Orders as o
on c. CustomerID = o. CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
group by c. CompanyName
