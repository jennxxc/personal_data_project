use sql_norway_ds;
-- Q1_Female to Male Income Ratio over Time (Median vs. Average)
-- Expected output: year, male_median_income, female_median_income, female_pct_of_male_median (percentage of female income relative to male income, rounded to one decimal place), male_avg_income, female_avg_income, female_pct_of_male_avg
select 
year, 
max(case when sex='Males' then median_income_nok end) as male_median_income,
max(case when sex='Females' then median_income_nok end) as female_median_income,
round((max(case when sex='Females' then median_income_nok end))/(max(case when sex='Males' then median_income_nok end))*100, 1) as female_pct_of_male_median,
max(case when sex='Males' then avg_income_nok end) as male_avg_income,
max(case when sex='Females' then avg_income_nok end) as female_avg_income,
round((max(case when sex='Females' then avg_income_nok end))/(max(case when sex='Males' then avg_income_nok end))*100, 1) as female_pct_of_male_avg
from pensionable_income
group by year;
-- Q1-1_Income skewness over time
SELECT 
    year,
    sex,
    avg_income_nok,
    median_income_nok,
    avg_income_nok - median_income_nok AS avg_minus_median
FROM pensionable_income
WHERE sex IN ('Males', 'Females')
--  AND year IN (1975, 1990, 2024)
ORDER BY sex, year;
