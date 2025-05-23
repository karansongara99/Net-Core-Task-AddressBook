USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectAll]    Script Date: 29-01-2025 18:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_Country_SelectAll]
AS
BEGIN
    SELECT [Country].CountryID, 
           [Country].CountryName, 
		   [Country].CountryCode, 
		   [Country].CreationDate,
		   [Country].UserID
    FROM [Country] 
	INNER JOIN [User] ON [User].UserID = [Country].UserID
    ORDER BY [Country].CountryName
END