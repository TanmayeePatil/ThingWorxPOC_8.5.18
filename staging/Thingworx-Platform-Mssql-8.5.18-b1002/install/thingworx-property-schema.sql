
/*
 Schema Name       : thingworx-property-schema
 Database          : MSSQL
 Tables            : 1) property_vtq, 2)system_version
 Stored Procedures : 1) upsert_property_vtq, 2) insert_with_upsert_property_vtq 
*/

-----------------TABLES CREATION START------------------------------------------------------------

/****** Object: Table [property_vtq] *************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [property_vtq](
        [id] [nvarchar](192) NOT NULL,
        [name] [nvarchar](255) NOT NULL,
        [value] [varbinary](max) NULL,
        [time] [bigint] NULL,
        [quality] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object: Index [property_vtq_id_name_index] ****************************/
CREATE UNIQUE NONCLUSTERED INDEX [property_vtq_id_name_index] ON [property_vtq]
(
	[id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object: Table [system_version] ***********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [system_version](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[server_name] [nvarchar](255) NOT NULL,
	[server_code] [int] NOT NULL,
	[is_data_provider_supported] [bit] NOT NULL,
	[is_model_provider_supported] [bit] NOT NULL,
	[is_property_provider_supported] [bit] NOT NULL,
	[model_schema_version] [int] NOT NULL,
	[data_schema_version] [int] NOT NULL,
	[property_schema_version] [int] NOT NULL,
	[major_version] [nvarchar](10) NOT NULL,
	[minor_version] [nvarchar](10) NULL,
	[revision] [nvarchar](45) NOT NULL,
	[build] [nvarchar](45) NOT NULL,
	[creationdate] [datetime2](7) NULL,
 CONSTRAINT [system_version_pkey] PRIMARY KEY
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
-----------------TABLES CREATION END---------------------------------------------------------------

-----------INDEX /CONSTRAINT CREATION START--------------------------------------------------------
ALTER TABLE [system_version] ADD DEFAULT ('1753-01-01 00:00:00') FOR [creationdate]
GO

/****** Object: Index [system_version_systemversion_servername_index] ****************************/
CREATE NONCLUSTERED INDEX [system_version_systemversion_servername_index] ON [system_version]
(
	[server_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-----------INDEX /CONSTRAINT CREATION END----------------------------------------------------------

-----------STORED PROCEDURES CREATION START--------------------------------------------------------

-----------STORED PROCEDURES CREATION END----------------------------------------------------------
