
/*Schema Name      : thingworx-Model-schema
 Database          : MSSQL
 Tables            : 45 TABLES
 Stored Procedures : 1) upsert_aspect_model 2) upsert_user_properties 3) upsert_extension 4) fail_if_not_system_owner
*/

-----------------TABLES CREATION START-------------------------------------------------------------
/****** Object: Table [model_index] **************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [model_index](
	[id] [bigint] IDENTITY(0, 1) NOT NULL,
	[entity_name] [nvarchar](255) NOT NULL,
	[entity_type] [int] NOT NULL,
	[last_modified_time] [datetime2](7) NOT NULL,
	[description] [nvarchar](max) NULL,
	[identifier] [nvarchar](1000) NULL,
	[entity_id] [nvarchar](max) NOT NULL,
	[tags] [nvarchar](max) NULL,
	[project_name] [nvarchar](450) NULL,
    CONSTRAINT [model_index_pkey] PRIMARY KEY ([id])
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [model_index_ukey] UNIQUE ([entity_type] ASC, [entity_name] ASC)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [applicationkey_model] *****************************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [applicationkey_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[clientName] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[expirationDate] [datetime2](7) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[ipWhitelist] [nvarchar](max) NULL,
	[keyId] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[userNameReference] [nvarchar](max) NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [applicationkey_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [applicationkey_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [applicationkey_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object: Table [aspect_model] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [aspect_model](
	[entity_name] [nvarchar](255) NOT NULL,
	[entity_type] [int] NOT NULL,
	[mskey] [nvarchar](64) NOT NULL,
	[value] [nvarchar](max) NULL,
 CONSTRAINT [aspect_model_pkey] PRIMARY KEY
(
	[mskey] ASC,
	[entity_type] ASC,
	[entity_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [authenticator_model] ******************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [authenticator_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[enabled] [bit] NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[priority] [int] NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [authenticator_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [authenticator_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [authenticator_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [dashboard_model] **********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dashboard_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[dashboard] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [dashboard_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [dashboard_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [dashboard_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [datashape_model] **********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datashape_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[baseDataShape] [nvarchar](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[fieldDefinitions] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [datashape_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [datashape_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [datashape_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [datatable_model] **********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datatable_model](
	[entity_id] [bigint] NOT NULL,
	[alertConfigurations] [nvarchar](max) NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[enabled] [bit] NULL,
	[homeMashup] [nvarchar](max) NULL,
	[identifier] [nvarchar](max) NULL,
	[implementedShapes] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[propertyBindings] [nvarchar](max) NULL,
	[published] [bit] NULL,
	[remoteEventBindings] [nvarchar](max) NULL,
	[remotePropertyBindings] [nvarchar](max) NULL,
	[remoteServiceBindings] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[thingShape] [nvarchar](max) NULL,
	[thingTemplate] [nvarchar](max) NULL,
	[type] [int] NULL,
	[valueStream] [nvarchar](max) NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [datatable_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [datatable_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [datatable_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [datatagvocabulary_model] **************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datatagvocabulary_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[isDynamic] [bit] NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [datatagvocabulary_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [datatagvocabulary_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [datatagvocabulary_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [directoryservice_model] ***************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [directoryservice_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[enabled] [bit] NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[priority] [int] NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [directoryservice_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [directoryservice_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [directoryservice_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [extensionpackage_model] ***************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [extensionpackage_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[buildNumber] [nvarchar](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[extensionPackageManifest] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[minimumThingWorxVersion] [nvarchar](max) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[groupId] [nvarchar](max) NULL,
	[artifactId] [nvarchar](max) NULL,
	[packageVersion] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[vendor] [nvarchar](max) NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[migratorClass] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [extensionpackage_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [extensionpackage_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [extensionpackage_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [notificationdefinition_model] *********************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [notificationdefinition_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[contents] [nvarchar](max) NULL,
	[events] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[recipients] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [notificationdefinition_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [notificationdefinition_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [notificationdefinition_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [notificationcontent_model] ************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [notificationcontent_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[handlerID] [nvarchar](max) NULL,
	[handlerEntity] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[serviceDefinitions] [nvarchar](max) NULL,
	[serviceImplementations] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL
	CONSTRAINT [notificationcontent_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [notificationcontent_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [notificationcontent_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [extensions] ***************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [extensions](
	[name] [nvarchar](255) NOT NULL,
	[resource] [varbinary](max) NOT NULL,
	[checksum] [nvarchar](max) NOT NULL,
 CONSTRAINT [extensions_pkey] PRIMARY KEY
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [file_transfer_job] ********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [file_transfer_job](
	[id] [nvarchar](450) NOT NULL,
	[targetChecksum] [nvarchar](max) NULL,
	[code] [int] NULL,
	[isAsync] [bit] NULL,
	[maxSize] [bigint] NULL,
	[stagingDir] [nvarchar](max) NULL,
	[sourceFile] [nvarchar](max) NULL,
	[startPosition] [numeric](30, 6) NULL,
	[timeout] [bigint] NULL,
	[isRestartEnabled] [bit] NULL,
	[duration] [bigint] NULL,
	[targetFile] [nvarchar](max) NULL,
	[startTime] [bigint] NULL,
	[state] [nvarchar](max) NULL,
	[sourcePath] [nvarchar](max) NULL,
	[sourceRepository] [nvarchar](max) NULL,
	[blockCount] [bigint] NULL,
	[bytesTransferred] [numeric](30, 6) NULL,
	[targetPath] [nvarchar](max) NULL,
	[sourceChecksum] [nvarchar](max) NULL,
	[transferId] [nvarchar](max) NULL,
	[message] [nvarchar](max) NULL,
	[blockSize] [bigint] NULL,
	[size] [numeric](30, 6) NULL,
	[endTime] [bigint] NULL,
	[targetRepository] [nvarchar](max) NULL,
	[user] [nvarchar](max) NULL,
	[isComplete] [bit] NULL,
	[reservationId] [nvarchar](max) NULL,
	[isQueueable] [bit] NULL,
	[enqueueTime] [bigint] NULL,
	[enqueueCount] [bigint] NULL,
	[metadata] [nvarchar](max) NULL,
 CONSTRAINT [file_transfer_job_pkey] PRIMARY KEY
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [file_transfer_job_offline_queue] ******************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [file_transfer_job_offline_queue](
	[id] [nvarchar](450) NOT NULL,
	[targetChecksum] [nvarchar](max) NULL,
	[code] [int] NULL,
	[isAsync] [bit] NULL,
	[maxSize] [bigint] NULL,
	[stagingDir] [nvarchar](max) NULL,
	[sourceFile] [nvarchar](max) NULL,
	[startPosition] [numeric](30, 6) NULL,
	[timeout] [bigint] NULL,
	[isRestartEnabled] [bit] NULL,
	[duration] [bigint] NULL,
	[targetFile] [nvarchar](max) NULL,
	[startTime] [bigint] NULL,
	[state] [nvarchar](max) NULL,
	[sourcePath] [nvarchar](max) NULL,
	[sourceRepository] [nvarchar](max) NULL,
	[blockCount] [bigint] NULL,
	[bytesTransferred] [numeric](30, 6) NULL,
	[targetPath] [nvarchar](max) NULL,
	[sourceChecksum] [nvarchar](max) NULL,
	[transferId] [nvarchar](max) NULL,
	[message] [nvarchar](max) NULL,
	[blockSize] [bigint] NULL,
	[size] [numeric](30, 6) NULL,
	[endTime] [bigint] NULL,
	[targetRepository] [nvarchar](max) NULL,
	[user] [nvarchar](max) NULL,
	[isComplete] [bit] NULL,
	[isQueueable] [bit] NULL,
	[enqueueTime] [bigint] NULL,
	[enqueueCount] [bigint] NULL,
	[metadata] [nvarchar](max) NULL,
	[thingName] [nvarchar](max) NOT NULL,
 CONSTRAINT [file_transfer_job_offline_queue_pkey] PRIMARY KEY
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [group_model] **************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [group_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[members] [nvarchar](max) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[scimId] [nvarchar](255),
	[scimExternalId] [nvarchar](255),
	[scimDisplayName] [nvarchar](255),
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [group_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [group_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [group_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [localizationtable_model] **************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [localizationtable_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[languageCommon] [nvarchar](max) NULL,
	[languageNative] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [localizationtable_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [localizationtable_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [localizationtable_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [log_model] ****************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [log_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[logLevel] [nvarchar](max) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [log_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [log_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [log_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [mashup_model] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mashup_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[columns] [numeric](30, 6) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[mashupContent] [nvarchar](max) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[parameterDefinitions] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[relatedEntities] [nvarchar](max) NULL,
	[rows] [numeric](30, 6) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	[preview] [varbinary](max) NULL,
	CONSTRAINT [mashup_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [mashup_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [mashup_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [mediaentity_model] *********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mediaentity_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[content] [varbinary](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [mediaentity_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [mediaentity_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [mediaentity_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [menu_model] ***************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [menu_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[groupReferences] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[imageURL] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[menuItems] [nvarchar](max) NULL,
	[menuLabel] [nvarchar](max) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [menu_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [menu_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [menu_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [modeltagvocabulary_model] *************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [modeltagvocabulary_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[isDynamic] [bit] NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [modeltagvocabulary_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [modeltagvocabulary_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [modeltagvocabulary_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [network_model] ************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [network_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[connections] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [network_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [network_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [network_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [organization_model] *******************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [organization_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[connections] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[loginButtonStyle] [nvarchar](max) NULL,
	[loginImage] [varbinary](max) NULL,
	[loginPrompt] [nvarchar](max) NULL,
	[loginStyle] [nvarchar](max) NULL,
	[mobileMashup] [nvarchar](max) NULL,
	[name] [nvarchar](255) NOT NULL,
	[organizationalUnits] [nvarchar](max) NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[loginResetPassword] [bit] NULL,
	[resetMailServer] [nvarchar](max) NULL,
	[resetMailSubject] [nvarchar](max) NULL,
	[resetMailContent] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [organization_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [organization_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [organization_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [persistenceprovider_model] ************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persistenceprovider_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[enabled] [bit] NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[persistenceProviderPackage] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [persistenceprovider_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [persistenceprovider_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [persistenceprovider_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [persistenceproviderpackage_model] *****************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persistenceproviderpackage_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [persistenceproviderpackage_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [persistenceproviderpackage_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [persistenceproviderpackage_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [project_model] ************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [project_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[publishResult] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[groupId] [nvarchar](max) NULL,
	[artifactId] [nvarchar](max) NULL,
	[version] [nvarchar](max) NULL,
	[state] [nvarchar](max) NOT NULL DEFAULT 'DRAFT',
	[minPlatformVersion] [nvarchar](max) NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [project_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [project_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [project_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [resource_model] ***********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [resource_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[serviceDefinitions] [nvarchar](max) NULL,
	[serviceImplementations] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [resource_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [resource_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [resource_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [root_entity_collection] ***************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [root_entity_collection](
	[name] [nvarchar](255) NOT NULL,
	[type] [int] NULL,
	[description] [nvarchar](max) NULL,
	[owner] [nvarchar](max) NULL,
	[last_modified_time] [datetime2](7) NULL,
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[className] [nvarchar](max) NULL,
 CONSTRAINT [root_entity_collection_pkey] PRIMARY KEY
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [scriptfunctionlibrary_model] **********************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [scriptfunctionlibrary_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[functionDefinitions] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [scriptfunctionlibrary_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [scriptfunctionlibrary_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [scriptfunctionlibrary_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [statedefinition_model] ****************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [statedefinition_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [statedefinition_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [statedefinition_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [statedefinition_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [stream_model] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stream_model](
	[entity_id] [bigint] NOT NULL,
	[alertConfigurations] [nvarchar](max) NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[enabled] [bit] NULL,
	[homeMashup] [nvarchar](max) NULL,
	[identifier] [nvarchar](max) NULL,
	[implementedShapes] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[propertyBindings] [nvarchar](max) NULL,
	[published] [bit] NULL,
	[remoteEventBindings] [nvarchar](max) NULL,
	[remotePropertyBindings] [nvarchar](max) NULL,
	[remoteServiceBindings] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[thingShape] [nvarchar](max) NULL,
	[thingTemplate] [nvarchar](max) NULL,
	[type] [int] NULL,
	[valueStream] [nvarchar](max) NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [stream_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [stream_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [stream_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [styledefinition_model] ****************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [styledefinition_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [styledefinition_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [styledefinition_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [styledefinition_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [styletheme_model] ****************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [styletheme_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	[preview] [varbinary](max) NULL,
	CONSTRAINT [styletheme_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [styletheme_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [styletheme_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [subsystem_model] **********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [subsystem_model](
	[entity_id] [bigint] NOT NULL,
	[autoStart] [bit] NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[dependsOn] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[enabled] [bit] NULL,
	[friendlyName] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [subsystem_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [subsystem_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [subsystem_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [system_ownership] *********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [system_ownership](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[platform] [nvarchar](max) NULL,
	[took_ownership] [datetime2](7) default SYSDATETIMEOFFSET(),
 CONSTRAINT [system_ownership_pkey] PRIMARY KEY
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [tag_index] ****************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tag_index](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[entity_name] [nvarchar](255) NOT NULL,
	[vocabulary_name] [nvarchar](64) NOT NULL,
	[term_name] [nvarchar](64) NOT NULL,
	[entity_identifier] [nvarchar](max) NOT NULL,
	[vocabulary_type] [int] NOT NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
 CONSTRAINT [model_tag_index_pkey] PRIMARY KEY
(
	[tenant_id] ASC,
	[term_name] ASC,
	[vocabulary_name] ASC,
	[entity_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [thing_model] **************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thing_model](
	[entity_id] [bigint] NOT NULL,
	[alertConfigurations] [nvarchar](max) NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[enabled] [bit] NULL,
	[homeMashup] [nvarchar](max) NULL,
	[identifier] [nvarchar](max) NULL,
	[implementedShapes] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[propertyBindings] [nvarchar](max) NULL,
	[published] [bit] NULL,
	[remoteEventBindings] [nvarchar](max) NULL,
	[remotePropertyBindings] [nvarchar](max) NULL,
	[remoteServiceBindings] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[thingShape] [nvarchar](max) NULL,
	[thingTemplate] [nvarchar](max) NULL,
	[type] [int] NULL,
	[valueStream] [nvarchar](max) NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [thing_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [thing_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [thing_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [thingpackage_model] *******************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thingpackage_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [thingpackage_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [thingpackage_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [thingpackage_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [thingshape_model] *********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thingshape_model](
	[entity_id] [bigint] NOT NULL,
	[alertConfigurations] [nvarchar](max) NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[instanceRunTimePermissions] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[propertyBindings] [nvarchar](max) NULL,
	[remoteEventBindings] [nvarchar](max) NULL,
	[remotePropertyBindings] [nvarchar](max) NULL,
	[remoteServiceBindings] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[thingShape] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [thingshape_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [thingshape_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [thingshape_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [thingtemplate_model] ******************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thingtemplate_model](
	[entity_id] [bigint] NOT NULL,
	[alertConfigurations] [nvarchar](max) NULL,
	[avatar] [varbinary](max) NULL,
	[baseThingTemplate] [nvarchar](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[implementedShapes] [nvarchar](max) NULL,
	[instanceDesignTimePermissions] [nvarchar](max) NULL,
	[instanceRunTimePermissions] [nvarchar](max) NULL,
	[instanceVisibilityPermissions] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[propertyBindings] [nvarchar](max) NULL,
	[remoteEventBindings] [nvarchar](max) NULL,
	[remotePropertyBindings] [nvarchar](max) NULL,
	[remoteServiceBindings] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[sharedConfigurationTables] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[thingPackage] [nvarchar](max) NULL,
	[thingShape] [nvarchar](max) NULL,
	[type] [int] NULL,
	[valueStream] [nvarchar](max) NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [thingtemplate_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [thingtemplate_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [thingtemplate_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [transfer_reservation] *****************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [transfer_reservation](
	[id] [nvarchar](450) NOT NULL,
	[reservedBy] [nvarchar](max) NULL,
	[reservedAt] [bigint] NULL,
 CONSTRAINT [transfer_reservation_pkey] PRIMARY KEY
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [user_model] ***************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[enabled] [bit] NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[mobileMashup] [nvarchar](max) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[passwordHash] [nvarchar](max) NULL,
	[passwordHashAlgorithm] [nvarchar](max) NULL,
	[passwordHashIterationCount] [int] NULL,
	[passwordHashSaltSizeInBytes] [int] NULL,
	[passwordHashSizeInBytes] [int] NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[locked] [bit] NULL,
	[lockedTime] [datetime2](7) NULL,
	[scimId] [nvarchar](255),
	[scimExternalId] [nvarchar](255),
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [user_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [user_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [user_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [user_model_properties] ****************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_model_properties](
	[entity_name] [nvarchar](255) NOT NULL,
	[mskey] [nvarchar](64) NOT NULL,
	[value] [nvarchar](max) NULL,
 CONSTRAINT [user_model_properties_pkey] PRIMARY KEY
(
	[mskey] ASC,
	[entity_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [valuestream_model] ********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [valuestream_model](
	[entity_id] [bigint] NOT NULL,
	[alertConfigurations] [nvarchar](max) NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[enabled] [bit] NULL,
	[homeMashup] [nvarchar](max) NULL,
	[identifier] [nvarchar](max) NULL,
	[implementedShapes] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[propertyBindings] [nvarchar](max) NULL,
	[published] [bit] NULL,
	[remoteEventBindings] [nvarchar](max) NULL,
	[remotePropertyBindings] [nvarchar](max) NULL,
	[remoteServiceBindings] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[thingShape] [nvarchar](max) NULL,
	[thingTemplate] [nvarchar](max) NULL,
	[type] [int] NULL,
	[valueStream] [nvarchar](max) NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [valuestream_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [valuestream_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [valuestream_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [vocabulary_terms] *********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [vocabulary_terms](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[vocabulary_name] [nvarchar](64) NOT NULL,
	[term_name] [nvarchar](64) NOT NULL,
	[vocabulary_id] [nvarchar](max) NOT NULL,
	[vocabulary_type] [int] NOT NULL,
 CONSTRAINT [vocabulary_terms_pkey] PRIMARY KEY
(
	[vocabulary_type] ASC,
	[term_name] ASC,
	[vocabulary_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [widget_model] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [widget_model](
	[entity_id] [bigint] NOT NULL,
	[avatar] [varbinary](max) NULL,
	[className] [nvarchar](max) NULL,
	[configurationChanges] [nvarchar](max) NULL,
	[configurationTables] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[designTimePermissions] [nvarchar](max) NULL,
	[documentationContent] [nvarchar](max) NULL,
	[homeMashup] [nvarchar](max) NULL,
	[lastModifiedDate] [datetime2](7) NULL,
	[name] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](max) NULL,
	[projectName] [nvarchar](max) NULL,
	[runTimePermissions] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tenantId] [nvarchar](max) NULL,
	[type] [int] NULL,
	[visibilityPermissions] [nvarchar](max) NULL,
	[configurationTableDefinitions] [nvarchar](max) NULL,
	CONSTRAINT [widget_model_pkey] PRIMARY KEY ([entity_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [widget_entity_fkey] FOREIGN KEY
		([entity_id]) REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [widget_name_ukey] UNIQUE ([name]) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [ServiceDefinitions] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ServiceDefinitions](
	[id] [bigint] IDENTITY(0, 1) NOT NULL,
	[name_chk] AS CHECKSUM([name]) PERSISTED NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[category] [nvarchar](max) NOT NULL,
	[isAllowOverride] [bit] NOT NULL DEFAULT 0,
	[isOpen] [bit] NOT NULL DEFAULT 0,
	[isLocalOnly] [bit] NOT NULL DEFAULT 0,
	[isPrivate] [bit] NOT NULL DEFAULT 0,
	[resultType] [nvarchar](max) NOT NULL,
	[parameterDefinitions] [nvarchar](max) NOT NULL,
	[aspects] [nvarchar](max) NOT NULL,
	CONSTRAINT [service_defs_pkey] PRIMARY KEY ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [service_defs_lookup_idx] ON [ServiceDefinitions] ([name_chk]);
GO

/****** Object: Table [ServiceImplementations] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ServiceImplementations](
	[id] [bigint] IDENTITY(0, 1) NOT NULL,
	[name_chk] AS CHECKSUM([name]) PERSISTED NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[handlerName] [nvarchar](max) NOT NULL,
	[lastModifiedDate] [datetime2](7) NOT NULL,
	[configurationTables] [nvarchar](max) NOT NULL,
	CONSTRAINT [service_impls_pkey] PRIMARY KEY ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [service_impls_lookup_idx] ON [ServiceImplementations] ([name_chk]);
GO

/****** Object: Table [RemoteServiceBindings] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RemoteServiceBindings](
	[id] [bigint] IDENTITY(0, 1) NOT NULL,
	[name_chk] AS CHECKSUM([name]) PERSISTED NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[sourceName] [nvarchar](max) NOT NULL,
	[enableQueue] [bit] NOT NULL DEFAULT 0,
	[timeout] [bigint] DEFAULT 0,
	CONSTRAINT [service_bindings_pkey] PRIMARY KEY ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [service_bindings_lookup_idx] ON [RemoteServiceBindings] ([name_chk]);
GO

/****** Object: Table [EventDefinitions] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [EventDefinitions](
	[id] [bigint] IDENTITY (0, 1) NOT NULL,
	[name_chk] AS CHECKSUM([name]) PERSISTED NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[category] [nvarchar](max) NOT NULL,
	[dataShape] [nvarchar](max) NOT NULL,
	[aspects] [nvarchar](max) NOT NULL,
	CONSTRAINT [event_defs_pkey] PRIMARY KEY ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [event_defs_lookup_idx] ON [EventDefinitions] ([name_chk]);
GO

/****** Object: Table [Subscriptions] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Subscriptions](
	[id] [bigint] IDENTITY(0, 1) NOT NULL,
	[name_chk] AS CHECKSUM([name]) PERSISTED NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[enabled] [bit] NOT NULL,
	[source] [nvarchar](max) NOT NULL,
	[sourceType] [nvarchar](max) NOT NULL,
	[sourceProperty] [nvarchar](max) NOT NULL,
	[eventName] [nvarchar](max) NOT NULL,
	[alertName] [nvarchar](max) NOT NULL,
	[category] [nvarchar](max),
	[lastModifiedDate] [datetime2](7) NOT NULL,
	[trigger] [nvarchar](max),
	[aspects] [nvarchar](max) NOT NULL,
	CONSTRAINT [subscriptions_pkey] PRIMARY KEY ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [subscriptions_lookup_idx] ON [Subscriptions] ([name_chk]);
GO
/****** Object: Table [Entities_ServiceDefinitions] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Entities_ServiceDefinitions](
	[entity_id] [bigint] NOT NULL,
	[definition_id] [bigint] NOT NULL,
	CONSTRAINT [entity_servdefs_ukey] UNIQUE CLUSTERED ([definition_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [entity_servdefs_entity_fkey] FOREIGN KEY ([entity_id])
		REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [entity_servdefs_service_def_fkey] FOREIGN KEY ([definition_id])
		REFERENCES [ServiceDefinitions] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE
)
GO

CREATE NONCLUSTERED INDEX [ents_service_defs_lookup_idx] ON [Entities_ServiceDefinitions] ([entity_id]);
GO

/****** Object: Table [Entities_ServiceImplementations] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Entities_ServiceImplementations](
	[entity_id] [bigint] NOT NULL,
	[implementation_id] [bigint] NOT NULL,
	CONSTRAINT [entity_servimpls_ukey] UNIQUE CLUSTERED ([implementation_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [entity_servimpls_entity_fkey] FOREIGN KEY ([entity_id])
		REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [entity_servimpls_service_impl_fkey] FOREIGN KEY ([implementation_id])
		REFERENCES [ServiceImplementations] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE
)
GO

CREATE NONCLUSTERED INDEX [ents_service_impls_lookup_idx] ON [Entities_ServiceImplementations] ([entity_id]);
GO

/****** Object: Table [Entities_RemoteServiceBindings] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Entities_RemoteServiceBindings](
	[entity_id] [bigint] NOT NULL,
	[binding_id] [bigint] NOT NULL,
	CONSTRAINT [entity_bindings_ukey] UNIQUE CLUSTERED ([binding_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [entity_bindings_entity_fkey] FOREIGN KEY ([entity_id])
		REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [entity_bindings_binding_fkey] FOREIGN KEY ([binding_id])
		REFERENCES [RemoteServiceBindings] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE
)
GO

CREATE NONCLUSTERED INDEX [ents_service_bindings_lookup_idx] ON [Entities_RemoteServiceBindings] ([entity_id]);
GO

/****** Object: Table [Entities_Subscriptions] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Entities_Subscriptions](
	[entity_id] [bigint] NOT NULL,
	[subscription_id] [bigint] NOT NULL,
	CONSTRAINT [entity_subs_ukey] UNIQUE CLUSTERED ([subscription_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [entity_subs_entity_fkey] FOREIGN KEY ([entity_id])
		REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [entity_subs_subs_fkey] FOREIGN KEY ([subscription_id])
		REFERENCES [Subscriptions] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE
)
GO

CREATE NONCLUSTERED INDEX [ents_subscriptions_lookup_idx] ON [Entities_Subscriptions] ([entity_id]);
GO

/****** Object: Table [Entities_EventDefinitions] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Entities_EventDefinitions](
	[entity_id] [bigint] NOT NULL,
	[event_id] [bigint] NOT NULL,
	CONSTRAINT [entity_events_ukey] UNIQUE CLUSTERED ([event_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [entity_events_entity_fkey] FOREIGN KEY ([entity_id])
		REFERENCES [model_index] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT [entity_events_event_fkey] FOREIGN KEY ([event_id])
		REFERENCES [EventDefinitions] ([id])
		ON UPDATE CASCADE ON DELETE CASCADE
)
GO

CREATE NONCLUSTERED INDEX [ents_event_defs_lookup_idx] ON [Entities_EventDefinitions] ([entity_id]);
GO

/****** Object: Table [sync_log] ******************************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sync_log](
	[id] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[platform] [nvarchar](max), -- Arbitrary text describing the owning platform instance.
	[user_name] [nvarchar](max), -- Arbitrary text describing the owning user name
	[changes] [nvarchar](max),
	[dependencies] [nvarchar](max)
)
GO

-----------TABLES CREATION END---------------------------------------------------------------------

-----------INDEX /CONSTRAINT CREATION START--------------------------------------------------------
SET ANSI_PADDING ON
GO

/****** Object: Index [model_index_modelindex_project_name_index] ********************************/
CREATE NONCLUSTERED INDEX [model_index_modelindex_project_name_index] ON [model_index]
(
	[project_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object: Index [tag_index_modeltagindex_tag_index] ****************************************/
CREATE NONCLUSTERED INDEX [tag_index_modeltagindex_tag_index] ON [tag_index]
(
	[term_name] ASC,
	[vocabulary_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object: Index [vocabulary_terms_vocabularyterms_terms_index] *****************************/
CREATE NONCLUSTERED INDEX [vocabulary_terms_vocabularyterms_terms_index] ON [vocabulary_terms]
(
	[vocabulary_type] ASC,
	[term_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object: Index [vocabulary_terms_vocabularyterms_vocabulary_index] ************************/
CREATE NONCLUSTERED INDEX [vocabulary_terms_vocabularyterms_vocabulary_index] ON [vocabulary_terms]
(
	[vocabulary_type] ASC,
	[vocabulary_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [extensions] WITH NOCHECK ADD CONSTRAINT [extensions_name_fkey] FOREIGN KEY([name])
REFERENCES [extensionpackage_model] ([name])
GO

ALTER TABLE [extensions] NOCHECK CONSTRAINT [extensions_name_fkey]
GO

-----------INDEX /CONSTRAINT CREATION START--------------------------------------------------------

-----------STOERED PROCEDURES CREATION START-------------------------------------------------------

/****** Object: StoredProcedure [upsert_aspect_model] ********************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [upsert_aspect_model]
(
 @inserting_name nvarchar(255),
 @inserting_type int,
 @inserting_key nvarchar(64),
 @inserting_value nvarchar(max)
)
AS
BEGIN
IF EXISTS (SELECT * FROM aspect_model WHERE entity_name = @inserting_name AND entity_type = @inserting_type AND mskey = @inserting_key)
	UPDATE aspect_model SET entity_name = @inserting_name, entity_type = @inserting_type, mskey = @inserting_key, value = @inserting_value WHERE entity_name = @inserting_name AND entity_type = @inserting_type AND mskey = @inserting_key;
ELSE
	INSERT INTO aspect_model (entity_name, entity_type, mskey, value) VALUES (@inserting_name, @inserting_type, @inserting_key, @inserting_value);
END

GO
/****** StoredProcedure End **********************************************************************/

/****** Object: StoredProcedure [upsert_user_properties] *****************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [upsert_user_properties]
(
@inserting_name nvarchar(255),
@inserting_key nvarchar(64),
@inserting_value nvarchar(max)
)
AS
DECLARE @Iterator INT
SET @Iterator = 0
BEGIN
	WHILE (@Iterator < 3)
	BEGIN
    IF EXISTS (SELECT * FROM user_model_properties WHERE entity_name = @inserting_name AND mskey = @inserting_key)
			BEGIN
				UPDATE user_model_properties SET entity_name = @inserting_name, mskey = @inserting_key, value = @inserting_value WHERE entity_name = @inserting_name AND mskey = @inserting_key;
				RETURN;
			END
    ELSE
			BEGIN
				INSERT INTO user_model_properties (entity_name, mskey, value) VALUES (@inserting_name, @inserting_key, @inserting_value);
			RETURN;
			END
		WAITFOR DELAY '00:00:01';
		SET @Iterator = @Iterator + 1;
	END;
END;

GO
/****** StoredProcedure End **********************************************************************/

/****** Object: StoredProcedure [upsert_extension] ***********************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [upsert_extension]
(
@extension_name nvarchar(255),
@extension_resource varbinary(max),
@extension_checksum nvarchar(max)
)
AS
DECLARE @Iterator INT
SET @Iterator = 0
BEGIN
	WHILE (@Iterator < 3)
	BEGIN
    IF EXISTS (SELECT * FROM extensions WHERE name = @extension_name)
			BEGIN
				UPDATE extensions SET checksum = @extension_checksum, resource = @extension_resource WHERE name = @extension_name;
				RETURN;
			END
    ELSE
			BEGIN
				INSERT INTO extensions (name, resource, checksum) VALUES (@extension_name, @extension_resource, @extension_checksum);
			  RETURN;
			END
		WAITFOR DELAY '00:00:01';
		SET @Iterator = @Iterator + 1;
  END;
END;

GO
/****** StoredProcedure End **********************************************************************/

/****** Object: StoredProcedure [fail_if_not_system_owner] ***************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [fail_if_not_system_owner]
(
@system_ownership_id int
)
AS
BEGIN
IF NOT EXISTS (SELECT id FROM system_ownership WHERE id IN (SELECT TOP(1) id FROM system_ownership ORDER BY took_ownership DESC ) AND id = @system_ownership_id)

  THROW 50001, 'Database access prohibited because System Ownership has been lost', 1;

END

GO
/****** StoredProcedure End **********************************************************************/

-------------STOERED PROCEDURES CREATION END-------------------------------------------------------
