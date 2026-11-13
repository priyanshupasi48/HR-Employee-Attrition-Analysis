-- Job Role and Demographic Analysis
                                                    
-- Attrition rate by Job role   

SELECT
    JobRole,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;      

-- Attrition rate by age group

SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and Above'
    END AS Age_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC;

-- Attrition by gender 

SELECT
    Gender,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY Gender;                                         
                                 
-- Attrition by marital status	

SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY MaritalStatus
ORDER BY Attrition_Rate DESC;	

-- Attrition by business travel

SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY BusinessTravel
ORDER BY Attrition_Rate DESC;				