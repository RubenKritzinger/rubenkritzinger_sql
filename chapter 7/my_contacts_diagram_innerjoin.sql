SELECT mc.last_name,
mc.first_name,
p.profession
FROM my_contacts_id3 AS mc
INNER JOIN
profession AS p
ON mc.prof_id = p.prof_id;