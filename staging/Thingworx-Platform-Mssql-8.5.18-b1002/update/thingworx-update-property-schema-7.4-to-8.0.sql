--
-- Thingworx Platform Property Schema Update from 7.4 to 8.0
--

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'PRIMARY KEY' AND CONSTRAINT_NAME = 'property_vtq_pkey')
BEGIN
	ALTER TABLE [property_vtq] DROP CONSTRAINT [property_vtq_pkey];
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE type_desc = 'NONCLUSTERED' AND is_unique = 1 AND name = 'property_vtq_id_name_index')
BEGIN
	CREATE UNIQUE NONCLUSTERED INDEX [property_vtq_id_name_index] ON [property_vtq](
		[id] ASC,
		[name] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
GO

ALTER PROCEDURE [upsert_property_vtq]
(
@inserting_id nvarchar(max),
@inserting_name nvarchar(255), 
@inserting_value varbinary(max), 
@inserting_time bigint, 
@inserting_quality nvarchar(max)
)
AS
DECLARE @Iterator INT
SET @Iterator = 0

BEGIN
	WHILE (@Iterator < 3)
	BEGIN
    IF EXISTS (SELECT * FROM property_vtq WHERE id = @inserting_id AND name = @inserting_name)
			BEGIN
				UPDATE property_vtq SET value = @inserting_value, time = @inserting_time, quality = @inserting_quality WHERE id = @inserting_id AND name = @inserting_name;
				RETURN;
			END		
    ELSE
			BEGIN
				INSERT INTO property_vtq (id, name, value, time, quality) VALUES (@inserting_id, @inserting_name, @inserting_value, @inserting_time, @inserting_quality);
			  RETURN;
			END
			WAITFOR DELAY '00:00:01'; 
			SET @Iterator = @Iterator + 1;
	END;
END;

GO