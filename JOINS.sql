CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Sales'),
(5,'Marketing'),
(6,'Operations'),
(7,'Support'),
(8,'Admin'),
(9,'Research'),
(10,'Legal'),
(11,'Cyber Security'),
(12,'Data Science');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    city VARCHAR(30),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(1,'Aman',1,55000,'Delhi'),
(2,'Priya',2,48000,'Mumbai'),
(3,'Rohit',3,62000,'Pune'),
(4,'Neha',1,75000,'Delhi'),
(5,'Karan',4,45000,'Jaipur'),
(6,'Simran',5,52000,'Mumbai'),
(7,'Vikas',1,68000,'Bangalore'),
(8,'Anjali',2,51000,'Delhi'),
(9,'Mohit',3,70000,'Pune'),
(10,'Pooja',4,47000,'Chandigarh'),
(11,'Rahul',1,82000,'Delhi'),
(12,'Sneha',5,59000,'Mumbai'),
(13,'Arjun',3,65000,'Bangalore'),
(14,'Riya',2,49000,'Pune'),
(15,'Deepak',4,53000,'Delhi'),
(16,'Meera',1,72000,'Jaipur'),
(17,'Nitin',5,61000,'Mumbai'),
(18,'Kavya',3,78000,'Bangalore'),
(19,'Saurabh',2,52000,'Delhi'),
(20,'Isha',4,56000,'Pune'),
(21,'Manish',1,88000,'Mumbai'),
(22,'Divya',3,69000,'Delhi'),
(23,'Akash',5,54000,'Jaipur'),
(24,'Shreya',2,50000,'Bangalore'),
(25,'Harsh',4,62000,'Mumbai'),
(26,'Aditi',1,77000,'Delhi'),
(27,'Yash',3,66000,'Pune'),
(28,'Tanvi',5,58000,'Chandigarh'),
(29,'Gaurav',2,47000,'Jaipur'),
(30,'Nisha',4,51000,'Delhi'),
(31,'Abhishek',1,95000,'Bangalore'),
(32,'Payal',3,73000,'Mumbai'),
(33,'Varun',5,64000,'Delhi'),
(34,'Komal',2,55000,'Pune'),
(35,'Rakesh',4,60000,'Jaipur'),
(36,'Tanya',1,81000,'Mumbai'),
(37,'Sachin',3,67000,'Delhi'),
(38,'Muskan',5,53000,'Bangalore'),
(39,'Naveen',2,49000,'Chandigarh'),
(40,'Bhavna',4,58000,'Mumbai'),
(41,'Ajay',6,70000,'Delhi'),
(42,'Kirti',7,76000,'Pune'),
(43,'Tarun',8,62000,'Jaipur'),
(44,'Ritu',9,51000,'Delhi'),
(45,'Hemant',10,65000,'Bangalore'),
(46,'Shruti',6,87000,'Mumbai'),
(47,'Vivek',7,71000,'Delhi'),
(48,'Monika',8,56000,'Pune'),
(49,'Lokesh',9,54000,'Jaipur'),
(50,'Sakshi',10,59000,'Chandigarh');

select employees.dept_id, employees.emp_name, departments.dept_name from employees inner join departments on employees.dept_id = departments.dept_id  
select departments.dept_name, count(employees.emp_id) from employees INNER JOIN departments where employees.dept_id = departments.dept_id group by departments.dept_name
