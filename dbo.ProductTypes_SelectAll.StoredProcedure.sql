USE [Tabi]
GO
/****** Object:  StoredProcedure [dbo].[ProductTypes_SelectAll]    Script Date: 4/2/2024 5:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProductTypes_SelectAll]

as
/*
Execute dbo.ProductTypes_SelectAll
*/
Begin

SELECT [Id]
      ,[Name]
  FROM [dbo].[ProductTypes]

End


GO
