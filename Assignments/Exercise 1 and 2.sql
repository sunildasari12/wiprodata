use EmpSample_#OK;
select * from tblEmployees;

--   Questions for Exercise_1


--1:  Get Employees with One-Part Name

SELECT Name
FROM tblEmployees
WHERE LEN(Name) - LEN(REPLACE(Name, ' ', '')) = 0;

--2: Get Employees with Three-Part Name

SELECT Name
FROM tblEmployees
WHERE LEN(Name) - LEN(REPLACE(Name, ' ', '')) = 2;


-- 3: Get Employees whose First, Middle, or Last Name is exactly 'Ram' and nothing else

select emp.Name
from dbo.tblEmployees emp
where emp.Name like 'ram[ ]%' or emp.Name like '%[ ]ram' or emp.Name like '%[. ]ram[ ]%';

-- 4: SQL Bitwise Operations
SELECT 65 | 11 AS Result;  
SELECT 65 ^ 11 AS Result;  
SELECT 65 & 11 AS Result;  
SELECT (12 & 4) | (13 & 1) AS Result;  
SELECT 127 | 64 AS Result;  
SELECT 127 ^ 64 AS Result;  
SELECT 127 ^ 128 AS Result;
SELECT 127 & 64 AS Result; 
SELECT 127 & 128 AS Result;  

-- 5: Return all columns from dbo.tblCentreMaster
SELECT *
FROM tblCentreMaster;

--6: Return distinct employee types in the organization

SELECT DISTINCT EmployeeType
FROM tblEmployees;

--7  Return Name, FatherName, DOB of employees based on PresentBasic

SELECT Name, FatherName, DOB
FROM tblEmployees
WHERE PresentBasic > 3000;

SELECT Name, FatherName, DOB
FROM tblEmployees
WHERE PresentBasic < 3000;

SELECT Name, FatherName, DOB
FROM tblEmployees
WHERE PresentBasic BETWEEN 3000 AND 5000;

--8 Return all employee details based on Name

SELECT *
FROM tblEmployees
WHERE Name LIKE '%KHAN';

SELECT *
FROM tblEmployees
WHERE Name LIKE 'CHANDRA%';

SELECT *
FROM tblEmployees
WHERE 
    Name LIKE '_.RAMESH' AND
    UPPER(LEFT(Name, 1)) BETWEEN 'A' AND 'T';


--Exercise 2

-- 1: Total PresentBasic per Department, where sum > 30000, sorted by dept

SELECT DepartmentCode,
       SUM(PresentBasic) AS TotalPresentBasic
FROM tblEmployees
GROUP BY DepartmentCode
HAVING SUM(PresentBasic) > 30000
ORDER BY DepartmentCode;


--2: Max, Min & Avg Age by ServiceType, ServiceStatus, and Centre

SELECT CentreCode, ServiceType, ServiceStatus,
       MAX(DATEDIFF(YEAR, DOB, GETDATE())) AS MaxAgeYears,
       MIN(DATEDIFF(YEAR, DOB, GETDATE())) AS MinAgeYears,
       AVG(DATEDIFF(YEAR, DOB, GETDATE())) AS AvgAgeYears
FROM tblEmployees
GROUP BY CentreCode, ServiceType, ServiceStatus;


--3: Max, Min & Avg Service Duration (tenure) by same groups
SELECT CentreCode, ServiceType, ServiceStatus,
       MAX(DATEDIFF(YEAR, DOJ, GETDATE())) AS MaxSvcYears,
       MIN(DATEDIFF(YEAR, DOJ, GETDATE())) AS MinSvcYears,
       AVG(DATEDIFF(YEAR, DOJ, GETDATE())) AS AvgSvcYears
FROM tblEmployees
GROUP BY CentreCode, ServiceType, ServiceStatus;

--4: Departments where Total Salary > 3 � Average Salary
SELECT DepartmentCode
FROM (
   SELECT DepartmentCode,
          SUM(PresentBasic) AS TotalBasic,
          AVG(PresentBasic) AS AvgBasic
   FROM tblEmployees
   GROUP BY DepartmentCode
) t
WHERE t.TotalBasic > 3 * t.AvgBasic;

--5: Where TotalBasic > 2�AvgBasic and MaxBasic >= 3�MinBasic

SELECT DepartmentCode
FROM (
   SELECT DepartmentCode,
          SUM(PresentBasic) AS TotalBasic,
          AVG(PresentBasic) AS AvgBasic,
          MAX(PresentBasic) AS MaxBasic,
          MIN(PresentBasic) AS MinBasic
   FROM tblEmployees
   GROUP BY DepartmentCode
) t
WHERE t.TotalBasic > 2 * t.AvgBasic
  AND t.MaxBasic >= 3 * t.MinBasic;

