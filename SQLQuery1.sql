-- First create MANAGER table without department_name (to avoid circular reference)
CREATE TABLE MANAGER (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(50),
    reports_to INT NULL,
    FOREIGN KEY (reports_to) REFERENCES MANAGER(manager_id)
);


-- Then create Department table
CREATE TABLE Department (
    department_name VARCHAR(50) PRIMARY KEY,
    manager_id INT UNIQUE,
    FOREIGN KEY (manager_id) REFERENCES MANAGER(manager_id)
);

-- Then create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    salary INT,  -- Changed to INT for better data type
    department_name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (department_name) REFERENCES Department(department_name),
    FOREIGN KEY (manager_id) REFERENCES MANAGER(manager_id)
);

-- 1. Insert Managers first (no department_name needed)
INSERT INTO MANAGER (manager_id, manager_name, reports_to) VALUES
(1, 'Alice Johnson', NULL),
(2, 'Bob Smith', 1),
(3, 'Carol Williams', 1),
(4, 'David Brown', 2),
(5, 'Emily Davis', 2);

-- 2. Then Insert Departments
INSERT INTO Department (department_name, manager_id) VALUES
('IT', 1),
('HR', 2),
('Finance', 3),
('Marketing', 4),
('Operations', 5);

-- 3. Finally Insert Employees
INSERT INTO Employee (employee_id, first_name, salary, department_name, manager_id) VALUES
(1, 'John', 60000, 'IT', 1),
(2, 'Jane', 55000, 'HR', 2),
(3, 'Mike', 75000, 'IT', 1),
(4, 'Sarah', 65000, 'Finance', 3),
(5, 'David', 50000, 'Marketing', 4),
(6, 'Emily', 70000, 'Operations', 5),
(7, 'Robert', 80000, 'IT', 1),
(8, 'Lisa', 58000, 'HR', 2);