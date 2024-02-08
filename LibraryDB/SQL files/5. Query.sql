UPDATE Enrollment
SET Grade = '5'
WHERE CourseID = '1';

SELECT StudentID, CourseID, Grade
FROM Enrollment
WHERE CourseID = '1';