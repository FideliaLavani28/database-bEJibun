--BW01
--2440005416 - Davin Valentino
--2401954905 - Fidelia Lavani
--2401955006 - Willy
--2440011513 - Vanessa Tjandra

USE [bEJibun]
GO

INSERT INTO Staff
VALUES ('ST001','Genta Nasyidah','Female','081299537261','800000'),
('ST002','Agnes Rahmawati','Female','081863524123','800000'),
('ST003','Vinsen Ardianto','Male','081161524182','850000'),
('ST004','Gaiman Tamba','Male','081867680918','500000'),
('ST005','Yulia Purnawati','Female','087854342514','1000000'),
('ST006','Gavin Marpaung','Male','081162715372','1000000'),
('ST007','Bambang Marpaung','Male','081278909876','700000'),
('ST008','Jessica Yuniar','Female','081287615241','800000'),
('ST009','Gasti Safitri','Female','081298723645','900000'),
('ST010','Rosman Saptono','Male','081178675645','850000')
GO

INSERT INTO Vendor
VALUES ('VE001','Electrorks','081209890706','Depnaker Raya Street','electrorks2@gmail.com'), 
('VE002','Cloudwood','081190726452','Salemba Street','cloud_wood@gmail.com'), 
('VE003','Oracle Systems','081878674512','Thamrin Street','oraclesys@gmail.com'), 
('VE004','Chiefoods','081199112233','Cilandak Street','chiefoods@gmail.com'), 
('VE005','Yellow Electronics','081299871521','Ciputat Raya Street','yellowelectronics@yahoo.com'),
('VE006','Homepedia','081298173542','Wijaya 5 Street','homepediaofc@yahoo.com'),
('VE007','Midnight Foods','081245142312','Food Street','midnightfoods@yahoo.com'), 
('VE008','RootDrinks','081187189201','Jayakarta Street','rootdrinkofc@yahoo.com'), 
('VE009','Crystal Office','081299876543','Food Street','crystaloff1990@gmail.com'),  
('VE010','Alpha Sport','081272534162','Gajah Mada Street','alphasport@yahoo.com'), 
('VE011','Auto Shop','081252413123','Thamrin Street','autoshop@yahoo.com')
GO

INSERT INTO ItemType
VALUES ('IP001','Electronic'),('IP002','Gadgets'),('IP003','Food'),('IP004','Frozen Food'),('IP005','Alat Dapur'),('IP006','Alat Kebersihan'),('IP007','Alat Bangunan'),('IP008','Otomotif'),('IP009','Stationery'),('IP010','Olahraga'),('IP011','Drink')
GO

INSERT INTO Item
VALUES ('IT001','IP001','AC Samsung','8000000',1),
('IT002','IP002','Samsung Galaxy A30 S','3000000',1),
('IT003','IP003','Chocolate Brownies','25000',10),
('IT004','IP003','Oreo Brownies','28000',10),
('IT005','IP004','Chicken katsu','60000',5),
('IT006','IP004','Tahu bakso','10000',20),
('IT007','IP005','Piring','30000',10),
('IT008','IP005','Sendok','10000',15),
('IT009','IP006','Kanebo','50000',5),
('IT010','IP006','Rinso','50000',5),
('IT011','IP007','Obeng','15000',1),
('IT012','IP007','Gergaji','50000',1),
('IT013','IP007','Kuas Roll','25000',1), 
('IT014','IP008','Pelumas','15000',2),
('IT015','IP008','Semir ban','20000',5),
('IT016','IP009','Kertas A4','500',50),
('IT017','IP009','Lakban bening','7000',2),
('IT018','IP010','Shuttle Badminton Dakota','5000',10),
('IT019','IP010','Bola Tenis Head','20000',5),
('IT020','IP011','Fruit Tea','8000',5),
('IT021','IP011','Teh Kotak','5000',5),
('IT022','IP001','Kulkas Panasonic','8500000',1)
GO

INSERT INTO Customer
VALUES ('CU001','Martano Hutapea','Male','081276729123','1990-09-10'),
('CU002','Ika Usada','Female','081046831768','1999-10-09'),
('CU003','Irma Wahyuni','Female','081302277088','1992-12-04'),
('CU004','Bakti Sirait','Male','082934665787','1998-07-23'),
('CU005','Sari Suryatmi','Female','086924264077','1997-09-01'),
('CU006','Ivan Prayoga','Male','086117331035','1993-03-15'),
('CU007','Elma Mulyani','Female','081618749424','1994-09-12'),
('CU008','Chelsea Anggraini','Female','087571442499','1998-11-04'),
('CU009','Gandi Kurniawan','Male','085203895111','2002-08-17'),
('CU010','Dodo Ardianto','Male','084607520121','1999-05-14')
GO

