
SET IDENTITY_INSERT value_stream ON

DECLARE @duplicateCount bigint, @oldValueStreamMinId bigint, @toId bigint, @fromId bigint, @chunkSize int, @valueStreamRowCount bigint, @statusMsg varchar(255)

SELECT @valueStreamRowCount= COUNT(*) FROM value_stream

SELECT @oldValueStreamMinId = MIN(entry_id) FROM value_stream_old

SELECT @toId = isNull(MIN(entry_id),0) + 1 FROM value_stream

SET @chunkSize = 9999

SELECT @duplicateCount = COUNT(vs.[entry_id])
            FROM
                (SELECT [entry_id]
                       ,[entity_id]
                       ,[source_id]
                       ,[time]
                       ,[property_type]
                       ,[property_name]
                       ,[property_value] FROM [value_stream_old]) vs
                JOIN
                (SELECT [entity_id]
                       ,[source_id]
                       ,[time]
                       ,[property_name] FROM [value_stream_old]
                 GROUP BY
                      [entity_id]
                     ,[source_id]
                     ,[time]
                     ,[property_name]
                 HAVING COUNT(*) > 1
                ) vs_dup
                ON vs.entity_id = vs_dup.entity_id AND
                   vs.source_id = vs_dup.source_id AND
                   vs.property_name = vs_dup.property_name AND
                   vs.time = vs_dup.time


IF @duplicateCount > 0 
	BEGIN
		PRINT cast(@duplicateCount as varchar)  + ' duplicate entries found. Clean table value_stream by removing duplicated entries and then run the update script again.'
            PRINT 'To find out those duplicated entries please run following sql:'
            PRINT '            SELECT vs.[entry_id]
                  ,vs.[entity_id]
                  ,vs.[source_id]
                  ,vs.[time]
                  ,vs.[property_type]
                  ,vs.[property_name]
                  ,vs.[property_value]
            FROM
                (SELECT [entry_id]
                       ,[entity_id]
                       ,[source_id]
                       ,[time]
                       ,[property_type]
                       ,[property_name]
                       ,[property_value] FROM [twschema].[value_stream_old]) vs
                JOIN
                (SELECT [entity_id]
                       ,[source_id]
                       ,[time]
                       ,[property_name] FROM [twschema].[value_stream_old]
                 GROUP BY
                      [entity_id]
                     ,[source_id]
                     ,[time]
                     ,[property_name]
                 HAVING COUNT(*) > 1
                ) vs_dup
                ON vs.entity_id = vs_dup.entity_id AND
                   vs.source_id = vs_dup.source_id AND
                   vs.property_name = vs_dup.property_name AND
                   vs.time = vs_dup.time'
	END
ELSE 
	BEGIN
	
		IF @valueStreamRowCount = 0 
			BEGIN
				select @toId = max(entry_id) FROM value_stream_old
				select @statusMsg = 'New Value Stream Has No Data - Starting to migrate all records from Old Value Stream Table' 
				PRINT @statusMsg
			END
		ELSE
			BEGIN
				SELECT @toId = min(entry_id) FROM value_stream	 
				set @toId = @toId - 1
				IF @toId <= 0 
					BEGIN	
						SELECT @statusMsg = 'New Value Stream Has Data - No Additional Data to migrate.'
						PRINT @statusMsg
					END
				ELSE 
					BEGIN
						SELECT @statusMsg = 'New Value Stream Has Data - Migrating records only with Id from ' + cast(@toId as varchar)
						PRINT @statusMsg
					END
		END

		IF @toId >= @oldValueStreamMinId 
		BEGIN
			SELECT @statusMsg = 'Starting to migrate records (in reverse order) from Id ' + cast(@toId as varchar)
			PRINT @statusMsg  
			
			WHILE @toId >= @oldValueStreamMinId
			BEGIN TRY
				BEGIN TRANSACTION
				
		    		SET @fromId = @toId - @chunkSize
		    		IF @fromId <= 0 SET @fromId = 0
		    		
		    		INSERT INTO value_stream (entry_id, entity_id, source_id, time, property_type, property_name, property_value) 
		    		SELECT entry_id, entity_id, source_id, time, property_type, property_name, property_value FROM value_stream_old (NOLOCK)
		    		WHERE entry_id BETWEEN @fromId AND @toId
					
					SELECT @statusMsg = 'Migrated records from Id ' + cast(@toId as varchar) + ' to ' + cast(@fromId as varchar)
					PRINT @statusMsg
		    		
		    		SET @toId = (@toId - @chunkSize) - 1
				COMMIT    
			END TRY
			BEGIN CATCH
				BEGIN
					SELECT @statusMsg = 'Failed to migrate records from Id ' + cast(@toId as varchar) + ' to ' + cast(@fromId as varchar)
					print @statusMsg
					ROLLBACK
				END
			END CATCH	
		END
	END	

	SET IDENTITY_INSERT value_stream OFF
go