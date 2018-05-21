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
