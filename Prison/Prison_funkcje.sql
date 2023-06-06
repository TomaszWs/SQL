/*
 * @author Tomasz Wąs
 * @create date 2023-06-02 12:40:36
 * @modify date 2023-06-06 15:07:26
 * @desc Functions for prison database
 */
 
--Funkcja oblicza i zwraca bieżący wiek więźnia/ów na podstawie daty urodzenia (w przeciwieństwie do wieku przyjęcia do więzienia)
--Funkcja wykorzystywana w procedurze do obliczania statystyk
CREATE FUNCTION ObliczWiek (@data_urodzenia DATE) RETURNS INT 
AS
BEGIN
DECLARE @wiek INT;
SET @wiek = DATEDIFF(YEAR, @data_urodzenia, GETDATE());
RETURN @wiek;
END

SELECT imie, nazwisko, dbo.ObliczWiek(data_urodzenia) AS Wiek FROM Wiezien;

--Funkcja zwraca czas pozostały do końca wyroku oraz datę końca wyroku 
CREATE FUNCTION Czas_wyroku(@id_wiezien INT) 
RETURNS @wyniki TABLE
(pozostaly_czas INT,koniec_wyroku DATE)
AS
BEGIN
    DECLARE @czas_trwania INT;
    DECLARE @data_wydania DATE;
    DECLARE @koniec_wyroku DATE;
    DECLARE @pozostaly_czas INT;
    -- Pobranie danych z tabeli Wyrok dla danego więźnia
    SELECT @czas_trwania = czas_trwania, @data_wydania = data_wydania FROM Wyrok WHERE id_wiezien = @id_wiezien;
    -- Oblicza datę końca wyroku
    SET @koniec_wyroku = DATEADD(DAY, @czas_trwania, @data_wydania);
    -- Oblicza czas pozostały do końca wyroku
    SET @pozostaly_czas = DATEDIFF(DAY, GETDATE(), @koniec_wyroku);
    -- Wstawienie wyników do tabeli tymczasowej
    INSERT INTO @wyniki (pozostaly_czas, koniec_wyroku) VALUES (@pozostaly_czas, @koniec_wyroku);
    -- Zwrócenie tabeli tymczasowej
    RETURN;
END;

-- Przykład użycia
Select Wiezien.nazwisko,Wyrok.data_wydania,Wyrok.czas_trwania from Wiezien join Wyrok on Wiezien.id_wiezien = Wyrok.id_wiezien
SELECT pozostaly_czas, koniec_wyroku FROM dbo.Czas_wyroku(5);
