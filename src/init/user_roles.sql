USE ROLE SECURITYADMIN;

-- Create role
CREATE OR REPLACE ROLE DBADMIN COMMENT='Database admin';

-- Grant role to use virtual warehouse and database
GRANT USAGE ON WAREHOUSE real_estate_sales_wh TO ROLE DBADMIN;
GRANT USAGE ON DATABASE sale_db TO ROLE DBADMIN;

-- Grant role to use schema
GRANT USAGE ON SCHEMA sale_db.sale_lake TO ROLE DBADMIN;
GRANT USAGE ON SCHEMA sale_db.sale_batch TO ROLE DBADMIN;
GRANT USAGE ON SCHEMA sale_db.sale_speed TO ROLE DBADMIN;

-- Grant role to use all tables
GRANT SELECT ON ALL TABLES IN SCHEMA sale_db.sale_lake TO ROLE DBADMIN;
GRANT SELECT ON FUTURE TABLES IN SCHEMA sale_db.sale_lake TO ROLE DBADMIN;

GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA sale_db.sale_batch TO ROLE DBADMIN;
GRANT SELECT,INSERT,UPDATE,DELETE ON FUTURE TABLES IN SCHEMA sale_db.sale_batch TO ROLE DBADMIN;

GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA sale_db.sale_speed TO ROLE DBADMIN;
GRANT SELECT,INSERT,UPDATE,DELETE ON FUTURE TABLES IN SCHEMA sale_db.sale_speed TO ROLE DBADMIN;

-- Create new user
CREATE OR REPLACE USER dbadmin PASSWORD='123456' 
    DEFAULT_WAREHOUSE='real_estate_sales_wh' 
    DEFAULT_NAMESPACE='sale_db' 
    MUST_CHANGE_PASSWORD=FALSE;
    
-- Grant role to user
GRANT ROLE DBADMIN TO USER dbadmin;
ALTER USER dbadmin SET DEFAULT_ROLE='DBADMIN';

-- View all role of custom role
SHOW GRANTS TO ROLE DBADMIN;

-- View list of users using this role
SHOW GRANTS OF ROLE DBADMIN;