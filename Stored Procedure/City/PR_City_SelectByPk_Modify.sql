USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByPK]    Script Date: 29-01-2025 18:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_City_SelectByPK]
    @CityID INT
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
	WHERE [City].CityID = @CityID
    ORDER BY [City].CityName
END