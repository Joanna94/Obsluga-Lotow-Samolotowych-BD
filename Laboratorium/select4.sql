/*Numer rezerwacji, nazwiska osób i numery telefonow, ktorych lot odbedzie sie miedzy marcem a sierpniem.
	Wynik posortowany wg numerow rezerwacji.*/

SELECT Nr_rezerwacji, Nazwisko, Telefon
	FROM Rezerwacja, Osoba, Wlasciciel_rezerwacji
	WHERE DATEPART(MONTH, Data_rejsu) >= '03'
		AND DATEPART(MONTH, Data_rejsu) <= '08'
		AND Osoba.Id_wlasciciel = Rezerwacja.Id_wlasciciel
		AND Wlasciciel_rezerwacji.Id = Osoba.Id_wlasciciel
	ORDER BY Nr_rezerwacji ASC