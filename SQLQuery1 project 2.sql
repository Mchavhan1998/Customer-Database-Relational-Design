create database Project
use Project


CREATE TABLE status
(
	ID INT PRIMARY KEY,
	Status_name VARCHAR(100),
	is_user_working BIT
)


CREATE TABLE user_account 
(
    ID INT PRIMARY KEY,
    User_name VARCHAR(100),
    email VARCHAR(254),
    password VARCHAR(200),
    password_salt VARCHAR(50) NOT NULL,
    password_hash_algorithm VARCHAR(50)
)


CREATE TABLE role 
(
    id INT PRIMARY KEY,
    role_name VARCHAR(100)
)


CREATE TABLE user_has_role 
(
    id INT PRIMARY KEY,
    role_start_time DATETIME2,
    role_end_time Timestamp NOT NULL,
    user_account_id INT,
    role_id INT,
    CONSTRAINT FK_user_has_role_user_account
    FOREIGN KEY (user_account_id) REFERENCES user_account (ID),
    CONSTRAINT FK_user_has_role_role
    FOREIGN KEY (role_id) REFERENCES role (id)
)


CREATE TABLE user_has_status
(
    ID INT,
    status_start_time datetime2,
    status_end_time TIMESTAMP NOT NULL,
    user_account_id INT,
    status_id INT,
	constraint fk_user_has_status_user_account
	foreign KEY (user_account_id) references user_account (ID),
	Constraint fk_user_has_status_status
	foreign key (status_id) references status (ID)
)


--Insert values into the status 

INSERT INTO status (ID, Status_name, is_user_working)
VALUES (101, 'Active', 1),
       (102, 'Inactive', 0);

select * from status

-- Insert values into the user_account 

INSERT INTO user_account (ID, User_name, email, password, password_salt, password_hash_algorithm)
VALUES (101, 'Mayur Chavhan', 'chavhanmayur98@gmail.com', 'password123', 'Bunty123', 'Beast256'),
       (102, 'Virat Smith', 'Smith56@gmail.com', 'password456', 'VK18', 'Smt56');

select * from user_account

-- Insert values into the role 

INSERT INTO role (id, role_name)
VALUES (101, 'Analysis'),
       (102, 'Scientist');

select * from role

-- Insert values into the user_has_role table

INSERT INTO user_has_role (id, role_start_time, role_end_time, user_account_id, role_id)
VALUES (101, '2023-07-03 10:00:00', DEFAULT, 101, 101),
       (102, '2023-07-03 11:30:00', DEFAULT, 102, 102);

select * from user_has_role

-- Insert values into the user_has_status table

INSERT INTO user_has_status (ID, status_start_time, status_end_time, user_account_id, status_id)
VALUES (101, '2023-07-03 10:00:00', DEFAULT, 101, 101),
       (102, '2023-07-03 11:00:00', DEFAULT, 102, 102);

select * from user_has_status



----There is no boolean data type in SQL Server. However, a common option is to use the BIT data type
----A table can only have one timestamp column.
 

 		select * from status
		select * from user_account
		select * from role
		select * from user_has_role
		select * from user_has_status


		DELETE FROM user_has_status;
		DELETE FROM user_has_role;
		DELETE FROM user_account;
		DELETE FROM role;
		DELETE FROM status;