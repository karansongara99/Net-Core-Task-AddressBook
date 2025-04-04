USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_Insert]    Script Date: 29-01-2025 19:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_State_Insert]
	@CountryID		NVARCHAR(50),
    @StateName		NVARCHAR(50),
	@StateCode		NVARCHAR(50),
    @CreationDate	DATETIME,
	@UserID			INT
AS
BEGIN
    INSERT INTO [State] 
	(
		CountryID,
		StateName,
		StateCode,
		CreationDate,
		UserID
	)
	VALUES 
	(
		@CountryID,
		@StateName,
		@StateCode,
		@CreationDate,
		@UserID
	);
END