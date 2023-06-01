
--Widok zbiera informacje o wizycie i wiezniu
CREATE VIEW WizytacjeWiezniow 
AS 
SELECT Wizytacja.id_wizyta, Wizytacja.data_godzina, Wizytacja.powod_wizyta, Wiezien.imie, Wiezien.nazwisko, Wiezien.data_urodzenia, Wiezien.narodowosc
FROM Wizytacja JOIN Wiezien ON Wizytacja.id_wiezien = Wiezien.id_wiezien;

SELECT * FROM WizytacjeWiezniow;