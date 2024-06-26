USE [Tabi]
GO
/****** Object:  StoredProcedure [dbo].[Products_Select_ById]    Script Date: 4/2/2024 5:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select_ById (Join the ProductId with Product Images, ProductType, Venue).

CREATE proc [dbo].[Products_Select_ById]

@Id int

/*
Declare @Id int = 5
Execute [dbo].[Products_Select_ById] @Id

*/
as

Begin

SELECT p.[Id]
      ,[SKU]
      ,p.[Name]
      ,[Description]
      ,pt.[Id]
	  ,pt.Name  
      ,[VenueId]
      ,[isVisible]
      ,[isActive]
      ,f.Id
      ,dbo.fn_GetUserJSON(p.Createdby) as CreatedBy
	  ,dbo.fn_GetUserJSON(p.ModifiedBy) as ModifiedBy
		, TotalCount = COUNT(1) OVER()
FROM [dbo].[Products] as p
join dbo.ProductTypes pt on pt.id = p.ProductTypeId
join dbo.Files f on f.Id = p.PrimaryImageId
  Where p.[Id] = @Id
End

GO
