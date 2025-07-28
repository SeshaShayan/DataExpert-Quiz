/*
Identifying Active Businesses Based on Event Occurrences
 
Using the playground.business_events table, identify all active businesses. An active business is defined as one that has more than one event type with occurrences greater than the average occurrences of that event type among all businesses. The goal is to filter businesses based on their activity level, comparing individual event occurrences to the overall average for those event types. The result should be a table with one column called business_id with all the business ids that are active.

These are the tables to query for this question:

--playground.business_events
-business_id int
-event_type string
-occurences int

--Your answer should include these columns:
-business_id integer
*/
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
