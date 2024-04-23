-- DAR PERMISOS DE CONEXION A LA BASE DE DATOS

GRANT CONNECT TO usuario_cliente;

   -- Concede permisos de selecci�n en la tabla `SalesLT.Customer` a un usuario espec�fico llamado `usuario_cliente`:
    
     GRANT SELECT ON SalesLT.Customer TO usuario_cliente;
    
   -- Revoca los permisos de selecci�n en la tabla `SalesLT.Product` de un usuario espec�fico llamado `usuario_admin`:
    
     REVOKE SELECT ON SalesLT.Product FROM usuario_admin;

   -- Concede permisos de inserci�n en la tabla `SalesLT.SalesOrderHeader` a un rol espec�fico llamado `rol_ventas`:
     
     GRANT INSERT ON SalesLT.SalesOrderHeader TO rol_ventas;
     
   -- Concede permisos de actualizaci�n en la tabla `SalesLT.Product` a un rol espec�fico llamado `rol_inventario`:
     
     GRANT UPDATE ON SalesLT.Product TO rol_inventario;
     
   -- Concede permisos de eliminaci�n en la tabla `SalesLT.Customer` a un usuario espec�fico llamado `usuario_soporte`:
  
     GRANT DELETE,TRUNCATE ON SalesLT.Customer TO usuario_soporte;
  
   -- Concede permisos de ejecuci�n en un procedimiento almacenado llamado `usp_GetCustomerByID` a un rol espec�fico llamado `rol_reportes`:
 
     GRANT EXECUTE ON usp_GetCustomerByID TO rol_reportes;
 
   -- Concede permisos de control total en la base de datos `AdventureWorksLT` a un usuario espec�fico llamado `usuario_administrador`:

     GRANT CONTROL ON DATABASE::AdventureWorksLT TO usuario_administrador;
   


