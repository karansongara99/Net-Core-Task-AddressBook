USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_StateDropDown]    Script Date: 29-01-2025 19:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_StateDropDown]
AS
BEGIN
	SELECT 
		StateID, 
		StateName 
	FROM [State]
	ORDER BY [State].StateName
END