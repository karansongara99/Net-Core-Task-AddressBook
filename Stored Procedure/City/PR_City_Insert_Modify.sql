USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_Insert]    Script Date: 29-01-2025 18:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_City_Insert]
 @StateID		INT,
	@CountryID		INT,
    @CityName		VARCHAR(50),
	@STDCode		VARCHAR(50),
	@PinCode		VARCHAR(50),
	@CreationDate	DATETIME,
	@UserID			INT
AS
BEGIN
    INSERT INTO [City] 
	(
		StateID,
		CountryID,
		CityName,
		STDCode,
		PinCode,
		CreationDate,
		UserID
	)
	VALUES 
	(
		@StateID, 
		@CountryID,
		@CityName,
		@STDCode,
		@PinCode,
		@CreationDate,
		@UserID
	);
END