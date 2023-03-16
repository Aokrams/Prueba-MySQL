CREATE SCHEMA minimarket;

USE minimarket;

#creo la tabla producto
CREATE TABLE Producto (
	producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(30),
    categoria_id INTEGER,
    precio MEDIUMINT,
    sku INTEGER
);

#creo la tabla categoria
CREATE TABLE Categoria (
	categoria_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(25)
);

#creo la tabla proveedor
CREATE TABLE Proveedor (
	proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(30),
    contacto VARCHAR(50)
);

#creo la tabla ventapordia usare la venta de productos por dia
CREATE TABLE VentaPorDia (
	venta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    producto_id INTEGER,
    cantidad INTEGER,
    total INTEGER,
    fecha DATE
);

#creo la tabla compraproveedor
CREATE TABLE CompraProveedor (
	compra_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    producto_id INTEGER,
    cantidad INTEGER,
    fecha DATE
); 

#agrego proveedor_id a la tabla compraproveedor
ALTER TABLE CompraProveedor ADD proveedor_id INTEGER NOT NULL;

#hago las foreign key para las tablas correspondientes
ALTER TABLE Producto 
ADD FOREIGN KEY (categoria_id) REFERENCES Categoria (categoria_id);
ALTER TABLE VentaPorDia
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id);
ALTER TABLE CompraProveedor
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id);
ALTER TABLE CompraProveedor
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id);

#inserto los datos de categoria
INSERT INTO Categoria (nombre)
VALUES("Lacteos"), 
("Carnes"), 
("Frutas y Verduras"), 
("Higiene"), 
("Bebidas"), 
("Panaderia")
;
#la muestro para revisar si entraron los datos
SELECT * FROM Categoria;

#inserto los datos de producto
INSERT INTO Producto (nombre, categoria_id, precio, sku)
VALUES("Pan", 6, 2000, 321), 
("Fanta", 5, 1500, 254), 
("Confort", 4, 6000, 654), 
("Limon", 3, 1800, 631),
("Chuleta", 2, 5000, 745),
("Leche", 1, 1200, 946),
("Queque", 6, 1750, 574),
("Powerade", 5, 1000, 283),
("Detergente Bio Klinning", 4, 4000, 546),
("Manzana", 3, 600, 789),
("Truto de pollo", 2, 3000, 593),
("Yoghurt Griego", 1, 650, 494)
;
# la muestro para ver si ingresaron
SELECT * FROM Producto;

#inserto los datos de proveedor
INSERT INTO Proveedor (nombre, contacto)
VALUES("Pedro Pérez", "9 35849588"),
("Francisco Undurraga", "9 75649284"),
("Juan Inostroza", "9 59536199"),
("Luisa Sepúlveda", "9 18235629"),
("Vanessa Aliaga", "9 93745243"),
("Estefania Hormazába", "9 74835276")
;
# la muestro para ver si ingresaron correctamente
SELECT * FROM Proveedor;

#inserto los datos de ventapordia
INSERT INTO VentaPorDia (producto_id, cantidad, total, fecha)
VALUES(1, 20, 40000, '2022-01-09'),
(2, 6, 9000, '2022-01-18'),
(3, 5, 30000, '2022-02-13'),
(4, 4, 7200, '2022-03-27'),
(5, 5, 25000, '2022-04-15'),
(6, 10, 12000, '2022-05-20'),
(7, 3, 5250, '2022-06-07'),
(8, 2, 2000, '2022-07-19'),
(9, 4, 16000, '2022-08-30'),
(10, 6, 3600, '2022-09-28'),
(11, 10, 30000, '2022-10-12'),
(12, 6, 3900, '2022-11-15'),
(1, 13, 26000, '2022-12-10'),
(2, 4, 6000, '2022-12-24'),
(1, 10, 20000, '2022-12-31') 
;
# verifico si ingresaron correctamente
SELECT * FROM VentaPorDia;

# ingreso los datos de compraproveedor
INSERT INTO CompraProveedor (producto_id, cantidad, fecha, proveedor_id)
VALUES(1, 50, '2022-01-02', 1),
(2, 30, '2022-01-03', 2),
(3, 30, '2022-01-04', 3),
(4, 20, '2022-01-05', 4),
(5, 30, '2022-01-05', 5),
(6, 40, '2022-01-06', 6),
(7, 30, '2022-01-07', 1),
(8, 20, '2022-01-08', 2),
(9, 20, '2022-01-09', 3),
(10, 30, '2022-01-10', 4),
(11, 40, '2022-01-11', 5),
(12, 20, '2022-01-12', 6)
;
# los muestro para ver si ingresaron correctamente
SELECT * FROM CompraProveedor;

# inserto otro dato a venta por dia para dar ejemplo
INSERT INTO VentaPorDia (producto_id, cantidad, total, fecha)
VALUES(1, 20, 40000, '2023-01-09');

# le pido que muestre la suma de todos los totales que corresponderian a las ganancias
# solo pido los datos del año 2022 (el año puede ser diferente dependiendo de los datos que agrege)
SELECT SUM(total) FROM VentaPorDia WHERE fecha LIKE '2022%';

# este seria un ejemplo malo ya que traeria la suma de todos los años
# y solo pide la de un año
SELECT SUM(total) FROM VentaPorDia;

# aqui muestro que llamara al nombre del proveedor en vez de su id ademas de la fecha y cantidad
SELECT Proveedor.nombre, CompraProveedor.fecha, CompraProveedor.cantidad
FROM Proveedor JOIN CompraProveedor ON Proveedor.proveedor_id = CompraProveedor.proveedor_id;





