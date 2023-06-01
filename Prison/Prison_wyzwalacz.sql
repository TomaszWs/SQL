
--do wyzwalacza potrzebna jest nowa tabela, która będzie modyfikowana przez wyzwalacz
CREATE TABLE dane_wiezienia (liczba_wyrokow INT, liczba_wiezniow INT, liczba_odwiedzajacych INT);

INSERT INTO dane_wiezienia (liczba_wyrokow, liczba_wiezniow, liczba_odwiedzajacych)
SELECT (SELECT COUNT(*) FROM Wyrok), (SELECT COUNT(*) FROM Wiezien), (SELECT COUNT(*) FROM Odwiedzajacy)

SELECT * FROM dane_wiezienia

--wyzwalacz po modyfilacji wyroku (usunięciu,dodaniu bądź zmianie) przelicza ilość wyroków i aktualizuje dane w tabeli dane_wiezienia
CREATE TRIGGER trigger_aktualizuj_dane_wiezienia
ON Wyrok
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
UPDATE dane_wiezienia
SET liczba_wyrokow = (SELECT COUNT(*) FROM Wyrok);
END;


DELETE FROM Wyrok WHERE id_Wyrok = 6;
SELECT * FROM dane_wiezienia