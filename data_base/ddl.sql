DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS activity;
DROP TABLE IF EXISTS enroll;

CREATE TABLE user( 
id INT NOT NULL AUTO_INCREMENT, 
name VARCHAR(50) NOT NULL, 
surname VARCHAR(50) NOT NULL, 
DOB DATE,
phone INT(20), 
address VARCHAR(100), 
email VARCHAR(50) UNIQUE NOT NULL, 
photo VARCHAR(300), 
password VARCHAR(32) NOT NULL,
token VARCHAR(32),
user_type VARCHAR(14) NOT NULL CHECK (user_type IN ('admin', 'member')),
PRIMARY KEY (id)
);

CREATE TABLE activity( 
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) UNIQUE NOT NULL,
description MEDIUMTEXT,
photo VARCHAR(300), 
PRIMARY KEY (id)
);

CREATE TABLE enroll( 
user INT REFERENCES USER,
activity INT REFERENCES ACTIVITY,
date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(user, activity)
);
