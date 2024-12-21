-- Tables

CREATE TABLE Departments (
    DepartmentID INTEGER PRIMARY KEY,
    DepartmentName TEXT
);

CREATE TABLE Students (
    StudentID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT,
    Age INTEGER,
    Gender TEXT,
    DepartmentID INTEGER,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Inserting Data

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'AI'),
(3, 'Business');

INSERT INTO Students (Name, Age, Gender, DepartmentID) VALUES
('Ali Ahmed', 21, 'M', 1),
('Ayesha Khan', 20, 'F', 2),
('Bilal Saeed', 22, 'M', 3),
('Maria Tanveer', 23, 'F', 1);

-- Retrieving Data

SELECT * FROM Students;

SELECT * FROM Students WHERE Gender = 'F';

SELECT * FROM Students WHERE DepartmentID = (
    SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Computer Science'
);

-- Updating and Deleting Data

UPDATE Students SET DepartmentID = 2 WHERE Name = 'Ali Ahmed';

DELETE FROM Students WHERE Age > 22;

-- Joins 

CREATE TABLE Courses (
    CourseID INTEGER PRIMARY KEY,
    CourseName TEXT,
    DepartmentID INTEGER,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Courses (CourseID, CourseName, DepartmentID) VALUES
(1, 'Database Systems', 1),
(2, 'Machine Learning', 2),
(3, 'Marketing Strategies', 3);

SELECT 
    Students.Name AS StudentName,
    Departments.DepartmentName AS DepartmentName
FROM 
    Students
JOIN 
    Departments ON Students.DepartmentID = Departments.DepartmentID;

SELECT CourseName FROM Courses WHERE DepartmentID = (
    SELECT DepartmentID FROM Departments WHERE DepartmentName = 'AI'
);

-- Aggregate Functions
SELECT AVG(Age) AS AverageAge FROM Students WHERE DepartmentID = (
    SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Business'
);

SELECT Name, Age FROM Students ORDER BY Age ASC LIMIT 1;

SELECT Name FROM Students WHERE DepartmentID = (
    SELECT DepartmentID FROM Students WHERE Name = 'Ayesha Khan'
);

SELECT DepartmentID, COUNT(*) AS StudentCount 
FROM Students 
GROUP BY DepartmentID 
HAVING StudentCount > 1;


-- Create Results Table
CREATE TABLE Results (
    StudentID INT,
    Score INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Insert Sample Data into Results Table
INSERT INTO Results (StudentID, Score) VALUES
(1, 85),
(2, 90),
(3, 75),
(4, 80);

-- Subqueries

SELECT Students.Name, Results.Score 
FROM Students 
JOIN Results ON Students.StudentID = Results.StudentID 
WHERE Results.Score > 80;

-- Indexing
CREATE INDEX idx_department_name ON Departments (DepartmentName);

-- Transactions
-- Update a student’s department and roll back if the department doesn’t exist
BEGIN TRANSACTION;
UPDATE Students SET DepartmentID = 4 WHERE Name = 'Ali Ahmed';
ROLLBACK;
COMMIT;

-- Normalization
-- Example of Normalizing Data into 3NF
-- Original Unnormalized Table:
-- CourseName | StudentID | StudentName | DepartmentName

-- 1NF: Separate Courses, Students, and Departments into different tables
-- 2NF: Link tables through relationships (e.g., Foreign Keys)
-- 3NF: Remove transitive dependencies by ensuring all attributes depend only on the primary key

-- Normalized Schema Implementation:
-- Tables: Courses, Students, Departments, Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentID INTEGER,
    CourseID INTEGER,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
