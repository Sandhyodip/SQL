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
