/*Lotnisko*/
INSERT INTO Lotnisko
	VALUES ('GDN', 'Polska', 'Gdansk');
INSERT INTO Lotnisko
	VALUES ('WAR', 'Polska', 'Warszawa');
INSERT INTO Lotnisko
	VALUES ('IEG', 'Polska', 'Zielona Gora');
INSERT INTO Lotnisko
	VALUES ('HND', 'Japonia', 'Tokio');
INSERT INTO Lotnisko
	VALUES ('OSL', 'Norwegia', 'Oslo');
INSERT INTO Lotnisko
	VALUES ('JFK', 'Stany Zjednoczone','Nowy Jork');
INSERT INTO Lotnisko
	VALUES ('KRK', 'Polska', 'Krakow');
INSERT INTO Lotnisko
	VALUES ('PRG', 'Czechy', 'Praga');
INSERT INTO Lotnisko
	VALUES ('SXF', 'Niemcy', 'Berlin');

/*Rozklad lotow*/
INSERT INTO Rozklad_lotow 
	VALUES ('LO 171', 'PN WT PT', '13:00', '13:45', '01.12.2015-30.04.2016', 0, 'GDN', 'WAR');
INSERT INTO Rozklad_lotow 
	VALUES ('SRN2', 'SO', '18:30', '19:30', '26.10.2015-26.07.2016', 0, 'GDN', 'IEG'); /*Zielona Gora*/
INSERT INTO Rozklad_lotow
	VALUES ('LO 3', 'SR CZ', '12:30', '11:00', '01.01.2016-31.12.2016', 1, 'WAR', 'HND'); /*Tokio lotnisko Haneda*/
INSERT INTO Rozklad_lotow
	VALUES ('LO 151', 'PN SR SO N', '11:00', '13:00', '05.09.2015-28.08.2016', 0, 'GDN', 'OSL'); /*Oslo Norwegia*/
INSERT INTO Rozklad_lotow
	VALUES ('LO 34', 'CZ PT', '6:30', '16:00', '15.01.2016-30.11.2016', 1, 'GDN', 'JFK'); /*Nowy Jork, godzina przylotu nastepnego dnia*/
INSERT INTO Rozklad_lotow
	VALUES ('SRN8', 'PN SR PT SO', '15:00', '17:10', '20.11.2014-31.12.2016', 0, 'GDN', 'KRK'); /*Krakow*/
INSERT INTO Rozklad_lotow
	VALUES ('LO 15', 'PN WT SR CZ PT SO N', '13:15', '14:10', '02.12.2015-31.07.2016', 0, 'WAR', 'KRK');
	

/*Samolot*/
INSERT INTO Samolot
	VALUES (1, 'Boeing 747', 300, 50, 50);
INSERT INTO Samolot
	VALUES (2, 'Airbus A300', 200, 40, 30);
INSERT INTO Samolot
	VALUES (3, 'Antonow An-24', 100, 15, 20);
INSERT INTO Samolot
	VALUES (4, 'Bombardier CRJ', 150, 30, 25);
INSERT INTO Samolot
	VALUES (5, 'Tu-204', 120, 40, 30);
INSERT INTO Samolot
	VALUES (6, 'Boeing 787', 190, 25, 30);
INSERT INTO Samolot
	VALUES (7, 'Embraer 145', 40, 10, 10);

/*Lot*/
INSERT INTO Lot
	VALUES ('LO 3', '2016-04-15', '12:30', '11:00', 1, 'LO 3', 1); /*wypelnione*/
INSERT INTO Lot
	VALUES ('LO 15', '2016-01-03', '13:15', '14:10', 0, 'LO 15', 7); /*wypelnione*/
INSERT INTO Lot
	VALUES ('SRN8', '2015-12-24', '15:00', '17:10', 0, 'SRN8', 3); /*wypelnione*/
INSERT INTO Lot
	VALUES ('LO 171', '2016-03-09', '13:00', '13:45', 0, 'LO 171', 7); /*wypelnione*/
INSERT INTO Lot
	VALUES ('SRN2', '2016-06-20', '18:30', '19:30', 0, 'SRN2', 5);  /*wypelnione*/
