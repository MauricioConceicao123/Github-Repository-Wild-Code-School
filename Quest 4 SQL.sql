SELECT * FROM wizard

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE school;
TRUNCATE wizard;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM wizard;
SELECT * FROM school;


INSERT INTO school (name, country, capacity)   
VALUES ('Beauxbatons Academy of Magic', 'France', 550),   
('Castelobruxo', 'Brazil', 380),   
('Durmstrang Institute', 'Norway', 570),   
('Hogwarts School of Witchcraft and Wizardry', 'United Kingdom', 450),
('Ilvermorny School of Witchcraft and Wizardry', 'USA', 300),   
('Koldovstoretz', 'Russia', 125),   
('Mahoutokoro School of Magic', 'Japan', 800),   
('Uagadou School of Magic', 'Uganda', 350);  

ALTER TABLE wizard ADD COLUMN school_id INT NOT NULL AUTO_INCREMENT;


INSERT INTO wizard (firstname, lastname, birthday, birth_place, biography, is_muggle, school_id)    
VALUES ('harry', 'potter', '1980-07-31', 'london', '', '0', 4),   
('hermione', 'granger', '1979-09-19', '', 'Friend of Harry Potter', '0', 4),   
('lily', 'potter', '1960-01-30', '', 'mother of Harry Potter', '0', 4),   
('ron', 'weasley', '1980-03-01', '', 'Best friend of Harry', '0', 4),   
('ginny', 'weasley', '1981-08-11', '', 'Sister of Ron and girlfriend of Harry', '0', 4),   
('fred', 'weasley', '1978-04-01', '', '', '0', 4),   
('george', 'weasley', '1978-04-01', '', '', '0', 4),   
('arthur', 'weasley', '1950-02-06', '', '', '0', 4),   
('molly', 'weasley', ' 1949-01-01', '', '', '0', 4),   
('drago', 'malefoy', '1980-06-05', '', '', '0', 4),   
('albus', 'dumbledore', '1881-07-01', '', '', '0', 4),   
('severus', 'rogue', '1960-01-09', '', '', '0', 4),   
('tom', 'jédusor', '1926-12-31', '', 'Celui-Dont-On-Ne-Doit-Pas-Prononcer-Le-Nom alias Voldermort', '0', 4),   
('dudley', 'dursley', '1980-06-23', '', 'Cousin d\'Harry', '1', 4),   
('fleur', 'delacour', '1977-10-30', '', '', '0', 1),   
('gabrielle', 'delacour', '1985-07-31', '', '', '0', 1),   
('viktor', 'krum', '1976-04-01', '', '', '0', 3),   
('gellert', 'grindelwald', '1883-08-03', '', '', '0', 3),   
('babajide', 'akingbade', '1976-02-23', '', '', '0', 8);

/** Help needed **/