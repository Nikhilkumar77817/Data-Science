use startersql;
select* from users;
-- ---------------Transactions and AutoCommit----------------------------------------
set autocommit = 0; -- isko likhne se hame jo bhi changes karenge wo save nahi honge jab tak ham COMMIT na likh de
select * from users;
delete from users where id =10;
Select * from users;
rollback; -- delete ki hui wapas aa jati hai
Select * from users;
-- ---------------------------------------------------------
-- ------------------------------------------------------------
CREATE TABLE workers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    current_age INT ,
    department varchar(50),
    salary DECIMAL(10,2)
);
INSERT INTO workers (name, email, gender, date_of_birth, current_age, department, salary) VALUES
('Rahul Sharma','rahul1@gmail.com','Male','1998-05-10',27,'IT',55000.50),
('Amit Verma','amit2@gmail.com','Male','1996-08-15',29,'HR',48000.00),
('Neha Gupta','neha3@gmail.com','Female','1999-03-22',26,'Finance',52000.75),
('Pooja Singh','pooja4@gmail.com','Female','1997-11-12',28,'Marketing',50000.00),
('Rohit Kumar','rohit5@gmail.com','Male','1995-07-05',30,'IT',62000.25),
('Ankit Mishra','ankit6@gmail.com','Male','1998-09-18',27,'Sales',45000.00),
('Sneha Agarwal','sneha7@gmail.com','Female','2000-01-20',25,'HR',42000.80),
('Vikas Yadav','vikas8@gmail.com','Male','1994-12-11',31,'Finance',65000.90),
('Priya Kapoor','priya9@gmail.com','Female','1999-06-14',26,'Marketing',48000.00),
('Arjun Patel','arjun10@gmail.com','Male','1997-04-09',28,'IT',57000.10),

('Kavita Joshi','kavita11@gmail.com','Female','1996-02-17',29,'Sales',46000.00),
('Deepak Singh','deepak12@gmail.com','Male','1993-10-30',32,'Finance',70000.50),
('Riya Malhotra','riya13@gmail.com','Female','2001-08-05',24,'HR',41000.00),
('Sandeep Kumar','sandeep14@gmail.com','Male','1998-12-25',27,'IT',59000.00),
('Meena Devi','meena15@gmail.com','Female','1995-05-19',30,'Marketing',51000.00),
('Karan Mehta','karan16@gmail.com','Male','1997-03-07',28,'Sales',47000.00),
('Nisha Jain','nisha17@gmail.com','Female','1999-09-23',26,'Finance',53000.60),
('Manoj Tiwari','manoj18@gmail.com','Male','1994-11-14',31,'IT',64000.00),
('Simran Kaur','simran19@gmail.com','Female','2000-04-28',25,'HR',43000.00),
('Rakesh Das','rakesh20@gmail.com','Male','1996-07-02',29,'Sales',46000.30),

('Pankaj Sharma','pankaj21@gmail.com','Male','1993-01-16',32,'Finance',72000.00),
('Alok Pandey','alok22@gmail.com','Male','1998-10-21',27,'IT',58000.00),
('Divya Sinha','divya23@gmail.com','Female','1999-12-03',26,'Marketing',49500.00),
('Shweta Roy','shweta24@gmail.com','Female','2001-02-11',24,'HR',40000.00),
('Varun Khanna','varun25@gmail.com','Male','1995-06-30',30,'Sales',47500.00),
('Anjali Gupta','anjali26@gmail.com','Female','1997-09-09',28,'Finance',54000.00),
('Tarun Bansal','tarun27@gmail.com','Male','1994-03-18',31,'IT',66000.00),
('Komal Arora','komal28@gmail.com','Female','2000-07-07',25,'Marketing',45000.00),
('Yash Thakur','yash29@gmail.com','Male','1998-01-29',27,'Sales',47000.00),
('Ritu Saxena','ritu30@gmail.com','Female','1996-05-13',29,'HR',44000.00);

select * from workers;


