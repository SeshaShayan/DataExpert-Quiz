/*
Calculating Available Seats on Flights
 
Calculate the number of seats not yet purchased for each flight. Use three tables: playground.flights (with columns: flight_id, plane_id), playground.planes (with columns: plane_id, number_of_seats), and playground.purchases (with columns: flight_id, seat_no). Each row in purchases is unique for (flight_id, seat_no) pairs. For each flight_id, compute the free_seats as the number of seats not purchased. Order the results by flight_id in ascending order. Ensure consistency in purchases, with no records for non-existing flight_ids or seat_nos.

These are the tables to query for this question:
--playground.flights
-flight_id int
-plane_id int

--playground.planes
-plane_id int
-number_of_seats int

--playground.purchases
-flight_id int
-seat_no int

--Your answer should include these columns:
-flight_id integer
-free_seats integer
*/

with seats_purchased as (
  SELECT f.flight_id, count(p.seat_no) as occupied_seats
  FROM playground.flights f 
    inner join playground.purchases p
    on f.flight_id=p.flight_id
  group by f.flight_id
  ),
  capacity as(
  select f.flight_id, pl.number_of_seats as total_seats
     FROM playground.flights f
    inner join playground.planes pl
      on f.plane_id =pl.plane_id
  )

select c.flight_id, 
  c.total_seats-coalesce(sp.occupied_seats,0) as free_seats
  from capacity c left join seats_purchased sp
    on c.flight_id=sp.flight_id
ORDER BY  c.flight_id
