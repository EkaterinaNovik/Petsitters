DROP DATABASE IF EXISTS Petsitters;
CREATE DATABASE Petsitters;

USE Petsitters;

CREATE TABLE roles
(
id 				INT 			NOT NULL	auto_increment	PRIMARY KEY,
name 			VARCHAR(50) 	NOT NULL
);

CREATE TABLE users
( 
id 				INT				NOT NULL	auto_increment	PRIMARY KEY,
email 			VARCHAR(50) 	NOT NULL,		
password 		VARCHAR(100) 	NOT NULL
);

CREATE TABLE users_roles
(
id 				INT 			NOT NULL	auto_increment	PRIMARY KEY,
user_id 		INT 			NOT NULL,
role_id 		INT 			NOT NULL
);

CREATE TABLE user_info
(
id				INT 			NOT NULL	auto_increment	PRIMARY KEY,
user_id			INT 			NOT NULL,
name 			VARCHAR(50) 	NOT NULL,
image 			VARCHAR(100) 	NOT NULL,
gender 			VARCHAR(1), 
birthday 		DATE,
phone 			VARCHAR(20) 	NOT NULL,
address 		VARCHAR(100)	NOT NULL
);

CREATE TABLE pets
(
id 				INT				NOT NULL 	auto_increment	PRIMARY KEY,
type 			VARCHAR(50) 	NOT NULL,
name 			VARCHAR(50) 	NOT NULL,
age 			INT 			NOT NULL,
breed 			VARCHAR(100) 	NOT NULL,
user_id 		INT 			NOT NULL
);

CREATE TABLE services
(
id 				INT 			NOT NULL 	auto_increment	PRIMARY KEY,
name 			VARCHAR(50) 	NOT NULL,
price 			DECIMAL 		NOT NULL
);

CREATE TABLE orders
(
id 				INT 			NOT NULL 	auto_increment	PRIMARY KEY,
service_id 		INT 			NOT NULL,
pet_id 			INT 			NOT NULL,
start_date 		DATETIME 		NOT NULL,
end_date		DATETIME 		NOT NULL,
payment 		VARCHAR(50) 	NOT NULL,
during 			TIME 			NOT NULL,
petsitter_id 	INT 			NOT NULL,
status 			VARCHAR(50) 	NOT NULL
);

CREATE TABLE reviews
(
id 				INT 			NOT NULL	auto_increment	PRIMARY KEY,
order_id 		INT				NOT NULL,
comment 		TEXT,
rate 			INT,
date 			DATE
);

ALTER TABLE users_roles
	ADD CONSTRAINT FK_users_roles_user_id_users_id
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE;

ALTER TABLE users_roles
	ADD CONSTRAINT FK_users_roles_role_id_roles_id
		FOREIGN KEY (role_id) REFERENCES roles(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE;

ALTER TABLE user_info
	ADD CONSTRAINT FK_user_info_user_id_users_id
		FOREIGN KEY (user_id) REFERENCES users(id) 
			ON UPDATE CASCADE
			ON DELETE CASCADE;

ALTER TABLE pets
	ADD CONSTRAINT FK_pets_user_id_users_id
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE;

ALTER TABLE orders
	ADD CONSTRAINT FK_orders_service_id_services_id
		FOREIGN KEY (service_id) REFERENCES services(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE;

ALTER TABLE orders
	ADD CONSTRAINT FK_orders_pet_id_pets_id
		FOREIGN KEY (pet_id) REFERENCES pets(id)
			ON UPDATE CASCADE 
			ON DELETE CASCADE;

ALTER TABLE orders
	ADD CONSTRAINT FK_orders_petsitter_id_users_id
		FOREIGN KEY (petsitter_id) REFERENCES users(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE;

ALTER TABLE reviews
	ADD CONSTRAINT FK_order_id_orders_id
		FOREIGN KEY (order_id) REFERENCES orders(id)
			ON UPDATE CASCADE
			ON DELETE CASCADE;