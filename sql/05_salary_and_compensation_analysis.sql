	-- 	Salary and Compensation Analysis
                                                
-- Average salary by attrition status

SELECT
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Income,
    ROUND(MIN(MonthlyIncome), 2) AS Minimum_Income,
    ROUND(MAX(MonthlyIncome), 2) AS Maximum_Income
FROM hr_employee_attrition_cleaned
GROUP BY Attrition;  

-- Avearge salary by department

SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Income
FROM hr_employee_attrition_cleaned
GROUP BY Department
ORDER BY Average_Income DESC;

-- Average salary by job role

SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Income
FROM hr_employee_attrition_cleaned
GROUP BY JobRole
ORDER BY Average_Income DESC;

-- Salary comparison between active and exited employees by department

SELECT
    Department,

    ROUND(AVG(
        CASE WHEN Attrition = 'Yes'
        THEN MonthlyIncome END
    ), 2) AS Average_Income_Left,

    ROUND(AVG(
        CASE WHEN Attrition = 'No'
        THEN MonthlyIncome END
    ), 2) AS Average_Income_Retained

FROM hr_employee_attrition_cleaned
GROUP BY Department;

-- Identify employees earning below department average

SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome

FROM hr_employee_attrition_cleaned e

WHERE MonthlyIncome < (
    SELECT AVG(e2.MonthlyIncome)
    FROM hr_employee_attrition_cleaned e2
    WHERE e2.Department = e.Department
)

ORDER BY Department, MonthlyIncome;         