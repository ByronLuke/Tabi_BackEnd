USE [Tabi]
GO
/****** Object:  StoredProcedure [dbo].[Products_Delete_ById]    Script Date: 4/2/2024 5:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Products_Delete_ById]

@Id int

/*

declare @Id int = 8
Execute [dbo].[Products_Delete_ById] @Id

*/

as

Begin

UPDATE [dbo].[Products]
   SET isActive = 0
     
 WHERE Id = @Id

End


GO
