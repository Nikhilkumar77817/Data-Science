use startersql;
CREATE TABLE IF NOT EXISTS employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary float,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO employees (name, email, gender, date_of_birth,salary) VALUES
('Aarav', 'aarav@example.com', 'Male', '1992-03-15',65000.00),
('Vivaan', 'vivaan@example.com', 'Male', '1994-06-21',72000.00),
('Aditya', 'aditya@example.com', 'Male', '1991-09-10',68000.00),
('Vihaan', 'vihaan@example.com', 'Male', '1993-12-05',71000.00),
('Arjun', 'arjun@example.com', 'Male', '1990-01-18',80000.00),
('Reyansh', 'reyansh@example.com', 'Male', '1995-07-11',62000.00),
('Ayaan', 'ayaan@example.com', 'Male', '1992-11-23',64000.00),
('Krishna', 'krishna@example.com', 'Male', '1993-04-30',69000.00),
('Ishaan', 'ishaan@example.com', 'Male', '1996-02-14',61000.00),
('Shaurya', 'shaurya@example.com', 'Male', '1994-08-19',70000.00),

('Ananya', 'ananya@example.com', 'Female', '1993-05-17',66000.00),
('Diya', 'diya@example.com', 'Female', '1995-03-28',64000.00),
('Saanvi', 'saanvi@example.com', 'Female', '1992-10-09',73000.00),
('Myra', 'myra@example.com', 'Female', '1994-12-21',71000.00),
('Aadhya', 'aadhya@example.com', 'Female', '1996-01-15',60000.00),
('Kiara', 'kiara@example.com', 'Female', '1993-07-04',69000.00),
('Riya', 'riya@example.com', 'Female', '1991-09-25',75000.00),
('Sara', 'sara@example.com', 'Female', '1995-11-30',62000.00),
('Meera', 'meera@example.com', 'Female', '1992-06-13',68000.00),
('Ira', 'ira@example.com', 'Female', '1994-04-22',67000.00),

('Kabir', 'kabir@example.com', 'Male', '1990-03-12',82000.00),
('Rohan', 'rohan@example.com', 'Male', '1993-09-07',67000.00),
('Aryan', 'aryan@example.com', 'Male', '1995-05-19',64000.00),
('Kunal', 'kunal@example.com', 'Male', '1992-08-26',71000.00),
('Dev', 'dev@example.com', 'Male', '1994-02-03',69000.00),

('Pooja', 'pooja@example.com', 'Female', '1993-01-29',65000.00),
('Neha', 'neha@example.com', 'Female', '1995-07-18',63000.00),
('Kavya', 'kavya@example.com', 'Female', '1992-11-02',72000.00),
('Sneha', 'sneha@example.com', 'Female', '1994-06-14',68000.00),
('Tanya', 'tanya@example.com', 'Female', '1996-10-05',61000.00);

-- select * from employees
-- select name,gender from employees;
-- select * from employees where gender = "Female" ;
-- gender , name from employees where gender = "Female" ;
-- select * from employees where date_of_birth < '1990-09-09';
-- select * from employees where salary > 70000;
-- select * from employees where salary between 70000 and 80000;
-- select * from employees where salary in (80000) ;
-- select * from employees where gender='Female' and salary > '70000';
-- select * from employees where gender='Female' and salary > '60000' order by date_of_birth asc;
-- select * from employees where gender='Female' and salary > '60000' order by date_of_birth asc limit 5; -- (give top 5)
-- select * from employees where gender='Female' and salary > '60000'  limit 5;
-- SELECT * FROM employees WHERE name LIKE 'S%';-- Starts with A
-- SELECT * FROM employees WHERE name LIKE '%a';-- Ends with a
-- SELECT * FROM employees WHERE name LIKE '%er%';-- Contains 'er'
-- SELECT * FROM employees WHERE name LIKE '%ar%'; -- Contains 'ar'
-- select * from employees  order by  salary asc limit 5 ; -- ( give top five salary) 

-- select name ,gender,salary from employees  order by  salary desc limit 10; -- (name or gender ke saath salary in desending order)

-- select * from employees  order by  salary desc limit 1; -- (give highest salary) if write limit 2 then give top 2 highest salary
-- select * from employees  order by  salary desc limit 2,5; -- ( highest salary between 2 to 5)

