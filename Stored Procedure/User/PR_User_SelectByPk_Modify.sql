USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByPK]    Script Date: 29-01-2025 18:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_User_SelectByPK]
    @UserID INT
AS
BEGIN
     SELECT [User].UserID, 
           [User].UserName, 
		   [User].MobileNo, 
           [User].EmailID, 
		   [User].CreationDate
    FROM [User]
    WHERE [User].[UserID] = @UserID
    ORDER BY [User].UserName
END