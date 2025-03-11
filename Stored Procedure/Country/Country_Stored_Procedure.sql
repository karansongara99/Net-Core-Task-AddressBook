SELECT * FROM [Country]
----Country Insert Procedure----
ALTER PROCEDURE PR_Country_Insert
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
	)
END

----Country Update Procedure--------

ALTER PROCEDURE PR_Country_UpdateByPk
	@CountryID		INT,
	@CountryName	NVARCHAR(50),
	@CountryCode	NVARCHAR(50),
	@UserID			INT
AS
BEGIN
    UPDATE [Country]
    SET  [dbo].[Country].[CountryName]	= @CountryName, 
         [dbo].[Country].[CountryCode]	= @CountryCode, 
		 [dbo].[Country].[UserID]		= @UserID
   WHERE [dbo].[Country].[CountryID]	= @CountryID;
END

-------Country Delete Procedure-------

CREATE PROCEDURE PR_Country_DeleteByPk
    @CountryID INT
AS
BEGIN
    DELETE FROM [dbo].[Country]
    WHERE [dbo].[Country].[CountryID] = @CountryID;
END

--------Country All Data-----------

ALTER PROCEDURE PR_Country_SelectAll
AS
BEGIN
    SELECT [Country].CountryID, 
           [Country].CountryName, 
		   [Country].CountryCode, 
		   [Country].CreationDate,
		   [Country].UserID
    FROM [Country] 
	INNER JOIN [User] ON [Country].UserID = [User].UserID
    ORDER BY [Country].CountryName,[User].UserName
END

---------------------Country Select By ID---------

ALTER PROCEDURE PR_Country_SelectByPK
    @CountryID INT
AS
BEGIN
	SELECT [Country].CountryID, 
           [Country].CountryName, 
		   [Country].CountryCode, 
		   [Country].CreationDate,
		   [Country].UserID
    FROM [Country] 
	WHERE [Country].[CountryID] = @CountryID
    ORDER BY [Country].CountryName
END


SELECT * FROM [Country]

-------------Tempory Data Entered--------

SET IDENTITY_INSERT [Country] ON

INSERT INTO [Country] (CountryID,CountryName,CountryCode,CreationDate,UserID) 
VALUES (201,'India','IND','5-JAN-91',101)

INSERT INTO [Country] (CountryID,CountryName,CountryCode,CreationDate,UserID) 
VALUES (202,'United Kingdom','UK','5-JAN-2000',102)