--6: Centres where MAX(LEN(Name)) >= 2 � MIN(LEN(Name))

SELECT CentreCode
FROM tblEmployees
GROUP BY CentreCode
HAVING MAX(LEN(Name)) >= 2 * MIN(LEN(Name));

--7: Max/Min/Avg service of employees in milliseconds
SELECT CentreCode, ServiceType, ServiceStatus,
       MAX(DATEDIFF_BIG(millisecond, DOJ, GETDATE())) AS MaxSvcMs,
       MIN(DATEDIFF_BIG(millisecond, DOJ, GETDATE())) AS MinSvcMs,
       AVG(CAST(DATEDIFF_BIG(millisecond, DOJ, GETDATE()) AS bigint)) AS AvgSvcMs
FROM tblEmployees
GROUP BY CentreCode, ServiceType, ServiceStatus;

--8: Find names with leading or trailing spaces
SELECT Name
FROM tblEmployees
WHERE Name <> LTRIM(RTRIM(Name));

--9 : Find names with more than one space between parts (double space)

SELECT Name
FROM tblEmployees
WHERE Name LIKE '%  %';  -- two spaces in a row

--10: Normalize name: trim spaces, replace dots or multiple spaces to single space
SELECT Name,
       REPLACE(
         REPLACE(
           LTRIM(RTRIM(Name)), '.', ' '
         ), '  ', ' '
       ) AS NormalizedName
FROM tblEmployees;


--11: Max Number of Words in employee names (after normalization)
WITH CleanNames AS (
  SELECT Name,
         REPLACE(REPLACE(LTRIM(RTRIM(Name)), '.', ' '), '  ', ' ') AS Clean
  FROM tblEmployees
)
SELECT MAX(LEN(Clean) - LEN(REPLACE(Clean, ' ', '')) + 1) AS MaxWords
FROM CleanNames;

--12: Employee names starting and ending with same character
SELECT Name
FROM tblEmployees
WHERE LEFT(Name,1) = RIGHT(Name,1);


--13: First and second name start with same letter

SELECT Name
FROM tblEmployees
WHERE
  CHARINDEX(' ', Name) > 0
  AND UPPER(LEFT(Name,1)) = UPPER(SUBSTRING(Name, CHARINDEX(' ',Name)+1,1));

--14: All words in name start with same character

WITH NameParts AS (
    SELECT 
        E.Name,
        Split.a.value('.', 'VARCHAR(100)') AS part
    FROM tblEmployees E
    CROSS APPLY (
        SELECT CAST('<x>' + 
             REPLACE(REPLACE(LTRIM(RTRIM(E.Name)), '.', ' '), ' ', '</x><x>') + 
             '</x>' AS XML) 
    ) AS A(Split)
    CROSS APPLY A.Split.nodes('/x') AS Split(a)
)
SELECT Name
FROM NameParts
GROUP BY Name
HAVING MIN(LEFT(part, 1)) = MAX(LEFT(part, 1));


--15: Any word (excluding initials) in name starts and ends with same character

WITH NameParts AS (
    SELECT 
        E.Name,
        Split.a.value('.', 'VARCHAR(100)') AS part
    FROM tblEmployees E
    CROSS APPLY (
        SELECT CAST('<x>' + 
             REPLACE(REPLACE(LTRIM(RTRIM(E.Name)), '.', ' '), ' ', '</x><x>') + 
             '</x>' AS XML) 
    ) AS A(Split)
    CROSS APPLY A.Split.nodes('/x') AS Split(a)
)
SELECT DISTINCT Name
FROM NameParts
WHERE LEN(part) > 1
  AND LEFT(part,1) = RIGHT(part,1);




--16: PresentBasic rounded to hundred using various methods

SELECT Name, PresentBasic
FROM tblEmployees
WHERE ROUND(PresentBasic, -2, 0) = PresentBasic;


SELECT Name, PresentBasic
FROM tblEmployees
WHERE FLOOR(PresentBasic / 100.0) * 100 = PresentBasic;

SELECT Name, PresentBasic
FROM tblEmployees
WHERE PresentBasic % 100 = 0;


SELECT Name, PresentBasic
FROM tblEmployees
WHERE CEILING(PresentBasic / 100.0) * 100 = PresentBasic;

--17: Departments where all employees have basic rounded to 100

SELECT DepartmentCode
FROM tblEmployees
GROUP BY DepartmentCode
HAVING MIN(PresentBasic % 100) = 0
   AND MAX(PresentBasic % 100) = 0;

--18: Departments where no employee has basic rounded to 100

SELECT DepartmentCode
FROM tblEmployees
GROUP BY DepartmentCode
HAVING MAX(CASE WHEN PresentBasic % 100 = 0 THEN 1 ELSE 0 END) = 0;

