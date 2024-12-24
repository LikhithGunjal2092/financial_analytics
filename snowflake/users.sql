-- Step 1: Create a new user
use role securityadmin;
CREATE USER ETLUser
PASSWORD = ''
DEFAULT_ROLE = SYSADMIN -- Set SYSADMIN as the default role
DEFAULT_WAREHOUSE = analytics_wh -- Set the default warehouse
DEFAULT_NAMESPACE = financial_analytics.analytics -- Set the default database and schema
MUST_CHANGE_PASSWORD = FALSE; -- Force the user to change the password on first login

-- Step 2: Grant the SYSADMIN role to the user
GRANT ROLE SYSADMIN TO USER ETLUser;

use role sysadmin;
use database financial_analytics_wh;
create role bi_reader;
grant usage on database financial_analytics_wh to role bi_reader;
grant usage on schema staging to role  bi_reader;
grant usage on schema analytics to role  bi_reader;
grant select on all tables in database financial_analytics_wh to role bi_reader;

grant usage on warehouse analytics_wh to role bi_reader;

use role securityadmin;
CREATE or replace USER biuser
PASSWORD = ''
DEFAULT_ROLE = bi_reader -- Set SYSADMIN as the default role
DEFAULT_WAREHOUSE = analytics_wh -- Set the default warehouse
DEFAULT_NAMESPACE = financial_analytics.analytics -- Set the default database and schema
MUST_CHANGE_PASSWORD = FALSE; -- Force the user to change the password on first login


use role sysadmin;
grant role bi_reader to user bi_user;
