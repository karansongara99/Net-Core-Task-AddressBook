USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_CountryDropDown]    Script Date: 29-01-2025 19:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_CountryDropDown]
AS
BEGIN
	SELECT 
		CountryID, 
		CountryName 
	FROM [Country]
	ORDER BY [Country].CountryName
END