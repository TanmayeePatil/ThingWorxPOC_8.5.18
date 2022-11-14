--
-- Thingworx Data Schema Update from 8.3 to 8.4
--
-- 

-- Delete entry_id as a primary key from stream table
IF EXISTS (SELECT name FROM sys.indexes
            WHERE name = N'PK_stream')
	ALTER TABLE stream DROP CONSTRAINT PK_stream;
GO

-- Delete entry_id as a primary key from value_stream table
IF EXISTS (SELECT name FROM sys.indexes
            WHERE name = N'PK_value_stream')
	ALTER TABLE value_stream DROP CONSTRAINT PK_value_stream;
GO

-- Modify stored procedure batch_stream_entry to remove output
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

-- Modify stored procedure batch_value_stream_entry to remove output
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [batch_value_stream_entry]
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