--:19. Bonus eligibility: service ? 1 year 3 months 15 days

SELECT 
    E.Name,
    DATEADD(MONTH, 15, DATEADD(DAY, 15, E.DOJ)) AS EligibilityDate,
    
    DATEDIFF(YEAR, E.DOB, DATEADD(MONTH, 15, DATEADD(DAY, 15, E.DOJ))) AS AgeYears,
    
    DATEDIFF(MONTH, E.DOB, DATEADD(MONTH, 15, DATEADD(DAY, 15, E.DOJ))) % 12 AS AgeMonths,
    
    DATEDIFF(DAY,
        DATEADD(YEAR,
            DATEDIFF(YEAR, E.DOB, DATEADD(MONTH, 15, DATEADD(DAY, 15, E.DOJ))),
            DATEADD(MONTH,
                DATEDIFF(MONTH, E.DOB, DATEADD(MONTH, 15, DATEADD(DAY, 15, E.DOJ))) % 12,
                E.DOB
            )
        ),
        DATEADD(MONTH, 15, DATEADD(DAY, 15, E.DOJ))
    ) AS AgeDays,

    DATENAME(WEEKDAY, DATEADD(MONTH, 15, DATEADD(DAY, 15, E.DOJ))) AS Weekday,
    DATEPART(WEEK, DATEADD(MONTH, 15, DATEADD(DAY, 15, E.DOJ))) AS WeekOfYear,
    DATEPART(DAYOFYEAR, DATEADD(MONTH, 15, DATEADD(DAY, 15, E.DOJ))) AS DayOfYear
FROM tblEmployees AS E;




--20: Bonus eligibility by service type/employee type criteria

SELECT Name, ServiceType, EmployeeType, DOJ, DOB
FROM tblEmployees
WHERE (
    ServiceType = 1 AND EmployeeType = 1 AND
      DATEDIFF(YEAR, DOJ, GETDATE()) >= 10 AND
      DATEDIFF(YEAR, GETDATE(), DATEADD(YEAR, 60, DOB)) >= 15
)
OR (
    ServiceType = 1 AND EmployeeType = 2 AND
      DATEDIFF(YEAR, DOJ, GETDATE()) >= 12 AND
      DATEDIFF(YEAR, GETDATE(), DATEADD(YEAR, 55, DOB)) >= 14
)
OR (
    ServiceType = 1 AND EmployeeType = 3 AND
      DATEDIFF(YEAR, DOJ, GETDATE()) >= 12 AND
      DATEDIFF(YEAR, GETDATE(), DATEADD(YEAR, 55, DOB)) >= 12
)
OR (
    ServiceType IN (2,3,4) AND
      DATEDIFF(YEAR, DOJ, GETDATE()) >= 15 AND
      DATEDIFF(YEAR, GETDATE(), DATEADD(YEAR, 65, DOB)) >= 20
);


--:21. Display current date in all formats using CONVERT

SELECT
  CONVERT(VARCHAR(30), GETDATE(), 100) AS Format100,
  CONVERT(VARCHAR(30), GETDATE(), 101) AS Format101,
  CONVERT(VARCHAR(30), GETDATE(), 103) AS Format103,
  CONVERT(VARCHAR(30), GETDATE(), 112) AS Format112,
  CONVERT(VARCHAR(30), GETDATE(), 121) AS Format121;


--22: Compare net payment vs. expected basic using TblPayEmployeeParamDetails

WITH SalarySummary AS (
    SELECT 
        p.EmployeeNumber,
        e.Name,
        p.NoteNumber,
        SUM(CASE WHEN p.ParamCode = 'BASIC' THEN p.Amount ELSE 0 END) AS BasicPay,
        SUM(p.Amount) AS NetPay
    FROM tblPayEmployeeparamDetails p
    JOIN tblEmployees e ON e.EmployeeNumber = p.EmployeeNumber
    GROUP BY p.EmployeeNumber, e.Name, p.NoteNumber
)
SELECT *
FROM SalarySummary
WHERE NetPay < BasicPay;

WITH SalaryBreakdown AS (
    SELECT 
        p.EmployeeNumber,
        e.Name,
        SUM(CASE WHEN p.ParamCode = 'BASIC' THEN p.Amount ELSE 0 END) AS BasicAmount,
        SUM(CASE WHEN p.ParamCode <> 'BASIC' THEN p.Amount ELSE 0 END) AS OtherComponents
    FROM tblPayEmployeeparamDetails p
    JOIN tblEmployees e ON e.EmployeeNumber = p.EmployeeNumber
    GROUP BY p.EmployeeNumber, e.Name
)
SELECT *
FROM SalaryBreakdown
WHERE OtherComponents�<�BasicAmount;