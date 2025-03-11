SELECT * FROM City

----Country Insert Procedure----
CREATE PROCEDURE PR_City_Insert
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

----Country Update Procedure--------

ALTER PROCEDURE PR_City_UpdateByPk
	@CityID			INT,
	@StateID		INT,
	@CountryID		INT,
    @CityName		VARCHAR(50),
	@STDCode		VARCHAR(50),
	@PinCode		VARCHAR(50),
	@UserID			INT
AS
BEGIN
    UPDATE [City]
    SET  [dbo].[City].[StateID]			= @StateID, 
         [dbo].[City].[CountryID]		= @CountryID, 
		 [dbo].[City].[CityName]		= @CityName,
		 [dbo].[City].[STDCode]			= @STDCode,
		 [dbo].[City].[PinCode]			= @PinCode,
		 [dbo].[City].[UserID]			= @UserID
   WHERE [dbo].[City].[CityID]			= @CityID
END

-------City Delete Procedure-------

CREATE PROCEDURE PR_City_DeleteByPk
    @CityID INT
AS
BEGIN
    DELETE FROM [dbo].[City]
    WHERE [dbo].[City].[CityID] = @CityID;
END

--------City All Data-----------

CREATE PROCEDURE PR_City_SelectAll
AS
BEGIN
    SELECT [City].CityID, 
           [City].StateID, 
		   [City].CountryID, 
		   [City].CityName,
		   [City].STDCode,
		   [City].PinCode,
		   [City].CreationDate,
		   [City].UserID
    FROM [City] 
	INNER JOIN [State] ON [State].StateID = [City].StateID
	INNER JOIN [Country] ON [Country].CountryID = [City].CountryID
	INNER JOIN [User] ON [User].UserID = [City].UserID
    ORDER BY [City].CityName
END

---------------------City Select By ID---------

CREATE PROCEDURE PR_City_SelectByPK
    @CityID INT
AS
BEGIN
	 SELECT [City].CityID, 
           [City].StateID, 
		   [City].CountryID, 
		   [City].CityName,
		   [City].STDCode,
		   [City].PinCode,
		   [City].CreationDate,
		   [City].UserID
    FROM [City] 
	WHERE [City].CityID = @CityID
    ORDER BY [City].CityName
END

-------------Tempory Data Entered--------

SET IDENTITY_INSERT [City] ON

SELECT * FROM City

INSERT INTO [City] (CityID,StateID,CountryID,CityName,STDCode,PinCode,CreationDate,UserID) 
VALUES (401,301,201,'Rajkot','0281','360001','5-JAN-2000',101)

INSERT INTO [City] (CityID,StateID,CountryID,CityName,STDCode,PinCode,CreationDate,UserID) 
VALUES (402,302,202,'Maharastra','002','404000','12-DEC-2000',102)
