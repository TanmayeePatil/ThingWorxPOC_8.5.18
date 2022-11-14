--------------USER AND SCHEMA CREATION--------------------------------------------------------------

CREATE USER $(thingworxusername) FOR LOGIN $(loginname) WITH DEFAULT_SCHEMA=$(schema)
GO

ALTER ROLE [db_owner] ADD MEMBER $(thingworxusername)
GO

CREATE SCHEMA $(schema) AUTHORIZATION $(thingworxusername)
GO
