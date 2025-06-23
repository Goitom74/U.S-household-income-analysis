-- US_household_income_data cleaning

SELECT * 
FROM us_income_project.us_household_income;

SELECT * 
FROM us_income_project.us_household_income_statistics;
alter table us_income_project.us_household_income_statistics rename column `ï»¿id` to `id`;

SELECT count(id)
FROM us_income_project.us_household_income;

SELECT count(id)
FROM us_income_project.us_household_income_statistics;

SELECT id, count(id)
FROM us_income_project.us_household_income
group by id
having count(id) > 1
;

Select *
from (select row_id,
id, 
row_number() over (partition by id order by id) row_num
from us_income_project.us_household_income) duplicates
where row_num > 1;
select * 
from us_income_project.us_household_income;

select distinct State_Name 
from us_income_project.us_household_income;

delete from us_income_project.us_household_income
where row_id in ( 
select row_id
from (select row_id,
id, 
row_number() over (partition by id order by id) row_num
from us_income_project.us_household_income) duplicates
where row_num > 1);

Update us_income_project.us_household_income  
set State_Name = 'Georgia'
where State_Name = 'georia';

Update us_income_project.us_household_income  
set State_Name = 'Alabama'
where State_Name = 'alabama';

Update us_income_project.us_household_income  
set Place = 'Autaugaville'
where county = 'Autauga County'
and city = 'Vinemont';

select distinct Type
from us_income_project.us_household_income;

Update us_income_project.us_household_income  
set Type = 'Borough' 
where Type = 'Boroughs';

select Aland, Awater
from us_income_project.us_household_income
where (Aland = 0 or Aland = '' or Aland is null);

select Aland, Awater
from us_income_project.us_household_income
where (Awater = 0 or Awater = '' or Awater is null);

select Aland, Awater
from us_income_project.us_household_income
where (Aland = 0 or Aland = '' or Aland is null)
and (Awater = 0 or Awater = '' or Awater is null); 
