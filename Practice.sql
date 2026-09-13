CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    hire_date DATE
);

INSERT INTO employees
(employee_id, name, age, department, salary, city, hire_date)
VALUES
(101, 'Rahul', 24, 'IT', 45000, 'Delhi', '2021-06-15'),
(102, 'Priya', 29, 'Sales', 55000, 'Mumbai', '2019-03-10'),
(103, 'Aman', 32, 'HR', 62000, 'Delhi', '2022-01-20'),
(104, 'Neha', 27, 'Sales', 48000, 'Bangalore', '2021-08-05'),
(105, 'Rohit', 35, 'IT', 75000, 'Mumbai', '2018-11-12'),
(106, 'Anjali', 31, 'Finance', 68000, 'Delhi', '2023-02-18'),
(107, 'Karan', 26, 'Sales', 52000, 'Pune', '2022-07-11'),
(108, 'Simran', 28, 'HR', 58000, 'Bangalore', '2020-05-25'),
(109, 'Arjun', 36, 'IT', 82000, 'Delhi', '2017-09-01'),
(110, 'Pooja', 25, 'Finance', 61000, 'Mumbai', '2021-12-03'),
(111, 'Vikram', 30, 'Sales', 70000, 'Delhi', '2023-04-15'),
(112, 'Riya', 33, 'HR', 65000, 'Pune', '2022-09-19'),
(113, 'Mohit', 29, 'IT', 59000, 'Mumbai', '2024-01-10'),
(114, 'Tanya', 27, 'Finance', 73000, 'Bangalore', '2019-06-22'),
(115, 'Varun', 34, 'Sales', 90000, 'Delhi', '2024-03-12');

SELECT employee_id, NAME, SALARY FROM employees WHERE salary>50000                                                            --Find all employees earning more than 50,000.
SELECT employee_id, NAME, SALARY, DEPARTMENT FROM employees WHERE department = "Sales"                                        --Find all employees in the 'Sales' department.
SELECT employee_id, NAME, SALARY, DEPARTMENT, AGE FROM employees WHERE AGE <= 35 AND AGE >=25                                 --Find all employees aged between 25 and 35.
SELECT employee_id, name, salary from employees ORDER BY salary desc                                                          --List all employees sorted by salary, highest first.
SELECT employee_id, name, department, salary from employees ORDER BY salary desc limit 5                                      --Find the top 5 highest-paid employees.
select count(employee_id) from employees                                                                                      --Find the total number of employees.
select avg(salary) from employees                                                                                             --Find the average salary across the company.
select count(employee_id) as Total_Employees, department from employees GROUP BY department order by Total_Employees desc     --Find the number of employees in each department.
select avg(salary) as Average_Salary, department from employees GROUP BY department order by Average_Salary desc              --Find the average salary in each department.
SELECT COUNT(employee_id) as Total_Employees, department from employees GROUP BY department having Total_Employees>=3



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    employee_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO orders
(order_id, employee_id, product, amount, order_date)
VALUES
(1001, 102, 'Laptop', 750, '2024-01-05'),
(1002, 105, 'Mouse', 250, '2024-01-08'),
(1003, 107, 'Laptop', 1200, '2024-01-10'),
(1004, 103, 'Keyboard', 450, '2024-01-12'),
(1005, 104, 'Laptop', 650, '2024-01-15'),
(1006, 111, 'Monitor', 900, '2024-01-18'),
(1007, 115, 'Laptop', 1500, '2024-01-20'),
(1008, 106, 'Keyboard', 300, '2024-01-22'),
(1009, 109, 'Laptop', 850, '2024-01-25'),
(1010, 110, 'Mouse', 200, '2024-01-28'),
(1011, 102, 'Monitor', 1100, '2024-02-02'),
(1012, 107, 'Keyboard', 550, '2024-02-05'),
(1013, 113, 'Laptop', 700, '2024-02-10'),
(1014, 114, 'Monitor', 950, '2024-02-14'),
(1015, 111, 'Laptop', 1300, '2024-02-18'),
(1016, 115, 'Mouse', 350, '2024-02-20'),
(1017, 103, 'Laptop', 900, '2024-02-25'),
(1018, 106, 'Monitor', 1250, '2024-03-01'),
(1019, 104, 'Keyboard', 400, '2024-03-05'),
(1020, 109, 'Laptop', 1400, '2024-03-10');

SELECT product, amount FROM orders WHERE product = "Laptop" and amount>500                                                    --Find all orders for 'Laptop' where the amount is greater than 500.
SELECT order_id, product, order_date from orders ORDER BY order_date asc                                                      --List all orders sorted by order date (oldest first)
SELECT order_id, product, amount from orders order BY amount desc                                                             --List all orders sorted by amount (highest first).
select max(amount) as Highest_Amount, min(amount) as Lowest_Amount from orders                                                --Find the highest and lowest order amount.
select sum(amount) as Total_Revenue from orders                                                                               --Find the total revenue from all orders.
select sum(amount) as Total_Sales, product from orders group BY product order by Total_Sales desc                             --Find the total sales amount for each product.
select E.employee_id, E.name, count(O.order_id), count(O.product) from orders O left join employees E on O.employee_id = E.employee_id GROUP BY E.employee_id, E.name
select E.city, sum(O.amount) from orders O left join employees E on E.employee_id = O.employee_id GROUP BY E.city
