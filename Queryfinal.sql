
-- ############ merging data 
CREATE VIEW m_data AS
SELECT 
    -- Employee Table Columns
    emp.EmployeeID AS EmployeeID,  
    emp.FirstName,  
    emp.LastName,  
    emp.Gender,  
    emp.Age,  
    emp.BusinessTravel,  
    emp.Department,  
    emp.DistanceFromHome_KM,  
    emp.[State],  
    emp.Ethnicity,  
    emp.Education,  
    emp.EducationField,  
    emp.JobRole,  
    emp.MaritalStatus,  
    emp.Salary,  
    emp.StockOptionLevel,  
    emp.OverTime,  
    emp.HireDate,  
    emp.Attrition,  
    emp.YearsAtCompany,  
    emp.YearsInMostRecentRole,  
    emp.YearsSinceLastPromotion,  
    emp.YearsWithCurrManager,  

    -- PerformanceRating Table Columns
    per.PerformanceID,  
    per.ReviewDate,  
    per.EnvironmentSatisfaction,  
    per.JobSatisfaction,  
    per.RelationshipSatisfaction,  
    per.TrainingOpportunitiesWithinYear,  
    per.TrainingOpportunitiesTaken,  
    per.WorkLifeBalance,  
    per.SelfRating,  
    per.ManagerRating

FROM [dbo].[Employee] AS emp  
JOIN [dbo].[PerformanceRating] AS per  
    ON emp.EmployeeID = per.EmployeeID;




-- ################## Attrition Analysis
-- Attrition rate
SELECT 
    100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*) AS Attrition_Rate
FROM 
    m_data;


-- number of employees left
SELECT 
    COUNT(*) AS Attrition_Count
FROM 
    m_data
WHERE 
    Attrition = 'Yes';


-- Attrition by Gender
SELECT 
    Gender,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    Gender
ORDER BY 
    Yes_Percentage DESC;


-- Attrition by Department
SELECT 
    Department,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    Department
ORDER BY 
    Yes_Percentage DESC;


-- Average Age of Employees Who Left vs. Stayed
SELECT 
    Attrition, 
    AVG(Age) AS Average_Age
FROM 
    m_data
GROUP BY 
    Attrition;

		   
-- Attrition by Marital Status
SELECT 
    MaritalStatus,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    MaritalStatus
ORDER BY 
    Yes_Percentage DESC;

-- Attrition by Ethnicity
SELECT 
    Ethnicity,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    Ethnicity
ORDER BY 
    Yes_Percentage DESC;


-- What is the attrition rate by job role?
	SELECT 
    JobRole,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    JobRole
ORDER BY 
    Yes_Percentage DESC;

-- What is the average salary of employees who left versus those who stayed?
SELECT 
    Attrition, 
    AVG(Salary) AS Average_Salary
FROM 
    m_data
GROUP BY 
    Attrition;



--  What is the attrition rate for employees who work overtime?
SELECT 
    OverTime,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    OverTime
ORDER BY 
    Yes_Percentage DESC;

-- What is the attrition rate by stock option level?
SELECT 
    StockOptionLevel,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    StockOptionLevel
ORDER BY 
    Yes_Percentage DESC;


-- What is the attrition rate for employees who haven’t been promoted in the last 5 years?
SELECT 
    100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*) AS Attrition_Rate
FROM 
    m_data
WHERE 
    YearsSinceLastPromotion >= 5;


-- years since last promotion and calculate attrition rate
SELECT 
    YearsSinceLastPromotion,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    YearsSinceLastPromotion
ORDER BY 
    Yes_Percentage DESC;

-- What is the attrition rate by years with the current manager?
SELECT 
    YearsWithCurrManager,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    YearsWithCurrManager
ORDER BY 
    Yes_Percentage DESC;


-- What is the attrition rate for employees who have taken no TrainingOpportunitiesTaken?
SELECT 
    100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*) AS Attrition_Rate
FROM 
    m_data
WHERE 
    TrainingOpportunitiesTaken = 0;


-- What is the average TrainingOpportunitiesWithinYear for employees who left?
SELECT 
    AVG(TrainingOpportunitiesWithinYear) AS Average_Training_Opportunities
FROM 
    m_data
WHERE 
    Attrition = 'Yes';

--  Attrition Rate by Business Travel
SELECT 
    BusinessTravel,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    BusinessTravel
ORDER BY 
    Yes_Percentage DESC;

-- Attrition Rate for Employees Living Far from Home (DistanceFromHome > 20 KM)
SELECT 
    100.0 * COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*) AS Attrition_Rate
FROM 
    m_data
WHERE 
    `DistanceFromHome (KM)` > 20;

--  Attrition Rate by Education Level
SELECT 
    Education,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    Education
ORDER BY 
    Yes_Percentage DESC;

--  Attrition Rate by Education Field
SELECT 
    EducationField,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    EducationField
ORDER BY 
    Yes_Percentage DESC;

--  Attrition Rate for Employees Who Work Overtime
SELECT 
    OverTime,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    OverTime
ORDER BY 
    Yes_Percentage DESC;

-- Attrition Rate by Years at the Company (Using Tenure Groups)
SELECT 
    CASE 
        WHEN YearsAtCompany BETWEEN 0 AND 5 THEN '0-5'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '5-10'
        WHEN YearsAtCompany BETWEEN 11 AND 15 THEN '10-15'
        WHEN YearsAtCompany BETWEEN 16 AND 20 THEN '15-20'
        ELSE '20+'
    END AS TenureGroup,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    TenureGroup
ORDER BY 
    Yes_Percentage DESC;

--  Attrition Rate by Years Since Last Promotion
SELECT 
    YearsSinceLastPromotion,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    YearsSinceLastPromotion
ORDER BY 
    Yes_Percentage DESC;

--  Attrition Rate by Environment Satisfaction
SELECT 
    EnvironmentSatisfaction,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    EnvironmentSatisfaction
ORDER BY 
    Yes_Percentage DESC;

--  Attrition Rate by Job Satisfaction
SELECT 
    JobSatisfaction,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    JobSatisfaction
ORDER BY 
    Yes_Percentage DESC;

--  Attrition Rate by Work-Life Balance
SELECT 
    WorkLifeBalance,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    WorkLifeBalance
ORDER BY 
    Yes_Percentage DESC;

--  Attrition Rate by Training Opportunities Taken
SELECT 
    TrainingOpportunitiesTaken,
    100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS Yes_Percentage,
    100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*) AS No_Percentage
FROM 
    m_data
GROUP BY 
    TrainingOpportunitiesTaken
ORDER BY 
    Yes_Percentage DESC;

