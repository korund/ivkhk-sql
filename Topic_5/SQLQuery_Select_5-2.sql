-- JKTVR16 Konstantinov Rudolf
-- Excercise 5.2

-- query 1
select CustomerID,ContactName,Country from Customers where Country='Canada';
-- query 2
select CustomerID,ContactName,PostalCode from Customers where PostalCode in ('1010', '8010');
-- query 3
select CustomerID,ContactName,Fax from Customers where Fax is null;
-- query 4
select CustomerID,ContactName,Region from Customers where Region is not null;
-- query 5
select CustomerID,ContactName,Fax,Region from Customers where Fax is null and Region is null;
-- query 6
select CustomerID,ContactName,Phone from Customers where Phone like '%555%';
-- query 7
select CustomerID,ContactName,ContactTitle,Country from Customers where ContactTitle='owner' and Country in ('USA', 'Mexico');
-- query 8
select CustomerID,ContactName from Customers where ContactName like '%Sven%';
-- query 9
select CustomerID,Country from Customers;
-- query 10
select CustomerID,ContactName from Customers where CustomerID like '[B-E]%';
-- query 11
select CustomerID,ContactName from Customers where CustomerID not like '%[AO]%';
-- query 12
select CustomerID,ContactName,ContactTitle from Customers where ContactTitle like '%sales%';
-- query 13
select CustomerID,ContactName,ContactTitle from Customers where ContactTitle like '%manager%' and ContactTitle not like '%sales%';
-- query 14
select CustomerID,ContactName,City from Customers where City like '% % %';
-- query 15
select OrderID,CustomerID,OrderDate from Orders where year(OrderDate)='1996';
-- query 16
select OrderID,CustomerID,OrderDate from Orders where year(OrderDate)='1997' and month(OrderDate)='08';
-- query 17
select OrderID,CustomerID,OrderDate from Orders where year(OrderDate)='1997' and month(OrderDate)='07' and CustomerID='greal';
-- query 18
select OrderID,UnitPrice,Quantity from [Order Details] where UnitPrice>50 and Quantity<5;
-- query 19
select ProductID,ProductName,UnitPrice,UnitsInStock,(UnitPrice * UnitsInStock) as 'StockPrice' from Products;
-- query 20
select top(4) OrderID,CustomerID,OrderDate from Orders;
