ALTER TABLE my_contacts
ADD COLUMN contact_id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (contact_id);


alter table my_contacts
ADD COLUMN phone INT(10) NOT NULL after email;