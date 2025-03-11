SELECT * FROM [dbo].[User]

----User Insert Procedure----
CREATE PROCEDURE PR_User_Insert
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

----User Update Procedure--------

ALTER PROCEDURE PR_User_UpdateByPk
	@UserID			INT,
	@UserName		VARCHAR(50),
    @MobileNo		VARCHAR(50),
	@EmailID		VARCHAR(50)
AS
BEGIN
    UPDATE [User]
    SET  [dbo].[User].[UserName]     =	@UserName, 
         [dbo].[User].[MobileNo]     =	@MobileNo, 
		 [dbo].[User].[EmailID]      =	@EmailID
   WHERE [dbo].[User].[UserID]       =	@UserID;
END

-------User Delete Procedure-------

CREATE PROCEDURE PR_User_DeleteByPk
    @UserID INT
AS
BEGIN
    DELETE FROM [dbo].[User]
    WHERE [dbo].[User].[UserID] = @UserID;
END

--------User All Data-----------

CREATE PROCEDURE PR_User_SelectAll
AS
BEGIN
    SELECT [User].UserID, 
           [User].UserName, 
		   [User].MobileNo, 
           [User].EmailID, 
		   [User].CreationDate
    FROM [User]
    ORDER BY [User].UserName
END

---------------------User By ID---------

CREATE PROCEDURE PR_User_SelectByPK
    @UserID INT
AS
BEGIN
     SELECT [User].UserID, 
			[User].UserName, 
			[User].MobileNo, 
			[User].EmailID, 
			[User].CreationDate
    FROM [User]
    WHERE [User].[UserID] = @UserID
    ORDER BY [User].UserName
END

----PR_User_SelectByUsernamePassword

CREATE PROCEDURE [PR_User_SelectByUsernamePassword]
@UserName	NVARCHAR(50),
@EmailID	NVARCHAR(50)
AS
BEGIN
	SELECT Username, EmailID FROM [User]
	WHERE Username = @UserName AND EmailID = @EmailID
END

EXEC [PR_User_SelectByUsernamePassword]  'Karan','karansongara@gmail.com'

SELECT * FROM [User]

----PR_User_Registration----------

CREATE PROCEDURE [dbo].[PR_User_Register]
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
EXEC [PR_User_Register]  'Karthik','9825385623','karthiksoni64@gmail.com'

-------------Tempory Data Entered--------

SET IDENTITY_INSERT [User] ON

INSERT INTO [User] (UserID,UserName,MobileNo,EmailID,CreationDate) 
VALUES (101,'Karan',6353263735,'karansongara@gmail.com','5-JAN-91')

INSERT INTO [User] (UserID,UserName,MobileNo,EmailID,CreationDate) 
VALUES (102,'Nikhil',9428263244,'nikhilpatel04@gmail.com','5-JAN-2000')

