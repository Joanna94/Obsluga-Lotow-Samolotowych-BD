/*Wypisuje rodzaje samolotów oraz sumê miejsc, które maj¹ wiêcej miejsc, ni¿ œrednia miejsc posiadanych
	przez wszystkie dostêpne samoloty.*/


SELECT (Ilosc_m_kl_biznes+Ilosc_m_kl_ekonom+Ilosc_m_kl_pierwsza) AS Suma, Id
	INTO Miejsca /*Tablica tymczasowa*/
	FROM Samolot

SELECT Suma, Rodzaj
	FROM Miejsca JOIN Samolot
		ON Miejsca.Id = Samolot.Id
	WHERE Suma > (
		SELECT AVG(Suma)
			FROM Miejsca
		)