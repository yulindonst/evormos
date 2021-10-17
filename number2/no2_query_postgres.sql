with 
top_score as (
select 
	*, 
	rank() over (partition by hacker_id, challenge_id order by score desc) ranking
from submissions_table
)
select 
	a.hacker_id,
	b.name,
	sum(a.score) totalScore
from top_score a 
left join hackers_table b on a.hacker_id = b.hacker_id
where a.ranking = 1
group by a.hacker_id, b.name
order by 3 desc
;