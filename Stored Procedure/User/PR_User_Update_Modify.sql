USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_UpdateByPk]    Script Date: 29-01-2025 18:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_User_UpdateByPk]
	@UserID			INT,
	@UserName		VARCHAR(50),
    @MobileNo		VARCHAR(50),
	@EmailID		VARCHAR(50),
    @CreationDate	DATETIME
AS
BEGIN
    UPDATE [User]
    SET  [dbo].[User].[UserName]     =	@UserName, 
         [dbo].[User].[MobileNo]     =	@MobileNo, 
		 [dbo].[User].[EmailID]      =	@EmailID,
		 [dbo].[User].[CreationDate] =	@CreationDate
   WHERE [dbo].[User].[UserID]       =	@UserID;
END