--Funkcja oblicza i zwraca bieżący wiek więźnia/ów na podstawie daty urodzenia (w przeciwieństwie do wieku przyjęcia do więzienia)
CREATE FUNCTION ObliczWiek (@data_urodzenia DATE) RETURNS INT 
AS
BEGIN
DECLARE @wiek INT;
SET @wiek = DATEDIFF(YEAR, @data_urodzenia, GETDATE());
RETURN @wiek;
END

SELECT imie, nazwisko, dbo.ObliczWiek(data_urodzenia) AS Wiek FROM Wiezien;

--Funkcja zwraca najdłuższy wyrok w postaci tabeli wybierając najwyższy wynik z posortowanej malejąco tabeli wyrok 
CREATE FUNCTION pobierz_najdluzszy_wyrok() RETURNS TABLE 
AS
RETURN
(SELECT TOP 1 * FROM Wyrok ORDER BY czas_trwania DESC);

SELECT * FROM dbo.pobierz_najdluzszy_wyrok();

INSERT INTO Wyrok(data_wydania,czas_trwania,popelnione_przestepstwo,id_wiezien) VALUES('2023-01-01', 1000000, 'Kradziez',6)
SELECT * FROM dbo.pobierz_najdluzszy_wyrok();