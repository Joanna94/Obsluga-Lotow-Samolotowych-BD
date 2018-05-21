/*Na któr¹ rezerwacjê przypada najwiêcej wykupionych baga¿y? Wypisuje numer rezerwacji i sumê baga¿y*/

SELECT Rezerwacja.Nr_rezerwacji, SUM(Ilosc_bagazu) AS Suma
	INTO Suma_bagazu /*tablica tymczasowa*/	
	FROM Rezerwacja, Pasazer, Odprawa
	WHERE Rezerwacja.Nr_rezerwacji = Pasazer.Nr_rezerwacji
		AND Odprawa.Id_pasazer = Pasazer.Id
	GROUP BY Rezerwacja.Nr_rezerwacji
	ORDER BY Suma DESC

SELECT Nr_rezerwacji, Suma
	FROM Suma_bagazu
	WHERE Suma = (
		SELECT MAX(Suma)
			FROM Suma_bagazu
	)