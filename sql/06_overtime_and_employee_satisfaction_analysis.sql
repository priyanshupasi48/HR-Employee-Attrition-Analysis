--  Overtime and Employee Satisfaction Analysis   
                                            
-- Attrition rate by overtime 

SELECT
    OverTime,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;

-- Attrition by job satisfaction

SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Work-life balance vs Attrition

SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- Overtime and job satisfaction combined

SELECT
    OverTime,
    JobSatisfaction,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY OverTime, JobSatisfaction
ORDER BY Attrition_Rate DESC;

-- Enivironment satisfaction vs attrition

SELECT
    EnvironmentSatisfaction,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY EnvironmentSatisfaction
ORDER BY Attrition_Rate DESC;
