USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_UpdateByPk]    Script Date: 29-01-2025 18:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_Country_UpdateByPk]
	@CountryID		INT,
	@CountryName	NVARCHAR(50),
	@CountryCode	NVARCHAR(50),
    @CreationDate	DATETIME,
	@UserID			INT
AS
BEGIN
    UPDATE [Country]
    SET  [dbo].[Country].[CountryName]	= @CountryName, 
         [dbo].[Country].[CountryCode]	= @CountryCode, 
		 [dbo].[Country].[CreationDate]	= @CreationDate,
		 [dbo].[Country].[UserID]		= @UserID
   WHERE [dbo].[Country].[CountryID]	= @CountryID;
END