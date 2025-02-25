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