use gl_beats;

select *
from mediatype;

select *
from genre;

select genre_name,media_type_code
from genre
cross join mediatype

###.....................................CONDITIONAL STATEMENT....................................
##Each Time we are creating a NEW COLUMNS
select *,1 as num,null as empty_table,"a" as Alpha  
from invoice;
-- ..........................................................................................

##...Separate out HIGH PRICE and LOW PRICE
select customer_id,total_price,
		case when total_price > 5 then "High" else "Low" End as t_bucket
from invoice
-- ..........................................................................................

##..Separete 0-4->"LOW", 4-7->"Miduum" and 7> "High"
select customer_id,total_price,
	case when total_price > 7 then "High" 
	when total_price >=4 and total_price <= 7 then "Mid"
	else "Low" End as t_bucket
from invoice;
-- ..........................................................................................

##...........Display Only HIGH RECORDS......

select *
from
(select customer_id,total_price,
case when total_price > 7 then "High"
	when total_price >= 4 and total_price <=7 then "Midium"
    else "Low" End as t_bucket 
    from invoice) a
where t_bucket = "High";

-- .....................................................................................................

##.COUNT how many are in each bucket--> "HIGH CUSTOMERS","LOW CUSTOMERS" and "MID CUSTOMERS" are there
select count(customer_id),
	case when total_price > 7 then "High" 
	when total_price >=4 and total_price <= 7 then "Mid"
	else "Low" End as t_bucket 
from invoice
group by 2;

-- ..........................................................................................

##......For Every time Customers Buys More then 7 --> Give 10% DISCOUNt overall...
select customer_id,total_price,
	case when total_price > 7 then 0.90 * total_price
	 else total_price End as discount_price
from invoice;

-- ..........................................................................................

select billing_country, sum(total_price) as Total
from invoice
group by 1;

-- .........................................................................................................
##..........................VERY IMPORTANT.....HOW to Create PIVOT in SQL......................................

-- .In any Country (Say eg:- USA) How many are LOW Bucket,how many are Hight and Midium Bucket.I want to take DIVISION of these BY CATEGORY
select billing_country, 
		sum(case when t_buckets = "LOW" then 1 else 0 End) as Low_Cust,
        sum(case when t_buckets = "High" then 1 else 0 End) as High_Cust,
        sum(case when t_buckets = "Mid" then 1 else 0 End) as Mid_Cust,
        count(*) as total_Cust
from 
(Select * ,
		case when total_price > 7 then 'high' 
		when total_price >=4 and total_price <7 then 'mid'
		else 'low' END as t_buckets from invoice) A
group by 1
-- ..................................................................
select billing_country, 
	   case when t_buckets = "LOW" then 1 else 0 End as Low_Cust
from 
(Select * ,
		case when total_price > 7 then 'high' 
		when total_price >=4 and total_price <7 then 'mid'
		else 'low' END as t_buckets from invoice) A
group by 1

-- .......................................................................................................
select media_type_id, genre_id,count(track_id)
from tracks
group by 1,2;

select *
from mediatype

##.There are 5 Media_Types I want to Know how many Different Types of "GENRE" are there in Different Media_Types
select genre_id,
	sum(case when media_type_id = 1 then 1 else 0 End) as Media_Type1,
    sum(case when media_type_id = 2 then 1 else 0 End) as Media_Type2,
    sum(case when media_type_id = 3 then 1 else 0 End) as Media_Type3,
    sum(case when media_type_id = 4 then 1 else 0 End) as Media_Type4,
    sum(case when media_type_id = 5 then 1 else 0 End) as Media_Type5,
    count(track_id)
    
 from tracks
 group by 1;

