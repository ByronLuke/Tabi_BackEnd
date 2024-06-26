USE [Tabi]
GO
/****** Object:  StoredProcedure [dbo].[EventStatus_SelectAll]    Script Date: 4/15/2024 12:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================
-- Author: Byron Praetor
-- Create Date: 04/11/2024
-- Description: A select procedure for all the Event Status
-- Code Reviewer: Victor Martinez
-- ========================================================

CREATE proc [dbo].[EventStatus_SelectAll]

as

/*

Execute [dbo].[EventStatus_SelectAll] 

*/
Begin

SELECT [Id]
      ,[Name]
  FROM [dbo].[EventStatus]

End

GO
