/*

Data Quality Tests

1. Data needs to be 100 records of instagram accounts (row count test)
2. Data needs to be 5 fields (column count test)
3. Instagram account needs to be String format and the others need to be numerical (data type check)
4. Each record needs to be unique in the data set (duplicate count check)


Row Count - 100
Column Count - 5


Data Types

Instagram account - VARCHAR
Name - VARCHAR
Topic VARCHAR
Follower Count - INTEGER
Post Count - INTEGER

Duplicate Count - 0

*/

-- 1. Row Count Check
SELECT COUNT(*) as num_of_rows
FROM view_usa_ig_2024 


-- 2. Column Count Check
SELECT COUNT (*) as column_count 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_usa_ig_2024'


-- 3. Data Type Check
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_usa_ig_2024'


-- 4. Duplicate Check (should return nothing)
SELECT username, COUNT(*) as duplicate_count
FROM view_usa_ig_2024
GROUP BY username
HAVING COUNT(*) > 1