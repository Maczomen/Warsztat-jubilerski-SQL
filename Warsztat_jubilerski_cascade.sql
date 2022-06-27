SELECT * FROM Klienci WHERE Email = 'bb@gmail.com';
SELECT * FROM Zamowienia WHERE ID_klient = (SELECT ID FROM Klienci WHERE Email = 'bb@gmail.com');

DELETE FROM Klienci WHERE Email = 'bb@gmail.com';

SELECT * FROM Klienci WHERE Email = 'bb@gmail.com';
SELECT * FROM Zamowienia WHERE ID_klient = (SELECT ID FROM Klienci WHERE Email = 'bb@gmail.com');



SELECT * FROM Wyroby WHERE Nazwa = 'P01';
SELECT * FROM Zamowienia WHERE Nazwa_wyrobu = 'P01';
SELECT * FROM Stan_magazynu WHERE Nazwa_wyrobu = 'P01';
SELECT * FROM Tworzenie_wyrobow WHERE Nazwa_wyrobu = 'P01';
SELECT * FROM Uzupelnianie_magazynu WHERE Nazwa_wyrobu = 'P01';

DELETE FROM Wyroby WHERE Nazwa = 'P01';

SELECT * FROM Wyroby WHERE Nazwa = 'P01';
SELECT * FROM Zamowienia WHERE Nazwa_wyrobu = 'P01';
SELECT * FROM Stan_magazynu WHERE Nazwa_wyrobu = 'P01';
SELECT * FROM Tworzenie_wyrobow WHERE Nazwa_wyrobu = 'P01';
SELECT * FROM Uzupelnianie_magazynu WHERE Nazwa_wyrobu = 'P01';



SELECT * FROM Pracownicy WHERE Pesel = '90123456789';
SELECT * FROM Zamowienia WHERE Pesel_pracownika = '90123456789';
SELECT * FROM Uzupelnianie_magazynu WHERE Pesel_pracownika = '90123456789';

DELETE FROM Pracownicy WHERE Pesel = '90123456780';

SELECT * FROM Pracownicy WHERE Pesel = '90123456789';
SELECT * FROM Zamowienia WHERE Pesel_pracownika = '90123456789';
SELECT * FROM Uzupelnianie_magazynu WHERE Pesel_pracownika = '90123456789';

SELECT * FROM Pracownicy WHERE Pesel = '89012345678';
SELECT * FROM Tworzenie_wyrobow WHERE Pesel_pracownika = '89012345678';

DELETE FROM Pracownicy WHERE Pesel = '89012345670';

SELECT * FROM Pracownicy WHERE Pesel = '89012345678';
SELECT * FROM Tworzenie_wyrobow WHERE Pesel_pracownika = '89012345678';


SELECT * FROM Materialy WHERE Nazwa = 'Zloto';
SELECT * FROM Stan_magazynu WHERE Nazwa_materialu = 'Zloto';
SELECT * FROM Dostawy WHERE Nazwa_materialu = 'Zloto';
SELECT * FROM Potrzebne_materialy WHERE Nazwa_materialu = 'Zloto';
SELECT * FROM Uzupelnianie_magazynu WHERE Nazwa_materialu = 'Zloto';

UPDATE Materialy SET Nazwa = 'Zloto 999' WHERE Nazwa = 'Zloto';

SELECT * FROM Materialy WHERE Nazwa = 'Zloto 999';
SELECT * FROM Stan_magazynu WHERE Nazwa_materialu = 'Zloto 999';
SELECT * FROM Dostawy WHERE Nazwa_materialu = 'Zloto 999';
SELECT * FROM Potrzebne_materialy WHERE Nazwa_materialu = 'Zloto 999';
SELECT * FROM Uzupelnianie_magazynu WHERE Nazwa_materialu = 'Zloto 999';

DELETE FROM Materialy WHERE Nazwa = 'Zloto 999';

SELECT * FROM Materialy WHERE Nazwa = 'Zloto 999';
SELECT * FROM Stan_magazynu WHERE Nazwa_materialu = 'Zloto 999';
SELECT * FROM Dostawy WHERE Nazwa_materialu = 'Zloto 999';
SELECT * FROM Potrzebne_materialy WHERE Nazwa_materialu = 'Zloto 999';
SELECT * FROM Uzupelnianie_magazynu WHERE Nazwa_materialu = 'Zloto 999';


SELECT * FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801';
SELECT * FROM Stan_magazynu WHERE ID_magazynu = (SELECT ID FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801');
SELECT * FROM Dostawy WHERE ID_magazynu = (SELECT ID FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801');
SELECT * FROM Potrzebne_materialy WHERE ID_magazynu = (SELECT ID FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801');
SELECT * FROM Uzupelnianie_magazynu WHERE ID_magazynu = (SELECT ID FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801');

DELETE FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801';

SELECT * FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801';
SELECT * FROM Stan_magazynu WHERE ID_magazynu = (SELECT ID FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801');
SELECT * FROM Dostawy WHERE ID_magazynu = (SELECT ID FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801');
SELECT * FROM Potrzebne_materialy WHERE ID_magazynu = (SELECT ID FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801');
SELECT * FROM Uzupelnianie_magazynu WHERE ID_magazynu = (SELECT ID FROM Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801');



SELECT * FROM Dostawcy WHERE Email = 'NarodowySkup@wyszysko.com';
SELECT * FROM Dostawy WHERE ID_dostawcy = (SELECT ID FROM Dostawcy WHERE Email = 'NarodowySkup@wyszysko.com');

DELETE FROM Dostawcy WHERE Email = 'NarodowySkup@wyszysko.com';

SELECT * FROM Dostawcy WHERE Email = 'NarodowySkup@wyszysko.com';
SELECT * FROM Dostawy WHERE ID_dostawcy = (SELECT ID FROM Dostawcy WHERE Email = 'NarodowySkup@wyszysko.com');