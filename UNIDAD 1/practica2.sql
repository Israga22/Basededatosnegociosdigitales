--Practica #2

create database Practica2
go
use Practica2
go

create table cliente(
	clienteid int not null,
	nombre varchar(100) not null, 
	direccion varchar(100) not null, 
	tel varchar(20),
	constraint pk_cliente
	primary key(clienteid),
	constraint unico_nombre
	unique(nombre)
)
go

create table empleado(
  empleadoid int not null,
  nombre varchar(100) not null,
  apellidos varchar(100) not null, 
  sexo char(1) not null,
  salario decimal(10,2) not null, 
  constraint pk_empleado
  primary key(empleadoid),
  constraint chk_sexo 
  check(sexo='h' or sexo = 'm'),
  constraint chk_salario
  check(salario>=400 and salario<=40000)
)
go

create table producto(
  productoId int not null, 
  descripcion varchar(100) not null, 
  existencia int not null, 
  precio decimal(10,2) not null, 
  constraint pk_producto
  primary key(productoId),
  constraint unico_descripcion
  unique(descripcion)

)

create table venta(
 ventaId int not null,
 fecha date not null, 
 empleadoId int not null, 
 clienteId int not null,
 constraint pk_venta 
 primary key(ventaId),
 constraint fk_venta_empleado
 foreign key(empleadoId)
 references empleado (empleadoid),
 constraint fk_venta_cliente
 foreign key(clienteId)
 references cliente(clienteid)
)

create table detalleVenta
(
  ventaId int not null,
  productoId int not null, 
  cantidad int not null, 
  precio decimal(10,2),
  constraint pk_detalle
  primary key(ventaId,productoId),
  constraint fk_detalle_venta
  foreign key(ventaId) 
  references venta(ventaId),
  constraint fk_detalle_producto
  foreign key(productoId)
  references producto(productoId)
)