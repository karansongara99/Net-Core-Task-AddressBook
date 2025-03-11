USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_DeleteByPk]    Script Date: 29-01-2025 18:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_User_DeleteByPk]
    @UserID INT
AS
BEGIN
    DELETE FROM [dbo].[User]
    WHERE [dbo].[User].[UserID] = @UserID;
END