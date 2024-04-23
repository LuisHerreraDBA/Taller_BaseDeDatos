--Ejercicios utilizando la base de datos AdventureWorksLT2022:

--1. Consultas b�sicas:
-- Recuperar todos los registros de la tabla `SalesLT.Customer`:
    
     SELECT * FROM SalesLT.Customer;

-- Mostrar los nombres y apellidos de los clientes junto con sus direcciones de correo electr�nico:

    SELECT FirstName, LastName, EmailAddress FROM SalesLT.Customer;

-- Encontrar los productos disponibles en la tabla `SalesLT.Product`:

     SELECT * FROM SalesLT.Product;

--2. Filtrado y ordenamiento:
-- Encontrar todos los productos cuyo precio de venta sea mayor a $50:
 
     SELECT * FROM SalesLT.Product WHERE ListPrice > 50;
 
-- Mostrar los clientes que su nombre sea "David":

     SELECT * FROM SalesLT.Customer WHERE FirstName = 'David';

-- Ordenar los productos por su nombre en orden ascendente:

     SELECT * FROM SalesLT.Product ORDER BY Name ASC;

--3. Agregaci�n y agrupaci�n:
-- Calcular la cantidad total de productos disponibles:

     SELECT COUNT(*) AS TotalProducts FROM SalesLT.Product;

-- Encontrar la cantidad de pedidos realizados por cada cliente:

     SELECT CustomerID, COUNT(*) AS TotalOrders 
     FROM SalesLT.SalesOrderHeader 
     GROUP BY CustomerID;

-- Encontrar el producto m�s caro en t�rminos de precio de venta:

     SELECT TOP 1 * FROM SalesLT.Product ORDER BY ListPrice DESC;

--Estos son solo algunos ejemplos de soluciones a los ejercicios. 
--Puedes adaptarlos o expandirlos seg�n tus necesidades de aprendizaje y pr�ctica con SQL. 
