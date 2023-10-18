-- cummulative query

with data as ( 
      select date_trunc('month',installed_at) as month,game, 
      count(1) from installs  
      group by 1,2 
      order by game,month  
             ) 
select  
month,game, 
sum(count) over (partition by game  
      order by game asc rows between unbounded preceding and current row) 
from data
