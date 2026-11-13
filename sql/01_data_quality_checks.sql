  -- Data Quality Checks

USE hr_attrition_db;

-- Total Records

SELECT COUNT(*) AS total_employees
FROM hr_employee_attrition_cleaned;

-- Duplicate Employee Records

SELECT
    EmployeeNumber,
    COUNT(*) AS duplicate_count
FROM hr_employee_attrition_cleaned
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Missing Values

SELECT
    SUM(Age IS NULL) AS missing_age,
    SUM(Attrition IS NULL) AS missing_attrition,
    SUM(Department IS NULL) AS missing_department,
    SUM(JobRole IS NULL) AS missing_job_role,
    SUM(MonthlyIncome IS NULL) AS missing_income,
    SUM(OverTime IS NULL) AS missing_overtime
FROM hr_employee_attrition_cleaned;

-- Invalid Salary Values

SELECT *
FROM hr_employee_attrition_cleaned
WHERE MonthlyIncome <= 0;

-- Attrition Distribution

SELECT
    Attrition,
    COUNT(*) AS employee_count
FROM hr_employee_attrition_cleaned
GROUP BY Attrition;

-- Check Invalid Categorical Values

SELECT DISTINCT Attrition
FROM hr_employee_attrition_cleaned;

SELECT DISTINCT OverTime
FROM hr_employee_attrition_cleaned;

SELECT DISTINCT Department
FROM hr_employee_attrition_cleaned;

SELECT DISTINCT BusinessTravel
FROM hr_employee_attrition_cleaned;


