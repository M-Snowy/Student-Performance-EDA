-- Student dataset grading dataset
SELECT * 
FROM students.students_grading_dataset;

-----------------------------------------------------------------------------------------------
-- Which departments do we have in this dataset
SELECT distinct(Department)
FROM students_grading_dataset;

------------------------------------------------------------------------------------------------------
-- Change CS to Computer Science
SELECT distinct(Department)
FROM students_grading_dataset;

UPDATE students_grading_dataset
SET Department = 'Computer Science'
WHERE Department = 'CS';

-------------------------------------------------------------------------------------------------------------------
-- Rename the attendance column
ALTER TABLE students_grading_dataset
RENAME COLUMN `Attendance (%)` to Attendance;

SELECT *
FROM students_grading_dataset;
-----------------------------------------------------------------------------------------------
-- Does attendance impact the final marks of students

SELECT First_Name, Last_Name, Attendance, Final_Score
FROM students_grading_dataset
WHERE Attendance > 90 AND Final_Score > 90
ORDER BY Final_Score DESC;

SELECT First_Name, Last_Name, Attendance, Final_Score
FROM students_grading_dataset
WHERE Final_Score < 50
ORDER BY Final_Score ASC
LIMIT 10;
-------------------------------------------------------------------------
-- Rename the stress level column 
ALTER TABLE students_grading_dataset
RENAME COLUMN `Stress_Level (1-10)` TO Stress_Level;

---------------------------------------------------------------------------
-- The relationship between stress levels, study hours and sleep hours
SELECT Sleep_Hours_per_Night, Stress_Level
FROM students_grading_dataset
ORDER BY Sleep_Hours_per_Night, Stress_Level DESC;

----------------------------------------------------------------------------
-- Names of students studing Computer Science
SELECT DISTINCT(Last_Name), First_Name, Department
FROM students_grading_dataset
WHERE Department = 'Computer Science';

---------------------------------------------------------------------------------------------
-- How many Students in maths class
SELECT Count(Department) AS Total_Maths_Students
FROM students_grading_dataset
WHERE Department = 'Mathematics'
GROUP BY Department;

----------------------------------------------------------------------------
-- Average of final score in each department
SELECT avg(Final_Score), Department
FROM students_grading_dataset
Group by Department;

------------------------------------------------------------------------------------------
-- Does the parents income and level of education have an impact on the student scores
SELECT Last_Name, First_Name, Final_Score,Parent_Education_Level, Family_Income_Level
FROM students_grading_dataset
ORDER BY Final_Score DESC;

------------------------------------------------------------------------------------------
-- Does extra curriculum activies affect the students grade
SELECT COUNT(Extracurricular_Activities), Grade
FROM students_grading_dataset
WHERE Extracurricular_Activities = 'Yes'
GROUP BY Grade
ORDER BY Grade ASC;

--------------------------------------------------------------------------------------------
-- How many males and how many females are in this school
SELECT Gender, count(Gender) AS Total_Gender
FROM students_grading_dataset
Group By Gender;

SELECT First_Name, Last_Name, Gender, COUNT(Gender) Over( partition by Gender) As Total_Gender
FROM students_grading_dataset;