INSERT INTO SalesTransaction
VALUES ('SA001','CU001','ST003','2019-10-12'), 
('SA002','CU001','ST002','2020-02-19'), 
('SA003','CU003','ST001','2020-04-20'), 
('SA004','CU004','ST005','2019-06-15'), 
('SA005','CU004','ST003','2020-07-04'),
('SA006','CU005','ST008','2021-04-05'),
('SA007','CU010','ST009','2021-02-10'),
('SA008','CU008','ST007','2020-02-20'), 
('SA009','CU002','ST004','2019-08-01'),
('SA010','CU006','ST006','2019-12-12'), 
('SA011','CU010','ST001','2019-02-14'),
('SA012','CU002','ST002','2021-12-06'), 
('SA013','CU007','ST010','2020-07-20'), 
('SA014','CU003','ST005','2021-09-27'), 
('SA015','CU007','ST009','2019-12-09'), 
('SA016','CU002','ST006','2019-08-10'),
('SA017','CU008','ST010','2022-01-04') 
GO

INSERT INTO SalesTransactionDetail
VALUES ('SA001','IT002',1),
('SA002','IT016',80), 
('SA002','IT017',5),
('SA003','IT010',5), 
('SA003','IT009',5), 
('SA004','IT004',10), 
('SA004','IT006',30), 
('SA005','IT019',12), 
('SA006','IT013',3), 
('SA006','IT015',6),
('SA007','IT019',10), 
('SA008','IT008',20), 
('SA009','IT005',15),
('SA009','IT006',25),
('SA010','IT011',2),
('SA010','IT012',2),
('SA011','IT001',1), 
('SA011','IT011',1),
('SA011','IT020',12), 
('SA012','IT020',30),
('SA012','IT004',12),
('SA013','IT014',4),
('SA013','IT016',50),
('SA014','IT021',15),
('SA015','IT002',2), 
('SA016','IT022',1),
('SA017','IT003',20), 
('SA017','IT016',40) 
GO

INSERT INTO PurchaseTransaction
VALUES ('PH001','ST001','VE001','2019-01-01','2019-01-30'),
('PH002','ST005','VE005','2019-01-02','2019-02-28'), 
('PH003','ST003','VE006','2019-04-21','2019-05-12'),
('PH004','ST003','VE009','2019-04-21','2019-05-02'),
('PH005','ST004','VE004','2020-02-27','2020-03-10'),
('PH006','ST005','VE003','2020-03-01','2020-04-05'),
('PH007','ST002','VE002','2020-01-05','2020-02-10'),
('PH008','ST010','VE002','2020-01-06','2020-02-10'),
('PH009','ST006','VE006','2020-07-10','2020-08-15'),
('PH010','ST002','VE010','2020-10-10','2020-12-20'),
('PH011','ST010','VE011','2020-11-01','2020-11-06'),
('PH012','ST007','VE007','2021-12-10','2021-12-24'),
('PH013','ST009','VE008','2021-12-13','2021-12-18'),
('PH014','ST006','VE009','2021-12-30',NULL), 
('PH015','ST008','VE010','2021-12-31',NULL),
('PH016','ST003','VE006','2022-02-02',NULL),
('PH017','ST001','VE003','2022-02-10',NULL)
GO

INSERT INTO PurchaseTransactionDetail
VALUES ('PH001','IT022',15),
('PH002','IT001',20), 
('PH003','IT007',100), 
('PH004','IT016',500),
('PH005','IT005',100),
('PH006','IT002',50),
('PH007','IT011',200),
('PH008','IT013',500),
('PH009','IT010',80), 
('PH009','IT008',100),
('PH010','IT018',200),
('PH010','IT019',200),
('PH011','IT014',350),
('PH011','IT015',200),
('PH012','IT003',50),
('PH012','IT004',50),
('PH013','IT020',200),
('PH013','IT021',350), 
('PH014','IT016',100),
('PH014','IT017',80),
('PH015','IT018',100),
('PH015','IT019',100),
('PH016','IT008',100),
('PH016','IT009',50),
('PH016','IT010',100), 
('PH017','IT002',50)
GO
