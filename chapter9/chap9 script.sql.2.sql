CREATE TABLE job_current
(
 contact_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(30) NOT NULL,
 salary int(11) NOT NULL,
 start_date DATE NOT NULL  
);

CREATE TABLE job_desired

(
 
contact_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,

 title VARCHAR(30) NOT NULL,
 salary_low int(11) NOT NULL,

 salary_high int(11) NOT NULL,

 available VARCHAR(20) NOT NULL,

 years_exp int(11) NOT NULL,

 FOREIGN KEY (contact_id ) REFERENCES job_current(contact_id)

);

CREATE TABLE job_listings
(
 job_id INT NOT NULL AUTO_INCREMENT,
 title VARCHAR(50) NOT NULL,
 salary INT NOT NULL,
 zip INT NOT NULL,
 description VARCHAR(100),
 PRIMARY KEY(job_id)
);

use gregs_list;
insert into job_desired(contact_id,title,salary_low,available,years_exp)
values(1,cook,1200,week_days, 7);


CREATE TABLE `job_current` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `salary` int NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `job_desired` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `salary_low` int NOT NULL,
  `salary_high` int NOT NULL,
  `available` varchar(20) NOT NULL,
  `years_exp` int NOT NULL,
  PRIMARY KEY (`contact_id`),
  CONSTRAINT `job_desired_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `job_current` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `job_listings` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `salary` int NOT NULL,
  `zip` int NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci