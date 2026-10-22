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
