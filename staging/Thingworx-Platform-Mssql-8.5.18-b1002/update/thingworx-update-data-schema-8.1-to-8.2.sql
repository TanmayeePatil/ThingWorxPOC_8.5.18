--
/****** Object: Index [stream_entity_id_source_id_source_type_time_key] *************************/
CREATE UNIQUE NONCLUSTERED INDEX [stream_entity_id_source_id_source_type_time_key] ON [stream]
(
	[entity_id] ASC,
	[source_id] ASC,
	[source_type] ASC,
	[time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object: Index [stream_id_time_index] ****************************************************/
CREATE NONCLUSTERED INDEX [stream_id_time_index] ON [stream]
(
	[entity_id] ASC,
	[time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [ValStream-EntID_SouId_Propname_Tm] ON [value_stream]
(
	[entity_id] ASC,
	[source_id] ASC,
	[property_name] ASC,
	[time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO