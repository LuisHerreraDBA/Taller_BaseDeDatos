--Ejercicios de actualización, agregación y eliminación de datos utilizando la base de datos AdventureWorksLT2022:

--1. Actualización de datos:
   -- Actualiza el precio de venta del producto con el ID igual a 1 a $99.99:
    
     UPDATE SalesLT.Product 
     SET ListPrice = 99.99 
     WHERE ProductID = 1;
      
--2. Eliminación de datos:
   -- Elimina todos los pedidos realizados por el cliente con el ID igual a 20:
     
     DELETE FROM SalesLT.SalesOrderHeader 
     WHERE CustomerID = 20;

   -- Elimina todos los productos con un precio de lista menor o igual a $10:
    
     DELETE FROM SalesLT.Product 
     WHERE ListPrice <= 10;

--3. Inserción de un nuevo cliente:
   -- Inserta un nuevo cliente en la tabla `SalesLT.Customer` con la siguiente información:
     -- Nombre: John
     -- Apellido: Doe
     -- Dirección: 123 Main St
     -- Ciudad: Seattle
     -- Estado: Washington
     -- País: USA
     -- Código postal: 98101
     
     INSERT INTO SalesLT.Customer (FirstName, LastName, AddressLine1, City, State, CountryRegion, PostalCode)
     VALUES ('John', 'Doe', '123 Main St', 'Seattle', 'Washington', 'USA', '98101');
     

--4. Inserción de un nuevo producto:
   -- Inserta un nuevo producto en la tabla `SalesLT.Product` con la siguiente información:
     -- Nombre: Widget
     -- Número de modelo: W123
     -- Descripción: Widget de alta calidad
     -- Precio de lista: $49.99
     
     INSERT INTO SalesLT.Product (Name, ProductNumber, Description, ListPrice)
     VALUES ('Widget', 'W123', 'Widget de alta calidad', 49.99);
     

--5. Inserción de un nuevo pedido:
   -- Inserta un nuevo pedido en la tabla `SalesLT.SalesOrderHeader` para el cliente con el ID igual a 100:
     -- Fecha del pedido: hoy
     -- Subtotal: $100.00
     -- Impuesto: $10.00
     -- Total: $110.00
    
     INSERT INTO SalesLT.SalesOrderHeader (OrderDate, CustomerID, SubTotal, TaxAmt, TotalDue)
     VALUES (GETDATE(), 100, 100.00, 10.00, 110.00);
     

--6. Inserción de detalles del pedido:
   -- Inserta detalles del pedido en la tabla `SalesLT.SalesOrderDetail` para el pedido recién creado:
     -- Producto ID: 1 (suponiendo que este producto ya existe en la tabla de productos)
     -- Cantidad: 2
     -- Precio unitario: $25.00
     
     INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, ProductID, OrderQty, UnitPrice)
     VALUES (IDENT_CURRENT('SalesLT.SalesOrderHeader'), 1, 2, 25.00);
     

    

--7. Agregación de datos:
   -- Calcula el precio total de todos los productos vendidos:
     
     SELECT SUM(UnitPrice * OrderQty) AS TotalPrice 
     FROM SalesLT.SalesOrderDetail;
 
   -- Encuentra el promedio de la cantidad de productos por pedido:
 
     SELECT AVG(OrderQty) AS AvgOrderQty 
     FROM SalesLT.SalesOrderDetail;
 

-- Encuentra el número total de pedidos realizados por cada cliente:

     SELECT CustomerID, COUNT(*) AS TotalOrders 
     FROM SalesLT.SalesOrderHeader 
     GROUP BY CustomerID;

--Estos ejercicios te darán una buena práctica con la manipulación de datos en SQL. 
--Recuerda siempre tener cuidado al realizar operaciones de actualización y eliminación, 
--y asegúrate de realizar una copia de seguridad de tus datos importantes antes de ejecutar estas consultas en un entorno de producción.