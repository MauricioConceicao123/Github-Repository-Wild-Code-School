INSERT INTO school (name, country, capacity) VALUES ('Hogwarts School of Witchcraft and Wizardry','United Kingdom', 400);

SHOW TABLES;
DESCRIBE school;

INSERT INTO school (name, country, capacity)
VALUES ('Beauxbatons Academy of Magic', 'France', 550),
('Castelobruxo','Brazil',380),
('Durmstrang Institute', 'Norway', 570);

SHOW TABLES;
DESCRIBE school;

UPDATE school
SET capacity=450
WHERE id=1;

DELETE FROM school
WHERE id=3;

SELECT * FROM school;

DELETE FROM school
WHERE capacity>500;

/** HELP: Cant perform the upper command, please check out **/

TRUNCATE school;

SELECT * FROM school;

/** QUEST 3 Resolution **/

INSERT INTO school (name, country, capacity)
VALUES ('Beauxbatons Academy of Magic', 'France', 550),
('Castelobruxo','Brazil',380),
('Durmstrang Institute', 'Norway', 570),
('Hogwarts School of Witchcraft and Wizardry', 'United Kingdom', 450),
('Ilvermorny School of Witchcraft and Wizardry', 'USA', 300),
('Koldovstoretz', 'Russia', 125),
('Mahoutokoro School of Magic', 'Japan', 800),
('Uagadou School of Magic', 'Uganda', 350);

SELECT * FROM school;

UPDATE school
SET country='Sweden'
WHERE id=3;

UPDATE school
SET capacity=700
WHERE id=7;

DELETE FROM school
WHERE name LIKE '%Magic%';

/** HELP: Cant perform the upper command, sad emoji, please check out **/