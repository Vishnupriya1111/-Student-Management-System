# -Student-Management-System
A SQL-based project for managing student data and analyzing performance.
-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS StudentManagement;
USE StudentManagement;

-- Step 2: Create the Students table
CREATE TABLE IF NOT EXISTS Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(1) NOT NULL,
    Age INT NOT NULL,
    Grade VARCHAR(10) NOT NULL,
    MathScore INT NOT NULL,
    ScienceScore INT NOT NULL,
    EnglishScore INT NOT NULL
);

-- Step 3: Insert sample data into the Students table
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES
('John Doe', 'M', 16, 'A', 85, 90, 88),
('Jane Smith', 'F', 15, 'B', 78, 82, 80),
('Alice Johnson', 'F', 17, 'A', 92, 88, 91),
('Bob Brown', 'M', 16, 'C', 65, 70, 68),
('Charlie Davis', 'M', 15, 'B', 80, 75, 82),
('Diana Evans', 'F', 16, 'A', 95, 89, 93),
('Ethan Harris', 'M', 17, 'B', 77, 81, 79),
('Fiona Clark', 'F', 15, 'C', 60, 65, 62),
('George Lewis', 'M', 16, 'A', 88, 92, 90),
('Hannah Walker', 'F', 17, 'B', 82, 85, 80);

-- Step 4: Task 1 - Display all students and their details
SELECT * FROM Students;

-- Step 5: Task 2 - Calculate average scores for each subject
SELECT 
    AVG(MathScore) AS AvgMathScore,
    AVG(ScienceScore) AS AvgScienceScore,
    AVG(EnglishScore) AS AvgEnglishScore
FROM Students;

-- Step 6: Task 3 - Find the student(s) with the highest total score
SELECT 
    Name, 
    (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

-- Step 7: Task 4 - Count the number of students in each grade
SELECT 
    Grade, 
    COUNT(*) AS NumberOfStudents
FROM Students
GROUP BY Grade;

-- Step 8: Task 5 - Find the average score for male and female students
SELECT 
    Gender,
    AVG(MathScore) AS AvgMathScore,
    AVG(ScienceScore) AS AvgScienceScore,
    AVG(EnglishScore) AS AvgEnglishScore
FROM Students
GROUP BY Gender;

-- Step 9: Task 6 - Identify students whose Math score is above 80
SELECT 
    Name, 
    MathScore
FROM Students
WHERE MathScore > 80;

-- Step 10: Task 7 - Update the grade of a student with a specific Student ID
UPDATE Students
SET Grade = 'A+'
WHERE StudentID = 3;

-- Verify the update
SELECT * FROM Students WHERE StudentID = 3;
