use startersql;

CREATE TABLE IF NOT EXISTS customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
INSERT INTO customers VALUES (1, 'Alice', 'alice@example.com', 'Female', '1995-05-14', DEFAULT);
select * from customers ;
-- ---------------------------------------------------------------------------------------------------------

INSERT INTO users (name, email, gender, date_of_birth) VALUES
('Bob', 'bob@example.com', 'Male', '1990-11-23');
select * from users;
-- ---------------------------------------------------------------------------------------------------------

INSERT INTO users (name, email, gender, date_of_birth) VALUES
('Charlie', 'charlie@example.com', 'Other', '1988-02-17'),
('David', 'david@example.com', 'Male', '2000-08-09'),
('Eva', 'eva@example.com', 'Female', '1993-12-30');
select * from users;

-- ---------------------------------------------------------------------------------------------------------------------------
INSERT INTO customers (name, email, gender, date_of_birth) VALUES
('Charlie', 'charlie@example.com', 'Other', '1988-02-17'),
('David', 'david@example.com', 'Male', '2000-08-09'),
('Eva', 'eva@example.com', 'Female', '1993-12-30');
select * from customers;

-- -------------------------------------------------------------------------------------------------------

INSERT INTO customers (name, email, gender, date_of_birth) VALUES
('John', 'john@example.com', 'Male', '1992-03-15'),
('Sophia', 'sophia@example.com', 'Female', '1996-07-21'),
('Michael', 'michael@example.com', 'Male', '1990-11-09'),
('Emma', 'emma@example.com', 'Female', '1994-02-18'),
('Daniel', 'daniel@example.com', 'Male', '1991-09-27'),
('Olivia', 'olivia@example.com', 'Female', '1997-05-12'),
('Dev', 'devd@example.com', 'Male', '1989-12-03'),
('Isabella', 'isabella@example.com', 'Female', '1995-08-25'),
('James', 'james@example.com', 'Male', '1993-04-14'),
('Mia', 'mia@example.com', 'Female', '1998-10-06');
select * from customers;
-- -------------------------------------------------------------------------------------------------------

