DROP TABLE IF EXISTS student_item_transaction;
DROP TABLE IF EXISTS item_condition_update;
DROP TABLE IF EXISTS item_condition;
DROP TABLE IF EXISTS item_has_category;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS item_category;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS employee_permissions;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS student;


CREATE TABLE student(
	id int AUTO_INCREMENT PRIMARY KEY,
	pawprint VARCHAR(16),
	email VARCHAR(255),
	name_first VARCHAR(30),
	name_last VARCHAR(45),
	password VARCHAR(255),
	salt VARCHAR(255),
	privilege VARCHAR(255),
	has_waiver int
) ENGINE = INNODB;

CREATE TABLE location(
	id int AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE employee_permissions(
	id int AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE employee(
	id int AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(16),
	email VARCHAR(255),
	name_first VARCHAR(30),
	name_last VARCHAR(45),
	permissions int,
	FOREIGN KEY(permissions) references employee_permissions(id)
) ENGINE = INNODB;

CREATE TABLE item_category(
	id int AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE item(
	id varchar(50) PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE item_has_category(
	item_id varchar(50),
	category int,
	FOREIGN KEY(item_id) references item(id),
	FOREIGN KEY(category) references item_category(id),
	PRIMARY KEY(item_id, category)
) ENGINE = INNODB;

CREATE TABLE item_condition(
	id int AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE item_condition_update(
	item_id varchar(50),
	item_condition int,
	update_time datetime,
	FOREIGN KEY(item_id) references item(id),
	FOREIGN KEY(item_condition) references item_condition(id),
	PRIMARY KEY(item_id, item_condition, update_time)
) ENGINE = INNODB;

CREATE TABLE student_item_transaction(
	student_id int,
	employee_id int,
	location int,
	item_id varchar(50),
	item_condition int,
	check_out_time datetime,
	due_time datetime,
	check_in_time datetime,
	FOREIGN KEY(student_id) references student(id),
	FOREIGN KEY(employee_id) references employee(id),
	FOREIGN KEY(location) references location(id),
	FOREIGN KEY(item_id) references item(id),
	FOREIGN KEY(item_condition) references item_condition(id),
	PRIMARY KEY(student_id, employee_id, location, item_id, item_condition, check_out_time, due_time, check_in_time)
) ENGINE = INNODB;
