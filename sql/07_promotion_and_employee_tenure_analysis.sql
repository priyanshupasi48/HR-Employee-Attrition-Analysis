 -- Promotion and Employee Tenure Analysis
                                                
-- Attrition by years at company     

SELECT
    YearsAtCompany,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;                                           

-- Attrition by years since last promotion

SELECT
    YearsSinceLastPromotion,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY YearsSinceLastPromotion
ORDER BY Attrition_Rate DESC;

-- Attrition by total working experience

SELECT
    CASE
        WHEN TotalWorkingYears < 5 THEN '0-4 Years'
        WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN '5-10 Years'
        WHEN TotalWorkingYears BETWEEN 11 AND 20 THEN '11-20 Years'
        ELSE 'Above 20 Years'
    END AS Experience_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY Experience_Group
ORDER BY Attrition_Rate DESC;

-- Employees with no promotion in the last 5 years

SELECT
    EmployeeNumber,
    Department,
    JobRole,
    YearsAtCompany,
    YearsSinceLastPromotion,
    Attrition

FROM hr_employee_attrition_cleaned
WHERE YearsSinceLastPromotion >= 5
ORDER BY YearsSinceLastPromotion DESC;

-- Attrition by years in current role

SELECT
    YearsInCurrentRole,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrition_Count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate

FROM hr_employee_attrition_cleaned
GROUP BY YearsInCurrentRole
ORDER BY Attrition_Rate DESC;