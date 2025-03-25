USE StudentManagement;

-- Setup: Create and populate the StudentScores table
CREATE TABLE StudentScores (
    StudentID INT,
    TotalScore INT,
    MathScore INT,
    ScienceScore INT
);

INSERT INTO StudentScores (StudentID, TotalScore, MathScore, ScienceScore)
VALUES
    (1, 95, 45, 50),
    (2, 85, 35, 60),
    (3, 75, 40, 30),
    (4, 65, 25, 20),
    (5, 90, 50, 40),
    (6, 80, 42, 38),
    (7, 70, 30, 40),
    (8, 50, 20, 30);

-- 1. Assign Grades Based on Total Scores
SELECT
    StudentID,
    TotalScore,
    CASE
        WHEN TotalScore >= 90 THEN 'A'
        WHEN TotalScore >= 80 THEN 'B'
        WHEN TotalScore >= 70 THEN 'C'
        ELSE 'D (Fail)'
    END AS Grade
FROM
    StudentScores;

-- 2. Identify Pass/Fail Status in Specific Subjects
SELECT
    StudentID,
    MathScore,
    CASE
        WHEN MathScore >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS MathStatus,
    ScienceScore,
    CASE
        WHEN ScienceScore >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS ScienceStatus
FROM
    StudentScores;