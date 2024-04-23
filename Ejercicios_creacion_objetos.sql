-- CREACIONES DE OBJETOS

CREATE DATABASE TestData
GO

-- CREACION DE UNA TABLA
USE TestData
GO
CREATE TABLE dbo.Products
    (ProductID int PRIMARY KEY NOT NULL,
    ProductName varchar(25) NOT NULL,
    Price money NULL,
    ProductDescription varchar(max) NULL)
GO

-- INSERTAR DATOS

-- Standard syntax
INSERT dbo.Products (ProductID, ProductName, Price, ProductDescription)
    VALUES (1, 'Clamp', 12.48, 'Workbench clamp')
GO

-- LIMPIAR DATOS
TRUNCATE TABLE TestData.dbo.Products;
GO

-- INSERTA LOS DATOS
-- Changing the order of the columns
INSERT dbo.Products (ProductName, ProductID, Price, ProductDescription)
    VALUES ('Screwdriver', 50, 3.17, 'Flat head')
GO

-- Skipping the column list, but keeping the values in order
INSERT dbo.Products
    VALUES (75, 'Tire Bar', NULL, 'Tool for changing tires.')
GO

-- Dropping the optional dbo and dropping the ProductDescription column
INSERT Products (ProductID, ProductName, Price)
    VALUES (3000, '3 mm Bracket', 0.52)
GO

-- ACTIALIZAR UN PRODUCTO
UPDATE dbo.Products
    SET ProductName = 'Flat Head Screwdriver'
    WHERE ProductID = 50
GO

-- LEER LOS DATOS

-- The basic syntax for reading data from a single table
SELECT ProductID, ProductName, Price, ProductDescription
    FROM dbo.Products
GO

-- Returns all columns in the table
-- Does not use the optional schema, dbo
SELECT * FROM Products
GO

-- Returns only two of the records in the table
SELECT ProductID, ProductName, Price, ProductDescription
    FROM dbo.Products
    WHERE ProductID < 60
GO

-- Returns ProductName and the Price including a 7% tax
-- Provides the name CustomerPays for the calculated column
SELECT ProductName, Price * 1.07 AS CustomerPays
    FROM dbo.Products
GO

-- CREAR UNA VISTA
CREATE VIEW vw_Names
   AS
   SELECT ProductName, Price FROM Products;
GO

SELECT * FROM vw_Names;
GO

-- CREAR UN PROCEDIMIENTO ALMACENADO
CREATE PROCEDURE pr_Names @VarPrice money
   AS
   BEGIN
      -- The print statement returns text to the user
      PRINT 'Products less than ' + CAST(@VarPrice AS varchar(10));
      -- A second statement starts here
      SELECT ProductName, Price FROM vw_Names
            WHERE Price < @VarPrice;
   END
GO

EXECUTE pr_Names 10.00;
GO