INSERT INTO Lot
	VALUES ('LO 34', '2016-08-18', '06:30', '16:00', 1, 'LO 34', 2);
INSERT INTO Lot
	VALUES ('LO 151', '2016-02-15', '11:00', '13:00', 0, 'LO 151', 4); /*wypelnione*/
INSERT INTO Lot
	VALUES('LO 15', '2016-08-01', '13:15', '14:10', 0, 'LO 15', 5);

/*Wlasciciel rezerwacji*/
INSERT INTO Wlasciciel_rezerwacji
	VALUES (1, 'michal87@gmail.com', '500687444', 'Lipowa 12 20-300 Kamien');
INSERT INTO Wlasciciel_rezerwacji
	VALUES (2, 'm.krajnik@wp.pl', '660289754', 'Kochanowskiego 2 46-200 Luzino');
INSERT INTO Wlasciciel_rezerwacji
	VALUES (3, 'urbanski1111@onet.pl', '865247781', 'Nanicka 22 36-147 Dzialdowo');
INSERT INTO Wlasciciel_rezerwacji
	VALUES (4, 'majardzanek@wp.pl', '630158965', 'Poprzeczna 7 40-230 Trzciniec')
INSERT INTO Wlasciciel_rezerwacji
	VALUES (5, 'liceum1@edu.pl', '500145999', 'Bukowa 1 84-200  Wejherowo');
INSERT INTO Wlasciciel_rezerwacji
	VALUES (6, 'jakasfirma@yahoo.pl', '530689555', 'Chopina 32 56-240 Mala Wies');
INSERT INTO Wlasciciel_rezerwacji
	VALUES (7, 'monikazal@wp.pl', '630587411', '12 Maja 5 12-410 Gdynia');
INSERT INTO Wlasciciel_rezerwacji
	VALUES(8, 'najlepsza_firma@wp.pl', '528469200', '13 Ulica 1 11-111 Miasto');

/*Osoba*/
INSERT INTO Osoba
	VALUES (1, 1, 'Michal', 'Grabowski');
INSERT INTO Osoba
	VALUES (2, 2, 'Martyna', 'Krajnik');
INSERT INTO Osoba
	VALUES (3, 3, 'Damian', 'Urbanski');
INSERT INTO Osoba
	VALUES (4, 4, 'Maja', 'Rdzanek');
INSERT INTO OSOBA
	VALUES (5, 7, 'Monika', 'Zalewska');

/*Podmiot*/
INSERT INTO Podmiot
	VALUES (1, 5, '1 Liceum Ogolnoksztalcace im. Krola Jana III Sobieskiego', 155780003);
INSERT INTO Podmiot
	VALUES (2, 6, 'Jakas Firma', 260082505);
INSERT INTO Podmiot
	VALUES (3, 8, 'Najlepsza Firma', 111444444);

/*Rezerwacja*/
INSERT INTO Rezerwacja
	VALUES ('SW666Z', '2015-12-30', 2, 0, 'ekonomiczna', 1, 'LO 151', '2016-02-15');
INSERT INTO Rezerwacja
	VALUES ('D568GH', '2015-11-02', 1, 1, 'pierwsza', 2, 'SRN8', '2015-12-24');
INSERT INTO Rezerwacja
	VALUES ('CA32YF', '2016-03-01', 1, 0, 'biznes', 3, 'LO 3', '2016-04-15');
INSERT INTO Rezerwacja
	VALUES ('PL120A', '2015-12-15', 3, 0, 'ekonomiczna', 4, 'LO 15', '2016-01-03');
INSERT INTO Rezerwacja
	VALUES ('TR657U', '2016-01-04', 5, 0, 'ekonomiczna', 5, 'LO 171', '2016-03-09');
INSERT INTO Rezerwacja
	VALUES ('UNC845', '2016-04-19', 2, 0, 'biznes', 6, 'SRN2', '2016-06-20');
INSERT INTO Rezerwacja
	VALUES ('TF1278', '2016-07-17', 1, 0, 'pierwsza', 7, 'LO 34', '2016-08-18');
