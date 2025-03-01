CREATE TABLE `accounts` (
`id` INT PRIMARY KEY,
`balance` DECIMAL (10,2)
);

INSERT INTO `accounts` (`id`,`balance`)
VALUES (1,1000.00), (2,500.00);

DELIMITER //
CREATE PROCEDURE transfer(
IN from_account INT,
IN to_account INT,
IN amount DECIMAL (10,2)
)
BEGIN
DECLARE from_balance DECIMAL (10,2);
DECLARE message VARCHAR (50);
SELECT `balance` INTO from_balance FROM `accounts` WHERE `id`= from_account;
IF from_balance < amount THEN 
SET message = 'Insufficient Fund..!!';
ELSE 
UPDATE `accounts` SET `balance` = `balance`-amount WHERE `id`=from_account;
UPDATE `accounts` SET `balance` = `balance`+amount WHERE `id`=to_account;
SET message = 'Transaction Completed..!!';
END IF;
SELECT message;
END //
DELIMITER ;

CALL transfer (1,2,200.00);


DELIMITER //
CREATE PROCEDURE transferFunds(
IN fromAccount INT,
IN toAccount INT,
IN amount DECIMAL (10,2)
)
BEGIN
DECLARE fromBalance DECIMAL(10, 2);
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK;
RESIGNAL;
END;

DECLARE EXIT HANDLER FOR SQLWARNING
BEGIN
ROLLBACK;
RESIGNAL;
END;

START TRANSACTION;
SELECT `balance` INTO fromBalance FROM `accounts` WHERE `id`=fromAccount;
IF fromBalance< amount THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Insufficient Funds..!!';
END IF;
UPDATE `accounts` SET `balance` = `balance`-amount WHERE `id`=fromAccount;
UPDATE `accounts` SET `balance` = `balance`+amount WHERE `id`=toAccount;
COMMIT;
END //
DELIMITER ;

CALL TransferFunds(1, 2, 900.00);


