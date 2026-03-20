use startersql;

-- --------------------------------trigger------------------------------------
-- Trigger ek special SQL program hota hai jo automatically run hota hai jab database me koi event hota hai:
-- INSERT, UPDATE, ya DELETE
-- example = Jab koi employee delete ho, to uska record log table me save ho jaye automatically
-- Ye kaam trigger karta hai.

CREATE TABLE user_log (
id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER after_user_insert
AFTER INSERT ON workers
FOR EACH ROW
BEGIN
    INSERT INTO user_log (user_id, name)
    VALUES (NEW.id, NEW.name);
END$$
DELIMITER ;    

CALL AddUser('Ritika Jain', 'ritika@example.com', 'Female', '1996-03-12', 74000);

SELECT * FROM user_log;

-- DROP TRIGGER IF EXISTS after_user_insert;

-- ---------------------extra on sql--------------
select * from workers WHERE name LIKE '_a%';
select * from workers WHERE name LIKE '_an%';
select * from workers WHERE name LIKE '_a_i%';

SELECT * FROM workers
ORDER BY id
LIMIT 5 OFFSET 10;

SELECT DISTINCT gender FROM users;

