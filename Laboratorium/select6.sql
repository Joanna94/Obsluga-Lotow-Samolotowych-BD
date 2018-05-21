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

/*SUBSTRING(jaki_string, od, do)*/
