USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectAll]    Script Date: 29-01-2025 19:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_State_SelectAll]
AS
BEGIN
    SELECT	[State].StateID, 
			[State].CountryID,
			[State].StateName, 
			[State].StateCode, 
			[State].CreationDate,
			[State].UserID
    FROM [State] 
	INNER JOIN [Country] ON [Country].CountryID = [State].CountryID
	INNER JOIN [User] ON [User].UserID = [State].UserID
    ORDER BY [State].StateName
END
