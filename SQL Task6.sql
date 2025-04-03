USE StudentManagement;
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE
);
INSERT IGNORE INTO Employees (EmployeeID, FirstName, LastName, HireDate) VALUES
(1, 'John', 'Doe', '2023-01-15'),
(2, 'Jane', 'Smith', '2023-03-20'),
(3, 'Peter', 'Jones', '2024-05-10'),
(4, 'Alice', 'Brown', '2024-08-01');

-- 1. MODIFY TABLE STRUCTURE


DESCRIBE Employees;

-- Add new columns to the table
ALTER TABLE Employees 
ADD COLUMN LastUpdated DATE,
ADD COLUMN Status VARCHAR(10) DEFAULT 'Active';

-- Verify the new structure
DESCRIBE Employees;

-- Populate the LastUpdated column with current date for all existing records
UPDATE Employees 
SET LastUpdated = CURDATE();

-- Check the updated data
SELECT * FROM Employees LIMIT 10;


-- 2. DELETE RECORDS BASED ON CONDITIONS

-- First, let's see which records would be deleted (preview)
SELECT * FROM Employees WHERE Status = 'Inactive';

-- Delete inactive records
DELETE FROM Employees WHERE Status = 'Inactive';

-- Verify deletion by running the same SELECT query again
SELECT * FROM Employees WHERE Status = 'Inactive';

-- Another example: Delete records older than a specific date (e.g., 2023-01-01)
-- First preview the records
SELECT * FROM Employees WHERE LastUpdated < '2023-01-01';

-- Then delete them
DELETE FROM Employees WHERE LastUpdated < '2023-01-01';

-- Verify deletion
SELECT * FROM Employees WHERE LastUpdated < '2023-01-01';


-- BONUS: SAFETY MEASURES (as mentioned in guidelines)

-- Create a backup table before making changes
CREATE TABLE Employees_backup AS SELECT * FROM Employees;

-- Use transactions for safety (rollback if something goes wrong)
START TRANSACTION;

-- Perform your operations here (ALTER, UPDATE, DELETE)
-- If everything is OK:
COMMIT;

-- If something went wrong:
-- ROLLBACK;
