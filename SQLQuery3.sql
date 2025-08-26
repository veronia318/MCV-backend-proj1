SELECT * FROM Employee
SELECT salary From Employee


ALTER TABLE Employee ALTER COLUMN salary INT;

-- increase all employees 1000 pounds 
UPDATE Employee 
SET salary = salary + 1000;

-- increase every category of employees by a percentage
UPDATE Employee
SET salary = salary * 1.25
WHERE salary BETWEEN 50000 AND 59500 ;

UPDATE Employee
SET salary = salary * 1.50
WHERE salary BETWEEN 60000 AND 70000;

-- increase every Department amount of money

UPDATE Employee
SET salary = salary + 7000
WHERE department_name='IT'

UPDATE Employee
SET salary = salary + 4000
WHERE department_name='HR'

UPDATE Employee
SET salary = salary + 5000
WHERE department_name='Finance'

UPDATE Employee
SET salary = salary + 3000
WHERE department_name='Marketing'


UPDATE Employee
SET salary = salary + 2000
WHERE department_name='Operations'

-- get max salary from all employees  

SELECT * FROM Employee
SELECT MAX(salary) AS Max_salary
FROM Employee;

-- get max salary for each department 

SELECT department_name , MAX(salary) AS Max_salary_dep
FROM Employee
GROUP BY department_name
ORDER BY department_name;

-- SUM OF ALL salaries for EACH department
SELECT salary,department_name From Employee
SELECT MAX(SUM_OF_SALARIES) AS HIGHEST_SALARY_DEPARTMENT
FROM (
    SELECT SUM(salary) AS SUM_OF_SALARIES
    FROM Employee
    GROUP BY department_name
) department_totals;


     
SELECT 
    E.first_name AS Staff,
    D.department_name AS DeptName,
    E.salary AS Salary,
    M.manager_name AS ManagerName,
    SUM(E.salary) OVER (PARTITION BY D.department_name) AS DeptTotalSalary
FROM Employee E
JOIN Department D ON E.department_name = D.department_name
JOIN MANAGER M ON D.manager_id = M.manager_id
ORDER BY 
    DeptTotalSalary DESC,
    D.department_name,
    E.salary DESC;




