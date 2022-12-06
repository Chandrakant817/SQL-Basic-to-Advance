create database restaurant2;
use restaurant2;

create table menu2(
id float(15),
dish_name varchar(30),
price int(10)); 

select * from menu2;

insert into menu2 (id,dish_name,price)
	values (1, "Dosa", 100),(2, "Idly", 80),(3, "upma", 80);

select * from menu2;

Alter table menu2
rename column id to dish_id;

Alter table menu2
add column ratings float;

select * from menu2;

update menu2 set ratings = 4.8 where dish_id =1;
update menu2 set ratings = 4.7 where dish_id =2;
update menu2 set ratings = 4.6 where dish_id =3;

select * from menu2;

drop database restaurant;