IF NOT EXISTS
(
SELECT [name]
FROM master.DBO.sysdatabases
WHERE name = 'restaurant_db'
)
CREATE DATABASE restaurant_db;