-- Rename value_stream table and its indexes

sp_rename 'value_stream','value_stream_old'
GO

sp_rename 'PK_value_stream', 'PK_value_stream_old'
GO

sp_rename N'value_stream_old.ValStream-EntID_SouId_Propname_Tm', N'ValStream-EntID_SouId_Propname_Tm_old'
GO

-- Create new value_stream table(and its indexes) with the identity seed starting at the old value_stream current identity value

DECLARE @theSeed int
SELECT @theSeed = COALESCE(max(entry_id) + 1, 1) FROM [value_stream_old]

declare @sql nvarchar(4000)
set @sql = 'CREATE TABLE [value_stream](
	[entry_id] [bigint] IDENTITY(' + cast(@theSeed as varchar) + ',1) NOT NULL,
	[entity_id] [nvarchar](128) NULL,
	[source_id] [nvarchar](128) NULL,
	[time] [datetime2](7) NULL,
	[property_type] [int] NULL,
	[property_name] [nvarchar](128) NULL,
	[property_value] [nvarchar](max) NULL)
    ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]'

EXEC sp_executesql @sql
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