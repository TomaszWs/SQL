--Tabela adres
INSERT INTO Adresy(kraj,miasto,kod_pocztowy,ulica,numer_budynku,numer_mieszkania) VALUES
    ('Polska', 'Warszawa', '80-100', 'ul. Wita Stwosza', 1, 2),
    ('Polska', 'Zakopane', '80-100', 'ul. Wita Stwosza', 3, 4),
    ('Polska', 'Gdansk', '80-100', 'ul. Wita Stwosza', 5, 6),
    ('Polska', 'Gdansk', '80-100', 'ul. Dluga', 7, 8),
    ('Polska', 'Gdansk', '80-100', 'ul. Szeroka', 9, 10);

INSERT INTO Wiezienie(nazwa, dyrektor) VALUES
    ('Wiezienie nr 1', 'Stefan Batory'),
    ('Więzienie nr 2', 'Iwan Iwanowicz'),
    ('Więzienie nr 3', 'Feliks Dzierzynski'),
	('Więzienie nr 4', 'Mansa Musa'),
	('Więzienie nr 5', 'Aleksander Newski');

--program pracown
INSERT INTO Program_pracowniczy(nazwa,opis) VALUES
    ('Stolarstwo','Produkcja stolarska'),
    ('Kowalstwo', 'Produkcja kowalska'),
	('Kopiarstwo','Przepisywanie Bibli'),
    ('Sprzatanie', 'Sprzatanie wiezienia'),
    ('Murarstwo', 'Budowa muru');

--taela rehabilit.
INSERT INTO Program_rehabilitacja(nazwa,opis,czas_trwania) VALUES
    ('Terapia', 'Spotkania ze specjalista',180),
    ('Program 2', 'Resocjalizacja',90),
    ('Program 3', 'Praca',30),
    ('Program 4', 'Praca plus terapia',15),
    ('Program 5', 'Praca minus terapia',7);

-- Tabela osadzonych
INSERT INTO Wiezien(imie,nazwisko,data_urodzenia,wiek,narodowosc,id_rehabilitacja,id_praca,id_placowka) VALUES
    ('Gavrilo', 'Princip','1894-07-25',23, 'Austro-Wegry',1,1,1),
    ('Konrad', 'Adenauer','1924-03-22',55, 'Niemcy',1,2,1),
	('Adam', 'Mickiewicz','1222-02-11',19, 'Litwa',2,2,1),
	('Liang', 'Zhuge','1060-12-12',88, 'Wei',3,3,1),
	('Neil', 'Armstrong','1940-10-10',39, 'USA',4,4,1);

--Tabela wizyta
INSERT INTO Wizytacja(data_godzina,powod_wizyta,id_wiezien) VALUES
    (GETDATE(),'Konsultacja prawna',1),
    (GETDATE(),'Spotkanie rodzinne',2),
    (GETDATE(),'Spotkanie rodzinne',3),
    (GETDATE(),'Wydziedziczenie',4),
	(GETDATE(),'Morderstwo',5);

--Tabela odwiedzajac
INSERT INTO Odwiedzajacy(imię,nazwisko,relacja_z_wiezniem,id_adres,id_wizyta) VALUES
    ('Jan', 'Kowalski','Rodzic',1,1),
    ('Jan', 'Nowak','Rodzic',2,2),
    ('Piotr', 'Adamczyk','Przyjaciel',3,3),
    ('Marta', 'Maria','Siostra',4,4),
    ('Tomasz', 'Kot','Brat',5,5);

--Tabela dokumentacja
INSERT INTO Dokumentacja_medyczna(stan_zdrowia,przepisane_leki,id_wiezien) VALUES
    ('Alergia', 'Desloratadyna',1),
    ('Stabilny',NULL,2),
    ('Zły', 'Morfina, Kokaina',3),
    ('Dobry', 'Desloratadyna',4),
    ('Stabilny',NULL,5);

--Tabela dziennik
INSERT INTO Dziennik_bezpieczenstwa (data_godzina,opis,id_wiezien) VALUES
    (GETDATE(), 'Morderstwo',1),
    (GETDATE(), 'Bojka',2),
	(GETDATE(), 'Handel narkotykami',3),
    (GETDATE(), 'Gra w szachy',4),
	(GETDATE(), 'Morderstwo',5);

-- Tabela wyrok
INSERT INTO Wyrok(data_wydania,czas_trwania,popelnione_przestepstwo,id_wiezien) VALUES
    ('2023-01-01', 365, 'Kradziez',5),
    ('2023-01-02', 730, 'Napad',4),
	('2023-01-03', 365, 'Wlamanie',3),
    ('1914-03-04', 730, 'Napad',2),
	('1914-06-28', 36500, 'Morderstwo',1);
