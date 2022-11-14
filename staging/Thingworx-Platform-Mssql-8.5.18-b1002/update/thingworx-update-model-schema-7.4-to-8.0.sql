--
-- Thingworx Platform Model Schema Update from 7.4 to 8.0
--


IF COL_LENGTH('user_model', 'scimId') IS NULL
BEGIN
	ALTER TABLE user_model ADD scimId [nvarchar](255)
END

IF COL_LENGTH('user_model', 'scimExternalId') IS NULL
BEGIN
	ALTER TABLE user_model ADD scimExternalId [nvarchar](255)
END

IF COL_LENGTH('group_model', 'scimId') IS NULL
BEGIN
	ALTER TABLE group_model ADD scimId [nvarchar](255)
END

IF COL_LENGTH('group_model', 'scimExternalId') IS NULL
BEGIN
	ALTER TABLE group_model ADD scimExternalId [nvarchar](255)
END

IF COL_LENGTH('group_model', 'scimDisplayName') IS NULL
BEGIN
	ALTER TABLE group_model ADD scimDisplayName [nvarchar](255)
END

GO
