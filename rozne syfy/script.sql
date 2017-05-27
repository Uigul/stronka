/*
Created		2017-05-27
Modified		2017-05-27
Project		
Model		
Company		
Author		
Version		
Database		mySQL 5 
*/


drop table IF EXISTS `RESERVATIONS`;
drop table IF EXISTS `TABLES`;
drop table IF EXISTS `CONFIRMS`;
drop table IF EXISTS `EVENTS`;
drop table IF EXISTS `ORDERS`;
drop table IF EXISTS `STAYS`;
drop table IF EXISTS `ROOMS`;
drop table IF EXISTS `USERS`;


Create table `USERS` (
	`user_id` Int NOT NULL AUTO_INCREMENT,
	`login` Varchar(20) NOT NULL,
	`password` Varchar(20) NOT NULL,
	UNIQUE (`login`),
 Primary Key (`user_id`)) ENGINE = InnoDB;

Create table `ROOMS` (
	`room_id` Int NOT NULL,
	`quantity` Int NOT NULL,
	`description` Varchar(150),
 Primary Key (`room_id`)) ENGINE = InnoDB;

Create table `STAYS` (
	`stay_id` Int NOT NULL AUTO_INCREMENT,
	`stay_start` Date NOT NULL,
	`stay_end` Date NOT NULL,
	`auth_code` Varchar(6) NOT NULL,
	`user_id` Int NOT NULL,
	`room_id` Int NOT NULL,
 Primary Key (`stay_id`)) ENGINE = InnoDB;

Create table `ORDERS` (
	`order_id` Int NOT NULL AUTO_INCREMENT,
	`description` Varchar(150),
	`date` Date NOT NULL,
	`stay_id` Int NOT NULL,
 Primary Key (`order_id`)) ENGINE = InnoDB;

Create table `EVENTS` (
	`event_id` Int NOT NULL AUTO_INCREMENT,
	`description` Varchar(150) NOT NULL,
	`date` Date NOT NULL,
 Primary Key (`event_id`)) ENGINE = InnoDB;

Create table `CONFIRMS` (
	`con_id` Int NOT NULL AUTO_INCREMENT,
	`participation` Bool NOT NULL,
	`event_id` Int NOT NULL,
	`stay_id` Int NOT NULL,
 Primary Key (`con_id`)) ENGINE = InnoDB;

Create table `TABLES` (
	`table_id` Int NOT NULL AUTO_INCREMENT,
	`quantity` Int NOT NULL,
	`description` Varchar(150),
 Primary Key (`table_id`)) ENGINE = InnoDB;

Create table `RESERVATIONS` (
	`res_id` Int NOT NULL AUTO_INCREMENT,
	`date` Date NOT NULL,
	`stay_id` Int NOT NULL,
	`table_id` Int NOT NULL,
 Primary Key (`res_id`)) ENGINE = InnoDB;


Alter table `STAYS` add Constraint `rel_user_stay` Foreign Key (`user_id`) references `USERS` (`user_id`) on delete  restrict on update  restrict;
Alter table `STAYS` add Constraint `rel_room_stay` Foreign Key (`room_id`) references `ROOMS` (`room_id`) on delete  restrict on update  restrict;
Alter table `ORDERS` add Constraint `rel_stay_order` Foreign Key (`stay_id`) references `STAYS` (`stay_id`) on delete  restrict on update  restrict;
Alter table `RESERVATIONS` add Constraint `rel_stay_res` Foreign Key (`stay_id`) references `STAYS` (`stay_id`) on delete  restrict on update  restrict;
Alter table `CONFIRMS` add Constraint `rel_stay_con` Foreign Key (`stay_id`) references `STAYS` (`stay_id`) on delete  restrict on update  restrict;
Alter table `CONFIRMS` add Constraint `rel_event_con` Foreign Key (`event_id`) references `EVENTS` (`event_id`) on delete  restrict on update  restrict;
Alter table `RESERVATIONS` add Constraint `rel_table_res` Foreign Key (`table_id`) references `TABLES` (`table_id`) on delete  restrict on update  restrict;


