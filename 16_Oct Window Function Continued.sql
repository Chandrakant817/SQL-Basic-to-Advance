use gl_beats;

select *
from tracks;

-- ..................................................NTILE..............................................
##.....Based on the Miliseconds which one is Higher one...
# --> 100 indicate it will divide into 100 Groups
select *, ntile(100) over(order by milliseconds) as per_tile
from tracks;

select *, ntile(100) over(order by milliseconds) as perc_tile,
		  row_number() over(order by milliseconds) as rn
from tracks;

#--> 5 indicate It will divide into 5 Groups
select *, ntile(5) over(order by milliseconds) as perc_tile,
		  row_number() over(order by milliseconds) as rn
from tracks;

##..From Invoice Table get me the Top 20% Customers based on the Total_price.....(100) / 5 ==> 20...
select *
from
(select *, ntile(5) over(order by Total) as bucket
from
(select customer_id,sum(total_price) as Total
from invoice
group by 1) a) A1
where bucket = 5

-- ..................................................FIRST_VALUE...........................................

##.....When did the Customer Purchased 1st Item..(or)..In which Year did i acquire the most no of Customers..
select *, first_value(invoice_date) over(partition by customer_id 
										 order by invoice_date) as fv
from invoice;
-- ...........................

select Extract(year from fv) as year, count(*)
from
(select *, first_value(invoice_date) over(partition by customer_id 
										 order by invoice_date) as fv
from invoice) a
group by 1;

 -- .......................................................................................................
 
 -- ..................................Date function......
 ##..I want Day fom the Date..
 select Extract(day from invoice_date), invoice_date
 from invoice;
 
 select Extract(month from invoice_date), invoice_date
 from invoice;
 
 select Extract(quarter from invoice_date), invoice_date
 from invoice;
 
 select Extract(week from invoice_date), invoice_date
 from invoice;
 
 ##..................................We Can Also Use in Where Clause Also.............................
 select month(invoice_date)
 from invoice
 where month(invoice_date) = 1
 
select extract(month from invoice_date)
from invoice
where extract(month from invoice_date) = 1
 
select month(invoice_date)
from invoice
where year(invoice_date) = 2012;
 -- .........................................
-- ......................................Same Code........................
select day(invoice_date),invoice_date
from invoice;

select month(invoice_date), invoice_date
from invoice;

select quarter(invoice_date),invoice_date
from invoice;

select week(invoice_date), invoice_date
from invoice;

select year(invoice_date),invoice_date
from invoice;

-- .........................................................................................................

-- ................................................Interval............................................
##...............Day,Month,Year,Hour..............

select current_date()

##..Setup the Class 5 Days from Now...
select current_date() + interval 5 day;

##......Lets Meet after 1 Month......
select current_date() + interval 1 month;

##....Lets Meet after 1 month and 5 days..
select current_date() + interval 1 month + interval 5 day;

select current_date() + interval 1 month + interval 5 day + interval 1 week;

select current_date() + interval 1 month + interval 5 day + interval 1 hour;

##...I want to Meet 5 Day Before
select current_date() - interval 5 day; 

##...................................Difference Between 2 Date .............
##...DateDif Function in SQL..
select datediff(fv,invoice_date) as days
from 
(select *, first_value(invoice_date) over(partition by customer_id 
										 order by invoice_date) as fv
from invoice) a

select date_part(fv,invoice_date) as days
from 
(select *, first_value(invoice_date) over(partition by customer_id 
										 order by invoice_date) as fv
from invoice) a
-- .................................................................................................

-- ...................... Left, Right, Mid .............................
select left(first_name,3),first_name
from customers;

select right(first_name,3),first_name
from customers;

#3->starting_point and 1->No. of digit you want
select mid(first_name,3,1),first_name
from customers;
-- .................................................................................................
 -- ...........Concatenamt in SQL................
 select concat(first_name," "," ---> "," ",customer_country) 
 from customers;

 -- ......................Change the Data-Type of Column.........
 ##..Convert customer_phone column to String
select cast(unit_price as char)
from tracks;

select cast(2.2 as int);

-- ........................Coalesce. (Helps to Replace the values in Null data).........
 select coalesce(billing_country,"No_biling_Country")
 from invoice;
 
 
 -- ...................................	TRIM // LOWER // UPPER .............
select trim(billing_country)
from invoice;
 
select upper(billing_country)
from invoice;
select lower(billing_country)
from invoice;
 
 
 
 