CREATE TABLE Departments (
    DeptID INT,
    Department VARCHAR(50)
);

INSERT INTO Departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Sales'),
(4,'Finance');

CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    JoinDate DATE,
    ManagerID INT
);

INSERT INTO Employees VALUES
(101,'John','HR',50000,'2022-01-15',108),
(102,'Sarah','HR',60000,'2021-03-20',108),
(103,'Mike','IT',70000,'2020-07-10',109),
(104,'David','IT',80000,'2019-09-12',109),
(105,'Emma','IT',75000,'2023-02-18',109),
(106,'Alex','Sales',55000,'2022-11-01',110),
(107,'Chris','Sales',65000,'2021-05-25',110),
(108,'Robert','HR',90000,'2018-04-01',NULL),
(109,'Sophia','IT',100000,'2017-08-15',NULL),
(110,'William','Sales',95000,'2019-01-01',NULL),
(111,'Olivia','Finance',85000,'2020-10-20',112),
(112,'James','Finance',120000,'2016-06-11',NULL);

-- Basic sql

SELECT * FROM employees                                                                              -- Display all employess
SELECT Name, Salary from employees                                                                   -- Display employee name and salary
select Name, salary from employees where Salary>75000                                                -- Display employees whose salary is more than 75000
select EmpID, name, JoinDate from employees where JoinDate>'2021-01-01'                              -- display employees who joined after 2021-01-01
select EmpID, name, department from employees where Department = 'IT'                                -- Display employees belonging to IT department
SELECT EmpID, Name, salary from employees having Salary between 40000 and 70000                      -- Display employees whose salary is between 40000 and 70000
Select * from employees where name like 'a%'                                                         -- Display employees whose name starts with 'A'
Select * from employees where name like '%n'                                                         -- Display employees whose name ends with 'n'
select* from employees where name like '%ar%'                                                        -- Display employees whose name contain 'ar'
select * from employees where department ='HR' Or department ='IT'                                   -- Display employees who belongs to either HR or IT

-- Aggregations and Group by

Select sum(Salary) from employees                                                                    -- Display total salary paid to all employees
select avg(salary) from employees                                                                    -- Display average salary of employees
select max(salary) from employees                                                                    -- Display highest salary
select min(salary) from employees                                                                    -- Display lowest salary
select count(name) from employees                                                                    -- Display total employees
Select count(name), department from employees GROUP BY Department                                    -- Display employees department-wise
Select avg(salary), department from employees GROUP BY Department                                    -- Display average salary department-wise
select max(salary), department from employees GROUP BY Department                                    -- Display highest salary department-wise
select Department, count(name) from employees group by Department having count(name)>3               -- Display departments having more than 3 employees
select department, avg(salary) from employees group by Department having avg(Salary)>70000           -- Display departments where average salary exceeds 70000

-- Subqueries

select EmpID, Name, Salary from employees where salary>(select avg(Salary) from employees)           -- Display employees earning above average salary
select EmpID, name, Salary from employees where salary=(select max(Salary) from employees)           -- Display the employee earning highest salary
select EmpID, name, salary from employees order by salary desc limit 1 offset 1
select EmpID, name, salary from employees order by salary desc group by Departments
with highest_salary as(
    select EmpID, Name,department, salary, max(salary) over(partition by Department) as max_Salary from employees
)
select Name, Salary, Department from highest_salary where Salary = max_Salary
 
-- Joins

CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers VALUES
(1,'ABC Corp','Delhi'),
(2,'XYZ Ltd','Mumbai'),
(3,'Tech Solutions','Bangalore'),
(4,'Global Traders','Pune'),
(5,'Future Systems','Chennai'),
(6,'Prime Enterprises','Hyderabad');

CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(1001,1,'2024-01-15',15000),
(1002,2,'2024-01-20',25000),
(1003,1,'2024-02-10',18000),
(1004,3,'2024-02-18',35000),
(1005,4,'2024-03-05',12000),
(1006,2,'2024-03-10',40000),
(1007,1,'2024-04-01',30000),
(1008,5,'2024-04-15',45000),
(1009,3,'2024-05-02',28000),
(1010,2,'2024-05-20',50000);

select c.CustomerName, sum(o.Amount) from Orders o inner join Customers c on o.CustomerID = c.CustomerID GROUP BY c.customername                                -- Display customer name along wih the order amount
select c.CustomerID, c.CustomerName, o.OrderID from orders o inner join Customers c on o.CustomerID = c.CustomerID                                              -- Display all orders with customer details
select c.CustomerName from Customers c left join Orders o on o.CustomerID = c.CustomerID                                                                        -- Display customers who have never placed an order
select c.customername, c.CustomerID from customers c left join orders o on c.CustomerID = o.CustomerID                                                          -- Display all customers regardless of whether they placed an order
-- select c.CustomerID, c.CustomerName, o.OrderID from Customers c right join Orders o on c.customerID = o.customerID                                           -- Display all orders even if customer details are missing
