USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectAll]    Script Date: 29-01-2025 18:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_User_SelectAll]
AS
BEGIN
    SELECT [User].UserID, 
           [User].UserName, 
		   [User].MobileNo, 
           [User].EmailID, 
		   [User].CreationDate
    FROM [User]
    ORDER BY [User].UserName
END