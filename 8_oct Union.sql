use gl_beats;

-- ....................................UNION...............................
select album_id from album
UNION
select album_id from tracks
-- .....................................UNION ALL............................
select album_id from album
UNION all
select album_id from tracks
-- .............................CROSS JOIN (FULL JOIN).............................
SELECT DISTINCT FIRST_NAME , GENRE_NAME
FROM CUSTOMERS
CROSS JOIN GENRE;

