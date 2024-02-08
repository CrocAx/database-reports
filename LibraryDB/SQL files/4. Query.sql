-- Enrollment.StudentID = '1-10';
SELECT DISTINCT Name
FROM Instructor
JOIN Course ON Instructor.DepartmentID = Course.DepartmentID
JOIN Enrollment ON Course.CourseID = Enrollment.CourseID
WHERE Enrollment.StudentID = '1';

SELECT DISTINCT Name
FROM Instructor
JOIN Course ON Instructor.DepartmentID = Course.DepartmentID
JOIN Enrollment ON Course.CourseID = Enrollment.CourseID
WHERE Enrollment.StudentID = '10';