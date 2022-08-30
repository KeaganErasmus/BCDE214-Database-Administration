CREATE ROLE IF NOT EXISTS 'worker';
GRANT SELECT ON healthcare.patient_carer_relationship TO 'worker';
GRANT SELECT ON healthcare.patient_contact TO 'worker';
GRANT SELECT ON healthcare.patient_over_90 TO 'worker';

CREATE USER IF NOT EXISTS 'worker1'@'localhost' IDENTIFIED BY 'worker1pass';
GRANT 'worker' TO 'worker1'@'localhost';

SHOW GRANTS FOR 'worker1'@'localhost';