CREATE DATABASE startersql; -- create database and click right button and click set as default schema  --
USE startersql; -- use data dabe which you create 

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

select * from users; -- to check the table or show (* means all )

select id ,email from users; -- show only id and email

-- if we want to drop/delete (entire database) then run this query 
-- DROP DATABASE startersql;

-- if we want to rename the table then 
-- RENAME TABLE users to customers ;

-- ALTER TABLE -to modify table 
ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
select * from users;

ALTER TABLE users DROP COLUMN is_active; -- ( if we want delete)

ALTER TABLE users MODIFY COLUMN name VARCHAR(150); -- modify column type
select * from users;

-- Move a Column to the First Position
ALTER TABLE users MODIFY COLUMN email VARCHAR(100) FIRST;
select * from users;

-- To move a column after another column (e.g., move gender after name ):
ALTER TABLE users MODIFY COLUMN gender ENUM('Male', 'Female', 'Other') AFTER name ;
select * from users;