INSERT INTO Rezerwacja
	VALUES ('XX445Q', '2016-07-01', 1, 0, 'ekonomiczna', 8, 'LO 15', '2016-08-01');

/*Pasazer*/
INSERT INTO Pasazer
	VALUES (1, 'Michal', 'Grabowski', 'dorosly', 'SW666Z');
INSERT INTO Pasazer
	VALUES (2, 'Przemyslaw', 'Kornowski', 'dorosly', 'SW666Z');
INSERT INTO Pasazer
	VALUES (3, 'Martyna', 'Krajnik', 'dorosly', 'D568GH');
INSERT INTO Pasazer
	VALUES (4, 'Monika', 'Krajnik', 'nieletni', 'D568GH');
INSERT INTO Pasazer
	VALUES (5, 'Damian', 'Urbanski', 'dorosly', 'CA32YF');
INSERT INTO Pasazer
	VALUES (6, 'Maja', 'Rdzanek', 'dorosly', 'PL120A');
INSERT INTO Pasazer
	VALUES (7, 'Joanna', 'Glodowska', 'dorosly', 'PL120A');
INSERT INTO Pasazer
	VALUES (8, 'Pawel', 'Schmidke', 'dorosly', 'PL120A');
INSERT INTO Pasazer
	VALUES (9, 'Anna', 'Lyczkowska', 'dorosly', 'TR657U');
INSERT INTO Pasazer
	VALUES (10, 'Pawel', 'Pallach', 'dorosly', 'TR657U');
INSERT INTO Pasazer
	VALUES (11, 'Julia', 'Slowy', 'dorosly', 'TR657U');
INSERT INTO Pasazer
	VALUES (12, 'Paula', 'Malek', 'dorosly', 'TR657U');
INSERT INTO Pasazer
	VALUES (13, 'Patrycja', 'Pohl', 'dorosly', 'TR657U');
INSERT INTO Pasazer
	VALUES (14, 'Andrzej', 'Poliszkiewicz', 'dorosly', 'UNC845');
INSERT INTO Pasazer
	VALUES (15, 'Stefan', 'Ptak', 'dorosly', 'UNC845');
INSERT INTO Pasazer
	VALUES (16, 'Monika', 'Zalewska', 'dorosly', 'TF1278');
INSERT INTO Pasazer
	VALUES(17, 'Malwina', 'Nowakowska', 'dorosly', 'XX445Q');

/*Odprawa*/
INSERT INTO Odprawa /*Dla wlasciciela Michal Grabowski*/
	VALUES(1, NULL, '30d-3h', 'nieodprawiony', 1, NULL, NULL, 'LO 151', '2016-02-15', 1);
INSERT INTO Odprawa /*Dla wlasciciela Michal Grabowski*/
	VALUES(2, NULL, '30d-3h', 'nieodprawiony', 1, NULL, NULL, 'LO 151', '2016-02-15', 2);
INSERT INTO Odprawa /*Dla wlasciciela Martyna Krajnik*/
	VALUES(3, 'ASD840562', '30d-3h', 'odprawiony', 1, 'A15', 'NJGD45', 'SRN8', '2015-12-24', 3); /*SRN8*/
INSERT INTO Odprawa /*Dla wlasciciela Martyna Krajnik*/
	VALUES(4, 'PLI023653', '30d-3h', 'odprawiony', 1, 'B15', 'KJY201', 'SRN8', '2015-12-24', 4);
INSERT INTO Odprawa/*Dla wlasicicela Damian Urbanski*/
	VALUES (5, 'TED258967', '30d-3h', 'odprawiony', 0, 'E02', 'UYW99', 'LO 3', '2016-04-15', 5);
INSERT INTO Odprawa /*Dla wlasciciela Maja Rdzanek*/
	VALUES (6, NULL, '30d-3h', 'nieodprawiony', 1, NULL, NULL, 'LO 15', '2016-01-03', 6);
INSERT INTO Odprawa /*Dla wlasciciela Maja Rdzanek*/
	VALUES (7, NULL, '30d-3h', 'nieodprawiony', 2, NULL, NULL, 'LO 15', '2016-01-03', 7);
