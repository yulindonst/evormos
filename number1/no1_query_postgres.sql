with abc as (select rank() over (partition by occupation order by name) ronum, occupation, name from occupation_table)
select 
	min(case when occupation = 'Dancer' then name end) as dancer,
	min(case when occupation = 'Photographer' then name end) as photographer,
	min(case when occupation = 'Salesman' then name end) as salesman,
	min(case when occupation = 'Actress' then name end) as actress
from abc
group by ronum
order by 1 asc
;