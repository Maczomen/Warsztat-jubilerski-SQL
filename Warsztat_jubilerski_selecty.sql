--Który z pracowników sprzeda³ najwiêcej towarów zarejestrowanym klientom indywidualnym
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


--Dok³adne ceny danych zamówieñ
CREATE VIEW Dane_zamowienia 
	AS SELECT Zamowienia.ID, Wyroby.Nazwa AS 'Nazwa wyrobu', Zamowienia.Ilosc, Zamowienia.Data_zlecenia AS 'Data zlecenia', Zamowienia.Data_wykonania AS 'Data wykonania' 
							, CAST(ROUND((1 - Zamowienia.Znizka/100)*Wyroby.Cena_sprzedazy * Zamowienia.Ilosc,2) AS DECIMAL(10,2)) AS 'Cena'
			FROM Zamowienia JOIN Wyroby 
								ON Zamowienia.Nazwa_wyrobu = Wyroby.Nazwa
			WITH CHECK OPTION;

SELECT * FROM Dane_zamowienia;


--Ile zamówieñ i na jak¹ kwotê z³o¿yli klienci w ostatnim miesi¹cu (wykorzystanie view)
SELECT D1.*,CASE 
				WHEN D1.[Iloœæ zamowieñ w ostatnim miesiacu] = 0 THEN 'Nieaktywny'
				WHEN Zamowienia.Ilosc / D1.[Iloœæ zamowieñ w ostatnim miesiacu] <=2 THEN 'Indywidualny'
				ELSE 'Firma'
			END AS 'Rodzaj klienta'
	FROM (
		SELECT Klienci.ID, COUNT(Zamowienia.ID)	AS 'Iloœæ zamowieñ w ostatnim miesiacu', ISNULL(SUM(Dane_zamowienia.Cena),0) AS 'Dochód w ostatnim miesiacu z klienta'
						, CAST(ISNULL(AVG(Dane_zamowienia.Cena),0) AS DECIMAL(10,2)) AS 'Œrednia wartoœæ zamówienia'
			FROM Klienci 
				LEFT JOIN Zamowienia 
							ON Zamowienia.ID_klient = Klienci.ID AND Zamowienia.Data_zlecenia >= DATEADD(m, -1, getdate())
				LEFT JOIN Dane_zamowienia
							ON Dane_zamowienia.ID = Zamowienia.ID
			GROUP BY Klienci.ID
		) AS D1 LEFT JOIN Zamowienia 
							ON D1.ID = Zamowienia.ID
	ORDER BY D1.[Dochód w ostatnim miesiacu z klienta] DESC;


--Ile wyrobów stworzyli miesiac temu poszczególni pracownicy w ostatnim miesi¹cu
SELECT Pracownicy.Imie, Pracownicy.Nazwisko, D1.*, Pracownicy.Stanowisko
	FROM (
		SELECT Pracownicy.Pesel, COUNT(Tworzenie_wyrobow.ID) AS 'Liczba stworzonych wyrobów'
			FROM Pracownicy
				LEFT JOIN Tworzenie_wyrobow
						ON Tworzenie_wyrobow.Pesel_pracownika = Pracownicy.Pesel AND (Tworzenie_wyrobow.Data_wykonania BETWEEN DATEADD(m, -2, getdate()) AND DATEADD(m, -1, getdate()))
			GROUP BY Pracownicy.Pesel
		) AS D1 JOIN Pracownicy
					ON Pracownicy.Pesel = D1.Pesel
	WHERE Pracownicy.Stanowisko <> 'inne'
	ORDER BY D1.[Liczba stworzonych wyrobów] DESC;


--Œrednie koszty materia³ów od poszczególnych dostawców
SELECT Dostawy.Nazwa_materialu AS 'Nazwa materia³u', CAST(AVG(Dostawy.Cena/Dostawy.Ilosc) AS DECIMAL(10,2)) AS 'Œrednia cena za gram/sztuke'
	FROM Dostawcy JOIN Dostawy
							ON Dostawy.ID_dostawcy = Dostawcy.ID
	WHERE Dostawcy.Email LIKE 'NarodowySkup_%'
	GROUP BY Dostawy.Nazwa_materialu
	ORDER BY Dostawy.Nazwa_materialu;


--Wszystkie aktualnie potrzebne materia³y dla danego magazynu
SELECT Potrzebne_materialy.Nazwa_materialu AS 'Nazwa materia³u', SUM(Potrzebne_materialy.Ilosc) AS 'Potrzebna iloœæ'
	FROM Potrzebne_materialy
	WHERE Potrzebne_materialy.ID_magazynu = (SELECT Magazyny.ID FROM Magazyny WHERE Magazyny.Adres = 'Gdansk Cienista 58 80-801')
	GROUP BY Potrzebne_materialy.Nazwa_materialu;


--Najbardziej popularne wyroby
SELECT TOP (5) Wyroby.*, ISNULL(D1.[Iloœæ zakupionych produktów],0) AS 'Iloœæ zakupionych produktów'
		, CAST(ROUND(ISNULL(CAST(D2.[Iloœæ zakupionych produktów na przecenie] AS float) / D1.[Iloœæ zakupionych produktów] * 100 ,0),2) AS varchar(5)) + '%' AS 'Procent zakupiony podczas przeceny'
	FROM (
		SELECT Zamowienia.Nazwa_wyrobu AS 'Nazwa', ISNULL(SUM(Zamowienia.Ilosc),0) AS 'Iloœæ zakupionych produktów'
			FROM Zamowienia
			GROUP BY Zamowienia.Nazwa_wyrobu
		) AS D1 LEFT JOIN (
		SELECT Zamowienia.Nazwa_wyrobu AS 'Nazwa', SUM(Zamowienia.Ilosc) AS 'Iloœæ zakupionych produktów na przecenie'
			FROM Zamowienia
			WHERE Zamowienia.Znizka > 0
			GROUP BY Zamowienia.Nazwa_wyrobu
		) AS D2
					ON D2.Nazwa = D1.Nazwa
		RIGHT JOIN Wyroby 
					ON Wyroby.Nazwa = D1.Nazwa
	ORDER BY D1.[Iloœæ zakupionych produktów] DESC