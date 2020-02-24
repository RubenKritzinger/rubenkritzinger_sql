# CocoaMySQL dump
# Version 0.7b5
# http://cocoamysql.sourceforge.net
#
# Host: localhost (MySQL 5.0.37)
# Database: ch9
# Generation Time: 2007-09-07 11:09:52 -0400
# ************************************************************

# Dump of table projekts
# ------------------------------------------------------------

CREATE TABLE `projekts` (
  `number` int(11) NOT NULL default '0',
  `descriptionofproj` varchar(50) default NULL,
  `contractoronjob` varchar(10) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('1','outside house painting','Murphy');
INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('2','kitchen remodel','Valdez');
INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('3','wood floor installation','Keller');
INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('4','roofing','Jackson');

ALTER TABLE projekts
rename to project_list;

ALTER TABLE project_list
ADD COLUMN proj_id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (proj_id);

ALTER TABLE project_list
drop column number;

ALTER TABLE project_list
rename column descriptionofproj to improvements;

ALTER TABLE project_list
add column startdate date not null after proj_id;

ALTER TABLE project_list
add column estimatedcost dec(10,2) not null after startdate;

ALTER TABLE project_list
rename column contractoronjob to contractor;

ALTER TABLE project_list
ADD COLUMN contactnumber int (10) not null ;