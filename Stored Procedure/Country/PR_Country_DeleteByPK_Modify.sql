USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_DeleteByPk]    Script Date: 29-01-2025 18:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_Country_DeleteByPk]
    @CountryID INT
AS
BEGIN
    DELETE FROM [dbo].[Country]
    WHERE [dbo].[Country].[CountryID] = @CountryID;
END