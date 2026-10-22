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
-- Q2_The Absolute NOK Gap in Median Income (since 1990)
-- Expected output: year, absolute_gap_nok, gap_yoy_change
with 
yearly_income as (
select 
year,
max(case when sex='Males' then median_income_nok end) as male_med_income,
max(case when sex='Females' then median_income_nok end) as female_med_income,
max(case when sex='Males' then avg_income_nok end) as male_avg_income,
max(case when sex='Females' then avg_income_nok end) as female_avg_income
from pensionable_income 
where sex in ('Males', 'Females')
group by year) 
select 
year,
(male_med_income-female_med_income) as median_gap_nok,
(male_avg_income-female_avg_income) as avg_gap_nok,
(male_med_income - female_med_income) - lag(male_med_income - female_med_income) over (order by year) as median_gap_yoy_change,
(male_avg_income - female_avg_income) - lag(male_avg_income - female_avg_income) over (order by year) as avg_gap_yoy_change
from yearly_income
where year>=1990
order by year;
-- Q3_Decadal Shift in Gender Income Gap (1960s–2020s)
-- Expected output: start_of_decade, avg_male_med, avg_female_med, avg_female_pct_of_male_median, improvement_from_prev_decade
with 
t1 as (select 
year,
max(case when sex='Males' then median_income_nok end) as male_med_income,
max(case when sex='Females' then median_income_nok end) as female_med_income,
floor(year/10)*10 as start_of_decade,
max(case when sex='Females' then median_income_nok end)/max(case when sex='Males' then median_income_nok end) as female_pct_of_male_median
from pensionable_income
where sex in ('Males', 'Females')
group by year),
t2 as (select
start_of_decade,
round(avg(female_pct_of_male_median)*100, 1) as avg_female_pct_of_male_median
from t1
group by start_of_decade)
select 
start_of_decade,
avg(male_med_income) as avg_male_med,
avg(female_med_income) as avg_female_med,
avg_female_pct_of_male_median,
avg_female_pct_of_male_median - lag(avg_female_pct_of_male_median) over (order by start_of_decade) as improvement_from_prev_decade
from t1 join t2 using (start_of_decade)
group by start_of_decade;
-- Q4_Indexed Income Growth by Sex (1967 Female Income = 100)
-- Expected output: year, sex, median_income_nok, index_female_1967_100
-- method1:
with 
t1 as (select 
year, 
sex, 
median_income_nok as female_1967_baseline
from pensionable_income 
where sex='Females' and year='1967')
select 
p.sex,
p.year, 
p.median_income_nok,
round(p.median_income_nok/female_1967_baseline*100, 1) as income_index_1967
from pensionable_income p
cross join t1
where p.sex in ('Males', 'Females')
and p.year in (1967, 1980, 1990, 2000, 2010, 2024);
-- method2:
select 
p.sex,
p.year, 
p.median_income_nok,
round(p.median_income_nok/(select median_income_nok
from pensionable_income 
where sex='Females' and year='1967')*100,0) as income_index_1967
from pensionable_income p
where p.sex in ('Males', 'Females')
and p.year in (1967, 1980, 1990, 2000, 2010, 2024);
-- Q5_Women's Share of Pensionable-Income Earners (1967–2024)
-- Expected output: year, female_n, male_n, total_n, female_share_pct, yoy_change_pp, female_share_5yr_ma
select 
year, 
female_n,
male_n, 
total_n, 
female_share_pct, 
round(avg(case when year >=1971 then female_share_pct else null end) over (order by year rows between 4 preceding and current row), 1) as female_share_5yr_moving_avg, 
round(female_share_pct - lag(female_share_pct) over (order by year), 1) as yoy_change_pp
from(
select 
year, 
max(case when sex='Females' then taxable_persons end) as female_n,
max(case when sex='Males' then taxable_persons end) as male_n,
max(case when sex='Females' then taxable_persons end)  + max(case when sex='Males' then taxable_persons end) as total_n, 
round(max(case when sex='Females' then taxable_persons end) /(max(case when sex='Females' then taxable_persons end)  + max(case when sex='Males' then taxable_persons end))*100, 1) as female_share_pct
from pensionable_income
group by year) t 
order by year;