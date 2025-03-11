USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_UserDropDown]    Script Date: 29-01-2025 18:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_UserDropDown]
AS
BEGIN
	SELECT 
		UserID , 
		UserName 
	FROM [User]
	ORDER BY [User].UserName
END