use startersql;
CREATE TABLE customers1 (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
city VARCHAR(50)
);

INSERT INTO customers1 (name, city) VALUES
('Rahul','Delhi'),
('Amit','Mumbai'),
('Neha','Bangalore'),
('Priya','Kolkata'),
('Arjun','Chennai');


CREATE TABLE orders1 (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
product VARCHAR(50),
amount DECIMAL(10,2)
);

INSERT INTO orders1 (customer_id, product, amount) VALUES
(1,'Laptop',75000),
(1,'Mouse',500),
(2,'Mobile',20000),
(3,'Tablet',15000),
(3,'Keyboard',1200),
(4,'Monitor',10000);

select * from customers1;
select * from orders1 ;

-- ------inner join------------
select  customers1.name ,customers1.city,orders1.product, orders1.amount
from customers1
inner join orders1 on customers1.customer_id = orders1.order_id ;


-- --------------left join---
SELECT c.name, o.product,c.city
FROM customers1 c
LEFT JOIN orders1 o
ON c.customer_id = o.customer_id;

-- --------------right join----------
SELECT c.customer_id,o.order_id,c.name, o.product,c.city
FROM customers1 c
RIGHT JOIN orders1 o
ON c.customer_id = o.customer_id;

-- ---------cross join----------------
SELECT c.customer_id,o.order_id,c.name, o.product,c.city
FROM customers1 c
CROSS JOIN orders1 o;

-- ----------------union(remove duplicates) and union all( keep duplicates) --------------
select name from users
Union
select name from customers1;

-- ----------------VIEW-----------------------------------
select * FROM workers;
create  view view_workers as select id,name,department,current_age from workers where salary >70000;
create  view view_workers1 as select id,name,department,current_age from workers where salary >50000;
select * FROM view_workers;
select * FROM view_workers1;

update workers set salary = 80000 where id =2;
-- if we update in original table then view me automatically update ho jayga

-- DROP VIEW view_workers;

-- --------------------idexes----------------
select * from workers;
show indexes from workers;
CREATE INDEX idx_gender_salary ON workers (gender, salary);
SELECT * FROM workers WHERE gender = 'Male' AND salary > 70000;

-- -------------------------sub queries---------------------------------