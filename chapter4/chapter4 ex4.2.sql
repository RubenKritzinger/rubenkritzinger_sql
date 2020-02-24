create table my_name
(
personid int not null auto_increment,
first_name varchar(30),
last_name varchar(30),
primary key (personid)
);

INSERT INTO my_name (personid, first_name, last_name)
VALUES (NULL, 'Marcia', 'Brady');

INSERT INTO my_name (personid, first_name, last_name)
VALUES (Null, 'Jan', 'Brady');

INSERT INTO my_name (personid, first_name, last_name)
VALUES (null, 'Bobby', 'Brady');

INSERT INTO my_name (personid,first_name, last_name)
VALUES (null,'Cindy', 'Brady');

INSERT INTO my_name (personid, first_name, last_name)
VALUES (null, 'Peter', 'Brady');