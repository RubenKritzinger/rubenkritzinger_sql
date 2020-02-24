SELECT * FROM myclowndb.activities;

SELECT ci.name , a.activity_id
FROM clown_info as ci
INNER JOIN
info_activities AS ia
ON ci.Clown_id = ia.activity_id
inner join 
activities as a
on ia.activity_id = a.activity_id;