--BW01
--2440005416 - Davin Valentino
--2401954905 - Fidelia Lavani
--2401955006 - Willy
--2440011513 - Vanessa Tjandra

USE [bEJibun]

--SALES TRANSACTION
--1. Customer CU003 melakukan pembelian

--BEGIN TRAN
INSERT INTO SalesTransaction
VALUES
('SA018','CU003','ST005','2022-01-10')
--ROLLBACK

--BEGIN TRAN
INSERT INTO SalesTransactionDetail
VALUES 
('SA018','IT003',15),
('SA018','IT010',7),
('SA018','IT016',60),
('SA018','IT017',5)

--2. Customer CU010 melakukan pembelian

--BEGIN TRAN
INSERT INTO SalesTransaction
VALUES
('SA019','CU010','ST009','2022-01-10')

--BEGIN TRAN
INSERT INTO SalesTransactionDetail
VALUES 
('SA019','IT011',2),
('SA019','IT012',2)

--PURCHASE TRANSACTION

SELECT * FROM PurchaseTransaction
--1. ST008 melakukan pembelian 
INSERT INTO PurchaseTransaction
VALUES ('PH018','ST008','VE011','2021-01-11',NULL)

INSERT INTO PurchaseTransactionDetail
VALUES ('PH018','IT014',15), ('PH018','IT015',15)

--2.ST003 melakukan pembelian 
INSERT INTO PurchaseTransaction
VALUES ('PH019','ST003','VE001','2021-01-12',NULL)

INSERT INTO PurchaseTransactionDetail
VALUES ('PH019','IT022',20)
