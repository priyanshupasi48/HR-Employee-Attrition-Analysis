# --------------------           📊 HR Employee Attrition Analysis                    -------------------

###                An End-to-End Data Analytics Project Using Python, SQL, Excel & Power BI


##  Project Overview

The HR Employee Attrition Analysis project focuses on analyzing employee attrition patterns and understanding the factors that influence employee turnover within an organization.

Employee attrition is a major challenge for organizations because it can increase recruitment costs, reduce productivity, and affect overall business performance.

This project uses Python, SQL, and Power BI to clean, explore, analyze, and visualize HR employee data. The goal is to identify important factors associated with employee attrition and provide meaningful insights that can help HR departments improve employee retention strategies.

This is an end-to-end Data Analytics project demonstrating practical skills in data cleaning, exploratory data analysis, SQL querying, and data visualization.

## 🎯 Project Objectives

- Analyze overall employee attrition and retention.
- Identify departments with higher employee attrition.
- Understand attrition patterns across different age groups.
- Analyze the relationship between monthly income and employee attrition.
- Analyze attrition across different job roles and genders.
- Understand how business travel influences attrition.
- Examine the relationship between years at company and employee attrition.
- Identify important HR trends through interactive dashboards.
- Provide data-driven insights to support employee retention strategies.

## 🛠️ Tools & Technologies

| Tool  |         | Purpose |

| Python          ---> Data cleaning and exploratory data analysis 
| Pandas          ---> Data manipulation and preprocessing 
| NumPy           ---> Numerical operations 
| Matplotlib      ---> Data visualization 
| Seaborn         ---> Statistical visualization 
| MySQL           ---> Database management and SQL analysis 
| Power BI        ---> Interactive dashboard development 
| DAX             ---> KPI calculations and business measures 
| Excel           ---> Data inspection and analysis 
| VS Code         ---> Development environment 
| Git & GitHub    ---> Version control and project documentation 

## 📂 Project Workflow

The project follows a structured end-to-end data analytics workflow:

1. Data Collection: Imported the HR Employee Attrition dataset.
2. Data Cleaning: Handled missing values, duplicates, data types, and inconsistencies using Python.
3. Exploratory Data Analysis: Performed  statistical analysis and identify patterns using Pandas,    Matplotlib, and Seaborn.
4. SQL Analysis: Loaded cleaned data into MySQL and performed business-focused queries.
5. Data Visualization: Developed  an interactive Power BI dashboard.
6. Business Insights: Interpret findings and identify factors associated with employee attrition.
7. Documentation: Present the complete project workflow and findings.

## 📁 Project Structure


HR Employee Attrition Analysis/
|
├── data/
|   |
│   ├── processed/
│   │   └── HR_Employee_Attrition_Cleaned.csv
│   └── raw/
│       └── HR Employee Attrition.csv
|
├── notebook/
|   |
│   └── HR_Employee_Attrition_EDA.ipynb
|
├── powerbi/
|   |
│   ├── hr_employee_attrition_dashboard01.png
│   ├── hr_employee_attrition_dashboard02.png
│   └── hr_employee_attrition_dashboard03.png
|
├── python/
│   └── data_cleaning.py
|
├── reports/
│   └── cleaning_summary.txt
|
├── sql/
│   ├── 01_data_quality_checks.sql
│   ├── 02_hr_KPI_analysis.sql
│   ├── 03_department_wise_analysis.sql
│   ├── 04_job_role_and_demographic_analysis.sql
│   ├── 05_salary_and_compensation_analysis.sql
│   ├── 06_overtime_and_employee_satisfaction_analysis.sql
│   ├── 07_promotion_and_employee_tenure_analysis.sql
│   └── 08_adavnce_sql_queries.sql
|
└── README.md


## 🧹 1. Data Cleaning Using Python

The raw HR dataset was imported into Python for preprocessing and data quality checks.

### Data Cleaning Tasks

- Loaded the dataset
- Checked dataset dimensions and structure
- Cleaned column names
- Identified and Handled missing values
- Removed empty rows and columns
- Checked and removed duplicate records
- Checked and corrected data types
- Standardized categorical values
- Validated HR business rules
- Handled missing numeric values
- Handled missing categorical values
- Employee number validation
- Exported the cleaned dataset into the processed folder

**Output File:** `HR_Employee_Attrition_Cleaned.csv`

### Python Libraries

- Pandas
- NumPy
- Matplotlib
- Seaborn

## 📈 2. Exploratory Data Analysis (EDA)

Exploratory Data Analysis was performed to understand employee characteristics and discover patterns associated with attrition.

### Key EDA Analysis

- HR Analytics KPIs
- Attrition Distribution
- Attrition by Department
- Attrition by Overtime
- Attrition by Job Role
- Attrition by Age Group
- Monthly Income vs Employee Attrition
- Job Satisfaction vs Attrition %
- Years at Company vs Attrition
- Business Travel vs Attrition 
- Work-Life Balance vs Attrition
- Years Since Last Promotion vs Attrition
- Department-wise Attrition Rate
- Average monthly income by department
- Monthly income distribution by attrition
- Salary summary by attrition

