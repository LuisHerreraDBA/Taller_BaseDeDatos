--Crear un trigger que registre cada vez que se inserta un nuevo cliente en la tabla `SalesLT.Customer`. 
--El trigger registrar� la fecha y hora de la inserci�n del cliente en una tabla de registro de auditor�a llamada `CustomerAuditLog`.

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

--Una vez creada la tabla de registro de auditor�a, podemos proceder a crear el trigger:

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

--Este trigger se activar� despu�s de que se inserte un nuevo registro en la tabla `SalesLT.Customer`. Guardar� el `CustomerID` 
--del nuevo cliente insertado y la fecha y hora de la inserci�n en la tabla `CustomerAuditLog`.

--Es importante recordar que los triggers pueden afectar el rendimiento de la base de datos, 
--especialmente si realizan operaciones complejas o acceden a muchas filas en otras tablas.
--Por lo tanto, debes utilizarlos con precauci�n y realizar pruebas exhaustivas para asegurarte de que no causen 
--problemas de rendimiento en tu sistema.