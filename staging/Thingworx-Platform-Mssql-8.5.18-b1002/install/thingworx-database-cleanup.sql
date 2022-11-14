
--------------DATABASE CLEANUP--------------------------------------------------------------------
IF EXISTS (SELECT name FROM sysdatabases WHERE name= '$(database)')
ALTER DATABASE $(database) SET AUTO_CLOSE OFF 
GO

IF EXISTS (SELECT name FROM sysdatabases WHERE name= '$(database)')
DROP DATABASE $(database)
GO