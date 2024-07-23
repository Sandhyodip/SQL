-- Commit command is used to save all the transactions to the database.
START TRANSACTION; -- IN SOME CASES BEGIN TRANSACTION;
DELETE FROM CUSTOMERS WHERE AGE = 25;  
COMMIT;  

START TRANSACTION;
INSERT INTO `employee_table` (`id`,`name`,`email`) VALUES (6,'Sandhyodip','sdas@gmail.com'),(7,'Sanchari','sghosh@gmail.com');
COMMIT;

-- Rollback command is used to undo transactions that have not already been saved to the database.
START TRANSACTION; -- IN SOME CASES BEGIN TRANSACTION;
DELETE FROM CUSTOMERS WHERE AGE = 25;  
ROLLBACK;  

START TRANSACTION;
INSERT INTO `employee_table` (`id`,`name`,`email`) VALUES (6,'Sandhyodip','sdas@gmail.com'),(7,'Sanchari','sghosh@gmail.com');
ROLLBACK;

-- SAVEPOINT is used to roll the transaction back to a certain point without rolling back the entire transaction.

START TRANSACTION;
INSERT INTO `employee_table` (`id`,`name`,`email`) VALUES (6,'Sandhyodip','sdas@gmail.com'); -- EXECUTED
SAVEPOINT First_Save_Point;
DELETE FROM `employee_table` WHERE `id`=5; -- EXECUTED
SAVEPOINT Second_Save_Point;
DELETE FROM `employee_table` WHERE `id`=4; -- NOT EXECUTED i.e. ROLLED BACK
ROLLBACK TO Second_Save_Point;
INSERT INTO `employee_table` (`id`,`name`,`email`) VALUES (7,'Sanchari','sghosh@gmail.com'); -- EXECUTED
COMMIT;

-- Example of normal Transaction
START TRANSACTION;
UPDATE `employee_table` SET balance = balance - 8000 WHERE id = '6' AND `name` LIKE '%Sandhyodip%';
UPDATE `employee_table` SET balance = balance + 8000 WHERE id = '7' AND `name` LIKE '%Sanchari%';
COMMIT;
ROLLBACK;

-- Example of Isolation (I of ACID property) in Transaction
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
-- Transaction 1
UPDATE `employee_table` SET balance = balance - 8000 WHERE id = '7' AND `name` LIKE '%Sanchari%';
UPDATE `employee_table` SET balance = balance + 8000 WHERE id = '6' AND `name` LIKE '%Sandhyodip%';
COMMIT;
-- Transaction 2
UPDATE `employee_table` SET balance = balance - 3000 WHERE id = '1' AND `name` LIKE '%John%';
UPDATE `employee_table` SET balance = balance + 3000 WHERE id = '2' AND `name` LIKE '%Smith%';
COMMIT;
ROLLBACK;

