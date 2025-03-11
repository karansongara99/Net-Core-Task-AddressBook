---------City DropDown Procedure
CREATE PROCEDURE PR_CityDropDown
AS
BEGIN
	SELECT 
		CityID , 
		CityName 
	FROM [City]
	ORDER BY [City].CityName
END

------Country DropDown Procedure
CREATE PROCEDURE PR_CountryDropDown
AS
BEGIN
	SELECT 
		CountryID , 
		CountryName 
	FROM [Country]
	ORDER BY [Country].CountryName
END

-------State DropDown Procedure
CREATE PROCEDURE PR_StateDropDown
AS
BEGIN
	SELECT 
		StateID , 
		StateName 
	FROM [State]
	ORDER BY [State].StateName
END

---------User DropDown Procedure
CREATE PROCEDURE PR_UserDropDown
AS
BEGIN
	SELECT 
		UserID , 
		UserName 
	FROM [User]
	ORDER BY [User].UserName
END