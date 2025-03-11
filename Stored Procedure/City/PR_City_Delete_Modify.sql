USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPk]    Script Date: 29-01-2025 18:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_City_DeleteByPk]
    @CityID INT
AS
BEGIN
    DELETE FROM [dbo].[City]
    WHERE [dbo].[City].[CityID] = @CityID;
END