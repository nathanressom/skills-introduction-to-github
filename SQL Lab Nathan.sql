-- 1. Retrieve all students who enrolled in 2023.
SELECT * FROM Students
WHERE enrollmentdate like "%2023";

-- 2. Find students whose email contains 'gmail.com'.
SELECT * FROM Students
WHERE Email LIKE '%gmail.com%';

-- 3. Count how many students are enrolled in the database.
SELECT COUNT(*) AS TotalStudents FROM Students;

-- 4. Find students born between 2000 and 2005.
SELECT * FROM Students 
WHERE DateOfBirth BETWEEN '2000-01-01' AND '2005-12-31';

-- 5. List students sorted by last name in descending order.
SELECT * FROM Students 
ORDER BY LastName DESC;

-- 6. Find the names of students and the courses they are enrolled in.
SELECT S.FirstName, S.LastName, C.CourseName 
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID;

-- 7. List all students and their courses, ensuring students without courses are included (LEFT JOIN).
SELECT S.FirstName, S.LastName, C.CourseName 
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
LEFT JOIN Courses C ON E.CourseID = C.CourseID;

-- 8. Find all courses with no students enrolled (LEFT JOIN).
SELECT C.CourseName
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID  
WHERE E.CourseID IS NULL;

-- 10. List courses and show the number of students enrolled in each course.
SELECT C.CourseName, COUNT(E.StudentID) AS StudentCount
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName;