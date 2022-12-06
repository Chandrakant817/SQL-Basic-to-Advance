use gl_beats;

##..............................	JOINS	.........................................
select *
from invoice
limit 10;

##....How to Identify If the clm is a Ptimart Key...........
## ---> values should be Unique and NOT NULL
select *
from customers;

### ------------ Befor Applying JOIN should be performed all this code at very FIRST............
select count(customer_id),count(distinct customer_id)
from customers;

select count(customer_id)
from customers
where customer_id is null;

select count(*),count(customer_id)
from customers;
-- ...................................................................................................

select *
from invoice

select count(customer_id),count(distinct customer_id)
from invoice;

select count(*),count(customer_id)
from invoice;

select count(customer_id)
from invoice
where customer_id is null;

-- .................................................................................
