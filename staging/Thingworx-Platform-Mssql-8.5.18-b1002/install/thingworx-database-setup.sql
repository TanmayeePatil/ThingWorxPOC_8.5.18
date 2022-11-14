/*
  Schema Name       : thingworx-database-setup
  Database          : MSSQL
*/

---------------DATABASE CREATION-------------------------------------------------------------------

CREATE DATABASE $(database) COLLATE Latin1_General_100_CS_AS_SC;
GO

ALTER DATABASE $(database) SET READ_COMMITTED_SNAPSHOT ON
GO

-- The stmt below will allow MSSQL to record updated rows' versioning information automatically in the tempDB table for reads on a snapshot
ALTER DATABASE $(database) SET ALLOW_SNAPSHOT_ISOLATION ON
GO