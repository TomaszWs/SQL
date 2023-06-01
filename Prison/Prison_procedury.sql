--Procedura dodaje więźnia według podanych zmiennych; id więźnia jest autoinkrementowane
CREATE PROCEDURE DodajWieznia @imie VARCHAR(255), @nazwisko VARCHAR(255), @data_urodzenia DATE, @wiek INT, @narodowosc VARCHAR(255) 
AS
INSERT INTO Wiezien (imie, nazwisko, data_urodzenia, wiek, narodowosc) VALUES (@imie, @nazwisko, @data_urodzenia, @wiek, @narodowosc)

--Procedura aktualizuje dane więźnia - podmienia stare dane nowymi
CREATE PROCEDURE AktualizujWieznia @id_wiezien INT,@imie VARCHAR(255),@nazwisko VARCHAR(255),@data_urodzenia DATE,@wiek INT,@narodowosc VARCHAR(255)
AS
UPDATE Wiezien
SET imie = @imie, nazwisko = @nazwisko, data_urodzenia = @data_urodzenia, wiek = @wiek, narodowosc = @narodowosc WHERE id_wiezien = @id_wiezien

EXEC DodajWieznia 'Tomasz', 'Wąs', '1996-02-02', 44, 'Vietnam'
SELECT * from Wiezien

EXEC AktualizujWieznia 6, 'Tomasz', 'Wąs', '1999-01-01', 99, 'Polska'
SELECT * from Wiezien