The analysis helps identify employee groups and workplace factors associated with higher attrition.

## 🗄️ 3. SQL Analysis Using MySQL

The cleaned HR dataset was imported into MySQL for structured data analysis.

**Database Name:** `hr_attrition_db`

**Table Name:** `hr_employee_attrition_cleaned`

### SQL Concepts Used

- SELECT and WHERE
- GROUP BY and HAVING
- ORDER BY
- Aggregate Functions
- CASE Statements
- INNER JOIN and LEFT JOIN
- Subqueries
- Window Functions
- Date and String Functions
- NULL Handling
- Data Quality Checks

### Business Questions Answered Using SQL

1. What is the overall employee attrition rate?

The overall employee attrition rate is 16.2%, indicating that approximately 16 out of every 100 employees have left the organization. This highlights the need for effective employee retention strategies, improved engagement, and regular workforce analysis.

2. Which department has the highest attrition?

The Research & Development department experiences the highest employee attrition among the departments. This suggests a potential employee retention challenge within the department and highlights the importance of evaluating workload, career development opportunities, compensation, and employee satisfaction.

3. Which job roles experience the highest employee attrition?

Job roles such as Laboratory Technician, Sales Executive, and Research Scientist are important areas to examine for higher employee attrition. These roles may experience retention challenges due to differences in workload, career progression, compensation, and job expectations. Identifying the exact highest-attrition role through job-role-wise analysis can help HR prioritize retention initiatives.

4. Does overtime have a relationship with employee attrition?

Yes, overtime is associated with employee attrition. Employees who work overtime generally demonstrate higher attrition compared with employees who do not work overtime. Excessive working hours may contribute to employee stress, reduced work-life balance, and job dissatisfaction. Organizations should monitor overtime and promote sustainable workloads.

5. How does monthly income differ between employees who leave and those who stay?

Employees who leave the organization generally have a lower average monthly income than employees who stay. This indicates that compensation may be one of the factors influencing employee retention. Organizations should regularly review salary structures, compensation competitiveness, and reward programs to reduce potential attrition.

6. Which age groups experience higher attrition? 

Employees around 35 years of age represent the highest attrition concentration in the analysis. This indicates that mid-career employees may require greater attention regarding career advancement, salary growth, professional development, and job satisfaction.

7. How does employee tenure influence attrition?

Employee attrition tends to be higher among employees with shorter organizational tenure, particularly those in their initial years of employment. This suggests that onboarding, employee engagement, mentorship, and early-career development programs play an important role in improving employee retention.

8. Does business travel influence employee turnover?

Business travel appears to influence employee turnover. Employees who travel frequently may experience higher attrition due to demanding schedules, travel-related stress, and difficulties maintaining personal commitments. HR should evaluate travel frequency and provide appropriate flexibility and support.

9. How does work-life balance relate to attrition?

Employees with poor work-life balance are more likely to leave the organization than employees with better work-life balance. This highlights the importance of flexible working arrangements, manageable workloads, employee wellness initiatives, and a supportive workplace culture.

10. How do years since last promotion relate to employee attrition?

Employees who have not received a promotion for an extended period may demonstrate a higher likelihood of attrition. Limited career advancement opportunities can reduce motivation and job satisfaction. Organizations should introduce transparent promotion policies, regular performance evaluations, and structured career development plans.

## Business Recommendations

Based on the HR Employee Attrition Analysis, the following strategic recommendations are proposed to improve employee retention, enhance workforce satisfaction, and reduce organizational turnover.

### 1. Strengthen Employee Retention Strategies
- Develop targeted employee retention programs, particularly for departments experiencing higher attrition.
- Conduct regular employee satisfaction surveys and exit interviews to identify the reasons behind employee departures.
- Introduce employee engagement initiatives to strengthen organizational commitment.

### 2. Improve Compensation and Benefits
- Regularly review salary structures to ensure compensation remains competitive within the industry.
- Identify potential salary gaps between employees who leave and those who stay.
- Introduce performance-based incentives, bonuses, and recognition programs to improve employee satisfaction.

### 3. Manage Overtime and Workload
- Monitor employee overtime patterns to identify excessive workloads.
- Distribute responsibilities more effectively to prevent employee burnout.
- Encourage flexible working arrangements and promote a healthy work environment.

### 4. Focus on Career Growth and Development
- Establish transparent promotion policies and structured career progression paths.
- Provide professional training, skill development, and mentorship opportunities.
- Conduct regular performance reviews to identify employees seeking career advancement.

### 5. Improve Work-Life Balance
- Introduce flexible working schedules wherever operationally possible.
- Promote employee wellness initiatives and stress-management programs.
- Encourage managers to maintain reasonable workloads and respect employees' personal time.

### 6. Strengthen Early-Career Employee Engagement
- Improve onboarding and orientation programs for newly hired employees.
- Introduce mentorship programs to help new employees adapt to the organization.
- Conduct regular feedback sessions during the initial stages of employment.

### 7. Implement Department-Specific Retention Programs
- Prioritize departments with higher employee attrition.
- Analyze department-specific challenges, including workload, management practices, and career opportunities.
- Develop customized retention strategies based on departmental requirements.

