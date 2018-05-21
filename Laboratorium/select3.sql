/*Wyswietla wszystkich doroslych pasazerow, wraz z numerami kart pokladowych, których waga baga¿u jest mniejsza ni¿ œrednia
	wag wszystkich baga¿y. Wyniki posortowane rosnaco wg nazwisk pasazerow.*/

SELECT Nazwisko, Imie, Nr_karty_pokl
	FROM Pasazer JOIN Odprawa
		ON Pasazer.Id = Odprawa.Id,
		Bagaz
	WHERE Wiek = 'dorosly'
		AND Status_odprawy = 'odprawiony'
		AND Odprawa.Id = Id_odprawy
		AND Waga < (
			SELECT AVG(Waga)
				FROM Bagaz)
	ORDER BY Nazwisko ASC;