USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByUsernamePassword]    Script Date: 29-01-2025 18:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_User_SelectByUsernamePassword]
@UserName	NVARCHAR(50),
@EmailID	NVARCHAR(50)
AS
BEGIN
	SELECT 
		Username, 
		EmailID 
	FROM [User]
	WHERE Username = @UserName AND EmailID = @EmailID
END
