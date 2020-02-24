use gregs_list;

CREATE TABLE movie_table_demo (
`movie_id` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(45) NOT NULL,
`rating` char(1) NOT NULL,
`drama` char(1) NOT NULL,
`comedy` char(1) NOT NULL,
`action` char(1) NOT NULL,
`gore` char(1) NOT NULL,
`scifi` char(1) NOT NULL,
`for_kids` char(1) NOT NULL,
`cartoon` char(1) NOT NULL,
`published` date NOT NULL,
PRIMARY KEY (`movie_id`)
) ;

INSERT INTO movie_table_demo
(movie_id,title,rating,drama,comedy,action,gore,scifi,for_kids,cartoon,published)
VALUES
(1,"Monsters Inc.",'G','f','t','f','f','f','t','t','2002-06-03'),
(2,"The Godfather",'R','f','f','t','t','f','f','f','2001-02-05'),
(3,"Gone with the Wind",'G','t','f','f','f','f','f','f','1999-11-20'),
(4,"American Pie",'R','f','t','f','f','f','f','f','2003-04-19'),
(5,"Nightmare on Elm Street",'R','f','f','t','t','f','f','f','2003-04-19'),
(6,"Casablanca",'P','t','f','f','f','f','f','f','2001-02-05');


alter table movie_table_demo
add column category varchar (10) default 'nons' after cartoon;

UPDATE movie_table_demo SET category = 'drama' where drama = 'T';
UPDATE movie_table_demo SET category = 'comedy' where comedy = 'T';
UPDATE movie_table_demo SET category = 'action' where action = 'T';
UPDATE movie_table_demo SET category = 'horror' where gore = 'T';
UPDATE movie_table_demo SET category = 'scifi' where scifi = 'T';
UPDATE movie_table_demo SET category = 'family' where for_kids = 'T';
UPDATE movie_table_demo SET category = 'family' where cartoon = 'T' AND rating = 'G';
UPDATE movie_table_demo SET category = 'misc' where cartoon = 'T' AND rating <> 'G';

drop table movie_table_demo;

#gebruik eerder hoof leters om veranderinge te maak#
UPDATE movie_table_demo
SET category =
CASE
WHEN drama = 'T' THEN 'drama'
WHEN comedy = 'T' THEN 'comedy'
WHEN action = 'T' THEN 'action'
WHEN gore = 'T' THEN 'horror'
WHEN scifi = 'T' THEN 'scifi'
WHEN for_kids = 'T' THEN 'family'
WHEN cartoon = 'T' AND rating ='g' then 'family'
ELSE 'misc'
END;

UPDATE movie_table_demo
SET category =
CASE
WHEN drama = 'T' AND rating = 'R' THEN 'drama-r'
WHEN comedy = 'T' AND rating = 'R' THEN 'comedy-r'
WHEN action = 'T' AND rating = 'R' THEN 'action-r'
WHEN gore = 'T' AND rating = 'R' THEN 'horror-r'
WHEN scifi = 'T' AND rating = 'R' THEN 'scifi-r'
WHEN category = 'misc' AND rating = 'G' THEN 'family'
END;


UPDATE movie_table_demo
SET category =
CASE
WHEN category = 'drama-r' THEN 'drama'
WHEN category = 'comedy-r' THEN 'comedy'
WHEN category = 'action-r' THEN 'action'
WHEN category = 'horror-r' THEN 'horror'
WHEN category = 'scifi-r' THEN 'scifi'
END;

ALTER TABLE movie_table_demo
DROP COLUMN drama,
DROP COLUMN comedy,
DROP COLUMN action,
DROP COLUMN gore,
DROP COLUMN scifi,
DROP COLUMN for_kids,
DROP COLUMN cartoon;

#how to order your data#

SELECT title, category
FROM movie_table_demo
WHERE
title LIKE 'A%'
order by title;


