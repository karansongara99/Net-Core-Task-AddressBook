USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_Insert]    Script Date: 29-01-2025 18:58:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_Country_Insert]
    @CountryName		VARCHAR(50),
	@CountryCode		VARCHAR(50),
    @CreationDate		DATETIME,
	@UserID				INT
AS
BEGIN
    INSERT INTO [Country] 
	(
		CountryName,
		CountryCode,
		CreationDate,
		UserID
	)
	VALUES 
	(
		@CountryName,
		@CountryCode, 
		@CreationDate,
		@UserID
	);
END