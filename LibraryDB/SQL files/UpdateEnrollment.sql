USE [LibraryDB]
GO

UPDATE [dbo].[Enrollment]
   SET [StudentID] = <StudentID, int,>
      ,[CourseID] = <CourseID, int,>
      ,[Grade] = <Grade, int,>
 WHERE <Search Conditions,,>
GO


