/*Calculate 3-Day Rolling Average of Posts per User
 
Using the table playground.posts, write a SQL query to calculate the 3-day rolling average of posts for each user. The output should include columns: user_id, post_date, and third_rolling_avg, where third_rolling_avg is the 3-day rolling average of post count for each user, rounded to 2 decimal places. The rolling average should be calculated over a specified 3-day period for each user, including the current day and the two preceding days. The result should be ordered in ascending order of post date

These are the tables to query for this question:

--playground.posts
-user_id int
-post_date date
-post_count int

--Your answer should include these columns:
-user_id integer
-post_date date
-third_rolling_avg double
*/

SELECT 
 user_id,post_date ,
  
    round(avg(post_count) 
      over(partition by user_id 
              order by post_date 
              ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
    ,2) as third_rolling_avg
  FROM playground.posts
