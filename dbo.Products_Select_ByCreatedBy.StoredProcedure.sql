USE [Tabi]
GO
/****** Object:  StoredProcedure [dbo].[Products_Select_ByCreatedBy]    Script Date: 4/2/2024 5:03:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Q question 2
--Select_ByCreatedBy (Paginated) (Join the ProductId with Product Images, ProductType, Venue)

CREATE proc [dbo].[Products_Select_ByCreatedBy]
@PageIndex int
,@PageSize int
,@CreatedBy int

as
/*

Execute dbo.Products_Select_ByCreatedBy @CreatedBy =1, @PageIndex=0, @PageSize = 10

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
WHERE (p.CreatedBy = @CreatedBy)
order by p.Id
		
 
	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY

End
GO
