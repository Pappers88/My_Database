USE my_db;


DROP TABLE profiles;
DROP TABLE orders;
DROP TABLE people;


CREATE TABLE people (
	id INTEGER AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	second_name VARCHAR(50) NOT NULL,
	DOB DATE NOT NULL,
	PRIMARY KEY (id)
);



CREATE TABLE orders(
	id INTEGER AUTO_INCREMENT,
	amount DECIMAL(18,2) NOT NULL,
	person_id INT,
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (person_id) REFERENCES people(id),
	CHECK(amount>0)
);


CREATE TABLE profiles (
	id INTEGER AUTO_INCREMENT,
	person_id INT,
	address text,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (person_id) REFERENCES people(id)
);


INSERT INTO `my_db`.`people` (
	`first_name`,
	`second_name`,
	`DOB`
) VALUES (
	"Wally",
	"West",
	STR_TO_DATE("05-02-1991", "%d-%m-%Y")
);


INSERT INTO `my_db`.`profiles` (
	`person_id`,
	`address`
) VALUES (
	1,
	"Central City"
);


INSERT INTO `my_db`.`orders` (
	`amount`,
	`person_id`
) VALUES 
	(17.05, 1),
	(2.99, 1),
	(8.00, 1),
	(7.75, 1),
	(13.14, 1);