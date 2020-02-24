use gregs_list;
alter table my_contacts
drop column profession;

use gregs_list;
alter table my_contacts
drop column status;



use gregs_list;
alter table my_contacts
drop column interests;

use gregs_list;
alter table my_contacts
drop column city;

use gregs_list;
alter table my_contacts
drop column state;

alter table my_contacts
add column prof_id int(10);

alter table my_contacts
add column zip_code int(10);

alter table my_contacts
add column status_id int(10);

alter table my_contacts
add constraint my_contacts_fk_1
foreign key (zip_code)
references zip_code (zip_code);

alter table my_contacts
add constraint my_contacts_fk_2
foreign key (status_id)
references status (status_id);

alter table my_contacts
add constraint my_contacts_fk_3
foreign key (prof_id)
references profession (prof_id);

update my_contacts
set prof_id=13, zip_code=1,status_id=5
where contact_id =1;


update my_contacts
set prof_id=6, zip_code=2,status_id=3
where contact_id =2;

update my_contacts
set prof_id=5, zip_code=3,status_id=5
where contact_id =3;

update my_contacts
set prof_id=9, zip_code=4,status_id=4
where contact_id =4;
# form here""#

update my_contacts
set prof_id=11, zip_code=5,status_id=4
where contact_id =5;

update my_contacts
set prof_id=4, zip_code=6,status_id=4
where contact_id =6;

update my_contacts
set prof_id=14, zip_code=9,status_id=3
where contact_id =7;

update my_contacts
set prof_id=15, zip_code=2,status_id=4
where contact_id =8;

update my_contacts
set prof_id=4, zip_code=7,status_id=2
where contact_id =9;

update my_contacts
set prof_id=8, zip_code=8,status_id=4
where contact_id =10;

update my_contacts
set prof_id=1, zip_code=2,status_id=1
where contact_id =11;

update my_contacts
set prof_id=2, zip_code=10,status_id=1
where contact_id =12;

update my_contacts
set prof_id=12, zip_code=2,status_id=1
where contact_id =13;

update my_contacts
set prof_id=10, zip_code=2,status_id=1
where contact_id =14;

update my_contacts
set prof_id=16, zip_code=2,status_id=1
where contact_id =15;

update my_contacts
set prof_id=4, zip_code=11,status_id=1
where contact_id =16;


