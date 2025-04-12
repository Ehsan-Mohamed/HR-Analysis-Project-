## HR_Project_DEPI_G2

# Project Overview

Analyze employee-related data to uncover insights that can improve workforce management, optimize retention strategies, and enhance overall organizational performance. 
The analysis focuses on:
Identifying key drivers of employee turnover.
Evaluating employee satisfaction and performance metrics.
Providing actionable recommendations to HR teams for improving retention, engagement, and productivity.

#  Description of the Database Architecture

The project uses a relational database architecture with CSV files as the primary data source. 
The data is structured in tabular format, making it easy to process and analyze using Python libraries like pandas.

The main entities in the dataset include:
Employees: Contains details such as Employee ID, Gender, Age, Attrition etc.
Performance Reviews: Includes metrics like Environment Satisfaction, Job Satisfaction, Work Life Balance, etc.
Education Level, Rating Level, Satisfaction Level: Include categorical values for each numeric value.

Relationships:
Each employee has one or more performance reviews (Employee ID links the two datasets).

Features :
Columns represent attributes such as Employee ID, Department, Performance Rating, etc.
Rows represent individual records (one row per employee or review).
Shape of Data :
Balanced across key dimensions (e.g., departments, job roles).
Slightly imbalanced between classes (e.g., more non-attrition cases than attrition cases).
Used Techniques :
Data cleaning: Handling missing values, removing duplicates, standardizing formats.
Feature engineering: Creating new variables (e.g., tenure categories, Age Group, Salary Group).
Statistical analysis: Computing summary statistics and correlations.


# Objectives
	•	Data Cleaning & Preparation: Use SQL & Python to clean, transform, and structure the data.
	•	Exploratory Data Analysis (EDA): Identify trends, correlations, and key insights about employee performance and satisfaction.
	•	Visualization & Reporting: Use Power BI to create interactive dashboards and reports for HR decision-making.

# Tools & Technologies Used
	•	SQL Server – For data analysis.
	•	Python (Pandas, Matplotlib, Seaborn, etc.) – For data analysis and visualization.
	•	Power BI – For interactive dashboards and data presentation.
	•	Excel & Power Query – For preliminary data processing.
# Power Bi links
HR Analysis report:https://app.powerbi.com/groups/3eb57517-4dae-49d6-bab3-977addcff2a4/reports/4b9f87f0-1219-4d59-a46f-d4fa19a7c52e?ctid=b97ced59-fd70-450d-98e2-7fde19a6beeb&pbi_source=linkShare&bookmarkGuid=d9468ec2-ee3c-409e-a7ce-5d72b06c01bb 
HR Analysis Dashboard: https://app.powerbi.com/groups/me/dashboards/334aa06a-f3a8-4398-beb2-4f9ec9ba0e02?ctid=b97ced59-fd70-450d-98e2-7fde19a6beeb&pbi_source=linkShare 


# Project Contributors
[Ehsan Mohamed Aboelfetoh] /
[Ahmed Osman Ali] /
[Ahmed Hamdy Ibrahim Khalil]/ 
[Ehab abd Allah Ali] 
