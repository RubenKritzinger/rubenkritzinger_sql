create table  interest_separate
(
	interest varchar(100),
	interest1 varchar(100),
	interest2 varchar(100),
	interest3 varchar(100)
 );

 insert into interest_separate(interest)
 select interests from interests
 group by interests;

update interest_separate set
interest1 = substring_index(interest,',',1),
interest = substr(interest,length(interest1)+2);


update interest_separate set
interest2 = substring_index(interest,',',1),
interest = substr(interest,length(interest2)+2);

update interest_separate set
interest3 = substring_index(interest,',',1),
interest = substr(interest,length(interest3)+2);

set sql_safe_updates=0