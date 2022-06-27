INSERT INTO Warsztat_jubilerski.dbo.Klienci VALUES
	('601099161','aaa@wp.pl'),
	('117226335','bb@gmail.com'),
	('662553442','c@onet.com'),
	('123456789','s180542@student.pg.edu.pl'),
	('987654321','lol@wp.pl'),
	('444444444','123human123@yes.org'),
	('684256812','merryChristmas@haveANice.day'),
	('666999666','666@help.me'),
	('213721377','why@it.happend')
;

INSERT INTO Warsztat_jubilerski.dbo.Klienci (Email)
	VALUES
		('only@little.more'),
		('rand@rand.rand'),
		('tahts@it.com')
;

INSERT INTO Warsztat_jubilerski.dbo.Pracownicy VALUES
	('12345678901','Milosz','Michalak','uczen',3500.00,'t','123456788','tfadieid24k@paikhuuok.com'),
	('23456789012','Jan','Szewczyk','rzemieslnik',5499.99,'t','234567890','dosama@kocoks.com'),
	('34567890123','Ireneusz','Sobczak','uczen',3399.99,'n','345678901','farwr@level.ninja'),
	('45678901234','Malwina', 'Wojcik','rzemieslnik',5399.99,'t','456789012','vdidaned@taluabushop.com'),
	('56789012345','Jan','Makowski','rzemieslnik',5099.99,'z','567890123','acc@wp.pow'),
	('67890123456','Boles³aw','Andrzejewski','rzemieslnik',5249.99,'t','678901234','cos@cos.cos'),
	('78901234567','Alexander','Wisniewski','mistrz',7000.00,'t','789012345','nie@wp.pl'),
	('89012345678','Piotr','Zarzycki','mistrz',6999.99,'z','890123456','s180542@student.pg.edu.pl'),
	('90123456789','Oskar','Tomaszewski','inne',3000.00,'t','901234567','acd@wp.pl'),
	('01234567890','Liliana','Maciejewska','inne',3249.99,'n','012345678','tax@wp.pl'),
	('75757575757','Karolina','Szewczyk','mistrz',7000.00,'t','757575757','alexa@play.despacito')
;

INSERT INTO Warsztat_jubilerski.dbo.Wyroby VALUES
	('P01','Zloty piersiconek 585',1239.99),
	('P02','Zloty piersiconek 375',949.99),
	('P03','Zloty piersiconek 585 (rozowe zloto)',1239.99),
	('P04','Zloty piersiconek 375 (rozowe zloto)',949.99),
	('W01','Zloty wisiorek 585',1199.99),
	('N01','Zloty naszyjnik 585',1449.99),
	('N02','Zloty naszyjnik 375',1139.99),
	('P05','Srebrny piersiconek 375',649.99),
	('P06','Srebrny piersiconek z rubinami 585',1229.99),
	('N03','Srebrny naszyjnik 333',599.99),
	('W02','Srebrny wisiorek 375',699.99),
	('P07','Zloty piersiconek z brylantami 585',1839.99),
	('P08','Zloto-srebrny piersiconek z brylantami 585/750',2199.99),
	('W03','Zloty wisiorek z brylantami 585',1879.99),
	('N04','Zloty naszyjnik z rubinami 585',1999.99)
;

INSERT INTO Warsztat_jubilerski.dbo.Materialy VALUES
	('Zloto',250),
	('Biale zloto',280),
	('Srebro',120),
	('Brylant 0.1',300),
	('Brylant 0.2',600),
	('Brylant 0.3',900),
	('Brylant 0.5',1500),
	('Rubin 0.1',260),
	('Rubin 0.2',520),
	('Miedz',40),
	('Zelazo',30),
	('Mieszanka metali',35)
;