-- ----------------------------------UPDATE --in data -----------------------------------------
-- UPDATE employees set salary = 45000 where id = 3 ;
-- select * from employees;

-- UPDATE employees set salary = 45000,email='aditya78@gmail.com' where id = 3 ;
-- select * from employees;

-- UPDATE employees SET name = 'aditya Kumar', email = 'adityakumar78@gmail.com' WHERE id = 3;
-- select * from employees;



-- UPDATE employees SET name = 'Arjun Singh'where  email = 'arjun@example.com' ;
-- select * from employees;

-- UPDATE employees SET salary = salary + 10000 where salary < 65000 AND id > 0 ; -- (hame primary key add krni padegi becz we are using safe updare mode jo ki id hai )
-- select * from employees;

-- ----------------------------------DELETION---------------------------------------------------------
-- DELETE statement removes rows from a table.

-- DELETE  from employees where salary <70000 and id > 0;
-- select * from employees;
-- DELETE  from employees where id = 3; ( do not run )
-- DROP table employees; (do not run otherwise employees table get deleted completely)

-- ------------------------------------ALTER --------------------------------------------
-- select * from users;
-- ALTER TABLE users ADD salary float;
-- UPDATE users SET salary = 50000 where  id > 0; 
-- select * from users ;

-- ALTER TABLE users DROP COLUMN created_at ; -- ( delete column created at)
-- select* from users ;

-- ALTER TABLE user RENAME TO staff; -- ( not run )
-- ALTER TABLE users RENAME COLUMN name TO employee_name; -- ( not run)

-- ALTER TABLE users MODIFY salary DECIMAL(10,2);
-- select * from users ;

-- ALTER TABLE users ADD (city CHAR(50), department VARCHAR(50));
-- select * from users ;

-- ALTER TABLE users DROP COLUMN city;
-- ALTER TABLE users DROP COLUMN age;

-- UPDATE users SET department= 'IT' where  id > 0;
-- select * from users ;

-- UPDATE users SET location = 'Delhi', current_age = 24 WHERE id > 0;
-- select * from users ;
-- alter table users add constraint chk_dob check (date_of_birth > '1800-09-08');

-- insert into users (name,gender,email,date_of_birth,salary,department,location,current_age) values
--  ('akio','Male','akio44@gmail.com','1999-09-08',50000.00,'IT','Delhi',24 ); 

--  insert into users (name,gender,email,date_of_birth,salary,department,location,current_age) values
--  ('nikhil','Male','nikhil44@gmail.com','2005-09-08',150000.00,'IT','Noida',20 );
 
-- ===========================SQL==Function================================================================================

select * from employees;
SELECT COUNT(*) FROM users; -- 6
SELECT COUNT(*) FROM employees; -- 19

SELECT COUNT(*) FROM employees WHERE gender = 'Female';

SELECT COUNT(*) as total_counts FROM employees group by gender;

SELECT SUM(salary) AS total_payroll FROM employees;

SELECT gender, AVG(salary) AS avg_salary FROM users GROUP BY gender;

SELECT name, LENGTH(name) AS name_length FROM employees;

-- SELECT name, LOWER(name) AS lowercase_name FROM users; (not run )
SELECT name, UPPER(name) AS uppercase_name FROM users;
select * from employees;

SELECT CONCAT(name, ' <', email, '>') AS user_contact FROM users;
SELECT CONCAT(name, ' <', email, '>') AS user_contact FROM employees;

SELECT name, YEAR(date_of_birth) AS birth_year FROM users;
SELECT name, YEAR(date_of_birth) AS birth_year FROM employees;

SELECT name, DATEDIFF(CURDATE(), date_of_birth) AS days_lived FROM users;
SELECT name, DATEDIFF(CURDATE(), date_of_birth) AS days_lived FROM employees;

SELECT salary,
       ROUND(salary,2) AS rounded,
       FLOOR(salary) AS floored,
       CEIL(salary) AS ceiled
FROM employees;

SELECT name, gender,
       IF(gender ='Female','Yes','No') AS is_female
FROM employees;

SELECT id, MOD(id, 2) AS remainder FROM employees;

-- ==================================================================================================================





