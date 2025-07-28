with windowed_occerences as (
  SELECT business_id, event_type, occurences,
  avg(occurences) over(partition by event_type)
  as avg_event_occurence
  FROM playground.business_events

 )

select business_id
  from windowed_occerences
  where occurences>avg_event_occurence
group by business_id
having count(distinct event_type)>1