INSERT INTO Warsztat_jubilerski.dbo.Zamowienia VALUES
	(CAST( GETDATE() AS Date ), CAST( GETDATE() AS Date ),3,0, 'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'bb@gmail.com'),'90123456789','N04'),
	(CAST( GETDATE() AS Date ), CAST( GETDATE() AS Date ),1,10, 'odebrane',NULL,'90123456789','W03'),
	(CAST( GETDATE() AS Date ), CAST( GETDATE() AS Date ),7,0, 'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'bb@gmail.com'),'90123456789','W03'),
	('2020-11-11', '2020-11-12',4,0, 'dostepne do odbioru',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'aaa@wp.pl'),'01234567890','P03'),
	(CAST( GETDATE() AS Date ), NULL,12,25, 'w trakcie',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'aaa@wp.pl'),'01234567890','P02'),
	(CAST( GETDATE() AS Date ), NULL,1,0, 'w trakcie',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'tahts@it.com'),'01234567890','P04'),
	(CAST( GETDATE() AS Date ), NULL,10,25, 'w trakcie',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'aaa@wp.pl'),'90123456789','N04'),
	('2020-11-11', '2020-11-20',10,0,'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'bb@gmail.com'),'90123456789','P01'),
	('2020-11-11', '2020-11-11',7,0, 'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'bb@gmail.com'),'01234567890','N04'),
	(CAST( GETDATE() AS Date ), NULL,4,0, 'w trakcie',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'merryChristmas@haveANice.day'),'01234567890','P04'),
	('2020-10-12', '2020-10-13',5,0, 'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'bb@gmail.com'),'01234567890','N04'),
	('2020-11-11', '2020-11-11',6,0,'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = '123human123@yes.org'),'90123456789','P01'),
	('2020-11-12', '2020-11-12',2,0,'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = '123human123@yes.org'),'90123456789','P01'),
	('2020-11-12', '2020-11-12',3,0,'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = '123human123@yes.org'),'90123456789','P02'),
	('2020-11-12', '2020-11-12',4,0,'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = '123human123@yes.org'),'90123456789','P03'),
	('2020-9-11', '2020-9-11',8,0, 'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'bb@gmail.com'),'90123456789','N04'),
	(CAST( GETDATE() AS Date ), CAST( GETDATE() AS Date ),1,10, 'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 's180542@student.pg.edu.pl'),'90123456789','N01'),
	(CAST( GETDATE() AS Date ), CAST( GETDATE() AS Date ),1,10, 'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 's180542@student.pg.edu.pl'),'90123456789','N02'),
	(CAST( GETDATE() AS Date ), NULL,1,0, 'w trakcie',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 's180542@student.pg.edu.pl'),'90123456789','N03'),
	('2020-8-11', '2020-8-11',11,0, 'odebrane',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'bb@gmail.com'),'01234567890','N04'),
	('2020-12-21', CAST( GETDATE() AS Date ),1,10, 'dostepne do odbioru',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'why@it.happend'),'01234567890','P01'),
	('2020-12-21', CAST( GETDATE() AS Date ),1,10, 'dostepne do odbioru',(SELECT ID FROM Warsztat_jubilerski.dbo.Klienci WHERE Email = 'why@it.happend'),'01234567890','N02')
;

INSERT INTO Warsztat_jubilerski.dbo.Magazyny VALUES
	('Gdansk Cienista 58 80-801'),
	('Gdansk Miszewskiego 14/1 80-811')
;

INSERT INTO Warsztat_jubilerski.dbo.Stan_magazynu (ID_magazynu,Nazwa_wyrobu,Ilosc) VALUES
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'P01',2),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'P02',1),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'P03',5),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'P04',3),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'P05',2),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'P08',1),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'P07',10),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'P05',12),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'P06',8),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'W01',7),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'W02',9),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'W03',1),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'N01',8),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'N02',2),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'N04',5),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'N03',3)
;

