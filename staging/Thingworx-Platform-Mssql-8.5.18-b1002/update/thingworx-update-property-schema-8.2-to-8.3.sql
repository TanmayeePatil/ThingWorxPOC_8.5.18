--
-- Thingworx Platform Property Schema Update from 8.2 to 8.3
--

IF OBJECT_ID('insert_with_upsert_property_vtq') IS NOT NULL
DROP PROCEDURE insert_with_upsert_property_vtq
GO

IF OBJECT_ID('upsert_property_vtq') IS NOT NULL
DROP PROCEDURE upsert_property_vtq
GO
