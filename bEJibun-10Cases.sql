--BW01
--2440005416 - Davin Valentino
--2401954905 - Fidelia Lavani
--2401955006 - Willy
--2440011513 - Vanessa Tjandra

USE [bEJibun]

--1. Display ItemName, ItemPrice, and Item Total (obtained from the sum of purchase’s quantity) of every item from all purchase that haven’t arrived, 
--and the Item Total of the said item is greater than 100. Display the data sorted according to the Item Total in descending order.
SELECT ItemName, Price, [Item Total]=SUM(PurchaseQty)
FROM PurchaseTransaction PT JOIN PurchaseTransactionDetail PTD ON PT.PurchaseID=PTD.PurchaseID JOIN Item i ON i.ItemID=PTD.ItemID 
	JOIN ItemType it ON it.ItemTypeID=i.ItemTypeID
WHERE ArrivalDate=NULL
GROUP BY ItemName, Price
HAVING SUM(PurchaseQty)>100
ORDER BY [Item Total] ASC


--2. Display VendorName, Domain Name (obtained from all letters of vendor's email, after the letter ‘@’), and 
--Average Purchased Item (obtained from the average of the quantities of the items that have been purchased from the vendor) of every vendor 
--whose address is on ‘Food Street’, and Domain Name is not ‘gmail.com’.
SELECT VendorName, [Domain Name]=SUBSTRING(VendorEmail,CHARINDEX('@',VendorEmail)+1,LEN(VendorEmail)), [Average Purchased Item]=AVG(PurchaseQty)
FROM PurchaseTransactionDetail PTD JOIN PurchaseTransaction PT ON PTD.PurchaseID=PT.PurchaseID JOIN Vendor v ON v.VendorID=PT.VendorID
WHERE VendorAddress IN ('Food Street') AND VendorEmail NOT LIKE '%gmail.com'
GROUP BY VendorName, VendorEmail


--3.Display Month (obtained from the month of sales’ date), Minimum Quantity Sold (obtained from the minimum of the sales’ quantity), 
--and Maximum Quantity Sold (obtained from the maximum of the sales’ quantity) from every sales transaction that happens in 2019, 
--excluding the quantity of items with the type of either ‘Food’ or ‘Drink’.
SELECT [Month]=MONTH(SalesDate), [Minimum Quantity Sold]=MIN(SalesQty), [Maximum Quantity Sold]=MAX(SalesQty)
FROM SalesTransaction ST JOIN SalesTransactionDetail STD ON ST.TransactionID=STD.TransactionID JOIN Item i ON i.ItemID=STD.ItemID 
	JOIN ItemType it ON it.ItemTypeID=i.ItemTypeID
WHERE YEAR(SalesDate)=2019 AND ItemTypeName NOT IN('Food','Drink')
GROUP BY MONTH(SalesDate)

--4.Display Staff Number, (obtained from StaffID, by replacing ‘ST’ with ‘Staff ’), StaffName, 
--Salary (obtained from the staff's salary, added by ‘Rp. ’ in front of the salary), Sales Count (obtained from the count of the sales transaction), 
--and Average Sales Quantity (obtained from the average of the sales quantity) for each staff who serve customer of opposite gender in February.
SELECT [Staff Number]=REPLACE(St.StaffID,'ST','Staff '), StaffName, [Salary]=CONCAT('Rp. ',StaffSalary), [Sales Count]=COUNT(DISTINCT Sls.TransactionID), 
	[Average Sales Quantity]=AVG(SalesQty)
FROM Staff St JOIN SalesTransaction Sls ON St.StaffID=Sls.StaffID JOIN SalesTransactionDetail Std ON Std.TransactionID=Sls.TransactionID 
	JOIN Customer c ON c.CustomerID=Sls.CustomerID
WHERE c.CustomerGender != St.StaffGender AND MONTH(SalesDate)=02
GROUP BY St.StaffID, StaffName, StaffSalary


--5. Display Customer Initial (obtained from the first letter and the last letter of the customer’s name), 
--Transaction Date (obtained from the sales date in ‘mm dd, yyyy’ Format), and Quantity from sales transactions which are done by female customer, 
--and the sales quantity is higher than the average quantity of all sales transaction.
--(alias subquery)
SELECT [Customer Initial]=CONCAT(LEFT(CustomerName,1),RIGHT(CustomerName,1)), [Transaction Date]=FORMAT(SalesDate,'MM dd, yyyy'),[Quantity]=SalesQty
FROM Customer c JOIN SalesTransaction ST ON c.CustomerID=ST.CustomerID JOIN SalesTransactionDetail STD ON ST.TransactionID=STD.TransactionID,(
	SELECT [AvgQty]=AVG(SalesQty)
	FROM SalesTransactionDetail
)x
WHERE CustomerGender='Female' AND SalesQty > x.AvgQty


--6.Display ID (obtained from vendor’s id in lower case), VendorName, and Phone Number 
--(obtained from vendor's phone, by replacing the first character of the vendor’s phone with ‘+62’) from every purchase transaction, 
--where the transaction’s quantity is higher than the minimum of all purchase transaction, and the transaction’s item id is odd. 
--The same vendor may be displayed more than once.
--(alias subquery)
SELECT [ID]=LOWER(PT.VendorID), VendorName, [Phone Number]=CONCAT('+62',SUBSTRING(VendorPhone,2,LEN(VendorPhone)))
FROM Vendor v JOIN PurchaseTransaction PT ON v.VendorID=PT.VendorID JOIN PurchaseTransactionDetail PTD ON PTD.PurchaseID=PT.PurchaseID, (
	SELECT [MinQty]= MIN(PurchaseQty)
	FROM PurchaseTransaction PT , PurchaseTransactionDetail PTD
	WHERE PT.PurchaseID=PTD.PurchaseID
)x
WHERE PurchaseQty > x.MinQty AND CAST(SUBSTRING(ItemID,3,LEN(ItemID)) AS INT) % 2=1 


--7.	Display StaffName, VendorName, PurchaseID, Total Purchased Quantity (obtained from the sum of purchase quantity), 
--Ordered Day (obtained from the difference in day between the purchase date and current date, and ends with ‘ Days ago’) for every transaction which 
--Total Purchased Quantity is greater than the maximum quantity of all transactions that arrived less than a week after the purchase.
--(alias subquery)
SELECT s.StaffName, VendorName, PT.PurchaseID, [TotalPurchasedQuantity]=SUM(PurchaseQty), [Ordered Day]=CONCAT(DATEDIFF(day,PurchaseDate,GETDATE()),' Days ago')
FROM Staff s JOIN PurchaseTransaction PT ON PT.StaffID=s.StaffID JOIN PurchaseTransactionDetail PTD ON  PTD.PurchaseID=PT.PurchaseID 
	JOIN Vendor v ON v.VendorID=PT.VendorID, (
		SELECT [MaxQty]=MAX(PurchaseQty)
		FROM PurchaseTransactionDetail 

	)x
WHERE DATEDIFF(day,PurchaseDate,ArrivalDate)<7 
GROUP BY s.StaffName, VendorName, PT.PurchaseID, PurchaseDate, x.MaxQty
HAVING x.MaxQty<SUM(PurchaseQty)


--8.	Display Day (obtained from the name of the day of the sales transaction, such as ‘Monday’), 
--Item Sales Amount (obtained from the count of the item sales) from each sale, only including items which price is less than the average of the price of items 
--with the type of either ‘Electronic’ or ‘Gadgets’. Display only the two data with the smallest sales transaction count.
--(alias subquery)
SELECT TOP 2 [Day]=DATENAME(WEEKDAY,SalesDate), [Item Sales Amount]=COUNT(DISTINCT STD.ItemID)
FROM SalesTransaction ST JOIN SalesTransactionDetail STD ON ST.TransactionID=STD.TransactionID 
	JOIN Item i ON STD.ItemID=i.ItemID, (
		SELECT [AvgPrice]=AVG(Price)
		FROM Item i, ItemType it
		WHERE it.ItemTypeID=i.ItemTypeID AND ItemTypeName IN ('Electronic','Gadgets') 
	) x
WHERE Price < x.AvgPrice
GROUP BY DATENAME(WEEKDAY,SalesDate)
ORDER BY [Item Sales Amount] ASC


--9.	Create a view called ‘Customer Statistic by Gender’ which display CustomerGender, Maximum Sales (obtained from the maximum of the sales quantity) and 
--Minimum Sales (obtained from the minimum of the sales quantity) for every transaction with the quantity between 10 and 50 and the customer date of birth's range 
--are between 1998 and 1999.
CREATE VIEW [Customer Statistic by Gender]
AS
SELECT CustomerGender, [Maximum Sales]=MAX(SalesQty), [Minimum Sales]=MIN(SalesQty)
FROM Customer c JOIN SalesTransaction ST ON c.CustomerID=ST.CustomerID JOIN SalesTransactionDetail STD ON STD.TransactionID=ST.TransactionID
WHERE SalesQty BETWEEN 10 AND 50 AND YEAR(CustomerDOB) BETWEEN 1998 AND 1999
GROUP BY CustomerGender


--10.	Create a view called ‘Item Type Statistic’ to display Item Type (obtained from item type’s name in uppercase), 
--Average Price (obtained from the average of item's price) and Number of Item Variety (obtained from the count of items) for every item type 
--which started with F and include only the items which minimum purchase is higher than 5.
CREATE VIEW [Item Type Statistic]
AS
SELECT [Item Type]=UPPER(ItemTypeName), [Average Price]=AVG(Price), [Number of Item Variety]=COUNT(ItemName)
FROM Item i JOIN ItemType it ON i.ItemTypeID=it.ItemTypeID
WHERE MinPurchase>5 AND ItemTypeName LIKE 'F%'
GROUP BY ItemTypeName
