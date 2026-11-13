HR Analytics KPI Analysis

-- Total employees who left

SELECT
    COUNT(*) AS Attrition_Count
FROM hr_employee_attrition_cleaned
WHERE Attrition = 'Yes';

-- Total active employees 

SELECT
    COUNT(*) AS Active_Employees
FROM hr_employee_attrition_cleaned
WHERE Attrition = 'No';

-- Overall atrition rate

SELECT
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_employee_attrition_cleaned;

-- Average employee age 

SELECT
    ROUND(AVG(Age), 2) AS Average_Age
FROM hr_employee_attrition_cleaned;

-- Average monthly income 

SELECT
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income
FROM hr_employee_attrition_cleaned;

-- Average years at company

SELECT
    ROUND(AVG(YearsAtCompany), 2) AS Average_Tenure
FROM hr_employee_attrition_cleaned;

-- Complete HR KPI Summary

SELECT
    COUNT(*) AS Total_Employees,

    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Attrition_Count,

    SUM(CASE
        WHEN Attrition = 'No' THEN 1
        ELSE 0
    END) AS Active_Employees,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate,

    ROUND(AVG(Age), 2) AS Average_Age,

    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income,

    ROUND(AVG(YearsAtCompany), 2) AS Average_Tenure

FROM hr_employee_attrition_cleaned;