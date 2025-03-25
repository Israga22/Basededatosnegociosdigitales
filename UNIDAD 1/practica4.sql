use practica4

create table categoria(
  categoriaId int not null,
  numero int not null, 
  descripcion varchar(50) not null,
  constraint pk_categoria
  primary key(categoriaId,numero)
)

create table producto(
  productoId int not null,
  descripcion varchar(100) not null, 
  precio decimal(10,2) not null,
  stock int not null,
  categoriaId int not null, 
  numeroInventario int not null,
  constraint pk_producto
  primary key(productoId),
  constraint fk_producto_categoria
  foreign key(categoriaId,numeroInventario)
  references categoria(categoriaId,numero)
)