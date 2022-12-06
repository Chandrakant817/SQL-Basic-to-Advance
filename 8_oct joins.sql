use gl_beats;

-- ......................................................................................................
-- .........Output Artist name and Title name..................
select R.artist_name,A.title_name
from album A
Inner join artist R
on A.artist_id = R.artist_id;

-- .......................Practise..........
select a.title_name,b.artist_name
from album as a
inner join artist as b
on a.artist_id = b.artist_id

-- .........................................
-- ................Same Query different form of Writing.........
select artist.artist_name as Artist_Name ,album.title_name as Title_Nme
from album
inner join artist
on artist.artist_id = album.artist_id;

-- ......................................................................................................

##.......................How Many TITLE each ARTIST has.......................
select R.artist_name,count(A.title_name) As Total
from album A
Inner join artist R
on A.artist_id = R.artist_id
group by 1
order by 2 DESC;
-- ................Same Query different form of Writing.........
select artist.artist_name,count(album.title_name) as Count
from album
Inner join artist
on album.album_id = artist.artist_id
group by 1
order by 2 Desc;
-- ......................................................................................................


##.................................Per ARTIST How many Units were sold......................
-- *HINT*-->Tracks(Main Table),INVOICE LINE ITEM(lEFT join),ALBUM TABLE (LEFT JOIN)

# ARTISC_ID How many Tracks
select artist_id,sum(quantity) as Total_Units
from tracks TR

left join invoice_items IT
on TR.track_id = IT.track_id

left join album AB
on TR.album_id = AB.album_id

Group by 1
order by 2 Desc;
-- ................Same Query different form of Writing.........
select artist_id,sum(quantity) as Total_Units

from tracks
left join invoice_items
on tracks.track_id = invoice_items.track_id

left join album
on tracks.album_id = album.album_id

Group by 1
order by 2 Desc;
-- ......................................................................................................

##..Per ARTIST what is the AvG PRICE per TRACK
select artist_id,avg(TR.unit_price) as Average_Price
#.OR --> select artist_id,avg(IT.unit_price) as Average_Price
from tracks TR
left join invoice_items IT
on TR.track_id = IT.track_id

left join album AB
on TR.album_id = AB.album_id

Group by 1
order by 2 Desc;
