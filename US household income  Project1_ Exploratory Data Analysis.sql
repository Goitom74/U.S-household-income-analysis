-- US_household_income_Exploratory_Data_Analysis

SELECT * 
FROM us_income_project.us_household_income;

SELECT * 
FROM us_income_project.us_household_income_statistics;

SELECT State_Name, County, City, ALand, AWater
FROM us_income_project.us_household_income;

SELECT State_Name, Sum(ALand), Sum(AWater)
FROM us_income_project.us_household_income
Group by State_Name
order by 2 desc
limit 10;

SELECT State_Name, Sum(ALand), Sum(AWater)
FROM us_income_project.us_household_income
Group by State_Name
order by 3 desc
limit 10;

SELECT * 
FROM us_income_project.us_household_income usi
join us_income_project.us_household_income_statistics uss
on usi.id = uss.id
where mean <> 0;

SELECT usi.State_Name, county, Type, `Primary`, mean, median
FROM us_income_project.us_household_income usi
join us_income_project.us_household_income_statistics uss
on usi.id = uss.id
where mean <> 0;

SELECT usi.State_Name, avg(mean), avg(median)
FROM us_income_project.us_household_income usi
join us_income_project.us_household_income_statistics uss
on usi.id = uss.id
where mean <> 0
group by usi.State_Name
order by 2
limit 10;


SELECT usi.State_Name, avg(mean), avg(median)
FROM us_income_project.us_household_income usi
join us_income_project.us_household_income_statistics uss
on usi.id = uss.id
where mean <> 0
group by usi.State_Name
order by 2 desc
limit 10;

SELECT Type, count(Type), avg(mean), avg(median)
FROM us_income_project.us_household_income usi
join us_income_project.us_household_income_statistics uss
on usi.id = uss.id
where mean <> 0
group by 1
order by 3 desc
limit 20;

SELECT Type, count(Type), avg(mean), avg(median)
FROM us_income_project.us_household_income usi
join us_income_project.us_household_income_statistics uss
on usi.id = uss.id
where mean <> 0
group by 1
order by 4 desc
limit 20;

SELECT usi.State_Name, city, avg(mean)
FROM us_income_project.us_household_income usi
join us_income_project.us_household_income_statistics uss
on usi.id = uss.id
group by usi.State_Name, city
order by 3 desc
;
