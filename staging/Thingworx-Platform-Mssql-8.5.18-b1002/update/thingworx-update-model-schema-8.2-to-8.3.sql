--
-- Thingworx Platform Model Schema Update from 8.2 to 8.3
--

IF COL_LENGTH('applicationkey_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE applicationkey_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('authenticator_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE authenticator_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('dashboard_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE dashboard_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('dataanalysisdefinition_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE dataanalysisdefinition_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('datashape_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE datashape_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('datatable_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE datatable_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('datatagvocabulary_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE datatagvocabulary_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('directoryservice_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE directoryservice_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('extensionpackage_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE extensionpackage_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('group_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE group_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('localizationtable_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE localizationtable_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('log_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE log_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('mashup_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE mashup_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('mediaentity_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE mediaentity_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('menu_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE menu_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('modeltagvocabulary_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE modeltagvocabulary_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('network_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE network_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('notificationcontent_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE notificationcontent_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('notificationdefinition_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE notificationdefinition_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('organization_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE organization_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('persistenceprovider_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE persistenceprovider_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('persistenceproviderpackage_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE persistenceproviderpackage_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('project_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE project_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('resource_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE resource_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('scriptfunctionlibrary_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE scriptfunctionlibrary_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('statedefinition_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE statedefinition_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('stream_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE stream_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('styledefinition_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE styledefinition_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('subsystem_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE subsystem_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('thing_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE thing_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('thingpackage_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE thingpackage_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('thingshape_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE thingshape_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('thingtemplate_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE thingtemplate_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('user_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE user_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('valuestream_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE valuestream_model ADD configurationTableDefinitions [nvarchar](max)
END
IF COL_LENGTH('widget_model', 'configurationTableDefinitions') IS NULL
BEGIN
	ALTER TABLE widget_model ADD configurationTableDefinitions [nvarchar](max)
END
