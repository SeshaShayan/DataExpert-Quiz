/*
Summarizing Foreign Competitors by Country with Total Summary
 
Given the playground.foreign_competitors table with columns: competitor and country, write a SQL query to calculate the number of competitors per country. Additionally, include a final summary row that shows "Total:" and the total number of competitors. The resulting table should have two columns: country and competitors, sorted by competitors and country names in ascending order, and include the summary row at the bottom.

These are the tables to query for this question:
--playground.foreign_competitors
-competitor string
-country string
Your answer should include these columns:
-country varchar
-competitors integer

*/

SELECT COALESCE(country,'Total:') as country, count(competitor) as competitors  
  
  FROM
  playground.foreign_competitors
  group by rollup(country)
  order by competitors , country asc
  
