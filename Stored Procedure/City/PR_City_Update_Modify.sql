USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPk]    Script Date: 29-01-2025 18:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_City_UpdateByPk]
		@CityID			INT,
	@StateID		INT,
	@CountryID		INT,
    @CityName		VARCHAR(50),
	@STDCode		VARCHAR(50),
	@PinCode		VARCHAR(50),
	@CreationDate	DATETIME,
	@UserID			INT
AS
BEGIN
    UPDATE [City]
    SET  [dbo].[City].[StateID]			= @StateID, 
         [dbo].[City].[CountryID]		= @CountryID, 
		 [dbo].[City].[CityName]		= @CityName,
		 [dbo].[City].[STDCode]			= @STDCode,
		 [dbo].[City].[PinCode]			= @PinCode,
		 [dbo].[City].[CreationDate]	= @CreationDate,
		 [dbo].[City].[UserID]			= @UserID
   WHERE [dbo].[City].[CityID]			= @CityID;
END