USE StudentManagement;
-- 1. FIRST REMOVE EXISTING TABLES (if they exist)
SET FOREIGN_KEY_CHECKS = 0; -- Disable foreign key checks temporarily
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS students;
SET FOREIGN_KEY_CHECKS = 1; -- Re-enable foreign key checks

-- 2. CREATE STUDENTS TABLE (with all required columns)
CREATE TABLE students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(1) NOT NULL,
    Age INT NOT NULL,
    Grade VARCHAR(10) NOT NULL,
    MathScore INT DEFAULT 0, -- Now optional with default
    ScienceScore INT DEFAULT 0 -- Now optional with default
);

-- 3. CREATE SCORES TABLE (with proper foreign key)
CREATE TABLE scores (
    score_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject VARCHAR(50) NOT NULL,
    score INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(StudentID)
);

-- 4. INSERT STUDENTS (handling all required columns)
INSERT INTO students (StudentID, Name, Gender, Age, Grade) VALUES 
(1, 'John Smith', 'M', 17, '11A')
ON DUPLICATE KEY UPDATE Name=Name; -- Prevents duplicate errors

INSERT INTO students (StudentID, Name, Gender, Age, Grade) VALUES 
(2, 'Emily Johnson', 'F', 16, '10B')
ON DUPLICATE KEY UPDATE Name=Name;

-- 5. INSERT SCORES (only for existing students)
INSERT INTO scores (student_id, subject, score) VALUES 
(1, 'Math', 85),
(1, 'Science', 78)
ON DUPLICATE KEY UPDATE score=VALUES(score); -- Updates if exists

-- 6. VERIFICATION
SELECT * FROM students;
SELECT * FROM scores;