INSERT INTO Warsztat_jubilerski.dbo.Stan_magazynu (ID_magazynu,Nazwa_materialu,Ilosc) VALUES
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zloto',320.6),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Biale zloto',123.79),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Srebro',218.4),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Brylant 0.1',22),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Brylant 0.2',19),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Brylant 0.3',12),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Brylant 0.5',5),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Miedz',418.3),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zelazo',318.4),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Mieszanka metali',1000),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Zloto',120.5),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Srebro',90.4),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Rubin 0.1',10),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Miedz',214.3),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Zelazo',160.4),
	((SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Mieszanka metali',324.2)
;


INSERT INTO Warsztat_jubilerski.dbo.Dostawcy (Email) VALUES
	('jestDobrze@gmail.com'),
	('ZloteChlopaki@gmail.com'),
	('SkupSrebra@wp.pl'),
	('klejnotyNieZTejZiemi@wp.pl'),
	('zawszeDoUslug@gmail.com'),
	('NarodowySkup@zloto.com'),
	('NarodowySkup@srebro.com'),
	('NarodowySkup@miedz.com'),
	('NarodowySkup@brylanty.com'),
	('NarodowySkup@wyszysko.com')
;

INSERT INTO Warsztat_jubilerski.dbo.Dostawy VALUES
	(100,24440,'2020-10-12','2020-10-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'ZloteChlopaki@gmail.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zloto'),
	(150,36660,'2020-11-12','2020-11-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'ZloteChlopaki@gmail.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zloto'),
	(60,15000,'2020-12-12','2020-12-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'ZloteChlopaki@gmail.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zloto'),
	(90,10800,'2020-10-12','2020-10-24',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'SkupSrebra@wp.pl'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Srebro'),
	(200,23000,'2020-11-12','2020-11-24',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'SkupSrebra@wp.pl'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Srebro'),
	(40,4500,'2020-12-12','2020-12-20',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'NarodowySkup@srebro.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Srebro'),
	(300,10700,'2020-10-12','2020-10-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'jestDobrze@gmail.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Mieszanka metali'),
	(160,7000,'2020-12-12','2020-12-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'NarodowySkup@wyszysko.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Mieszanka metali'),
	(130,4000,'2020-11-12','2020-11-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'zawszeDoUslug@gmail.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zelazo'),
	(70,2100,'2020-12-12','2020-12-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'zawszeDoUslug@gmail.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zelazo'),
	(10,2999.99,'2020-10-12','2020-10-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'klejnotyNieZTejZiemi@wp.pl'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Brylant 0.1'),
	(12,3700,'2020-11-12','2020-11-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'klejnotyNieZTejZiemi@wp.pl'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Brylant 0.1'),
	(4,1300,'2020-12-12','2020-12-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'NarodowySkup@brylanty.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Brylant 0.1'),
	(7,2100,'2020-12-12','2020-12-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'klejnotyNieZTejZiemi@wp.pl'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Brylant 0.2'),
	(70,17100,'2020-10-12','2020-10-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'ZloteChlopaki@gmail.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Zloto'),
	(60,15000,'2020-12-12','2020-12-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'ZloteChlopaki@gmail.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Zloto'),
	(75,11200,'2020-10-12','2020-10-24',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'SkupSrebra@wp.pl'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Srebro'),
	(250,29000,'2020-11-12','2020-11-24',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'SkupSrebra@wp.pl'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Srebro'),
	(160,5500,'2020-12-12','2020-12-23',(SELECT ID FROM Warsztat_jubilerski.dbo.Dostawcy WHERE Email = 'NarodowySkup@wyszysko.com'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Mieszanka metali')
;

INSERT INTO Warsztat_jubilerski.dbo.Tworzenie_wyrobow VALUES
	('2020-10-12','2020-10-12','wykonane','P01','23456789012'),
	('2020-10-12','2020-10-12','wykonane','P01','23456789012'),
	('2020-10-13','2020-10-13','wykonane','P02','23456789012'),
	('2020-10-13','2020-10-13','wykonane','P02','23456789012'),
	('2020-10-13','2020-10-13','wykonane','P02','23456789012'),
	('2020-10-12','2020-10-23','wykonane','P02','34567890123'),
	(CAST( GETDATE() AS Date ),NULL,'oczekujace','P07',NULL),
	(CAST( GETDATE() AS Date ),NULL,'oczekujace','P07',NULL),
	(CAST( GETDATE() AS Date ),NULL,'oczekujace','P07',NULL),
	(CAST( GETDATE() AS Date ),NULL,'oczekujace','P07',NULL),
	(CAST( GETDATE() AS Date ),NULL,'oczekujace','P07',NULL),
	('2020-12-12','2020-12-12','wykonane','P07','75757575757'),
	('2020-12-12','2020-12-12','wykonane','P08','75757575757'),
	('2020-12-13','2020-12-13','wykonane','P05','89012345678'),
	('2020-12-13','2020-12-13','wykonane','P05','89012345678'),
	('2020-12-13','2020-12-13','wykonane','P02','78901234567'),
	('2020-12-12','2020-12-13','wykonane','N02','67890123456'),
	(CAST( GETDATE() AS Date ),NULL,'w trakcie','P07','78901234567'),
	(CAST( GETDATE() AS Date ),NULL,'w trakcie','P07','67890123456'),
	(CAST( GETDATE() AS Date ),NULL,'w trakcie','N03','67890123456')
;

INSERT INTO Warsztat_jubilerski.dbo.Tworzenie_wyrobow VALUES
	(CAST( GETDATE() AS Date ),NULL,'brak materialow','P03','45678901234');
	INSERT INTO Warsztat_jubilerski.dbo.Potrzebne_materialy VALUES
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zloto',2.2),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Miedz',1.1),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Mieszanka metali',0.6);
INSERT INTO Warsztat_jubilerski.dbo.Tworzenie_wyrobow VALUES
	(CAST( GETDATE() AS Date ),NULL,'brak materialow','P03','45678901234');
	INSERT INTO Warsztat_jubilerski.dbo.Potrzebne_materialy VALUES
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zloto',2.2),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Miedz',1.1),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Mieszanka metali',0.6);
INSERT INTO Warsztat_jubilerski.dbo.Tworzenie_wyrobow VALUES
	(CAST( GETDATE() AS Date ),NULL,'brak materialow','W01','67890123456');
	INSERT INTO Warsztat_jubilerski.dbo.Potrzebne_materialy VALUES
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zloto',2),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zelazo',0.9),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Mieszanka metali',0.6);
INSERT INTO Warsztat_jubilerski.dbo.Tworzenie_wyrobow VALUES
	(CAST( GETDATE() AS Date ),NULL,'brak materialow','W02','75757575757');
	INSERT INTO Warsztat_jubilerski.dbo.Potrzebne_materialy VALUES
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Srebro',1),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zelazo',1.5),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Mieszanka metali',0.5);
INSERT INTO Warsztat_jubilerski.dbo.Tworzenie_wyrobow VALUES
	(CAST( GETDATE() AS Date ),NULL,'brak materialow','W03','75757575757');
	INSERT INTO Warsztat_jubilerski.dbo.Potrzebne_materialy VALUES
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zloto',2.1),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Zelazo',0.5),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Mieszanka metali',0.9),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Brylant 0.1',5),
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'Brylant 0.2',2);
INSERT INTO Warsztat_jubilerski.dbo.Tworzenie_wyrobow VALUES
	(CAST( GETDATE() AS Date ),NULL,'brak materialow','N01','89012345678');
	INSERT INTO Warsztat_jubilerski.dbo.Potrzebne_materialy VALUES
		(IDENT_CURRENT('Tworzenie_wyrobow'),(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'Zloto',2.4);

INSERT INTO Warsztat_jubilerski.dbo.Uzupelnianie_magazynu VALUES
	('2020-10-12','2020-10-22',90.6,'wykonane',NULL,'Zloto',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'90123456789'),
	('2020-10-12','2020-10-22',100,'wykonane',NULL,'Mieszanka metali',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'90123456789'),
	('2020-10-13','2020-10-23',50,'wykonane',NULL,'Srebro',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'90123456789'),
	('2020-10-13','2020-10-23',78,'wykonane',NULL,'Zelazo',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'90123456789'),
	('2020-10-13','2020-10-23',10,'wykonane',NULL,'Brylant 0.1',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'90123456789'),
	('2020-10-13','2020-10-23',8,'wykonane',NULL,'Brylant 0.2',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'90123456789'),
	('2020-11-12','2020-11-22',90.6,'wykonane',NULL,'Zloto',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'01234567890'),
	('2020-11-12','2020-11-22',100,'wykonane',NULL,'Mieszanka metali',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'01234567890'),
	('2020-11-13','2020-11-23',50,'wykonane',NULL,'Srebro',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'01234567890'),
	('2020-11-13','2020-11-23',78,'wykonane',NULL,'Zelazo',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'01234567890'),
	('2020-11-13','2020-11-23',10,'wykonane',NULL,'Brylant 0.1',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'01234567890'),
	('2020-11-13','2020-11-23',8,'wykonane',NULL,'Brylant 0.2',(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'01234567890'),
	('2020-10-12','2020-10-22',3,'wykonane','P01',NULL,(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'90123456789'),
	('2020-10-12','2020-10-22',4,'wykonane','P02',NULL,(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'90123456789'),
	('2020-10-13','2020-10-23',2,'wykonane','N03',NULL,(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Cienista 58 80-801'),'90123456789'),
	('2020-10-12','2020-10-22',5,'wykonane','W01',NULL,(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'90123456789'),
	('2020-10-12','2020-10-22',2,'wykonane','W02',NULL,(SELECT ID FROM Warsztat_jubilerski.dbo.Magazyny WHERE Adres = 'Gdansk Miszewskiego 14/1 80-811'),'90123456789')
;