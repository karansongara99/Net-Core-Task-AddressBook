SELECT * FROM [State]

----State Insert Procedure----
CREATE PROCEDURE PR_State_Insert
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

----State Update Procedure--------

ALTER PROCEDURE PR_State_UpdateByPk
	@StateID		INT,
	@CountryID		INT,
    @StateName		NVARCHAR(50),
	@StateCode		NVARCHAR(50),
	@UserID			INT
AS
BEGIN
    UPDATE [State]
    SET  [dbo].[State].[CountryID]		= @CountryID,
		 [dbo].[State].[StateName]		= @StateName, 
         [dbo].[State].[StateCode]		= @StateCode, 
		 [dbo].[State].[UserID]			= @UserID
   WHERE [dbo].[State].[StateID]		= @StateID;
END

-------State Delete Procedure-------

CREATE PROCEDURE PR_State_DeleteByPk
    @StateID INT
AS
BEGIN
    DELETE FROM [dbo].[State]
    WHERE [dbo].[State].[StateID] = @StateID;
END

--------State All Data-----------

ALTER PROCEDURE PR_State_SelectAll
AS
BEGIN
    SELECT	[State].StateID, 
			[State].CountryID,
			[State].StateName, 
			[State].StateCode, 
			[State].CreationDate,
			[State].UserID
    FROM [State] 
	INNER JOIN [Country] ON [Country].CountryID = [State].CountryID
	INNER JOIN [User] ON [User].UserID = [State].UserID
    ORDER BY [State].StateName
END

---------------------State Select By ID---------

ALTER PROCEDURE PR_State_SelectByPK
    @StateID INT
AS
BEGIN
	SELECT	[State].StateID, 
			[State].CountryID,
			[State].StateName, 
			[State].StateCode, 
			[State].CreationDate,
			[State].UserID
    FROM [State] 
	WHERE [State].[StateID] = @StateID
    ORDER BY [State].StateName
END

SELECT * FROM [State]

-------------Tempory Data Entered--------

SET IDENTITY_INSERT [State] ON

INSERT INTO [State] (StateID,CountryID,StateName,StateCode,CreationDate,UserID) 
VALUES (301,201,'Gujarat','24','5-JAN-91',101)

INSERT INTO [State] (StateID,CountryID,StateName,StateCode,CreationDate,UserID) 
VALUES (302,202,'Maharastra','27','5-JAN-91',102)