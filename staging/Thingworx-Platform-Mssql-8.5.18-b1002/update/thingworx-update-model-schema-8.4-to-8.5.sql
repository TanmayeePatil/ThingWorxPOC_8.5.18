--
-- Thingworx Platform Model Schema Update from 8.4 to 8.5
--
--
-- Name: sync_log; Type: TABLE; Owner: :"user_name"; Tablespace: 
--

/**
 * 
 * A table for tracking changes to the model for the purpose of synchronizing those changes in HA. 
 * ID: A monitonically increasing number that acts as the model version number
 * CHANGES: A comma delimited list of entities that have been modified
 * DEPENDENCIES: A comma delimited list of entities that the modified entities depended on when this model change was made
 * 
**/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='sync_log')
BEGIN
	CREATE TABLE [sync_log](
		[id] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[platform] [nvarchar](max), -- Arbitrary text describing the owning platform instance.
		[user_name] [nvarchar](max), -- Arbitrary text describing the owning user name
		[changes] [nvarchar](max),
		[dependencies] [nvarchar](max)
	)
END
GO

-- Drop DataAnalyticsDefinition (DAD) Table, TW-59488
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='dataanalysisdefinition_model')
BEGIN
    PRINT 'Removing dataanalysisdefinition_model (DAD) table'
    DROP TABLE dataanalysisdefinition_model
END
GO

-- Alter project_model to add groupId, artifactId, dependences and state columns, TW-59519
PRINT 'Adding groupId, artifactId, dependencies, state columns for project_model, if not exist'
IF COL_LENGTH('project_model', 'groupId') IS NULL
BEGIN
	ALTER TABLE project_model ADD groupId [varchar] (max) NOT NULL DEFAULT '';
END
IF COL_LENGTH('project_model', 'artifactId') IS NULL
BEGIN
	ALTER TABLE project_model ADD artifactId [varchar] (max) NOT NULL DEFAULT '';
END
IF COL_LENGTH('project_model', 'publishResult') IS NULL
BEGIN
	ALTER TABLE project_model ADD publishResult [varchar] (max) NOT NULL DEFAULT '';
END
IF COL_LENGTH('project_model', 'state') IS NULL
BEGIN
	ALTER TABLE project_model ADD state [varchar] (max) NOT NULL DEFAULT 'DRAFT';
END
IF COL_LENGTH('project_model', 'minPlatformVersion') IS NULL
BEGIN
	ALTER TABLE project_model ADD minPlatformVersion [varchar] (max) NOT NULL DEFAULT '';
END
GO

-- Alter extensionpackage_model to add groupId, artifactId columns, TW-59519
PRINT 'Adding groupId, artifactId columns for extensionpackage_model, if not exist'
IF COL_LENGTH('extensionpackage_model', 'groupId') IS NULL
BEGIN
	ALTER TABLE extensionpackage_model ADD groupId [varchar] (max) NOT NULL DEFAULT '';
END
IF COL_LENGTH('extensionpackage_model', 'artifactId') IS NULL
BEGIN
	ALTER TABLE extensionpackage_model ADD artifactId [varchar] (max) NOT NULL DEFAULT '';
END
GO
