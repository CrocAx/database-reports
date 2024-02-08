SELECT Title
FROM Course
JOIN Department ON Course.DepartmentID = Department.DepartmentID
WHERE Department.DepartmentName = 'Computer science';

SELECT Title
FROM Course
JOIN Department ON Course.DepartmentID = Department.DepartmentID
WHERE Department.DepartmentName = 'Biology';

SELECT Title
FROM Course
JOIN Department ON Course.DepartmentID = Department.DepartmentID
WHERE Department.DepartmentName = 'English';

SELECT Title
FROM Course
JOIN Department ON Course.DepartmentID = Department.DepartmentID
WHERE Department.DepartmentName = 'Psychology';