USE wild_db_quest

CREATE TABLE Jets (id INTEGER PRIMARY KEY, name TEXT, country TEXT, Colour TEXT, Tail_number INTEGER);
INSERT INTO Jets (name, country, colour, Tail_number) VALUES ("MIG-21", "Russia", "Grey", "92");
INSERT INTO Jets (name, country, colour, Tail_number) VALUES ("F-16", "USA", "Blue", "578");
INSERT INTO Jets (name, country, colour, Tail_number) VALUES ("Rafale", "France", "Green", "667");
INSERT INTO Jets (name, country, colour, Tail_number) VALUES ("Harpem", "Australia", "Yellow", "23");


SELECT*FROM Jets