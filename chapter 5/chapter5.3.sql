use gregs_list;
select * from my_contacts;
set sql_safe_updates = 0 ;

alter table my_contacts
add column state char(2) not null after location;

update my_contacts
SET state = RIGHT(location, 2);

alter table my_contacts
drop column state;

update my_contacts
set location= SUBSTRING_INDEX(location, ',', 1);

alter table my_contacts
change column location city varchar(50);
