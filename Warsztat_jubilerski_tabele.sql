CREATE TABLE Klienci ( 
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	Nr_kontaktowy VARCHAR(9) CHECK (LEN(Nr_kontaktowy) = 9 AND Nr_kontaktowy LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Email VARCHAR(50) CHECK (Email LIKE '%_@_%.%') NOT NULL UNIQUE
);

CREATE TABLE Pracownicy (
	Pesel VARCHAR(11) CHECK (LEN(Pesel) = 11 AND Pesel LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') PRIMARY KEY, 
	Imie VARCHAR(30) NOT NULL,
	Nazwisko VARCHAR(30) NOT NULL,
	Stanowisko VARCHAR(30) CHECK (Stanowisko IN ('uczen','rzemieslnik','mistrz','inne')) NOT NULL,
	Wyplata DECIMAL(10,2) CHECK (Wyplata > 0) NOT NULL,
	Dostepnosc VARCHAR(1) CHECK (Dostepnosc IN ('t','n','z')) NOT NULL,
	Nr_kontaktowy VARCHAR(9) CHECK (LEN(Nr_kontaktowy) = 9 AND Nr_kontaktowy LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Email VARCHAR(50) CHECK (Email LIKE '%_@_%.%') NOT NULL UNIQUE
);

CREATE TABLE Wyroby (
	Nazwa VARCHAR(3) CHECK (LEN(Nazwa) = 3 AND Nazwa LIKE'[PWN][0-9][0-9]') PRIMARY KEY,
	Opis TEXT,
	Cena_sprzedazy DECIMAL(10,2) CHECK (Cena_sprzedazy > 0) NOT NULL
);

CREATE TABLE Materialy (
	Nazwa VARCHAR(30) PRIMARY KEY,
	Cena_kupna DECIMAL(10,2) CHECK (Cena_kupna > 0) NOT NULL
);

CREATE TABLE Zamowienia (
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	Data_zlecenia DATE NOT NULL, 
	Data_wykonania DATE,
	Ilosc INT NOT NULL DEFAULT 1,
	Znizka DECIMAL(4,2) NOT NULL DEFAULT 0,
	Stan_zlecenia VARCHAR(20) NOT NULL DEFAULT 'w trakcie',
	ID_klient INT REFERENCES Klienci ON DELETE SET NULL,
	Pesel_pracownika VARCHAR(11) REFERENCES Pracownicy ON DELETE CASCADE,
	Nazwa_wyrobu VARCHAR(3) REFERENCES Wyroby ON DELETE CASCADE NOT NULL,
	CHECK (
		(Ilosc > 0)
		AND (Znizka >= 0 )
		AND (Stan_zlecenia IN ('w trakcie', 'dostepne do odbioru', 'odebrane'))
		AND ((Data_wykonania IS NULL AND Stan_zlecenia = 'w trakcie') OR (Data_wykonania IS NOT NULL AND Stan_zlecenia <> 'w trakcie'))
	)
);

CREATE TABLE Magazyny (
	ID TINYINT IDENTITY(1,1) PRIMARY KEY, 
	Adres VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Stan_magazynu (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ID_magazynu TINYINT REFERENCES Magazyny ON DELETE CASCADE NOT NULL,
	Nazwa_wyrobu VARCHAR(3) REFERENCES Wyroby ON DELETE CASCADE,
	Nazwa_materialu VARCHAR(30) REFERENCES Materialy ON UPDATE CASCADE ON DELETE CASCADE,
	Ilosc FLOAT NOT NULL,
	UNIQUE (ID_magazynu,Nazwa_wyrobu,Nazwa_materialu),
	CHECK (
		(Ilosc > 0)
		AND ((Nazwa_wyrobu IS NOT NULL AND Nazwa_materialu IS NULL) OR (Nazwa_wyrobu IS NULL AND Nazwa_materialu IS NOT NULL))
	)
);


CREATE TABLE Dostawcy (
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	Nr_kontaktowy VARCHAR(9) CHECK (LEN(Nr_kontaktowy) = 9 AND Nr_kontaktowy LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Email VARCHAR(50) CHECK (Email LIKE '%_@_%.%') NOT NULL UNIQUE
);


CREATE TABLE Dostawy (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Ilosc INT CHECK (Ilosc > 0) NOT NULL,
	Cena DECIMAL(10,2) CHECK (Cena > 0) NOT NULL,
	Data_zlecenia DATE NOT NULL, 
	Data_wykonania DATE,
	ID_dostawcy INT REFERENCES Dostawcy ON DELETE CASCADE NOT NULL,
	ID_magazynu TINYINT REFERENCES Magazyny ON DELETE CASCADE NOT NULL,
	Nazwa_materialu VARCHAR(30) REFERENCES Materialy ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
);

CREATE TABLE Tworzenie_wyrobow (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Data_zlecenia DATE NOT NULL, 
	Data_wykonania DATE,
	Stan_zlecenia VARCHAR(20) NOT NULL DEFAULT 'w trakcie',
	Nazwa_wyrobu VARCHAR(3) REFERENCES Wyroby ON DELETE CASCADE NOT NULL,
	Pesel_pracownika VARCHAR(11) REFERENCES Pracownicy ON DELETE CASCADE,
	CHECK (
		(Stan_zlecenia IN ('w trakcie', 'wykonane', 'brak materialow','oczekujace'))
		AND (((Pesel_pracownika IS NULL AND Data_wykonania IS NULL) AND Stan_zlecenia = 'oczekujace') OR (Pesel_pracownika IS NOT NULL AND Stan_zlecenia <> 'oczekujace'))
		AND ((Data_wykonania IS NOT NULL AND Stan_zlecenia = 'wykonane') OR (Data_wykonania IS NULL AND Stan_zlecenia <> 'wykonane'))
	)
);

CREATE TABLE Potrzebne_materialy (
	ID_tworzenia_wyrobow INT REFERENCES Tworzenie_wyrobow ON DELETE CASCADE NOT NULL,
	ID_magazynu TINYINT REFERENCES Magazyny ON DELETE CASCADE NOT NULL,
	Nazwa_materialu VARCHAR(30) REFERENCES Materialy ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Ilosc FLOAT CHECK (Ilosc > 0) NOT NULL,
	PRIMARY KEY (ID_tworzenia_wyrobow, ID_magazynu, Nazwa_materialu)
);

CREATE TABLE Uzupelnianie_magazynu (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Data_zlecenia DATE NOT NULL, 
	Data_wykonania DATE,
	Ilosc INT NOT NULL,
	Stan_zlecenia VARCHAR(20) NOT NULL DEFAULT 'w trakcie' ,
	Nazwa_wyrobu VARCHAR(3) REFERENCES Wyroby ON DELETE CASCADE,
	Nazwa_materialu VARCHAR(30) REFERENCES Materialy ON UPDATE CASCADE ON DELETE CASCADE,
	ID_magazynu TINYINT REFERENCES Magazyny ON DELETE CASCADE NOT NULL,
	Pesel_pracownika VARCHAR(11) REFERENCES Pracownicy ON DELETE CASCADE,
	CHECK (
		(Stan_zlecenia IN ('w trakcie', 'wykonane','oczekujace'))
		AND (Ilosc > 0)
		AND ((Nazwa_wyrobu IS NOT NULL AND Nazwa_materialu IS NULL) OR (Nazwa_wyrobu IS NULL AND Nazwa_materialu IS NOT NULL))
		AND ((Pesel_pracownika IS NULL AND Stan_zlecenia = 'oczekujace') OR (Pesel_pracownika IS NOT NULL AND Stan_zlecenia <> 'oczekujace')) 
		AND ((Data_wykonania IS NOT NULL AND Stan_zlecenia = 'wykonane') OR (Data_wykonania IS NULL AND Stan_zlecenia <> 'wykonane'))
	)
);
