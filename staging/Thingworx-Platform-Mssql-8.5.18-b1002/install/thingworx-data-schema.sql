/*
 Schema Name       : thingworx-data-schema
 Database          : MSSQL
  Tables            : 1) blog 2) blog_comment 3) data_table 4) stream 5) value_stream 6) wiki 7) wiki_comment 8) wiki_history 9) data_table_indexes
 Stored Procedures : 1) upsert_stream_entry 2) batch_stream_entry 3) upsert_value_stream_entry 4 ) batch_value_stream_entry
 Sequences         : 1) blog_entry_id_seq 2) wiki_entry_id_seq
 */

-----------SEQUENCE CREATION START----------------------------------------------------------------
/****** Object: Sequences Start *****************************************************************/
CREATE SEQUENCE [blog_entry_id_seq]
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE;
  
GO

CREATE SEQUENCE [wiki_entry_id_seq]
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE;
  
GO
/****** Object: Sequences End ********************************************************************/
-----------SEQUENCE CREATION END------------------------------------------------------------------

-----------TABLES CREATION START------------------------------------------------------------------ 
/****** Object: Table [blog] ********************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [blog](
	[entry_id] [bigint] DEFAULT ( NEXT VALUE FOR [blog_entry_id_seq]) NOT NULL,
	[time] [datetime2](7) NULL,
	[entity_id] [nvarchar](255) NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[rating_average] [real] NULL,
	[rating_count] [int] NULL,
	[location] [nvarchar](max) NULL,
	[source_id] [nvarchar](255) NULL,
	[source_type] [nvarchar](255) NULL,
	[tags] [nvarchar](max) NULL,
	[last_updated] [datetime2](7) NULL,
	[is_sticky] [bit] NULL,
 CONSTRAINT [blog_pkey] PRIMARY KEY
(
	[entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object: Table [blog_comment] ******************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [blog_comment](
	[entry_id] [bigint] DEFAULT ( NEXT VALUE FOR [blog_entry_id_seq]) NOT NULL,
	[blog_entry_id] [bigint] NULL,
	[parent_entry_id] [bigint] NULL,
	[content] [nvarchar](max) NULL,
	[location] [nvarchar](max) NULL,
	[source_id] [nvarchar](255) NULL,
	[source_type] [nvarchar](255) NULL,
	[tags] [nvarchar](max) NULL,
	[time] [datetime2](7) NULL,
 CONSTRAINT [blog_comment_pkey] PRIMARY KEY
(
	[entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object: Table [data_table] ********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [data_table](
	[entry_id] [int] IDENTITY(1,1) NOT NULL,
	[entity_id] [nvarchar](255) NULL,
	[entity_key] [nvarchar](128) NULL,
	[field_values] [nvarchar](max) NULL,
	[location] [nvarchar](max) NULL,
	[source_id] [nvarchar](255) NULL,
	[source_type] [nvarchar](255) NULL,
	[tags] [nvarchar](max) NULL,
	[time] [datetime2](7) NULL,
	[full_text] [nvarchar](max) NULL,
 CONSTRAINT [data_table_pkey] PRIMARY KEY
(
	[entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [EntityId_Key_UniqueKey] UNIQUE NONCLUSTERED 
(
	[entity_id] ASC,
	[entity_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object: Table [data_table_indexes] ************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [data_table_indexes](
	[entry_id] [int] NOT NULL,
	[entity_id] [nvarchar](128) NOT NULL,
	[index_name] [nvarchar](255) NOT NULL,
	[mskey] [nvarchar](64) NOT NULL,
 CONSTRAINT [data_table_indexes_pkey] PRIMARY KEY
(
	[entry_id] ASC,
	[entity_id] ASC,
	[index_name] ASC,
	[mskey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO

/****** Object: Table [stream] ************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stream](
	[entry_id] [int] IDENTITY(1,1) NOT NULL,
	[entity_id] [nvarchar](175) NULL,
	[source_id] [nvarchar](175) NULL,
	[time] [datetime2] (7) NULL,
	[field_values] [nvarchar](max) NULL,
	[location] [nvarchar](255) NULL,
	[source_type] [nvarchar](96) NULL,
	[tags] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object: Table [value_stream] ******************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [value_stream](
	[entry_id] [bigint] IDENTITY(1,1) NOT NULL,
	[entity_id] [nvarchar](128) NULL,
	[source_id] [nvarchar](128) NULL,
	[time] [datetime2](7) NULL,
	[property_type] [int] NULL,
	[property_name] [nvarchar](128) NULL,
	[property_value] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object: Table [wiki] **************************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [wiki](
	[entry_id] [bigint] DEFAULT( NEXT VALUE FOR [wiki_entry_id_seq]) NOT NULL,
	[time] [datetime2](7) NULL,
	[entity_id] [nvarchar](255) NULL,
	[parent_entry_id] [nvarchar](255) NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[rating_average] [real] NULL,
	[rating_count] [int] NULL,
	[location] [nvarchar](max) NULL,
	[source_id] [nvarchar](255) NULL,
	[source_type] [nvarchar](255) NULL,
	[tags] [nvarchar](max) NULL,
 CONSTRAINT [wiki_pkey] PRIMARY KEY
(
	[entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [wiki_comment] ******************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [wiki_comment](
	[entry_id] [bigint] DEFAULT( NEXT VALUE FOR [wiki_entry_id_seq]) NOT NULL,
	[wiki_entry_id] [bigint] NULL,
	[parent_entry_id] [bigint] NULL,
	[content] [nvarchar](max) NULL,
	[location] [nvarchar](max) NULL,
	[source_id] [nvarchar](255) NULL,
	[source_type] [nvarchar](255) NULL,
	[tags] [nvarchar](max) NULL,
	[time] [datetime2](7) NULL,
 CONSTRAINT [wiki_comment_pkey] PRIMARY KEY
(
	[entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object: Table [wiki_history] ******************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [wiki_history](
	[entry_id] [int] IDENTITY(1,1) NOT NULL,
	[wiki_entry_id] [bigint] NULL,
	[entity_id] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[location] [nvarchar](max) NULL,
	[source_id] [nvarchar](255) NULL,
	[source_type] [nvarchar](255) NULL,
	[tags] [nvarchar](max) NULL,
	[time] [datetime2](7) NULL,
 CONSTRAINT [wiki_history_pkey] PRIMARY KEY
(
	[entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
-----------TABLES CREATION END--------------------------------------------------------------------

-----------INDEX /CONSTRAINT CREATION START-------------------------------------------------------
SET ANSI_PADDING ON
GO

/****** Object: Index [blog_id_index] ***********************************************************/
CREATE NONCLUSTERED INDEX [blog_id_index] ON [blog]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object: Index [blog_comment_collaboration_id_index] *************************************/
CREATE NONCLUSTERED INDEX [blog_comment_collaboration_id_index] ON [blog_comment]
(
	[blog_entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object: Index [stream_entity_id_source_id_source_type_time_key] *************************/
CREATE UNIQUE NONCLUSTERED INDEX [stream_entity_id_source_id_source_type_time_key] ON [stream]
(
	[entity_id] ASC,
	[source_id] ASC,
	[source_type] ASC,
	[time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object: Index [stream_id_time_index] ****************************************************/
CREATE NONCLUSTERED INDEX [stream_id_time_index] ON [stream]
(
	[entity_id] ASC,
	[time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE UNIQUE NONCLUSTERED INDEX [ValStream-EntID_SouId_Propname_PropType_Tm] ON [value_stream]
(
	[entity_id] ASC,
	[source_id] ASC,
	[property_name] ASC,
	[property_type] ASC,
	[time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

/****** Object: Index [WikiCom_Wiki_Entry_Id_NonCluIndex] ****************************************/
CREATE NONCLUSTERED INDEX [WikiCom_Wiki_Entry_Id_NonCluIndex] ON [wiki_comment]
(
	[wiki_entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

/****** Object: Index [WikiHist_Wiki_Entry_Id_NonClusIndex] **************************************/
CREATE NONCLUSTERED INDEX [WikiHist_Wiki_Entry_Id_NonClusIndex] ON [wiki_history]
(
	[wiki_entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

ALTER TABLE [blog_comment] WITH NOCHECK ADD CONSTRAINT [comment_blog_entry_id_fkey] FOREIGN KEY([blog_entry_id])
REFERENCES [blog] ([entry_id])
GO

ALTER TABLE [blog_comment] NOCHECK CONSTRAINT [comment_blog_entry_id_fkey]
GO

ALTER TABLE [wiki_comment] WITH NOCHECK ADD CONSTRAINT [comment_wiki_entry_id_fkey] FOREIGN KEY([wiki_entry_id])
REFERENCES [wiki] ([entry_id])
GO

ALTER TABLE [wiki_comment] NOCHECK CONSTRAINT [comment_wiki_entry_id_fkey]
GO

ALTER TABLE [wiki_history] WITH NOCHECK ADD CONSTRAINT [wiki_history_wiki_entry_id_fkey] FOREIGN KEY([wiki_entry_id])
REFERENCES [wiki] ([entry_id])
GO

ALTER TABLE [wiki_history] NOCHECK CONSTRAINT [wiki_history_wiki_entry_id_fkey]
GO

---------------INDEX /CONSTRAINT CREATION END------------------------------------------------------

---------------STORED PROCEDURES CREATION START----------------------------------------------------

/****** Object: StoredProcedure [upsert_stream_entry] ********************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [upsert_stream_entry]
(
@entity_id_value nvarchar(175),
@source_id_value nvarchar(175),
@time_value datetime2,
@field_values_value nvarchar(max), 
@location_value nvarchar(255), 
@source_type_value nvarchar(96), 
@tags_value nvarchar(max)
) 
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @entry_id_table TABLE(ID int);
  IF EXISTS (SELECT * FROM stream WHERE entity_id=@entity_id_value and source_id=@source_id_value and time=@time_value and source_type=@source_type_value)
		BEGIN
			UPDATE stream SET field_values=@field_values_value, location=@location_value, tags=@tags_value
			OUTPUT INSERTED.entry_id INTO @entry_id_table 
			WHERE entity_id=@entity_id_value and source_id=@source_id_value and time=@time_value and source_type=@source_type_value;
			SELECT * FROM @entry_id_table;
		END	
  ELSE
		BEGIN
			INSERT INTO stream (entity_id, source_id, time, field_values, location, source_type, tags)
			OUTPUT INSERTED.entry_id INTO @entry_id_table
			values (@entity_id_value, @source_id_value, @time_value, @field_values_value, @location_value, @source_type_value, @tags_value)
			SELECT * FROM @entry_id_table;
		END
END;

GO
/****** StoredProcedure End **********************************************************************/

/****** Object: StoredProcedure [batch_stream_entry] *********************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [batch_stream_entry]
(
@entity_id_value nvarchar(175),
@source_id_value nvarchar(175),
@time_value datetime2,
@field_values_value nvarchar(max), 
@location_value nvarchar(255), 
@source_type_value nvarchar(96), 
@tags_value nvarchar(max)
) 
AS
BEGIN
  SET NOCOUNT ON;  
  IF EXISTS (SELECT * FROM stream WHERE entity_id=@entity_id_value and source_id=@source_id_value and time=@time_value and source_type=@source_type_value)
		BEGIN
			UPDATE stream SET field_values=@field_values_value, location=@location_value, tags=@tags_value
			WHERE entity_id=@entity_id_value and source_id=@source_id_value and time=@time_value and source_type=@source_type_value;
			RETURN;
		END	
  ELSE
		BEGIN
			INSERT INTO stream (entity_id, source_id, time, field_values, location, source_type, tags)
			values (@entity_id_value, @source_id_value, @time_value, @field_values_value, @location_value, @source_type_value, @tags_value)
			RETURN;
		END
END;

GO
/****** StoredProcedure End **********************************************************************/

/****** Object: StoredProcedure [upsert_value_stream_entry] **************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [upsert_value_stream_entry]
(
@entity_id_value nvarchar(128),
@source_id_value nvarchar(128),
@time_value datetime2,
@property_type_value int, 
@property_name_value nvarchar(128),
@property_value_value nvarchar(max)
) 
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @entry_id_table TABLE(ID int);
  BEGIN TRY
	INSERT INTO value_stream (entity_id, source_id, time, property_type, property_name, property_value)
	OUTPUT INSERTED.entry_id INTO @entry_id_table
	values (@entity_id_value, @source_id_value, @time_value, @property_type_value, @property_name_value, @property_value_value);
	SELECT * from @entry_id_table;
  END TRY
  BEGIN CATCH  
	UPDATE value_stream SET property_value=@property_value_value
	OUTPUT INSERTED.entry_id INTO @entry_id_table 
	WHERE entity_id=@entity_id_value and source_id=@source_id_value and property_name=@property_name_value and property_type=@property_type_value and time=@time_value;
	SELECT * from @entry_id_table;
	END CATCH
END

GO
/****** StoredProcedure End **********************************************************************/

/****** Object: StoredProcedure [batch_value_stream_entry] ***************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [batch_value_stream_entry]
(
@entity_id_value nvarchar(128),
@source_id_value nvarchar(128),
@time_value datetime2,
@property_type_value int, 
@property_name_value nvarchar(128),
@property_value_value nvarchar(max)
) 
AS
BEGIN
  SET NOCOUNT ON;
  IF EXISTS (SELECT * FROM value_stream WHERE entity_id=@entity_id_value and source_id=@source_id_value and property_name=@property_name_value and property_type=@property_type_value and time=@time_value)
		BEGIN
			UPDATE value_stream SET property_value=@property_value_value
			WHERE entity_id=@entity_id_value and source_id=@source_id_value and property_name=@property_name_value and property_type=@property_type_value and time=@time_value;
			RETURN;
		END	
  ELSE
		BEGIN
			INSERT INTO value_stream (entity_id, source_id, time, property_type, property_name, property_value)
			values (@entity_id_value, @source_id_value, @time_value, @property_type_value, @property_name_value, @property_value_value);
			RETURN;
		END
END

GO
/****** StoredProcedure End **********************************************************************/

---------------STORED PROCEDURES CREATION END-----------------------------------------------------
