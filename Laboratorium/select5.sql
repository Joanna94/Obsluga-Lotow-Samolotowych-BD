/*Ilo�� lot�w wykonywana z Polski do ka�dego z kraj�w, kt�ry nie jest Polsk�, w ci�gu tygodnia. Wynik
	posortowany wed�ug nazw kraj�w.*/

SELECT SUM(LEN(Dni_tygodnia) - LEN(REPLACE(Dni_tygodnia, ' ',''))+ 1) as Ilosc, Kraj
	FROM Rozklad_lotow	JOIN Lotnisko
		ON Rozklad_lotow.Kod_docel = Lotnisko.Kod
	WHERE Kraj != 'Polska'
	GROUP BY Kraj
	ORDER BY Kraj ASC