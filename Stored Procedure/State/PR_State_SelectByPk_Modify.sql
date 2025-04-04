USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByPK]    Script Date: 29-01-2025 19:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_State_SelectByPK]
    @StateID INT
AS
BEGIN
	SELECT	[State].StateID, 
			[State].CountryID,
			[State].StateName, 
			[State].StateCode, 
			[State].CreationDate,
			[State].UserID
    FROM [State] 
	WHERE [State].[StateID] = @StateID
    ORDER BY [State].StateName
END
