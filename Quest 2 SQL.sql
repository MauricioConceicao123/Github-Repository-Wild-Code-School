INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('harry', 'potter', '1980-07-31', 'london', '', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('hermione', 'granger', '1979-09-19', '', 'Friend of Harry Potter', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('lily', 'potter', '1960-01-30', '', 'mother of Harry Potter', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('ron', 'weasley', '1980-03-01', '', 'Best friend of Harry', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('ginny', 'weasley', '1981-08-11', '', 'Sister of Ron and girlfriend of Harry', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('fred', 'weasley', '1978-04-01', '', '', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('george', 'weasley', '1978-04-01', '', '', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('arthur', 'weasley', '1950-02-06', '', '', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('molly', 'weasley', '1949-01-01', '', '', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('drago', 'malefoy', '1980-06-05', '', '', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('albus', 'dumbledore', '1881-07-01', '', '', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('severus', 'rogue', '1960-01-09', '', '', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('tom', 'jÃ©dusor', '1926-12-31', '', 'Celui-Dont-On-Ne-Doit-Pas-Prononcer-Le-Nom alias Voldermort', '0');
INSERT INTO `wild_db_quest`.`wizard` (`firstname`, `lastname`, `birthday`, `birth_place`, `biography`, `is_muggle`) VALUES ('dudley', 'dursley', '1980-06-23', '', 'Cousin d\'Harry', '1');

/** I like bananas **/

SHOW TABLES;
DESCRIBE wizard;

/** Ways of selecting specific data, in this case birthday dates**/

SELECT * FROM wizard WHERE birthday BETWEEN '1950-02-06' AND '1980-07-31';
SELECT * FROM wizard WHERE birthday BETWEEN '1950-02-06' AND '1980-07-31' LIMIT 2;
SELECT * FROM wizard WHERE birthday BETWEEN '1950-02-06' AND '1980-07-31' LIMIT 2 OFFSET 2;
SELECT * FROM wizard WHERE birthday LIKE '195%' OR birthday like '196%';

/** Retrieve all of the tuples containing wizards born between 1975 and 1985 **/

SELECT * FROM 	wizard WHERE birthday BETWEEN '1975-01-01' AND '1985-12-31';

/** Retrieve the wizards’ firstnames whose first names start with the letter “H” **/

SELECT * FROM wizard WHERE firstname LIKE 'H%';

/** Retrieve the first names and last names of the whole “Potter” family, ordered by first name **/

SELECT firstname, lastname FROM wizard WHERE lastname = 'Potter' ORDER BY firstname;

/** Retrieve the oldest wizard’s first name, last name and birth date (this must work regardless of the table content) **/

SELECT firstname, lastname, birthday FROM wizard ORDER BY birthday ASC LIMIT 1;

