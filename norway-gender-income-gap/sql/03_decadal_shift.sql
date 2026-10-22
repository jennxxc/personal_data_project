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
