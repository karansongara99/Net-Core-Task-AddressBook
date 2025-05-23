USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Register]    Script Date: 29-01-2025 18:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_User_Register]
    @UserName	NVARCHAR(50),
    @MobileNo	NVARCHAR(50),
    @EmailID	NVARCHAR(500)
AS
BEGIN
     INSERT INTO [dbo].[User]
    (
		[UserName],
		[MobileNo],
		[EmailID]
	) 
	VALUES
    (
		@UserName,
		@MobileNo,
		@EmailID
	);
END
END