	-- Department-wise Attrition Analysis
										
-- Employee count by department

SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition_cleaned
GROUP BY Department
ORDER BY Total_Employees DESC;

-- Attrition count by department

SELECT
    Department,
    COUNT(*) AS Attrition_Count
FROM hr_employee_attrition_cleaned
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC;

-- Attrition rate by department

SELECT
    Department,

    COUNT(*) AS Total_Employees,

    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY Department
ORDER BY Attrition_Rate DESC;

-- Department-wise active vs attrition employees

SELECT
    Department,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Employees_Left,

    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees

FROM hr_employee_attrition_cleaned
GROUP BY Department;

