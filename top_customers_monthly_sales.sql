/* Top 2 Customers with Highest Sales Every Month
 
Using the table playground.sales, Identify the top 2 customers based on their total sales for each month. Display the result based on asc order of their rank and month.

These are the tables to query for this question:
--playground.sales
-id int
-month string
-sales int

--Your answer should include these columns:
-id integer
-month varchar
-total_sales integer
-rank integer
*/

with monthly_sales as
(
  SELECT 
  id,month, 
  sum(sales) as total_sales,
  row_number()
    over(
        partition by month
        order by sum(sales) desc
    ) 
  as rank

  FROM playground.sales
  group by 1,2

)

select * 
  from monthly_sales
where rank<=2
order by month desc
