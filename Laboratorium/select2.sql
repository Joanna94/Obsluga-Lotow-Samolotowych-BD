/*Wypisuje rodzaje samolot�w oraz sum� miejsc, kt�re maj� wi�cej miejsc, ni� �rednia miejsc posiadanych
	przez wszystkie dost�pne samoloty.*/


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