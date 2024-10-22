-- MOON MISSIONS
-- Uppgift 1
/*
CREATE TABLE successful_missions AS
    SELECT *
    FROM moon_mission
    WHERE outcome = 'Successful';
*/

-- Uppgift 2
/*
ALTER TABLE successful_missions
    MODIFY  COLUMN mission_id
        INT AUTO_INCREMENT PRIMARY KEY;
*/

-- Uppgift 3
/*
UPDATE moon_mission
SET operator = TRIM(REPLACE(operator, ' ', ''));

UPDATE successful_missions
SET operator = TRIM(REPLACE(operator, ' ', ''))
WHERE outcome = 'Successful';

-- Kontrollera att det funkat i moon_mission
SELECT operator
FROM moon_mission;

-- Kontrollera att det funkat i successful_missions
SELECT operator
FROM successful_missions;
*/

-- Uppgift 4
/*
DELETE FROM successful_missions
WHERE launch_date >= '2010-01-01';
*/

-- Uppgift 5
/*
SELECT *,
CONCAT(first_name, ' ', last_name) AS name
FROM account;

ALTER TABLE account
    ADD COLUMN gender VARCHAR(6);

UPDATE account
SET gender = CASE
    WHEN
SUBSTRING(ssn, LENGTH(ssn) -1, 1) % 2 = 0 THEN 'female'
    ELSE 'male'
END;
*/

-- Uppgift 6
/*DELETE FROM account
WHERE gender = 'female' AND SUBSTRING(ssn, 1, 2) < '70';
*/

-- Uppgift 7
/*
SELECT
    CASE
        WHEN SUBSTRING(ssn, 10, 1) % 2 = 0 THEN 'female'
        ELSE 'male'
END AS gender,
AVG(TIMESTAMPDIFF(YEAR, STR_TO_DATE(CONCAT('20', SUBSTRING(ssn, 1, 6)),'%Y%m%d%'), CURDATE())) AS average_age
FROM account
GROUP BY
    CASE
        WHEN SUBSTRING(ssn, 10, 1) % 2 = 0 THEN 'female'
        ELSE 'male'
END;
*/


-- TEST så bookstore funkar
/*
USE bookstore;
SHOW TABLES;

-- For each table, view all contents
SELECT * FROM author;
SELECT * FROM language;
SELECT * FROM book;
SELECT * FROM bookstore;
SELECT * FROM inventory;
SELECT * FROM total_author_book_value;
*/

