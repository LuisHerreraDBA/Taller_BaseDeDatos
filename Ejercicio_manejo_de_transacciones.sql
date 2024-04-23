-- Comenzar una transacción
BEGIN TRANSACTION;

-- Definir los productos de origen y destino y la cantidad a transferir
DECLARE @ProductoOrigenID INT = 1; -- ID del producto de origen
DECLARE @ProductoDestinoID INT = 2; -- ID del producto de destino
DECLARE @CantidadTransferida INT = 10; -- Cantidad a transferir

-- Actualizar el inventario del producto de origen
UPDATE ProductInventory
SET QuantityOnHand = QuantityOnHand - @CantidadTransferida
WHERE ProductID = @ProductoOrigenID;

-- Actualizar el inventario del producto de destino
UPDATE ProductInventory
SET QuantityOnHand = QuantityOnHand + @CantidadTransferida
WHERE ProductID = @ProductoDestinoID;

-- Confirmar o revertir la transacción
IF @@ERROR <> 0
    ROLLBACK TRANSACTION; -- Revertir la transacción si se produce un error
ELSE
    COMMIT TRANSACTION; -- Confirmar la transacción si todo está bien
