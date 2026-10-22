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