CREATE ROLE IF NOT EXISTS 'db_developer', 'app_read', 'app_write';
GRANT ALL ON healthcare TO 'db_developer';
GRANT INSERT, UPDATE, DELETE ON healthcare.* TO 'db_developer';

CREATE USER IF NOT EXISTS 'dev1'@'localhost' IDENTIFIED BY 'dev1pass';
GRANT 'db_developer' TO 'dev1'@'localhost';

SHOW GRANTS FOR 'dev1'@'localhost';