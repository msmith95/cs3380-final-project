CREATE TABLE student(
	id int(8) PRIMARY KEY,
	username VARCHAR(16),
	email VARCHAR(255),
	name_first VARCHAR(30),
	name_last VARCHAR(45)
) ENGINE = INNODB;

CREATE TABLE waiver(
	id int(2) PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE student_has_waiver(
	student_id int(8),
	waiver_id int(2),
	FOREIGN KEY(student_id) references student(id),
	FOREIGN KEY(waiver_id) references waiver(id),
	PRIMARY KEY(student_id, waiver_id)
) ENGINE = INNODB;

CREATE TABLE location(
	id int(2) PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE employee_permissions(
	id int(1) PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE employee(
	id int(8) PRIMARY KEY,
	username VARCHAR(16),
	email VARCHAR(255),
	name_first VARCHAR(30),
	name_last VARCHAR(45),
	permissions int(1),
	FOREIGN KEY(permissions) references employee_permissions(id)
) ENGINE = INNODB;

CREATE TABLE item_category(
	id int(5) PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE item(
	id int(10) PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE item_has_category(
	item_id int(10),
	category int(5),
	FOREIGN KEY(item_id) references item(id),
	FOREIGN KEY(category) references item_category(id),
	PRIMARY KEY(item_id, category)
) ENGINE = INNODB;

CREATE TABLE item_condition(
	id int(2) PRIMARY KEY,
	name VARCHAR(250)
) ENGINE = INNODB;

CREATE TABLE item_condition_update(
	item_id int(10),
	item_condition int(2),
	update_time datetime,
	FOREIGN KEY(item_id) references item(id),
	FOREIGN KEY(item_condition) references item_condition(id),
	PRIMARY KEY(item_id, item_condition, update_time)
) ENGINE = INNODB;

CREATE TABLE student_item_transaction(
	student_id int(8),
	employee_id int(8),
	location int(2),
	item_id int(10),
	item_condition int(2),
	transaction_time datetime,
	FOREIGN KEY(student_id) references student(id),
	FOREIGN KEY(employee_id) references employee(id),
	FOREIGN KEY(location) references location(id),
	FOREIGN KEY(item_id) references item(id),
	FOREIGN KEY(item_condition) references item_condition(id),
	PRIMARY KEY(student_id, employee_id, location, item_id, item_condition, transaction_time)
) ENGINE = INNODB;