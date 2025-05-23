USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Insert]    Script Date: 29-01-2025 18:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_User_Insert]
	@UserName		VARCHAR(50),
    @MobileNo		VARCHAR(50),
	@EmailID		VARCHAR(50),
    @CreationDate	DATETIME
AS
BEGIN
    INSERT INTO [User] 
	(
		UserName,
		MobileNo,
		EmailID,
		CreationDate
	)
	VALUES 
	(
		@UserName, 
		@MobileNo, 
		@EmailID,
		@CreationDate
	);
END