DELIMITER //
CREATE PROCEDURE getEmployeeDetails(
IN emp_id TEXT,
IN employee_type VARCHAR(45),
IN employee_nature VARCHAR(45)
)
BEGIN
SET @name_column='first_name';
SET @table_name='ems_profile';
SET @query= CONCAT(
'SELECT ',@name_column, ' FROM ', @table_name,' WHERE FIND_IN_SET(id, "',emp_id,'" ) > 0',
' AND employee_type= "',employee_type,'"',
' AND nature_of_employment= "',employee_nature,'"'
);
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

CALL getEmployeeDetails('1890,1138', 'Non-Teaching','Adhoc');

-- Define a variable & assign a value to that variable
DELIMITER //
CREATE PROCEDURE getValue()
BEGIN
DECLARE amount INT(10);
SET amount = 100;
SELECT amount;
END //
DELIMITER ;

CALL getValue();

SET @myName="Sandhyodip";
SELECT @myName;

SET @name = 'Sanchari';
SET @count = 10;

SELECT COUNT(*) INTO @total_users FROM `core_user`;
SET @user_count=3000;
SELECT 
    CASE 
        WHEN @user_count > @total_users THEN CONCAT('Still ',(@user_count - @total_users) ,' users required')
        ELSE 'Users limit reached'
    END AS Message;

SET @count = 10;
SELECT @count*3 AS 'Value';


DELIMITER //
CREATE PROCEDURE addMember(
IN employee_name VARCHAR (50), 
IN home_address VARCHAR (50),
IN phone_no VARCHAR (50)  
)
BEGIN
INSERT INTO `sandhyodip` (`name`,`address`,`mobile_phone_no`)
VALUES (employee_name, home_address, phone_no); 
END //  
DELIMITER ; 
CALL addMember ('Mridula Das','mridula1962@gmail.com','9330711811');

DELIMITER //
CREATE PROCEDURE addNumbers(
IN a INT(10),
IN b INT(10),
OUT result INT(10)
)
BEGIN
SET result = a+b;
END //
DELIMITER ;

CALL addNumbers(27,30,@sum);
SELECT @sum;

DELIMITER //
CREATE PROCEDURE addNumbers(
IN a INT(10),
IN b INT(10)
)
BEGIN
SET @result = a+b;
SELECT @result;
END //
DELIMITER ;

CALL addNumbers(27,30);

SHOW PROCEDURE STATUS WHERE Db = 'ignou_se';

DELIMITER //
CREATE PROCEDURE addEvenPhoneNo(
IN phoneNo INT
)
BEGIN
DECLARE start_value INT DEFAULT 12;
WHILE start_value<=phoneNo DO
IF MOD(start_value,2)=0 THEN
INSERT INTO `sandhyodip` (`mobile_phone_no`) VALUES (start_value);
END IF;
SET start_value=start_value+1;
END WHILE;
END //
DELIMITER ;

CALL addEvenPhoneNo(20);

DELIMITER //
CREATE PROCEDURE addOddPhoneNo(
IN phNo INT
)
BEGIN
DECLARE counter INT DEFAULT 13;
WHILE counter <=phNo DO
IF MOD (counter,2) !=0 THEN
INSERT INTO `sandhyo`(`mobile_phone_no`) VALUES (counter);
END IF;
SET counter=counter+1;
END WHILE;
END //
DELIMITER ;
CALL addOddPhoneNo(21);

-- Write a procedure to find even & odd numbers between two given numbers (input) 
DELIMITER //
CREATE PROCEDURE getEvenOddNumber(
IN start_value INT(10),
IN end_value INT (10)
)
BEGIN
CREATE TEMPORARY TABLE IF NOT EXISTS temp_table (message VARCHAR(255));
WHILE start_value < end_value DO
IF MOD(start_value,2)=0 THEN
INSERT INTO temp_table VALUES (CONCAT(start_value,': Even Number!'));
ELSE 
INSERT INTO temp_table VALUES (CONCAT(start_value,': Odd Number!'));
END IF;
SET start_value=start_value+1;
END WHILE;
SELECT * FROM temp_table;
DROP TEMPORARY TABLE temp_table;
END //
DELIMITER ;

CALL getEvenOddNumber(1,20);

DELIMITER //
CREATE PROCEDURE getEmployee(
IN input_id INT
)
BEGIN
SELECT `first_name`, `last_name` FROM `ems_profile` WHERE `id`=input_id;
END //
DELIMITER ;

CALL getEmployee(1);


DELIMITER //
CREATE PROCEDURE getEmployeeName(
IN input_id INT,
OUT result VARCHAR(50)
)
BEGIN
SELECT CONCAT(`first_name`,' ',`last_name`) INTO result FROM `ems_profile` WHERE `id`=input_id;
END //
DELIMITER ;

CALL getEmployeeName(1,@employeeName);
SELECT @employeeName AS Employee_Name;