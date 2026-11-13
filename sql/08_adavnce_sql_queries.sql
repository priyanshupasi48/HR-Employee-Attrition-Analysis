--Advance SQL Queries
                                                    
-- Rank departments by attrition rate   

WITH Department_Attrition AS (
    SELECT
        Department,
        COUNT(*) AS Total_Employees,

        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
            AS Attrition_Count,

        ROUND(
            SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
            * 100.0 / COUNT(*), 2
        ) AS Attrition_Rate

    FROM hr_employee_attrition_cleaned
    GROUP BY Department
)

SELECT
    Department,
    Total_Employees,
    Attrition_Count,
    Attrition_Rate,

    RANK() OVER (
        ORDER BY Attrition_Rate DESC
    ) AS Attrition_Rank

FROM Department_Attrition;               

-- Rank job roles by average salary    

SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Salary,

    RANK() OVER (
        ORDER BY AVG(MonthlyIncome) DESC
    ) AS Salary_Rank

FROM hr_employee_attrition_cleaned
GROUP BY JobRole;             

-- The top 5 highest-paid employees in each department 

WITH Salary_Ranking AS (
    SELECT
        EmployeeNumber,
        Department,
        JobRole,
        MonthlyIncome,

        ROW_NUMBER() OVER (
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS Salary_Rank

    FROM hr_employee_attrition_cleaned
)

SELECT *
FROM Salary_Ranking
WHERE Salary_Rank <= 5
ORDER BY Department, Salary_Rank;     

-- Compare department attrition rate with overall attrition rate  

WITH Overall_Rate AS (
    SELECT
        AVG(Attrition = 'Yes') * 100 AS Overall_Attrition_Rate
    FROM hr_employee_attrition_cleaned
),

Department_Rate AS (
    SELECT
        Department,
        AVG(Attrition = 'Yes') * 100 AS Department_Attrition_Rate
    FROM hr_employee_attrition_cleaned
    GROUP BY Department
)
SELECT
    d.Department,

    ROUND(d.Department_Attrition_Rate, 2)
        AS Department_Attrition_Rate,
    ROUND(o.Overall_Attrition_Rate, 2)
        AS Overall_Attrition_Rate,
    ROUND(
        d.Department_Attrition_Rate - o.Overall_Attrition_Rate,
        2
    ) AS Difference_From_Overall

FROM Department_Rate d
CROSS JOIN Overall_Rate o
ORDER BY Difference_From_Overall DESC;         

-- Identify high-risk employee profiles

SELECT
    EmployeeNumber,
    Age,
    Department,
    JobRole,
    MonthlyIncome,
    OverTime,
    JobSatisfaction,
    WorkLifeBalance,
    YearsAtCompany,
    Attrition,

    CASE
        WHEN OverTime = 'Yes'
             AND JobSatisfaction <= 2
             AND WorkLifeBalance <= 2
        THEN 'Multiple Retention Concerns'

        WHEN OverTime = 'Yes'
             AND JobSatisfaction <= 2
        THEN 'Workload and Satisfaction Concerns'

        WHEN WorkLifeBalance <= 2
             AND YearsSinceLastPromotion >= 5
        THEN 'Work-Life and Career Growth Concerns'

        ELSE 'Other Profile'
    END AS Retention_Concern

FROM hr_employee_attrition_cleaned

ORDER BY
    CASE
        WHEN OverTime = 'Yes'
             AND JobSatisfaction <= 2
             AND WorkLifeBalance <= 2 THEN 1
        WHEN OverTime = 'Yes'
             AND JobSatisfaction <= 2 THEN 2
        WHEN WorkLifeBalance <= 2
             AND YearsSinceLastPromotion >= 5 THEN 3
        ELSE 4
    END;