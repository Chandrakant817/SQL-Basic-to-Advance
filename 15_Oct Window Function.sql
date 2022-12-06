use gl_beats;

-- .FOPO --> FUNCTION
			 OVER
			 Partition by
			 Order by
             
-- ..............................................................................................
select sum(total_price) as total
from invoice;

select *,sum(total_price) as Total
from invoice;

## Now Applying WINDOW Function in above Query

##...........Applying WINDOW FUNCTION........

select *, sum(total_price) over() as Total
from invoice;

##............For Each Country what is the Total Price......................
select *
from invoice;

select *, sum(total_price) over(partition by billing_country) as Total
from invoice;

##.. ORDER by Invoive_Date...
select *, sum(total_price) over(partition by billing_country order by invoice_date) as total
from invoice
-- .......................................................................................................

##..From Tracks Table Get me Avrage Unit_Price
select * ,avg(unit_price) over() as Average_Overall
from tracks;

##..You want Average_Price Based on Media_Type_Id
select *,avg(unit_price) over(partition by media_type_id) as Avg_price
from tracks; 
-- ...........................................................,..........................

-- .................................... RANK --- Dense_RANK ..................................................

##.............I want to Finf RANk Based on BYTES Size/ Milisecond.....
select *, Rank() over (order by bytes desc) Rank_Bytes
from tracks;

select *, rank() over (order by milliseconds desc) as rnk
from tracks;

##..........................RANK , DENSE_RANK , ROW_NUMBER in Miliseconds..........

select *, rank() over(order by milliseconds desc) as rnk,
		dense_rank() over(order by milliseconds desc) as d_rnk
from tracks;
-- ......................................................................

select *, rank() over(order by milliseconds desc) as rnk,
		  dense_rank() over(order by milliseconds desc) as d_rnk,
          row_number() over(order by milliseconds desc) as r_rnk
from tracks;

-- ....................................... Extract ....................................................

##..Extract QUARTER from Invoice
select extract(quarter from invoice_date) as Quart
from invoice;

select extract(quarter from invoice_date),sum(total_price) as total
from invoice
group by 1;
-- ....................................................................................

-- ........................................LAG............................................
##..........Quarter over Quater Growth......................
##..It creates new colm and brings the values side by side
##..  (514-502)/502
## 1-> It will shift the value "1 level Down"
select *, Lag(total,1) over(order by qtr) as next_qtr
from
(select extract(quarter from invoice_date) as qtr,
	   sum(total_price) as total
		from invoice
		group by 1) a;

##...2-> It will shift the value "2 level Down".........
select *, Lag(total,2) over(order by qtr) as next_qtr
from
(select extract(quarter from invoice_date) as qtr,
	   sum(total_price) as total
		from invoice
		group by 1) a;

##.....Lets say i want to compare Quatre 1 and Quater 4....

select *, lag(total,3) over(order by qtr) as next_qtr
from
(select extract(quarter from invoice_date) as qtr,
	   sum(total_price) as total
		from invoice
		group by 1) a;
-- ........................................LEAD.....................................................

select *,lag(total) over(order by qtr) as next_qtr,
		lead(total) over(order by qtr) as next_qtr_1
from
(select extract(quarter from invoice_date) as qtr, sum(total_price) as Total
from invoice
group by 1) A
-- ......................................................................................................


##............................Finding PERCENTAGE (%) GROWTH...................
#..(next_qtr - total) / total * 100
select *, 100*(lead(total) over (order by qtr) - total)/total as perc_gwt
from
(select extract(quarter from invoice_date) as qtr,
			  sum(total_price) as Total
from invoice
group by 1) A



