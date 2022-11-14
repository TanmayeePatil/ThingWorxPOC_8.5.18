
DROP INDEX [stream_entity_id_source_id_source_type_time_key] ON [stream]
GO

ALTER TABLE [stream] ALTER COLUMN [entity_id] [nvarchar](175) NULL
ALTER TABLE [stream] ALTER COLUMN [source_id] [nvarchar](175) NULL
ALTER TABLE [stream] ALTER COLUMN [source_type] [nvarchar](96) NULL
GO

CREATE UNIQUE NONCLUSTERED INDEX [stream_entity_id_source_id_source_type_time_key] ON [stream]
(
    [time] ASC,
    [source_type] ASC,
    [source_id] ASC,
    [entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [upsert_stream_entry]
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [batch_stream_entry]
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
DECLARE @entry_id_table TABLE(ID int);
BEGIN
  SET NOCOUNT ON;  
  IF EXISTS (SELECT * FROM stream WHERE entity_id=@entity_id_value and source_id=@source_id_value and time=@time_value and source_type=@source_type_value)
		BEGIN
			UPDATE stream SET field_values=@field_values_value, location=@location_value, tags=@tags_value
			OUTPUT INSERTED.entry_id INTO @entry_id_table 
			WHERE entity_id=@entity_id_value and source_id=@source_id_value and time=@time_value and source_type=@source_type_value;
			RETURN;
		END	
  ELSE
		BEGIN
			INSERT INTO stream (entity_id, source_id, time, field_values, location, source_type, tags)
			OUTPUT INSERTED.entry_id INTO @entry_id_table
			values (@entity_id_value, @source_id_value, @time_value, @field_values_value, @location_value, @source_type_value, @tags_value)
			RETURN;
		END
END;
GO