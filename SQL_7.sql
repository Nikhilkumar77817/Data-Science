-- check autocommit on or off ( select @@autocommit;
create database Prime;
use prime;

create table account(
id int primary key auto_increment,
name varchar(50),
balance decimal(10,2)
);

INSERT INTO account (name, balance) VALUES
('Rahul', 5000.50),
('Amit', 12000.00),
('Neha', 8500.75),
('Priya', 15000.00),
('Rohit', 4300.20),
('Anjali', 9200.60),
('Vikas', 11000.00),
('Pooja', 7600.45),
('Arjun', 9800.90),
('Sneha', 13400.00);
select * from account;
start transaction;
update account set balance = balance - 50 where id = 1;

update account set balance = balance + 50 where id = 3;
commit;
select * from account;
-- ==============================================================

start transaction;
update account set balance = balance - 900 where id = 1;

update account set balance = balance + 400 where id = 3;
rollback;
select * from account;
-- ==================================================
-- save point 
start transaction;
update account set balance = balance + 1000 where id = 1;
savepoint after_wallet_topup;
update account set balance = balance + 100  where id = 1;
rollback to after_wallet_topup;
commit;
select * from account;
-- ====================joins=======================================

create table customer(
customer_id int primary key ,
name varchar(50),
city varchar(50)
);
insert into customer values
(1,'alice','mumbai'),
(2,'bob','delhi'),
(3,'charlie','kolkata'),
(4,'david','mumbai');

select * from customer;

create table orders(
order_id int primary key,
customer_id int,
amount int
);
insert into orders values
(101,1,500),
(102,1,900),
(103,2,300),
(104,5,700);
select * from orders;

-- ====inner join=========
select * from customer c inner join orders o
on c.customer_id  = o.customer_id;

select c.customer_id,o.order_id,c.name from 
customer c inner join orders o
on c.customer_id  = o.customer_id;

-- ====left join=========
select * from customer c left join orders o
on c.customer_id  = o.customer_id;

-- ====right join=========
select * from customer c right join orders o
on c.customer_id  = o.customer_id; 

-- ====full join=========
SELECT *
FROM customer c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

UNION

SELECT *
FROM customer c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- ====cross join=========
select * from customer c cross join orders o
on c.customer_id  = o.customer_id; 

SELECT * FROM customer
CROSS JOIN orders;
-- ========self join==============================
select * from customer as A
join customer as B
on A.customer_id = B.customer_id; -- jo table hai wahi same dega

-- ========exclusive join==============================
SELECT *
FROM customer c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

UNION

SELECT *
FROM customer c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- ====cross join=========
select * from customer c cross join orders o
on c.customer_id  = o.customer_id; 

SELECT * FROM customer
CROSS JOIN orders;
-- ========exclusive join==============================
-- left exclusive join

select * from customer as A
left join orders as B
on A.customer_id = B.customer_id
where B.customer_id is null;

-- right exclusive join
select * from customer as A
right join orders as B
on A.customer_id = B.customer_id
where A.customer_id is null;

-- ========================sub query================
select * from orders where amount > (select avg(amount) from orders);

select name ,
( select count(*) from orders o where o.customer_id= c.customer_id)
as order_count
from customer c;

select
	summary.customer_id,
    summary.avg_amount
from
	(
		select customer_id, avg(amount) as avg_amount
        from orders group by customer_id)
        as summary;
 
-- ================view=========================
CREATE VIEW view1 AS
SELECT customer_id, name FROM customer;

SELECT * FROM view1;

-- if we want drop view ( drop  VIEW view1  )

CREATE VIEW view2 AS 
SELECT c.customer_id, c.name, o.order_id 
FROM customer c 
INNER JOIN orders o  
ON c.customer_id = o.customer_id;
SELECT * FROM view2; 

-- =======================================
SET SQL_SAFE_UPDATES = 0; -- ham update kar sakte hai nahi karna to 1 likho

select * from account;
ALTER TABLE account ADD branch varchar(50);
update account set branch = 'delhi' where id >=1;
update account set branch = 'mumbai' where  id % 2 = 0;
update account set branch = 'bangalore' where  id % 3 = 0; 

create index idx_branch on account(branch);
show index from account;
-- drop index idx_2 on account;

select * from account where branch = "delhi";

create index idx_2 on account(branch,balance);


DELIMITER $$
create  procedure check_balance (in acc_id int)
begin
	select balance from account where id = acc_id;
end $$
DELIMITER ;

CALL check_balance(4);


