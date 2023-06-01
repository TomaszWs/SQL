
--Widok zbiera informacje o wizycie, wiezniu oraz osobie odwiedzającej
CREATE VIEW WizytacjeWiezniow
AS 
SELECT Wizytacja.data_godzina, Wizytacja.powod_wizyta, Wiezien.imie, Wiezien.nazwisko, Wiezien.data_urodzenia, Wiezien.narodowosc, 
Odwiedzajacy.imię, Odwiedzajacy.nazwisko, Odwiedzajacy.relacja_z_wiezniem
FROM Wizytacja JOIN Wiezien ON Wizytacja.id_wiezien = Wiezien.id_wiezien JOIN Odwiedzajacy ON Wizytacja.id_wizyta = Odwiedzajacy.id_wizyta

SELECT * FROM WizytacjeWiezniow;