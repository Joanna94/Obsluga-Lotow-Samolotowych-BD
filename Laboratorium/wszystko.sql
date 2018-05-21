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


/*Dane wlascicieli rezerwacji na loty w 2016 roku: Nazwa, E-mail, Telefon, NIP, Miasto, Kod pocztowy i Adres*/

CREATE VIEW Wlasciciele_rezerwacji_loty_2016_rok
AS
	SELECT Id, (Osoba.Nazwisko+' '+Osoba.Imie) as Nazwa, E_mail, Telefon, NULL as NIP, 
		SUBSTRING(Adres, CHARINDEX('-', Adres)+5, LEN(Adres)-CHARINDEX('-', Adres)) as Miasto,
		SUBSTRING(Adres, CHARINDEX('-', Adres)-2, 6) as 'Kod pocztowy',
		SUBSTRING(Adres, 1, CHARINDEX('-', Adres) - 3) as Adres
		FROM Wlasciciel_rezerwacji, Osoba, Rezerwacja
		WHERE Wlasciciel_rezerwacji.Id = Osoba.Id_wlasciciel
			AND Rezerwacja.Id_wlasciciel = Wlasciciel_rezerwacji.Id
			AND DATEPART(YEAR, Data_rejsu) = '2016'
	UNION
	SELECT Id, Nazwa, E_mail, Telefon, NIP,
		SUBSTRING(Adres, CHARINDEX('-', Adres)+5, LEN(Adres)-CHARINDEX('-', Adres)) as Miasto,
		SUBSTRING(Adres, CHARINDEX('-', Adres)-2, 6) as 'Kod pocztowy',
		SUBSTRING(Adres, 1, CHARINDEX('-', Adres) - 3) as Adres
		FROM Wlasciciel_rezerwacji, Podmiot, Rezerwacja
		WHERE Wlasciciel_rezerwacji.Id = Podmiot.Id_wlasicicel
			AND Rezerwacja.Id_wlasciciel = Wlasciciel_rezerwacji.Id
			AND DATEPART(YEAR, Data_rejsu) = '2016'


/*Nazwiska w³aœcicieli lub nazwy podmiotów, którzy maj¹ maila za³o¿onego w domenie, która jest najpopularniejsza
	wœród w³aœcicieli rezerwacji.*/

	SELECT SUBSTRING(E_mail, CHARINDEX('@', E_mail)+1, LEN(E_mail)-CHARINDEX('@', E_mail)) as Domena, COUNT(*) as Ilosc
		INTO Zestaw_domen
		FROM Wlasciciel_rezerwacji
		GROUP BY SUBSTRING(E_mail, CHARINDEX('@', E_mail)+1, LEN(E_mail)-CHARINDEX('@', E_mail))


	SELECT Nazwisko as 'Osoba lub podmiot'
		FROM Osoba, Zestaw_domen, Wlasciciel_rezerwacji
		WHERE Osoba.Id_wlasciciel = Wlasciciel_rezerwacji.Id
		AND SUBSTRING(E_mail, CHARINDEX('@', E_mail)+1, LEN(E_mail)-CHARINDEX('@', E_mail)) = Domena
		AND Ilosc =(
		SELECT MAX(Ilosc)
			FROM Zestaw_domen)
	UNION
	SELECT Nazwa as 'Osoba lub podmiot'
		FROM Podmiot, Zestaw_domen, Wlasciciel_rezerwacji
		WHERE Podmiot.Id_wlasicicel = Wlasciciel_rezerwacji.Id
		AND SUBSTRING(E_mail, CHARINDEX('@', E_mail)+1, LEN(E_mail)-CHARINDEX('@', E_mail)) = Domena
		AND Ilosc =(
		SELECT MAX(Ilosc)
			FROM Zestaw_domen)


/*Iloœæ lotów wykonywana z Polski do ka¿dego z krajów, który nie jest Polsk¹, w ci¹gu tygodnia. Wynik
	posortowany wed³ug nazw krajów.*/

SELECT SUM(LEN(Dni_tygodnia) - LEN(REPLACE(Dni_tygodnia, ' ',''))+ 1) as Ilosc, Kraj
	FROM Rozklad_lotow	JOIN Lotnisko
		ON Rozklad_lotow.Kod_docel = Lotnisko.Kod
	WHERE Kraj != 'Polska'
	GROUP BY Kraj
	ORDER BY Kraj ASC



/*Numer rezerwacji, nazwiska osób i numery telefonow, ktorych lot odbedzie sie miedzy marcem a sierpniem.
	Wynik posortowany wg numerow rezerwacji.*/

SELECT Nr_rezerwacji, Nazwisko, Telefon
	FROM Rezerwacja, Osoba, Wlasciciel_rezerwacji
	WHERE DATEPART(MONTH, Data_rejsu) >= '03'
		AND DATEPART(MONTH, Data_rejsu) <= '08'
		AND Osoba.Id_wlasciciel = Rezerwacja.Id_wlasciciel
		AND Wlasciciel_rezerwacji.Id = Osoba.Id_wlasciciel
	ORDER BY Nr_rezerwacji ASC



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