select * from workers order by salary  desc ;
select salary from workers order by salary desc limit 1,1 ; -- ( [2,1] for 3rd highest salary// [3,1] for 4th highest salary
select distinct salary from workers order by salary desc limit 1 offset 2; -- 3rd highest salary offset meanns skip first 2
select distinct salary from workers order by salary desc limit 1 offset 1 ; -- 2nd highest salary
select distinct salary from workers order by salary desc limit 1 ;
select max(salary) from workers where salary <( select max(salary) from workers) ; -- 2nd highest salary
select * from workers where salary > (select avg(salary) from workers);
select department ,count(*) from workers group by department;
select * from workers where name like 'a%' ;

SET autocommit = 0;
select * from workers;
delete from workers where id =36;
select * from workers;
rollback;
select * from workers;
-- --------------------------------------------------
SET autocommit = 0;
select * from workers;
delete from workers where id =36;
select * from workers;
commit;
select * from workers;
-- ----------------------------
set autocommit=0;
select * from workers;
UPDATE workers SET salary = 80000 WHERE id = 51;
select * from workers;
commit;
select * from workers;
rollback; -- there is no benefit of rollback because commit have done . 
select * from workers;

SET autocommit = 1; -- jaisa pehle tha waisa hi kar dena hai

-- =======================================================================================================================================

create table addresses(
id int auto_increment primary key,
workers_id int,
street varchar(255),
city varchar(100),
state varchar(100),
pincode varchar(10),
constraint fk_user foreign key (workers_id) references workers(id) on delete cascade -- yani jab worker table me delete karenge to isme bhi delete ho jaygi
);

INSERT INTO addresses (workers_id, street, city, state, pincode) VALUES
(1,'Janpath','Delhi','Delhi','110001'),
(2,'Ballygunge','Kolkata','West Bengal','700019'),
(3,'Powai','Mumbai','Maharashtra','400076'),
(4,'Connaught Place','Delhi','Delhi','110001'),
(5,'Salt Lake Sector V','Kolkata','West Bengal','700091'),
(6,'Andheri East','Mumbai','Maharashtra','400069'),
(7,'Banjara Hills','Hyderabad','Telangana','500034'),
(8,'T Nagar','Chennai','Tamil Nadu','600017'),
(9,'Sector 62','Noida','Uttar Pradesh','201309'),
(10,'Hazratganj','Lucknow','Uttar Pradesh','226001'),
(11,'Civil Lines','Prayagraj','Uttar Pradesh','211001'),
(12,'Malviya Nagar','Jaipur','Rajasthan','302017'),
(13,'Vastrapur','Ahmedabad','Gujarat','380015'),

(14,'Kothrud','Pune','Maharashtra','411038'),
(15,'Rajajinagar','Bangalore','Karnataka','560010'),
(16,'Whitefield','Bangalore','Karnataka','560066'),
(17,'Gachibowli','Hyderabad','Telangana','500032'),
(18,'Anna Nagar','Chennai','Tamil Nadu','600040'),
(19,'Dwarka Sector 21','Delhi','Delhi','110075'),
(20,'Patel Nagar','Delhi','Delhi','110008'),
(21,'Alambagh','Lucknow','Uttar Pradesh','226005'),
(22,'Indira Nagar','Lucknow','Uttar Pradesh','226016'),
(23,'Lalbagh','Bhopal','Madhya Pradesh','462001'),

(24,'MP Nagar','Bhopal','Madhya Pradesh','462011'),
(25,'Ashok Nagar','Kanpur','Uttar Pradesh','208012'),
(26,'Kidwai Nagar','Kanpur','Uttar Pradesh','208011'),
(27,'Gandhi Nagar','Jammu','Jammu & Kashmir','180004'),
(28,'Panaji Market','Panaji','Goa','403001'),
(29,'Station Road','Patna','Bihar','800001'),
(30,'Fraser Road','Patna','Bihar','800001');

select * from workers;
select * from addresses;
delete from  addresses where id = 30; -- ritu ki address id me delete hoga par worker me nahi 
delete from  workers where id = 30; -- ritu delete ho jaygi workers se aur address me se bhi

delete from  workers where id = 29; -- ye chalene se worker me delete  hogi aur addresses me bhi delete hogi

SELECT 
w.name,
a.street,
a.city,
a.state,
a.pincode
FROM workers w
INNER JOIN addresses a
ON w.id = a.workers_id;

-- if we want to drop the foreign key then 
-- ALTER TABLE addresses DROP FOREIGN KEY fk_user;

-- ===========================joins=======================================================================













