
-- Switch to the target database
USE financial_analytics

-- Create a login for the ETL tool (if not already created)
CREATE LOGIN ETLUser
WITH PASSWORD = '';

USE financial_analytics
-- Create a user for the login in the target database
CREATE USER ETLUser FOR LOGIN ETLUser;

USE financial_analytics
-- Assign the db_datareader role (read access to all user tables and views)
EXEC sp_addrolemember 'db_datareader', 'ETLUser';

USE financial_analytics
-- Assign the db_datawriter role (write access to all user tables)
EXEC sp_addrolemember 'db_datawriter', 'ETLUser';



-- Switch to the target database
USE financial_analytics
-- Create a login for the ETL tool (if not already created)
CREATE LOGIN fa_admin
WITH PASSWORD = '';

USE financial_analytics
-- Create a user for the login in the target database
CREATE USER fa_admin FOR LOGIN fa_admin;
USE financial_analytics
-- Assign the db_datareader role (read access to all user tables and views)
EXEC sp_addrolemember 'db_owner', 'fa_admin';

