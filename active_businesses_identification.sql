 with occerence_avg_cte as
  ( 
      select 
      event_type
      , avg(occurences) as avg_occurences
     
      from playground.business_events
     group by event_type
),
   
   event_cnt_cte as(
   
     select be.business_id
   , count(distinct be.event_type) as event_count
     
      from playground.business_events be inner join occerence_avg_cte oac
     on be.event_type=oac.event_type and be.occurences>oac.avg_occurences
     group by business_id
   having  count(distinct be.event_type)>1
)
  select business_id from event_cnt_cte
