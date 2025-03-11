USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_CityDropDown]    Script Date: 29-01-2025 18:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_CityDropDown]
AS
BEGIN
	SELECT 
		CityID , 
		CityName 
	FROM [City]
	ORDER BY [City].CityName
END
