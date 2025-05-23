USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAll]    Script Date: 29-01-2025 18:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_City_SelectAll]
AS
BEGIN
    SELECT [City].CityID, 
           [City].StateID, 
		   [City].CountryID, 
		   [City].CityName,
		   [City].STDCode,
		   [City].PinCode,
		   [City].CreationDate,
		   [City].UserID
    FROM [City] 
	INNER JOIN [State] ON [State].StateID = [City].StateID
	INNER JOIN [Country] ON [Country].CountryID = [City].CountryID
	INNER JOIN [User] ON [User].UserID = [City].UserID
    ORDER BY [City].CityName
END
