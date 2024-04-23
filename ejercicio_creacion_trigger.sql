--Crear un trigger que registre cada vez que se inserta un nuevo cliente en la tabla `SalesLT.Customer`. 
--El trigger registrará la fecha y hora de la inserción del cliente en una tabla de registro de auditoría llamada `CustomerAuditLog`.

--Primero, necesitaremos crear la tabla `CustomerAuditLog` si no existe:

USE AdventureWorksLT2022;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CustomerAuditLog')
BEGIN
    CREATE TABLE CustomerAuditLog (
        LogID INT PRIMARY KEY IDENTITY(1,1),
        CustomerID INT,
        InsertedDateTime DATETIME
    );
END;

--Una vez creada la tabla de registro de auditoría, podemos proceder a crear el trigger:

CREATE OR ALTER TRIGGER trg_CustomerInsertAudit
ON SalesLT.Customer
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO CustomerAuditLog (CustomerID, InsertedDateTime)
    SELECT CustomerID, GETDATE()
    FROM inserted;
END;

--Este trigger se activará después de que se inserte un nuevo registro en la tabla `SalesLT.Customer`. Guardará el `CustomerID` 
--del nuevo cliente insertado y la fecha y hora de la inserción en la tabla `CustomerAuditLog`.

--Es importante recordar que los triggers pueden afectar el rendimiento de la base de datos, 
--especialmente si realizan operaciones complejas o acceden a muchas filas en otras tablas.
--Por lo tanto, debes utilizarlos con precaución y realizar pruebas exhaustivas para asegurarte de que no causen 
--problemas de rendimiento en tu sistema.