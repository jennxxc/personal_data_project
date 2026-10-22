use sql_norway_ds;
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
