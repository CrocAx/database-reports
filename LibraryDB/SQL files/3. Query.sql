SELECT Course.Title, AVG(EnrollmentCount) AS AverageStudentCount
FROM (
    SELECT CourseID, COUNT(StudentID) AS EnrollmentCount
    FROM Enrollment
    GROUP BY CourseID
) AS CourseEnrollmentCounts
JOIN Course ON CourseEnrollmentCounts.CourseID = Course.CourseID
GROUP BY Course.Title;
