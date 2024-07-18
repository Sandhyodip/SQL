-- Query Structure for GRANT (DCL)
-- GRANT privilege ON object TO user;

-- This allows User1 to perform SELECT operations on the Employees table.
GRANT SELECT ON Employees TO User1;

-- This allows User1 to perform SELECT, INSERT, and UPDATE operations on the Employees table.
GRANT SELECT, INSERT, UPDATE ON Employees TO User1;

-- This allows both User1 and User2 to perform SELECT operations on the Employees table.
GRANT SELECT ON Employees TO User1, User2;

-- This allows User1 to perform all operations on the Employees table.
GRANT ALL PRIVILEGES ON Employees TO User1;

-- Query Structure for REVOKE (DCL)
-- REVOKE privilege ON object FROM user;

-- This removes the SELECT privilege on the Employees table from User1.
REVOKE SELECT ON Employees FROM User1;

-- This removes the SELECT, INSERT, and UPDATE privileges on the Employees table from User1.
REVOKE SELECT, INSERT, UPDATE ON Employees FROM User1;

-- This removes the SELECT privilege on the Employees table from both User1 and User2.
REVOKE SELECT ON Employees FROM User1, User2;

-- This removes all privileges on the Employees table from User1.
REVOKE ALL PRIVILEGES ON Employees FROM User1;


