USE [master]
GO
/****** Object:  Database [AddressBook]    Script Date: 30-01-2025 20:54:19 ******/
CREATE DATABASE [AddressBook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AddressBook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AddressBook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AddressBook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AddressBook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AddressBook] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AddressBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AddressBook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AddressBook] SET ARITHABORT OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AddressBook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AddressBook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AddressBook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AddressBook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AddressBook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AddressBook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AddressBook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AddressBook] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AddressBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AddressBook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AddressBook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AddressBook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AddressBook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AddressBook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AddressBook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AddressBook] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AddressBook] SET  MULTI_USER 
GO
ALTER DATABASE [AddressBook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AddressBook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AddressBook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AddressBook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AddressBook] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AddressBook] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AddressBook] SET QUERY_STORE = ON
GO
ALTER DATABASE [AddressBook] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AddressBook]
GO
/****** Object:  Table [dbo].[City]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[StateID] [int] NULL,
	[CountryID] [int] NULL,
	[CityName] [varchar](50) NULL,
	[STDCode] [varchar](50) NULL,
	[PinCode] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
	[CountryCode] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NULL,
	[StateName] [varchar](50) NULL,
	[StateCode] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
	[EmailID] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_User]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_User]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPk]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_DeleteByPk]
    @CityID INT
AS
BEGIN
    DELETE FROM [dbo].[City]
    WHERE [dbo].[City].[CityID] = @CityID;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_City_Insert]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_Insert]
    @StateID INT,
	@CountryID INT,
    @CityName VARCHAR(50),
	@STDCode VARCHAR(50),
	@PinCode VARCHAR(50),
	@CreationDate DATETIME,
	@UserID INT
AS
BEGIN
    INSERT INTO [City] (StateID,CountryID,CityName,STDCode,PinCode,CreationDate,UserID)
	VALUES (@StateID, @CountryID, @CityName,@STDCode,@PinCode,@CreationDate,@UserID);
END
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAll]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_City_SelectAll]
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
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByPK]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectByPK]
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
GO
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPk]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_UpdateByPk]
	@CityID INT,
	@StateID INT,
	@CountryID INT,
    @CityName VARCHAR(50),
	@STDCode VARCHAR(50),
	@PinCode VARCHAR(50),
	@CreationDate DATETIME,
	@UserID INT
AS
BEGIN
    UPDATE [City]
    SET  [dbo].[City].[StateID] = @StateID, 
         [dbo].[City].[CountryID] = @CountryID, 
		 [dbo].[City].[CityName] = @CityName,
		 [dbo].[City].[STDCode] = @STDCode,
		 [dbo].[City].[PinCode] = @PinCode,
		 [dbo].[City].[CreationDate] = @CreationDate,
		 [dbo].[City].[UserID] = @UserID
   WHERE [dbo].[City].[CityID] = @CityID;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CityDropDown]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CityDropDown]
AS
BEGIN
	SELECT CityID , CityName FROM [City]
	ORDER BY [City].CityName
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_DeleteByPk]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Country_DeleteByPk]
    @CountryID INT
AS
BEGIN
    DELETE FROM [dbo].[Country]
    WHERE [dbo].[Country].[CountryID] = @CountryID;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_Insert]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_Insert]
    @CountryName VARCHAR(50),
	@CountryCode VARCHAR(50),
    @CreationDate DATETIME,
	@UserID INT
AS
BEGIN
    INSERT INTO [Country] (CountryName,CountryCode,CreationDate,UserID)
	VALUES (@CountryName, @CountryCode, @CreationDate,@UserID);
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectAll]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_SelectAll]
AS
BEGIN
    SELECT [Country].CountryID, 
           [Country].CountryName, 
		   [Country].CountryCode, 
		   [Country].CreationDate,
		   [Country].UserID
    FROM [Country] 
	INNER JOIN [User] ON [User].UserID = [Country].UserID
    ORDER BY [Country].CountryName
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectByPK]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_SelectByPK]
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


GO
/****** Object:  StoredProcedure [dbo].[PR_Country_UpdateByPk]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_UpdateByPk]
	@CountryID INT,
	@CountryName NVARCHAR(50),
	@CountryCode NVARCHAR(50),
    @CreationDate DATETIME,
	@UserID INT
AS
BEGIN
    UPDATE [Country]
    SET  [dbo].[Country].[CountryName] = @CountryName, 
         [dbo].[Country].[CountryCode] = @CountryCode, 
		 [dbo].[Country].[CreationDate] = @CreationDate,
		 [dbo].[Country].[UserID] = @UserID
   WHERE [dbo].[Country].[CountryID] = @CountryID;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CountryDropDown]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CountryDropDown]
AS
BEGIN
	SELECT CountryID , CountryName FROM [Country]
	ORDER BY [Country].CountryName
END
GO
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPk]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_DeleteByPk]
    @StateID INT
AS
BEGIN
    DELETE FROM [dbo].[State]
    WHERE [dbo].[State].[StateID] = @StateID;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_State_Insert]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_Insert]
	@CountryID  NVARCHAR(50),
    @StateName NVARCHAR(50),
	@StateCode NVARCHAR(50),
    @CreationDate DATETIME,
	@UserID INT
AS
BEGIN
    INSERT INTO [State] (CountryID,StateName,StateCode,CreationDate,UserID)
	VALUES (@CountryID, @StateName, @StateCode,@CreationDate,@UserID);
END
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectAll]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectAll]
AS
BEGIN
    SELECT [State].StateID, 
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
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByPK]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_State_SelectByPK]
    @StateID INT
AS
BEGIN
 SELECT [State].StateID, 
			[State].CountryID,
           [State].StateName, 
		   [State].StateCode, 
		   [State].CreationDate,
		   [State].UserID
    FROM [State] 
	WHERE [State].[StateID] = @StateID
    ORDER BY [State].StateName
END
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPk]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_UpdateByPk]
	@StateID INT,
	@CountryID  NVARCHAR(50),
    @StateName NVARCHAR(50),
	@StateCode NVARCHAR(50),
    @CreationDate DATETIME,
	@UserID INT
AS
BEGIN
    UPDATE [State]
    SET [dbo].[State].[CountryID] = @CountryID,
		[dbo].[State].[StateName] = @StateName, 
         [dbo].[State].[StateCode] = @StateCode, 
		 [dbo].[State].[CreationDate] = @CreationDate,
		 [dbo].[State].[UserID] = @UserID
   WHERE [dbo].[State].[StateID] = @StateID;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_StateDropDown]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_StateDropDown]
AS
BEGIN
	SELECT StateID , StateName FROM [State]
	ORDER BY [State].StateName
END
GO
/****** Object:  StoredProcedure [dbo].[PR_User_DeleteByPk]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_DeleteByPk]
    @UserID INT
AS
BEGIN
    DELETE FROM [dbo].[User]
    WHERE [dbo].[User].[UserID] = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Insert]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_Insert]
	@UserName  VARCHAR(50),
    @MobileNo VARCHAR(50),
	@EmailID VARCHAR(50),
    @CreationDate DATETIME
AS
BEGIN
    INSERT INTO [User] (UserName,MobileNo,EmailID,CreationDate)
	VALUES (@UserName, @MobileNo, @EmailID,@CreationDate);
END
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Register]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_Register]
    @UserName NVARCHAR(50),
    @MobileNo NVARCHAR(50),
    @EmailID NVARCHAR(500)
AS
BEGIN
    INSERT INTO [dbo].[User]
    ([UserName],[MobileNo],[EmailID]) VALUES
    (@UserName,@MobileNo,@EmailID);
END
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectAll]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_User_SelectAll]
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
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByPK]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_User_SelectByPK]
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
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByUsernamePassword]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_SelectByUsernamePassword]
@UserName  NVARCHAR(50),
@EmailID  NVARCHAR(50)
AS
BEGIN
	SELECT Username, EmailID FROM [User]
	WHERE Username = @UserName AND EmailID = @EmailID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_User_UpdateByPk]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_User_UpdateByPk]
	@UserID INT,
	@UserName  VARCHAR(50),
    @MobileNo VARCHAR(50),
	@EmailID VARCHAR(50),
    @CreationDate DATETIME
AS
BEGIN
    UPDATE [User]
    SET  [dbo].[User].[UserName] = @UserName, 
         [dbo].[User].[MobileNo] = @MobileNo, 
		 [dbo].[User].[EmailID] = @EmailID,
		 [dbo].[User].[CreationDate] = @CreationDate
   WHERE [dbo].[User].[UserID] = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_UserDropDown]    Script Date: 30-01-2025 20:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_UserDropDown]
AS
BEGIN
	SELECT UserID , UserName FROM [User]
	ORDER BY [User].UserName
END
GO
USE [master]
GO
ALTER DATABASE [AddressBook] SET  READ_WRITE 
GO