INSERT INTO Odprawa /*Dla wlasciciela Maja Rdzanek*/
	VALUES (8, NULL, '30d-3h', 'nieodprawiony', 1, NULL, NULL, 'LO 15', '2016-01-03', 8);
INSERT INTO Odprawa /*Dla wlasiciciela Liceum Ogolnoksztalcacego*/
	VALUES (9, 'AWU125896', '30d-3h', 'odprawiony', 1, 'B12', 'HBHB12', 'LO 171', '2016-03-09', 9);
INSERT INTO Odprawa /*Dla wlasiciciela Liceum Ogolnoksztalcacego*/
	VALUES (10, 'AWY125899', '30d-3h', 'odprawiony', 1, 'C12', 'HB15YS', 'LO 171', '2016-03-09', 10);
INSERT INTO Odprawa /*Dla wlasiciciela Liceum Ogolnoksztalcacego*/
	VALUES (11, 'AWU689442', '30d-3h', 'odprawiony', 1, 'D12', 'HBY17W', 'LO 171', '2016-03-09', 11);
INSERT INTO Odprawa /*Dla wlasiciciela Liceum Ogolnoksztalcacego*/
	VALUES (12, 'AWU208532', '30d-3h', 'odprawiony', 1, 'A13', 'HB589I', 'LO 171', '2016-03-09', 12);
INSERT INTO Odprawa /*Dla wlasiciciela Liceum Ogolnoksztalcacego*/
	VALUES (13, 'AWU458924', '30d-3h', 'odprawiony', 1, 'B13', 'HB1425', 'LO 171', '2016-03-09', 13);
INSERT INTO Odprawa /*Dla Jakiejs Firmy*/
	VALUES (14, 'AJS515154', '30d-3h', 'odprawiony', 2, 'A30', 'MN1517', 'SRN2', '2016-06-20', 14);
INSERT INTO Odprawa /*Dla Jakiejs Firmy*/
	VALUES (15, 'AE1351F02', '30d-3h', 'odprawiony', 1, 'B30', 'MN3690', 'SRN2', '2016-06-20', 15);
INSERT INTO Odprawa
	VALUES (16, 'AV111351D', '30d-3h', 'odprawiony', 0, 'C34', 'WY6985', 'LO 34', '2016-08-18', 16);
INSERT INTO Odprawa
	VALUES (17, 'AE2545WQ1', '30d-3h', 'nieodprawiony', 1, NULL, NULL, 'LO 15', '2016-08-01', 17);

/*Bagaz*/
INSERT INTO Bagaz /*Dla wlasciciela Martyna Krajnik*/
	VALUES ('LK4521177A', 25, 3, 'KRK');
INSERT INTO Bagaz /*Dla wlasciciela Martyna Krajnik*/
	VALUES ('KJ48895W56', 24, 4, 'KRK');
INSERT INTO Bagaz /*Dla wlasiciciela Liceum Ogolnoksztalcacego*/
	VALUES ('JH45872S22', 20, 9, 'WAR');
INSERT INTO Bagaz /*Dla wlasiciciela Liceum Ogolnoksztalcacego*/
	VALUES ('HBH151215A', 15, 10, 'WAR');
INSERT INTO Bagaz /*Dla wlasiciciela Liceum Ogolnoksztalcacego*/
	VALUES ('PSL15151AB', 18, 11, 'WAR');
INSERT INTO Bagaz /*Dla wlasiciciela Liceum Ogolnoksztalcacego*/
	VALUES ('JTR203000B', 20, 12, 'WAR');
INSERT INTO Bagaz /*Dla wlasiciciela Liceum Ogolnoksztalcacego*/
	VALUES ('QWE124577R', 23, 13, 'WAR');
INSERT INTO Bagaz  /*Jakas Firma*/
	VALUES ('XZ11414HY2', 25, 14, 'IEG');
INSERT INTO Bagaz /*Jakas Firma*/
	VALUES ('XMB39950H4', 28, 14, 'IEG');
INSERT INTO Bagaz /*Jakas Firma*/
	VALUES ('UY50001588', 21, 15, 'IEG');