### 8. Optimize Business Travel Policies
- Review frequent business travel requirements and identify opportunities to reduce unnecessary travel.
- Provide adequate flexibility and support to employees with demanding travel schedules.
- Consider virtual meetings where physical travel is not essential.

### 9. Establish Continuous HR Analytics Monitoring
- Develop a regular employee attrition monitoring system using Power BI dashboards.
- Track key HR indicators, including attrition rate, average employee tenure, department-wise attrition, and employee satisfaction.
- Use historical workforce data to identify emerging attrition patterns and support proactive HR decision-making.


### Business Outcomes


1. Reduced Employee Turnover: Identify key attrition drivers and develop targeted employee retention strategies to minimize workforce turnover.

2. Lower Recruitment and Training Costs: Improve employee retention to reduce recurring recruitment, onboarding, and employee training expenses.

3. Improved Employee Engagement: Address employee dissatisfaction through better workplace policies, employee recognition, and engagement initiatives.

4. Enhanced Workforce Planning: Identify high-attrition departments, job roles, and employee segments to support effective workforce allocation and planning.

5. Better Compensation Management: Analyze salary differences between employees who leave and those who stay to support competitive compensation and reward strategies.

6. Improved Work-Life Balance: Identify the impact of overtime and business travel on employee attrition to encourage healthier working conditions.

7. Stronger Career Development: Identify potential career stagnation and introduce structured promotion opportunities, training, and professional development programs.

8. Increased Employee Productivity: Promote employee satisfaction, motivation, and workforce stability to support improved organizational productivity.

9. Data-Driven HR Decision-Making: Leverage Power BI dashboards and analytical findings to support evidence-based HR strategies and proactive workforce management.

10. Long-Term Organizational Stability: Strengthen employee retention, preserve organizational knowledge, and build a more experienced, productive, and sustainable workforce.

## 📊 4. Power BI Dashboard

An interactive HR Employee Attrition Dashboard was developed using Microsoft Power BI to present important HR metrics and business insights.

### Dashboard KPIs

- Total Employees         --> 1470 - Total employees in the company
- Attrition Count         --> 237  Total employees left the company 
- Active Employees        --> 1233 The employees still in company 
- Attrition Rate          --> 16.12 %
- Average Monthly Income  --> 6.50 K

### Dashboard Visualizations

| Visualization |                          | Business Purpose |

| Attrition by Department          -->     Identify departments with higher attrition 
| Attrition by Gender              -->     Compare attrition across genders 
| Attrition by Business Travel     -->     Understand travel-related attrition patterns 
| Attrition by Job Role            -->     Identify high-attrition job roles 
| Attrition by Age                 -->     Analyze age-wise attrition 
| Attrition by Years at Company    -->     Understand employee tenure patterns 
| Attrition by Overtime            -->     Analyze the relationship between overtime and attrition 
| Attrition by Monthly Income      -->     Compare income groups and attrition 
| Attrition vs Retained Employees  -->     Compare employees who left and those who stayed 

### Interactive Dashboard Features

- Department slicer
- Gender slicer
- Job Role slicer
- Age Group slicer
- Business Travel slicer
- Overtime slicer
- Dynamic KPI cards
- Interactive charts and graphs

## 💡 5. Key Business Insights

The project investigates several important HR-related patterns:

- Department-wise analysis helps identify areas experiencing higher employee turnover.
- Job role analysis highlights positions that may require additional retention strategies.
- Overtime analysis helps investigate whether extended working hours are associated with employee attrition.
- Monthly income analysis helps understand differences in compensation between employees who leave and those who stay.
- Age-group analysis helps identify demographic patterns in employee turnover.
- Tenure analysis helps investigate whether employees are more likely to leave during particular stages of their employment.
- Business travel analysis helps evaluate the relationship between travel frequency and employee retention.


## 📌 Key Performance Indicators (KPIs)

| KPI |                                 | Description |

| Total Employees         -->  Total number of employees in the dataset 
| Attrition Count         -->  Number of employees who left the organization 
| Active Employees        -->  Number of employees who remained 
| Attrition Rate          -->  Percentage of employees who left
| Average Monthly Income  -->  Average monthly income of employees 

**Attrition Rate Formula:**

Attrition Rate = (Attrition Count / Total Employees) × 100

## 📚 Skills Demonstrated

Through this project, I demonstrated practical knowledge of:

- Data Cleaning and Preprocessing
- Exploratory Data Analysis
- Statistical Analysis
- Data Manipulation
- SQL Query Writing
- Database Management
- DAX Measures
- Data Visualization
- Dashboard Development
- Business Intelligence
- Analytical Thinking
- Data-Driven Decision Making

 👨‍💻 Author

Priyanshu Pasi

### Project Focus

End-to-end HR Analytics | Employee Attrition Analysis | Data-Driven Decision Making
 ⭐ 

If you find this project useful or interesting, consider giving this repository a ⭐ on GitHub.

Thank you for visiting my HR Employee Attrition Analysis project!
