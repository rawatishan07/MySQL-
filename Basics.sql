CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30)
);

INSERT INTO employees (emp_id, name, department, salary, city) VALUES
(1, 'Aman', 'IT', 55000, 'Delhi'),
(2, 'Priya', 'HR', 48000, 'Mumbai'),
(3, 'Rohit', 'Finance', 62000, 'Pune'),
(4, 'Neha', 'IT', 75000, 'Delhi'),
(5, 'Karan', 'Sales', 45000, 'Jaipur'),
(6, 'Simran', 'Marketing', 52000, 'Mumbai'),
(7, 'Vikas', 'IT', 68000, 'Bangalore'),
(8, 'Anjali', 'HR', 51000, 'Delhi'),
(9, 'Mohit', 'Finance', 70000, 'Pune'),
(10, 'Pooja', 'Sales', 47000, 'Chandigarh'),
(11, 'Rahul', 'IT', 82000, 'Delhi'),
(12, 'Sneha', 'Marketing', 59000, 'Mumbai'),
(13, 'Arjun', 'Finance', 65000, 'Bangalore'),
(14, 'Riya', 'HR', 49000, 'Pune'),
(15, 'Deepak', 'Sales', 53000, 'Delhi'),
(16, 'Meera', 'IT', 72000, 'Jaipur'),
(17, 'Nitin', 'Marketing', 61000, 'Mumbai'),
(18, 'Kavya', 'Finance', 78000, 'Bangalore'),
(19, 'Saurabh', 'HR', 52000, 'Delhi'),
(20, 'Isha', 'Sales', 56000, 'Pune'),
(21, 'Manish', 'IT', 88000, 'Mumbai'),
(22, 'Divya', 'Finance', 69000, 'Delhi'),
(23, 'Akash', 'Marketing', 54000, 'Jaipur'),
(24, 'Shreya', 'HR', 50000, 'Bangalore'),
(25, 'Harsh', 'Sales', 62000, 'Mumbai'),
(26, 'Aditi', 'IT', 77000, 'Delhi'),
(27, 'Yash', 'Finance', 66000, 'Pune'),
(28, 'Tanvi', 'Marketing', 58000, 'Chandigarh'),
(29, 'Gaurav', 'HR', 47000, 'Jaipur'),
(30, 'Nisha', 'Sales', 51000, 'Delhi'),
(31, 'Abhishek', 'IT', 95000, 'Bangalore'),
(32, 'Payal', 'Finance', 73000, 'Mumbai'),
(33, 'Varun', 'Marketing', 64000, 'Delhi'),
(34, 'Komal', 'HR', 55000, 'Pune'),
(35, 'Rakesh', 'Sales', 60000, 'Jaipur'),
(36, 'Tanya', 'IT', 81000, 'Mumbai'),
(37, 'Sachin', 'Finance', 67000, 'Delhi'),
(38, 'Muskan', 'Marketing', 53000, 'Bangalore'),
(39, 'Naveen', 'HR', 49000, 'Chandigarh'),
(40, 'Bhavna', 'Sales', 58000, 'Mumbai'),
(41, 'Ajay', 'IT', 70000, 'Delhi'),
(42, 'Kirti', 'Finance', 76000, 'Pune'),
(43, 'Tarun', 'Marketing', 62000, 'Jaipur'),
(44, 'Ritu', 'HR', 51000, 'Delhi'),
(45, 'Hemant', 'Sales', 65000, 'Bangalore'),
(46, 'Shruti', 'IT', 87000, 'Mumbai'),
(47, 'Vivek', 'Finance', 71000, 'Delhi'),
(48, 'Monika', 'Marketing', 56000, 'Pune'),
(49, 'Lokesh', 'HR', 54000, 'Jaipur'),
(50, 'Sakshi', 'Sales', 59000, 'Chandigarh');

SELECT * FROM employees;                                                                                                -- Display all employee records
SELECT name, salary from employees;                                                                                     -- Display only employee names and salary
select * FROM employees where salary > 50000                                                                            -- Display employee whose salary is greater than 50,000
select * from employees where city = "Delhi" or city = "Mumbai"                                                         -- Display employee whose city is either Delhi or Mumbai 
select * from employees where department = "IT"                                                                         -- Display employee who belogs to IT Department
select * from employees ORDER BY salary desc limit 5                                                                    -- Display the top 5 highest paid employee
select count(emp_id) from employees                                                                                     -- Count the total numberof employees
select max(salary), min(salary), avg(salary) from employees                                                             -- Display the maximum, minimum and average salary
select count(emp_id), department from employees group by department                                                     -- Count employee department wise
select department,count(emp_id) as employee_count from employees GROUP BY department HAVING count(emp_id) >10           -- Display department having more than 10 employees
select department, sum(salary) from employees GROUP BY department                                                       -- Display the total salary paid in each department
select department, avg(salary) from employees group by department having avg(salary)>60000                              -- Display the department whose average salary is above 60,000
select * from employees order by salary DESC limit 1 offset 1                                                           -- Find the second highest salary
select * from employees order by salary desc limit 1 offset 2                                                           -- Find the third highest salary
select * from employees where salary>(select avg(salary) from employees)                                                -- Employees having salary more than average salary
select * from employees e where salary = (select max(salary) from employees where department = e.department)            -- Find employee earning the highest salary in their department
select department, avg(salary) as avg_salary from employees group by department ORDER by avg_salary                     -- Display department ordered by average salary
select name, count(name) from employees group by name HAVING count(name)>1                                              -- Display duplicate name employees
select * from employees where name like 'a%'                                                                            -- Display names of employee whose names starts with letter 'A'