/*
 * @author Tomasz Wąs
 * @create date 2023-06-02 12:18:59
 * @modify date 2023-06-03 17:58:19
 * @desc Procedures for prison database
 */

-- Utworzenie nowej tabeli, do której są wprowadzane zdarzenia - data oraz opis (wpis zawiera przykładowo "aktualizacja danych" oraz datę)
CREATE TABLE Event_log(
    id_event INT IDENTITY(1, 1) PRIMARY KEY,
    Event_date DATETIME,
    Event_description VARCHAR(255)
);

--Procedura dodaje więźnia do tabeli Wiezien według podanych zmiennych; id więźnia jest autoinkrementowane. Imie i nazwisko są poprawiane za pomocą set
CREATE PROCEDURE Dodaj_wieznia @imie VARCHAR(255), @nazwisko VARCHAR(255), @data_urodzenia DATE, @wiek INT, @narodowosc VARCHAR(255)
AS
BEGIN
    -- Poprawa imienia - pierwsza litera wielka, reszta małymi literami
    SET @imie = UPPER(LEFT(@imie, 1)) + LOWER(SUBSTRING(@imie, 2, LEN(@imie)-1));
    -- Poprawa nazwiska - pierwsza litera wielka, reszta małymi literami
    SET @nazwisko = UPPER(LEFT(@nazwisko, 1)) + LOWER(SUBSTRING(@nazwisko, 2, LEN(@nazwisko)-1));
    -- Poprawa narodowości - pierwsza litera wielka, reszta małymi literami
    SET @narodowosc = UPPER(LEFT(@narodowosc, 1)) + LOWER(SUBSTRING(@narodowosc, 2, LEN(@narodowosc)-1));
    -- Wstawienie poprawionych danych do tabeli Wiezien
    INSERT INTO Wiezien (imie, nazwisko, data_urodzenia, wiek, narodowosc) VALUES (@imie, @nazwisko, @data_urodzenia, @wiek, @narodowosc);
    -- Rejestracja wydarzenia
    INSERT INTO Event_log (Event_date, Event_description) VALUES (GETDATE(), 'Dodanie nowego wieznia');
END;

--Example of use
EXEC Dodaj_wieznia 'aDAM', 'kOWALSKI', '1996-02-02', 44, 'vIETNAM'
SELECT * from Wiezien

-- Nowa tabela ze statystykami, potrzebna do następnej procedury:
CREATE TABLE Statystyki (
    id_statystyka INT IDENTITY(1, 1) PRIMARY KEY,
    liczba_wiezniow INT,
    sredni_wiek FLOAT,
    liczba_odwiedzajacych INT,
    sredni_czas_wyroku FLOAT,
    data_generowania DATETIME DEFAULT GETDATE()
);
-- Procedura przedstawia raport o stanie więzienia
-- nie ma parametrów wejściowych,ponieważ procedura operuje na danych z innych 
CREATE PROCEDURE Statystyka
AS
BEGIN
	-- Zmienna do przechowywania średniego wyroku
    DECLARE @sredni_czas_wyroku FLOAT;
	DECLARE @sredni_wiek FLOAT
	DECLARE @liczba_wiezniow INT
	DECLARE @liczba_odwiedzajacych INT
    -- Liczba wiezniow oraz odwiedzających:
    SELECT @liczba_wiezniow = liczba_wiezniow,@liczba_odwiedzajacych = liczba_odwiedzajacych FROM dane_wiezienia
    -- Średni czas trwania wyroku:
    SELECT @sredni_czas_wyroku = AVG(czas_trwania) FROM Wyrok;
	-- Wyświetla średni wiek więźniów
    SELECT @sredni_wiek = AVG(dbo.ObliczWiek4(data_urodzenia)) FROM Wiezien
    -- Wstawianie danych do tabeli ze statystykami
	INSERT INTO Statystyki(liczba_wiezniow, sredni_wiek, liczba_odwiedzajacych, sredni_czas_wyroku) VALUES (@liczba_wiezniow, @sredni_wiek, @liczba_odwiedzajacych, @sredni_czas_wyroku);
    -- Wyświetlenie raportu
    PRINT 'Raport o stanie wiezienia:';
    PRINT 'Liczba więźniów: ' + CAST(@liczba_wiezniow AS VARCHAR(5));
	PRINT 'Średni wiek więźniów: ' + CAST(@sredni_wiek AS VARCHAR(5));
	PRINT 'Liczba odwiedzajacych: ' + CAST(@liczba_odwiedzajacych AS VARCHAR(5));
    PRINT 'Średni czas trwania wyroków: ' + CAST(@sredni_czas_wyroku AS VARCHAR(15)) + ' dni';
END

