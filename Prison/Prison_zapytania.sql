-- Zapytania

SELECT Wiezien.imie, Wiezien.nazwisko, Odwiedzajacy.imię, Odwiedzajacy.nazwisko FROM Wiezien
JOIN Wizytacja ON Wiezien.id_wiezien = Wizytacja.id_wiezien
JOIN Odwiedzajacy ON Wizytacja.id_wizyta = Odwiedzajacy.id_wizyta
WHERE Odwiedzajacy.imię = 'Jan' AND Odwiedzajacy.nazwisko = 'Kowalski';


SELECT Wiezien.imie, Wiezien.nazwisko
FROM Wiezien LEFT JOIN Wizytacja ON Wiezien.id_wiezien = Wizytacja.id_wiezien
WHERE Wizytacja.id_wiezien IS NULL;


SELECT AVG(czas_trwania) AS sredni_czas_trwania
FROM Program_rehabilitacja;


SELECT Wiezien.imie, Wiezien.nazwisko,Wyrok.czas_trwania FROM Wiezien JOIN Wyrok ON Wiezien.id_wiezien = Wyrok.id_wiezien WHERE Wyrok.czas_trwania > (SELECT AVG(czas_trwania) FROM Wyrok);
