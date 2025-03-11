USE [AddressBook]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPk]    Script Date: 29-01-2025 19:00:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_State_DeleteByPk]
    @StateID INT
AS
BEGIN
    DELETE FROM [dbo].[State]
    WHERE [dbo].[State].[StateID] = @StateID;
END
