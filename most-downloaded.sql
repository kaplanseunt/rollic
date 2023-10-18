-- most downloaded game
-- window function,dense rank

select game,installs  
from( 
select game,installs, dense_rank()over(order by installs desc) as rank from 
( 
select game, count(1) as installs from installs 
group by game 
) tbl1  
)tbl2 where tbl2.rank=3; 
