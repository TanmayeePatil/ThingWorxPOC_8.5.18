/**

A table for storing authorized grants per user, resource server pairs

TOKEN: Encrypted binary serialization of OAuth2AccessToken object.
AUTHENTICATION_ID: This is the primary key and should represent resource server / principal pair. For example: rs_id + user_id

**/

/****** Object: Table [OAUTH_CLIENT_TOKEN] ******************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT name FROM sys.tables WHERE name='OAUTH_CLIENT_TOKEN')
CREATE TABLE [OAUTH_CLIENT_TOKEN](
	[TOKEN] [varbinary](8000),
	[AUTHENTICATION_ID] [varchar](256) PRIMARY KEY NOT NULL
)

GO