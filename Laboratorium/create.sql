CREATE TABLE Lotnisko(
	Kod char(3) NOT NULL PRIMARY KEY,
	Kraj varchar(20) NOT NULL,
	/*Miasto varchar(20) NOT NULL Alter table*/
);

CREATE TABLE Rozklad_lotow(
	Nr_rejsu char(8) NOT NULL PRIMARY KEY,
	Dni_tygodnia varchar(20) NOT NULL,
	Odlot time(0) NOT NULL,
	Przylot time(0) NOT NULL,
	Okres char(21) NOT NULL,
	Przesiadki int NOT NULL CHECK (Przesiadki >= 0 AND Przesiadki <= 2),
	Kod_start char(3) NOT NULL REFERENCES Lotnisko,
	Kod_docel char(3) NOT NULL REFERENCES Lotnisko,
);

CREATE TABLE Samolot(
	Id int PRIMARY KEY,
	Rodzaj varchar(20) NOT NULL,
	Ilosc_m_kl_ekonom int NOT NULL,
	Ilosc_m_kl_biznes int NOT NULL,
	Ilosc_m_kl_pierwsza int NOT NULL,
	Kraj_produkcji varchar(20) /*nizej drop w alter table*/
);

CREATE TABLE Lot(
	Nr_rejsu char(8) NOT NULL,
	Data_rejsu date NOT NULL,
	Odlot time(0) NOT NULL,
	Przylot time(0) NOT NULL,
	Przesiadki int NOT NULL CHECK (Przesiadki >= 0 AND Przesiadki <= 2),
	Numer_rejsu_rozkl char(8) NOT NULL REFERENCES Rozklad_lotow,
	Id_samolot	int NOT NULL REFERENCES Samolot,
	PRIMARY KEY (Nr_rejsu, Data_rejsu)
);

CREATE TABLE Wlasciciel_rezerwacji(
	Id int NOT NULL PRIMARY KEY,
	E_mail varchar(30) NOT NULL,
	Telefon char(9) NOT NULL,
	Adres varchar(50) NOT NULL
);

CREATE TABLE Osoba(
	Id_os int NOT NULL PRIMARY KEY,
	Id_wlasciciel int NOT NULL REFERENCES Wlasciciel_rezerwacji,
	Imie varchar(15) NOT NULL,
	Nazwisko varchar(15) NOT NULL,
);

CREATE TABLE Podmiot(
	Id_podm int NOT NULL PRIMARY KEY,
	Id_wlasicicel int NOT NULL REFERENCES Wlasciciel_rezerwacji,
	Nazwa varchar(100) NOT NULL,
	NIP int NOT NULL CHECK(NIP >= 100000000 AND NIP <= 999999999),
);

CREATE TABLE Rezerwacja(
	Nr_rezerwacji char(6) NOT NULL PRIMARY KEY,
	Data_rezerwacji date NOT NULL,
	Ilosc_os_doroslych int  NOT NULL DEFAULT(1) CHECK(Ilosc_os_doroslych >= 1),
	Ilosc_os_nieletnich int NOT NULL CHECK(Ilosc_os_nieletnich >=0),
	Rodzaj_klasy char(11) NOT NULL 
		CHECK(Rodzaj_klasy = 'ekonomiczna' OR Rodzaj_klasy = 'biznes' OR Rodzaj_klasy = 'pierwsza'),
	Id_wlasciciel int NOT NULL REFERENCES Wlasciciel_rezerwacji,
	Nr_rejsu char(8) NOT NULL,
	Data_rejsu date NOT NULL,
	FOREIGN KEY (Nr_rejsu, Data_rejsu) REFERENCES Lot(Nr_rejsu, Data_rejsu)
);

CREATE TABLE Pasazer(
	Id int NOT NULL PRIMARY KEY,
	Imie varchar(15) NOT NULL,
	Nazwisko varchar(15) NOT NULL,
	Wiek char(8) NOT NULL CHECK (Wiek = 'dorosly' OR Wiek = 'nieletni'),
	Nr_rezerwacji char(6) NOT NULL REFERENCES Rezerwacja
);

CREATE TABLE Odprawa(
	Id int NOT NULL PRIMARY KEY,
	Dok_odprawy char(9),
	Termin_odprawy char(6) NOT NULL DEFAULT('30d-3h'),
	Status_odprawy char(13) NOT NULL DEFAULT('nieodprawiony') 
		CHECK (Status_odprawy = 'odprawiony' OR Status_odprawy = 'nieodprawiony'),
	Ilosc_bagazu tinyint CHECK (Ilosc_bagazu >= 0 AND Ilosc_bagazu <= 6),
	Miejsce char(3),
	Nr_karty_pokl char(6),
	Nr_rejsu char(8) NOT NULL,
	Data_rejsu date NOT NULL,
	Id_pasazer int NOT NULL REFERENCES Pasazer,
	FOREIGN KEY(Nr_rejsu, Data_rejsu) REFERENCES Lot(Nr_rejsu, Data_rejsu)
);

CREATE TABLE Bagaz(
	Nr_stickera char(10) NOT NULL PRIMARY KEY,
	Waga int NOT NULL CHECK (Waga >=0 AND Waga <= 32),
	Id_odprawy int NOT NULL REFERENCES Odprawa,
	Kod_lotn char(3) NOT NULL REFERENCES Lotnisko
);

/* ALTER TABLE */
ALTER TABLE Samolot
	DROP COLUMN Kraj_produkcji;

ALTER TABLE Lotnisko
	ADD Miasto varchar(20) NOT NULL;