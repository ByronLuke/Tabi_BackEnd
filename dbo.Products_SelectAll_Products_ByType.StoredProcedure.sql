USE [Tabi]
GO
/****** Object:  StoredProcedure [dbo].[Products_SelectAll_Products_ByType]    Script Date: 4/2/2024 5:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Q question 2
--Select_All_Products_ByType: A proc to select all Products by Type. 
--Products should be returned in a paginated fashion. Do not retun all products at once.

CREATE proc [dbo].[Products_SelectAll_Products_ByType]
@PageIndex int
,@PageSize int
,@ProductTypeName nvarchar(100)

as
/*

Execute dbo.Products_SelectAll_Products_ByType @ProductTypeName ='Burger', @PageIndex=0, @PageSize = 10

*/
Begin

   Declare @offset int = @PageIndex * @PageSize

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
where pt.Name   = @ProductTypeName
order by p.Id
		
 
	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY

End
GO
