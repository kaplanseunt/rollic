-- user retention rate  

select  i.game, 
    date_trunc('day',i.installed_at)::date as install_date, 
    count(distinct i.user_id) as retained_users, 
    (extract (EPOCH from date_trunc( 
    'day',s.created_at)-date_trunc('day',i.installed_at)))/60/60/24 as day 
from installs i  
left join sessions s on i.user_id=s.user_id and i.game=s.game 
group by i.game,installed_at,day 
order by install_date,day; 
