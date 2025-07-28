 with event_cnt_cte as(
   
     select business_id,count(event_type) as event_count --group by 1
     -- LIMIT 100
     
      from playground.business_events
     group by business_id
   having count(event_type)>1
),
  occerence_avg_cte as
  ( 
      select 
      event_type
      , avg(occurences) as avg_occurences --group by 1
     -- LIMIT 100
     
      from playground.business_events
     group by event_type
)

select  distinct be.business_id from  
playground.business_events be inner join event_cnt_cte ece
  on be.business_id=ece.business_id
inner join occerence_avg_cte oac
  on be.event_type=oac.event_type
where be.occurences>avg_occurences
