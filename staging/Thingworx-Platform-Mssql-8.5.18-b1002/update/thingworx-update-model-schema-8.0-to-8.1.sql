--
-- Thingworx Platform Model Schema Update from 8.0 to 8.1
--

IF COL_LENGTH('resource_model', 'serviceDefinitions') IS NULL
BEGIN
	ALTER TABLE resource_model ADD serviceDefinitions [nvarchar](max)
END

IF COL_LENGTH('resource_model', 'serviceImplementations') IS NULL
BEGIN
	ALTER TABLE resource_model ADD serviceImplementations [nvarchar](max)
END

IF COL_LENGTH('notificationcontent_model', 'serviceDefinitions') IS NULL
BEGIN
	ALTER TABLE notificationcontent_model ADD serviceDefinitions [nvarchar](max)
END

IF COL_LENGTH('notificationcontent_model', 'serviceImplementations') IS NULL
BEGIN
	ALTER TABLE notificationcontent_model ADD serviceImplementations [nvarchar](max)
END
