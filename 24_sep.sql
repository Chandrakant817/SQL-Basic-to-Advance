use gl_beats;

###...............................Performing SQL Queries From Customer TAble...................................

##...........How to find Top 10 Values in the table...............
select *
from customers
limit 10;

##............want to see all the Data of Customers from Brazil...............
select *
from customers
where customer_country = "Brazil";

##....................Find out People from Brazil and Canada........................
select *
from customers
where customer_country in ("Brazil","Canada");

select count(*)
from customers
where customer_country in ("Brazil","Canada");

##...........................I want to see Customer_ID 5 and 9..........................
select *
from customers
where customer_id in (5,9)

select count(*)
from customers
where customer_id in (5,9)

##......Details of the Customers who is not working in any of the Company............
select *
from customers
where company != ' ';

##...is Null, is not Null, <> , !=

##..........Find all the Customers whose Company is not NULL and he is from USA
select *
from customers
where company != ' ' and customer_country = "USA"; 

select *
from customers
where company != ' ' or customer_country = "USA";


##....................................Performing SQL Queries From Tracks Table..............................
select *
from tracks

select count(*)
from tracks;

#..I Want to See only 2 Column Track_ID and Miliseconds..........
select track_id,milliseconds/60000
from tracks;

#..Rename this milliseconds column as Minutes
select track_id,milliseconds/60000 as Minutes
from tracks;

##.......Filter out values which are >8 Minutes...........
select track_id,milliseconds/60000 as Minutes
from tracks
where milliseconds/60000 > 8;

##....Find out all the values >8 and <12.....
select track_id,milliseconds/60000 as Minutes
from tracks
where milliseconds/60000 > 8 and  milliseconds/60000 < 12;

##...Another method for finding i.e Between. But it will Include both 8 and 12.....
select track_id,milliseconds/60000 as Minutes
from tracks
where milliseconds/60000 between 8 and 12;

##....I want to find name of the Composer starting with "A".............
select * 
from tracks
where composer like "A%";

##...I want to find name of the Composer Endinf with "A".............
select * 
from tracks
where composer like "%a";

##..Write query that starts with A and end with A.........
select * 
from tracks
where composer like "A%a";

##..Find out word which is "our" from Composer clm.....
select *
from tracks
where composer like "%our%";

##..Find out word which is "ace" from Composer clm.....
select *
from tracks
where composer like "%ace%";

select *
from tracks
where composer like "%ch";

##...How to find 2nd Letter is "R"......(1 UnderScore Used)
 select *
from tracks
where composer like "_r%";

##...How to find 2nd Letter is "R"......(2 UnderScore Used)
 select *
from tracks
where composer like "__r%";


##.......................................Aggrigation Function.........................................
 
 ##...Avg,Min,Max and Sum of Milliseconds.....and Count Trach_ID......
 select avg(milliseconds) as Average,
		min(milliseconds) as Minimum,
		max(milliseconds) as Maximum,
        sum(milliseconds) as Total, 
        count(track_id) as Total_Count
 from tracks;

##.....How many records are there in the table.........
select count(*) as Total_Records
from tracks;

select count(*),count(composer)
from tracks;

##..Distinct Means --> Unique/No repetition....
select count(distinct album_id)   
from tracks;

select count(distinct album_id), count(album_id) 
from tracks;











