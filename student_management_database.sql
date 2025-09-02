CREATE DATABASE StudentManagement;
USE StudentManagement;
CREATE TABLE Students (
  StudentID     INT AUTO_INCREMENT PRIMARY KEY,
  Name          VARCHAR(100) NOT NULL,
  Gender        ENUM('M','F','Other') NOT NULL,
  Age           TINYINT UNSIGNED NOT NULL,    
  Grade         VARCHAR(20) NOT NULL,          
  MathsScore    TINYINT UNSIGNED NOT NULL,
  ScienceScore  TINYINT UNSIGNED NOT NULL,
  EnglishScore  TINYINT UNSIGNED NOT NULL,
  CHECK (MathsScore   BETWEEN 0 AND 100),
  CHECK (ScienceScore BETWEEN 0 AND 100),
  CHECK (EnglishScore BETWEEN 0 AND 100)
) ENGINE=InnoDB;
INSERT INTO Students (Name, Gender, Age, Grade, MathsScore, ScienceScore, EnglishScore) VALUES
('Aarav',   'M', 15, 'Grade 10', 92, 88, 81),
('Isha',    'F', 15, 'Grade 10', 78, 85, 90),
('Kabir',   'M', 15, 'Grade 10', 66, 72, 80),
('Meera',   'F', 14, 'Grade 9',  95, 91, 87),
('Dev',     'M', 16, 'Grade 11', 59, 62, 70),
('Riya',    'F', 14, 'Grade 9',  88, 90, 85),
('Arjun',   'M', 15, 'Grade 10', 74, 68, 72),
('Sneha',   'F', 16, 'Grade 11', 81, 79, 84),
('Vikram',  'M', 15, 'Grade 10', 69, 75, 71),
('Ananya',  'F', 14, 'Grade 9',  93, 95, 89);

SELECT * FROM Students;


SELECT 
  Name, Grade,
  (MathsScore + ScienceScore + EnglishScore) AS TotalMarks
FROM Students
ORDER BY TotalMarks DESC
LIMIT 1;

SELECT 
  Grade, 
  COUNT(*) AS StudentCount
FROM Students
GROUP BY Grade;

SELECT 
  Gender,
  AVG(MathsScore)   AS AvgMaths,
  AVG(ScienceScore) AS AvgScience,
  AVG(EnglishScore) AS AvgEnglish,
  ROUND(AVG(MathsScore + ScienceScore + EnglishScore)/3,2) AS AvgOverall
FROM Students
GROUP BY Gender;


SELECT 
  StudentID, Name, Grade, MathsScore, ScienceScore, EnglishScore
FROM Students
WHERE MathsScore > 80;


UPDATE Students
SET MathsScore = 85
WHERE StudentID = 3;



