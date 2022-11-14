--
-- Thingworx Platform Model Schema update from 8.3 to 8.4
--

BEGIN TRANSACTION UpgradePlatform8_4_0
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET XACT_ABORT ON;
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

PRINT 'Adding new identity columns to model tables'
IF COL_LENGTH('model_index', 'id') IS NULL
BEGIN
	ALTER TABLE [model_index] ADD [id] [bigint] IDENTITY(0, 1) NOT NULL;
END
IF COL_LENGTH('thing_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [thing_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('thingshape_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [thingshape_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('thingtemplate_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [thingtemplate_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('applicationkey_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [applicationkey_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('authenticator_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [authenticator_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('dashboard_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [dashboard_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('dataanalysisdefinition_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [dataanalysisdefinition_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('datashape_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [datashape_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('datatable_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [datatable_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('datatagvocabulary_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [datatagvocabulary_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('directoryservice_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [directoryservice_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('extensionpackage_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [extensionpackage_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('group_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [group_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('localizationtable_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [localizationtable_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('log_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [log_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('mashup_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [mashup_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('mashup_model', 'preview') IS NULL
BEGIN
	ALTER TABLE [mashup_model] ADD [preview] [varbinary](max);
END
IF COL_LENGTH('mediaentity_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [mediaentity_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('menu_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [menu_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('modeltagvocabulary_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [modeltagvocabulary_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('network_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [network_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('organization_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [organization_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('persistenceprovider_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [persistenceprovider_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('persistenceproviderpackage_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [persistenceproviderpackage_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('project_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [project_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('resource_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [resource_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('scriptfunctionlibrary_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [scriptfunctionlibrary_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('statedefinition_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [statedefinition_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('stream_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [stream_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('styledefinition_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [styledefinition_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('subsystem_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [subsystem_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('thingpackage_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [thingpackage_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('user_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [user_model] ADD [entity_id] [bigint];
END
IF COL_LENGTH('valuestream_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [valuestream_model] ADD [entity_id] [bigint];
END;
IF COL_LENGTH('widget_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [widget_model] ADD [entity_id] [bigint];
END;
IF COL_LENGTH('notificationdefinition_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [notificationdefinition_model] ADD [entity_id] [bigint];
END;
IF COL_LENGTH('styletheme_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [styletheme_model] ADD [entity_id] [bigint];
END;
IF COL_LENGTH('notificationcontent_model', 'entity_id') IS NULL
BEGIN
	ALTER TABLE [notificationcontent_model] ADD [entity_id] [bigint];
END;

GO

PRINT 'Populating new identity columns'
UPDATE model
	SET model.[entity_id] = midx.[id]
	FROM [thing_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 2401;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [user_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 2701;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [datashape_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 1601;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [thingshape_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 2501;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [thingtemplate_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 1301;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [thingpackage_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 2601;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [applicationkey_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 2001;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [mediaentity_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 3001;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [mashup_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 601;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [group_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 2801;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [extensionpackage_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 5001;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [modeltagvocabulary_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 511;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [menu_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 5201;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [styledefinition_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 711;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [statedefinition_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 721;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [widget_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 701;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [resource_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 4901;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [authenticator_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 4301;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [subsystem_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 7001;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [log_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 201;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [scriptfunctionlibrary_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 4801;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [network_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 4601;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [organization_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 8011;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [directoryservice_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 4001;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [localizationtable_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 1901;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [persistenceprovider_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 20401;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [persistenceproviderpackage_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 20301;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [dashboard_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 741;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [datatagvocabulary_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 521;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [notificationdefinition_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 20701;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [styletheme_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 20901;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [notificationcontent_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 20801;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [dataanalysisdefinition_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 20601;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [project_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 20501;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [datatable_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 1401;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [stream_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 1200;
UPDATE model
	SET [entity_id] = midx.[id]
	FROM [valuestream_model] AS model
	INNER JOIN [model_index] AS midx ON model.[name] = midx.[entity_name]
	WHERE midx.[entity_type] = 1500;

GO

PRINT 'Removing dependencies on legacy constraints'
ALTER TABLE [extensions] DROP CONSTRAINT [extensions_name_fkey];

GO

PRINT 'Updating constraints on model tables'
ALTER TABLE [model_index] DROP CONSTRAINT [model_index_pkey];
ALTER TABLE [model_index] ADD CONSTRAINT [model_index_pkey] PRIMARY KEY ([id]);
ALTER TABLE [model_index] ADD CONSTRAINT [model_index_ukey] UNIQUE ([entity_type] ASC, [entity_name] ASC)

ALTER TABLE [thing_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [thing_model] ADD CONSTRAINT [thing_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [thing_model] DROP CONSTRAINT [thing_model_pkey];
ALTER TABLE [thing_model] ADD CONSTRAINT [thing_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [thing_model] ADD CONSTRAINT [thing_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [user_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [user_model] ADD CONSTRAINT [user_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [user_model] DROP CONSTRAINT [user_model_pkey];
ALTER TABLE [user_model] ADD CONSTRAINT [user_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [user_model] ADD CONSTRAINT [user_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [datashape_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [datashape_model] ADD CONSTRAINT [datashape_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [datashape_model] DROP CONSTRAINT [datashape_model_pkey];
ALTER TABLE [datashape_model] ADD CONSTRAINT [datashape_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [datashape_model] ADD CONSTRAINT [datashape_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [thingshape_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [thingshape_model] ADD CONSTRAINT [thingshape_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [thingshape_model] DROP CONSTRAINT [thingshape_model_pkey];
ALTER TABLE [thingshape_model] ADD CONSTRAINT [thingshape_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [thingshape_model] ADD CONSTRAINT [thingshape_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [thingtemplate_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [thingtemplate_model] ADD CONSTRAINT [thingtemplate_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [thingtemplate_model] DROP CONSTRAINT [thingtemplate_model_pkey];
ALTER TABLE [thingtemplate_model] ADD CONSTRAINT [thingtemplate_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [thingtemplate_model] ADD CONSTRAINT [thingtemplate_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [thingpackage_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [thingpackage_model] ADD CONSTRAINT [thingpackage_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [thingpackage_model] DROP CONSTRAINT [thingpackage_model_pkey];
ALTER TABLE [thingpackage_model] ADD CONSTRAINT [thingpackage_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [thingpackage_model] ADD CONSTRAINT [thingpackage_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [applicationkey_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [applicationkey_model] ADD CONSTRAINT [applicationkey_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [applicationkey_model] DROP CONSTRAINT [applicationkey_model_pkey];
ALTER TABLE [applicationkey_model] ADD CONSTRAINT [applicationkey_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [applicationkey_model] ADD CONSTRAINT [applicationkey_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [mediaentity_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [mediaentity_model] ADD CONSTRAINT [mediaentity_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [mediaentity_model] DROP CONSTRAINT [mediaentity_model_pkey];
ALTER TABLE [mediaentity_model] ADD CONSTRAINT [mediaentity_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [mediaentity_model] ADD CONSTRAINT [mediaentity_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [mashup_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [mashup_model] ADD CONSTRAINT [mashup_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [mashup_model] DROP CONSTRAINT [mashup_model_pkey];
ALTER TABLE [mashup_model] ADD CONSTRAINT [mashup_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [mashup_model] ADD CONSTRAINT [mashup_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [group_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [group_model] ADD CONSTRAINT [group_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [group_model] DROP CONSTRAINT [group_model_pkey];
ALTER TABLE [group_model] ADD CONSTRAINT [group_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [group_model] ADD CONSTRAINT [group_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [extensionpackage_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [extensionpackage_model] ADD CONSTRAINT [extensionpackage_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [extensionpackage_model] DROP CONSTRAINT [extensionpackage_model_pkey];
ALTER TABLE [extensionpackage_model] ADD CONSTRAINT [extensionpackage_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [extensionpackage_model] ADD CONSTRAINT [extensionpackage_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [modeltagvocabulary_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [modeltagvocabulary_model] ADD CONSTRAINT [modeltagvocabulary_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [modeltagvocabulary_model] DROP CONSTRAINT [modeltagvocabulary_model_pkey];
ALTER TABLE [modeltagvocabulary_model] ADD CONSTRAINT [modeltagvocabulary_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [modeltagvocabulary_model] ADD CONSTRAINT [modeltagvocabulary_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [menu_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [menu_model] ADD CONSTRAINT [menu_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [menu_model] DROP CONSTRAINT [menu_model_pkey];
ALTER TABLE [menu_model] ADD CONSTRAINT [menu_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [menu_model] ADD CONSTRAINT [menu_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [styledefinition_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [styledefinition_model] ADD CONSTRAINT [styledefinition_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [styledefinition_model] DROP CONSTRAINT [styledefinition_model_pkey];
ALTER TABLE [styledefinition_model] ADD CONSTRAINT [styledefinition_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [styledefinition_model] ADD CONSTRAINT [styledefinition_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [statedefinition_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [statedefinition_model] ADD CONSTRAINT [statedefinition_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [statedefinition_model] DROP CONSTRAINT [statedefinition_model_pkey];
ALTER TABLE [statedefinition_model] ADD CONSTRAINT [statedefinition_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [statedefinition_model] ADD CONSTRAINT [statedefinition_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [widget_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [widget_model] ADD CONSTRAINT [widget_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [widget_model] DROP CONSTRAINT [widget_model_pkey];
ALTER TABLE [widget_model] ADD CONSTRAINT [widget_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [widget_model] ADD CONSTRAINT [widget_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [resource_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [resource_model] ADD CONSTRAINT [resource_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [resource_model] DROP CONSTRAINT [resource_model_pkey];
ALTER TABLE [resource_model] ADD CONSTRAINT [resource_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [resource_model] ADD CONSTRAINT [resource_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [authenticator_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [authenticator_model] ADD CONSTRAINT [authenticator_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [authenticator_model] DROP CONSTRAINT [authenticator_model_pkey];
ALTER TABLE [authenticator_model] ADD CONSTRAINT [authenticator_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [authenticator_model] ADD CONSTRAINT [authenticator_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [subsystem_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [subsystem_model] ADD CONSTRAINT [subsystem_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [subsystem_model] DROP CONSTRAINT [subsystem_model_pkey];
ALTER TABLE [subsystem_model] ADD CONSTRAINT [subsystem_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [subsystem_model] ADD CONSTRAINT [subsystem_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [log_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [log_model] ADD CONSTRAINT [log_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [log_model] DROP CONSTRAINT [log_model_pkey];
ALTER TABLE [log_model] ADD CONSTRAINT [log_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [log_model] ADD CONSTRAINT [log_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [scriptfunctionlibrary_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [scriptfunctionlibrary_model] ADD CONSTRAINT [scriptfunctionlibrary_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [scriptfunctionlibrary_model] DROP CONSTRAINT [scriptfunctionlibrary_model_pkey];
ALTER TABLE [scriptfunctionlibrary_model] ADD CONSTRAINT [scriptfunctionlibrary_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [scriptfunctionlibrary_model] ADD CONSTRAINT [scriptfunctionlibrary_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [network_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [network_model] ADD CONSTRAINT [network_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [network_model] DROP CONSTRAINT [network_model_pkey];
ALTER TABLE [network_model] ADD CONSTRAINT [network_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [network_model] ADD CONSTRAINT [network_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [organization_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [organization_model] ADD CONSTRAINT [organization_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [organization_model] DROP CONSTRAINT [organization_model_pkey];
ALTER TABLE [organization_model] ADD CONSTRAINT [organization_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [organization_model] ADD CONSTRAINT [organization_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [directoryservice_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [directoryservice_model] ADD CONSTRAINT [directoryservice_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [directoryservice_model] DROP CONSTRAINT [directoryservice_model_pkey];
ALTER TABLE [directoryservice_model] ADD CONSTRAINT [directoryservice_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [directoryservice_model] ADD CONSTRAINT [directoryservice_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [localizationtable_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [localizationtable_model] ADD CONSTRAINT [localizationtable_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [localizationtable_model] DROP CONSTRAINT [localizationtable_model_pkey];
ALTER TABLE [localizationtable_model] ADD CONSTRAINT [localizationtable_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [localizationtable_model] ADD CONSTRAINT [localizationtable_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [persistenceprovider_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [persistenceprovider_model] ADD CONSTRAINT [persistenceprovider_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [persistenceprovider_model] DROP CONSTRAINT [persistenceprovider_model_pkey];
ALTER TABLE [persistenceprovider_model] ADD CONSTRAINT [persistenceprovider_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [persistenceprovider_model] ADD CONSTRAINT [persistenceprovider_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [persistenceproviderpackage_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [persistenceproviderpackage_model] ADD CONSTRAINT [persistenceproviderpackage_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [persistenceproviderpackage_model] DROP CONSTRAINT [persistenceproviderpackage_model_pkey];
ALTER TABLE [persistenceproviderpackage_model] ADD CONSTRAINT [persistenceproviderpackage_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [persistenceproviderpackage_model] ADD CONSTRAINT [persistenceproviderpackage_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [dashboard_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [dashboard_model] ADD CONSTRAINT [dashboard_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [dashboard_model] DROP CONSTRAINT [dashboard_model_pkey];
ALTER TABLE [dashboard_model] ADD CONSTRAINT [dashboard_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [dashboard_model] ADD CONSTRAINT [dashboard_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [datatagvocabulary_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [datatagvocabulary_model] ADD CONSTRAINT [datatagvocabulary_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [datatagvocabulary_model] DROP CONSTRAINT [datatagvocabulary_model_pkey];
ALTER TABLE [datatagvocabulary_model] ADD CONSTRAINT [datatagvocabulary_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [datatagvocabulary_model] ADD CONSTRAINT [datatagvocabulary_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [notificationdefinition_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [notificationdefinition_model] ADD CONSTRAINT [notificationdefinition_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [notificationdefinition_model] DROP CONSTRAINT [notificationdefinition_model_pkey];
ALTER TABLE [notificationdefinition_model] ADD CONSTRAINT [notificationdefinition_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [notificationdefinition_model] ADD CONSTRAINT [notificationdefinition_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [styletheme_model] ADD CONSTRAINT [styletheme_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ([id])
	ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [styletheme_model] ADD CONSTRAINT [styletheme_name_ukey] UNIQUE ([name]) ON [PRIMARY]

ALTER TABLE [notificationcontent_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [notificationcontent_model] ADD CONSTRAINT [notificationcontent_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [notificationcontent_model] DROP CONSTRAINT [notificationcontent_model_pkey];
ALTER TABLE [notificationcontent_model] ADD CONSTRAINT [notificationcontent_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [notificationcontent_model] ADD CONSTRAINT [notificationcontent_model_pkey] PRIMARY KEY ([entity_id]);

-- NOTE: DataAnalysisDefinition_model never had a primary key defined, so we will not attempt to drop it here.
ALTER TABLE [dataanalysisdefinition_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
GO
ALTER TABLE [dataanalysisdefinition_model] ADD CONSTRAINT [dataanalysisdefinition_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [dataanalysisdefinition_model] ADD CONSTRAINT [dataanalysisdefinition_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [dataanalysisdefinition_model] ADD CONSTRAINT [dataanalysisdefinition_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [project_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [project_model] ADD CONSTRAINT [project_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [project_model] DROP CONSTRAINT [project_model_pkey];
ALTER TABLE [project_model] ADD CONSTRAINT [project_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [project_model] ADD CONSTRAINT [project_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [datatable_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [datatable_model] ADD CONSTRAINT [datatable_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [datatable_model] DROP CONSTRAINT [datatable_model_pkey];
ALTER TABLE [datatable_model] ADD CONSTRAINT [datatable_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [datatable_model] ADD CONSTRAINT [datatable_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [stream_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [stream_model] ADD CONSTRAINT [stream_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [stream_model] DROP CONSTRAINT [stream_model_pkey];
ALTER TABLE [stream_model] ADD CONSTRAINT [stream_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [stream_model] ADD CONSTRAINT [stream_model_pkey] PRIMARY KEY ([entity_id]);

ALTER TABLE [valuestream_model] ALTER COLUMN [entity_id] [bigint] NOT NULL;
ALTER TABLE [valuestream_model] ADD CONSTRAINT [valuestream_model_name_ukey] UNIQUE ([name] ASC);
ALTER TABLE [valuestream_model] DROP CONSTRAINT [valuestream_model_pkey];
ALTER TABLE [valuestream_model] ADD CONSTRAINT [valuestream_model_entity_fkey] FOREIGN KEY ([entity_id]) REFERENCES [model_index] ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE [valuestream_model] ADD CONSTRAINT [valuestream_model_pkey] PRIMARY KEY ([entity_id]);

GO

PRINT 'Restoring foreign key dependencies'
ALTER TABLE [extensions] ADD CONSTRAINT [extensions_name_fkey] FOREIGN KEY ([name]) REFERENCES [extensionpackage_model]([name]);

GO

PRINT 'Creating new characteristics tables'
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
CREATE TABLE [RemoteServiceBindings](
	[id] [bigint] IDENTITY(0, 1) NOT NULL,
	[name_chk] AS CHECKSUM([name]) PERSISTED NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[sourceName] [nvarchar](max) NOT NULL,
	[enableQueue] [bit] NOT NULL DEFAULT 0,
	[timeout] [bigint] DEFAULT 0,
	CONSTRAINT [service_bindings_pkey] PRIMARY KEY ([id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

GO

PRINT 'Creating characteristic ownership tables'
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
);
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
);
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
);
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
);
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
);

GO

PRINT 'Adding lookup indexes to new tables'
CREATE NONCLUSTERED INDEX [service_defs_lookup_idx] ON [ServiceDefinitions] ([name_chk]);
CREATE NONCLUSTERED INDEX [service_impls_lookup_idx] ON [ServiceImplementations] ([name_chk]);
CREATE NONCLUSTERED INDEX [service_bindings_lookup_idx] ON [RemoteServiceBindings] ([name_chk]);
CREATE NONCLUSTERED INDEX [event_defs_lookup_idx] ON [EventDefinitions] ([name_chk]);
CREATE NONCLUSTERED INDEX [subscriptions_lookup_idx] ON [Subscriptions] ([name_chk]);

CREATE NONCLUSTERED INDEX [ents_service_defs_lookup_idx] ON [Entities_ServiceDefinitions] ([entity_id]);
CREATE NONCLUSTERED INDEX [ents_service_impls_lookup_idx] ON [Entities_ServiceImplementations] ([entity_id]);
CREATE NONCLUSTERED INDEX [ents_service_bindings_lookup_idx] ON [Entities_RemoteServiceBindings] ([entity_id]);
CREATE NONCLUSTERED INDEX [ents_subscriptions_lookup_idx] ON [Entities_Subscriptions] ([entity_id]);
CREATE NONCLUSTERED INDEX [ents_event_defs_lookup_idx] ON [Entities_EventDefinitions] ([entity_id]);

GO

COMMIT TRANSACTION UpgradePlatform8_4_0;