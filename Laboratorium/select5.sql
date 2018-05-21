/*Iloœæ lotów wykonywana z Polski do ka¿dego z krajów, który nie jest Polsk¹, w ci¹gu tygodnia. Wynik
	posortowany wed³ug nazw krajów.*/

SELECT SUM(LEN(Dni_tygodnia) - LEN(REPLACE(Dni_tygodnia, ' ',''))+ 1) as Ilosc, Kraj
	FROM Rozklad_lotow	JOIN Lotnisko
		ON Rozklad_lotow.Kod_docel = Lotnisko.Kod
	WHERE Kraj != 'Polska'
	GROUP BY Kraj
	ORDER BY Kraj ASC