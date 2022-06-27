--Kt�ry z pracownik�w sprzeda� najwi�cej towar�w zarejestrowanym klientom indywidualnym
CREATE VIEW Sprzedawcy_detaliczni
	AS SELECT Pracownicy.Imie, Pracownicy.Nazwisko, D1.*
	FROM (SELECT Pracownicy.Pesel,  COUNT(DISTINCT Zamowienia.ID_klient) AS 'Roznych kilentow', SUM(Ilosc) AS 'Sprzedali wyrobow'
			FROM Pracownicy JOIN Zamowienia 
								ON Pracownicy.Pesel = Zamowienia.Pesel_pracownika 
			WHERE Zamowienia.Ilosc <=2 AND Zamowienia.ID_klient IS NOT NULL
			GROUP BY Pracownicy.Pesel) AS D1 JOIN Pracownicy 
												ON Pracownicy.Pesel = D1.Pesel
			WITH CHECK OPTION;

SELECT * FROM Sprzedawcy_detaliczni
		ORDER BY Sprzedawcy_detaliczni.[Roznych kilentow] DESC, Sprzedawcy_detaliczni.[Sprzedali wyrobow] DESC;


--Dok�adne ceny danych zam�wie�
CREATE VIEW Dane_zamowienia 
	AS SELECT Zamowienia.ID, Wyroby.Nazwa AS 'Nazwa wyrobu', Zamowienia.Ilosc, Zamowienia.Data_zlecenia AS 'Data zlecenia', Zamowienia.Data_wykonania AS 'Data wykonania' 
							, CAST(ROUND((1 - Zamowienia.Znizka/100)*Wyroby.Cena_sprzedazy * Zamowienia.Ilosc,2) AS DECIMAL(10,2)) AS 'Cena'
			FROM Zamowienia JOIN Wyroby 
								ON Zamowienia.Nazwa_wyrobu = Wyroby.Nazwa
			WITH CHECK OPTION;

SELECT * FROM Dane_zamowienia;


--Ile zam�wie� i na jak� kwot� z�o�yli klienci w ostatnim miesi�cu (wykorzystanie view)
SELECT D1.*,CASE 
				WHEN D1.[Ilo�� zamowie� w ostatnim miesiacu] = 0 THEN 'Nieaktywny'
				WHEN Zamowienia.Ilosc / D1.[Ilo�� zamowie� w ostatnim miesiacu] <=2 THEN 'Indywidualny'
				ELSE 'Firma'
			END AS 'Rodzaj klienta'
	FROM (
		SELECT Klienci.ID, COUNT(Zamowienia.ID)	AS 'Ilo�� zamowie� w ostatnim miesiacu', ISNULL(SUM(Dane_zamowienia.Cena),0) AS 'Doch�d w ostatnim miesiacu z klienta'
						, CAST(ISNULL(AVG(Dane_zamowienia.Cena),0) AS DECIMAL(10,2)) AS '�rednia warto�� zam�wienia'
			FROM Klienci 
				LEFT JOIN Zamowienia 
							ON Zamowienia.ID_klient = Klienci.ID AND Zamowienia.Data_zlecenia >= DATEADD(m, -1, getdate())
				LEFT JOIN Dane_zamowienia
							ON Dane_zamowienia.ID = Zamowienia.ID
			GROUP BY Klienci.ID
		) AS D1 LEFT JOIN Zamowienia 
							ON D1.ID = Zamowienia.ID
	ORDER BY D1.[Doch�d w ostatnim miesiacu z klienta] DESC;


--Ile wyrob�w stworzyli miesiac temu poszczeg�lni pracownicy w ostatnim miesi�cu
SELECT Pracownicy.Imie, Pracownicy.Nazwisko, D1.*, Pracownicy.Stanowisko
	FROM (
		SELECT Pracownicy.Pesel, COUNT(Tworzenie_wyrobow.ID) AS 'Liczba stworzonych wyrob�w'
			FROM Pracownicy
				LEFT JOIN Tworzenie_wyrobow
						ON Tworzenie_wyrobow.Pesel_pracownika = Pracownicy.Pesel AND (Tworzenie_wyrobow.Data_wykonania BETWEEN DATEADD(m, -2, getdate()) AND DATEADD(m, -1, getdate()))
			GROUP BY Pracownicy.Pesel
		) AS D1 JOIN Pracownicy
					ON Pracownicy.Pesel = D1.Pesel
	WHERE Pracownicy.Stanowisko <> 'inne'
	ORDER BY D1.[Liczba stworzonych wyrob�w] DESC;


--�rednie koszty materia��w od poszczeg�lnych dostawc�w
SELECT Dostawy.Nazwa_materialu AS 'Nazwa materia�u', CAST(AVG(Dostawy.Cena/Dostawy.Ilosc) AS DECIMAL(10,2)) AS '�rednia cena za gram/sztuke'
	FROM Dostawcy JOIN Dostawy
							ON Dostawy.ID_dostawcy = Dostawcy.ID
	WHERE Dostawcy.Email LIKE 'NarodowySkup_%'
	GROUP BY Dostawy.Nazwa_materialu
	ORDER BY Dostawy.Nazwa_materialu;


--Wszystkie aktualnie potrzebne materia�y dla danego magazynu
SELECT Potrzebne_materialy.Nazwa_materialu AS 'Nazwa materia�u', SUM(Potrzebne_materialy.Ilosc) AS 'Potrzebna ilo��'
	FROM Potrzebne_materialy
	WHERE Potrzebne_materialy.ID_magazynu = (SELECT Magazyny.ID FROM Magazyny WHERE Magazyny.Adres = 'Gdansk Cienista 58 80-801')
	GROUP BY Potrzebne_materialy.Nazwa_materialu;


--Najbardziej popularne wyroby
SELECT TOP (5) Wyroby.*, ISNULL(D1.[Ilo�� zakupionych produkt�w],0) AS 'Ilo�� zakupionych produkt�w'
		, CAST(ROUND(ISNULL(CAST(D2.[Ilo�� zakupionych produkt�w na przecenie] AS float) / D1.[Ilo�� zakupionych produkt�w] * 100 ,0),2) AS varchar(5)) + '%' AS 'Procent zakupiony podczas przeceny'
	FROM (
		SELECT Zamowienia.Nazwa_wyrobu AS 'Nazwa', ISNULL(SUM(Zamowienia.Ilosc),0) AS 'Ilo�� zakupionych produkt�w'
			FROM Zamowienia
			GROUP BY Zamowienia.Nazwa_wyrobu
		) AS D1 LEFT JOIN (
		SELECT Zamowienia.Nazwa_wyrobu AS 'Nazwa', SUM(Zamowienia.Ilosc) AS 'Ilo�� zakupionych produkt�w na przecenie'
			FROM Zamowienia
			WHERE Zamowienia.Znizka > 0
			GROUP BY Zamowienia.Nazwa_wyrobu
		) AS D2
					ON D2.Nazwa = D1.Nazwa
		RIGHT JOIN Wyroby 
					ON Wyroby.Nazwa = D1.Nazwa
	ORDER BY D1.[Ilo�� zakupionych produkt�w] DESC