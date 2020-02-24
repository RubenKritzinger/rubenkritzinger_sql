use gregs_list;
select *from my_contacts;

SELECT status FROM my_contacts
GROUP BY status
ORDER BY status;

SELECT profession FROM my_contacts
GROUP BY profession
ORDER BY profession desc;

CREATE TABLE profession
(
 prof_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 profession VARCHAR(50) DEFAULT NULL
)

CREATE TABLE my_contacts_id (
  contact_id int(11) NOT NULL AUTO_INCREMENT,
  last_name varchar(30) DEFAULT NULL,
  first_name varchar(20) DEFAULT NULL,
  phone varchar(11) DEFAULT NULL,
  email varchar(50) DEFAULT NULL,
  gender char(1) DEFAULT NULL,
  birthday date DEFAULT NULL,
  prof_id INT(11) NOT NULL, 
  zip_code INT(11) NOT NULL,
  status_id INT(11)NOT NULL,   
  PRIMARY KEY (contact_id),
  FOREIGN KEY (prof_id) REFERENCES profession(prof_id),
  FOREIGN KEY (zip_code) REFERENCES zip_code(zip_code),
  FOREIGN KEY (status_id) REFERENCES status(status_id)
);

CREATE TABLE status
(
 status_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 status VARCHAR(20) DEFAULT NULL);
 
 CREATE TABLE seeking
(
 seeking_id INT(11) NOT NULL AUTO_INCREMENT,
 seeking VARCHAR(100) DEFAULT NULL,
 PRIMARY KEY(seeking_id)
);

CREATE TABLE Interest
(
 int_id INT(11) NOT NULL AUTO_INCREMENT,
 interests VARCHAR(100) DEFAULT NULL,
 PRIMARY KEY(int_id)
);

CREATE TABLE zip_code
(
 zip_code INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 city VARCHAR(50) DEFAULT NULL,
 state VARCHAR(2) DEFAULT NULL
);

CREATE TABLE contact_seeking (
contact_id int NOT NULL,
seeking_id int NOT NULL,
PRIMARY KEY (contact_id, seeking_id),
FOREIGN KEY (contact_id) REFERENCES my_contacts_id(contact_id),
FOREIGN KEY (seeking_id) REFERENCES seeking(seeking_id)
);

CREATE TABLE contact_interest (
contact_id int NOT NULL,
interest_id int NOT NULL,
PRIMARY KEY (contact_id, interest_id),
FOREIGN KEY (contact_id) REFERENCES my_contacts_id(contact_id),
FOREIGN KEY (interest_id) REFERENCES interests(interest_id)
);


insert into zip_code (city, state)
select location, state from my_contacts
group by location




 
 