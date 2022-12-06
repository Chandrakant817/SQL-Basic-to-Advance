use gl_beats;

select * 
from tracks;

##.Find out the Maximum BYTES from Tracks Table.....
select max(bytes) as max_bytes from tracks;

##.......Whose Track_ID belongs to i.e: ""1059546140"" How would i know that....
select * 
from tracks
where bytes='1059546140';

###...Combining Both Above 2 Queries..................Sub-Query..............................
select *
from tracks
where bytes = (select max(bytes) as max_bytes 
				from tracks);

##....Find the tracks has byte size is greater than average byte size...
select avg(bytes) 
from tracks;

select *
from tracks
where bytes > (select avg(bytes)
				from tracks);
                
select count(*) 
from tracks
where bytes > (select avg(bytes) 
				from tracks);

##....Find the tracks starting with A and has byte size is greater than average byte size....
select *
from tracks
where bytes > (select avg(bytes) 
				from tracks) and track_name like 'A%';


###...............................................................................
select * 
from customers;

##..Find Out Coubtry starting with "A"....
select *
from customers
where customer_country like "A%";

select *
from customers
where customer_country in (select customer_country
							from customers 
                            where customer_country like "A%");
                            
##...I want to know Customers from Country where there is State start with "A".....
select * 
from customers
where customer_state like "A%";

select * 
from customers
where customer_country in ("USA","Canada");

select count(*)
from customers
where customer_country in (select customer_country
							from customers
                            where customer_state like "A%");

select * 
from customers
where customer_country in (select customer_country
						from customers
                        where customer_state like "A%"); 

###...........................................GROUP BY CLAOUSE.......................................
select * 
from customers;

##........We want to find out Customer_Country and the count of Custometr_id.........
select customer_country, count(customer_id)
from customers
group by customer_country;

##............................Same CODE with Different Notation.....
select customer_country, count(customer_id)
from customers
group by 1;

###...from Play List Table.......
select *
from playlisttrack;

##......Get the Count of Track Per Play_List_ID
select playlist_id ,track_id
from playlisttrack
group by playlist_id;

select playlist_id , count(track_id)
from playlisttrack
group by playlist_id

###..Taking Group By: 1 as Playlist_id and Taking Order By: 2 as Count(trackid)
select playlist_id , count(track_id)
from playlisttrack
group by playlist_id
order by count(track_id) desc;
####................Same Code With Different Representation......
select playlist_id,count(track_id)
from playlisttrack
group by 1
order by 2 desc;
#.....2 means position i.e column number...

-- ..........................................HAVING CLAUSE............................................
##.....Give Me the Track_Id where the count is 100....
select playlist_id, count(track_id)
from playlisttrack
group by 1
having count(track_id) > 100
order by 2 desc;



