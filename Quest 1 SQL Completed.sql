CREATE DATABASE `wild_db_quest`;
  USE `wild_db_quest`;
  CREATE TABLE `wizard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `birth_place` VARCHAR(255) NULL,
  `biography` TEXT NULL,
  PRIMARY KEY (`id`));
 CREATE TABLE school (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  capacity INT,
  country VARCHAR(255) NOT NULL
); 
SHOW TABLES;
DESCRIBE wizard;
DESCRIBE school;
