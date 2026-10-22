DROP DATABASE IF EXISTS sql_norway_ds;
CREATE DATABASE sql_norway_ds 
character SET utf8mb4 collate utf8mb4_unicode_ci;
USE sql_norway_ds; 
DROP TABLE IF EXISTS pensionable_income;
CREATE TABLE pensionable_income
(
sex VARCHAR(20) NOT NULL, 
year SMALLINT NOT NULL, 
taxable_persons INT, 
avg_income_nok DECIMAL(12,2),
median_income_nok DECIMAL(12,2),
PRIMARY KEY (sex, year),
INDEX idx_year(year)
) ENGINE=InnoDB default charset=utf8mb4 collate utf8mb4_unicode_ci;

