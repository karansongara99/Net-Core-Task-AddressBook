USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPk]    Script Date: 29-01-2025 19:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_State_UpdateByPk]
	@StateID		INT,
	@CountryID		NVARCHAR(50),
    @StateName		NVARCHAR(50),
	@StateCode		NVARCHAR(50),
    @CreationDate	DATETIME,
	@UserID			INT
AS
BEGIN
    UPDATE [State]
    SET  [dbo].[State].[CountryID]		= @CountryID,
		 [dbo].[State].[StateName]		= @StateName, 
         [dbo].[State].[StateCode]		= @StateCode, 
		 [dbo].[State].[CreationDate]	= @CreationDate,
		 [dbo].[State].[UserID]			= @UserID
   WHERE [dbo].[State].[StateID]		= @StateID;
END