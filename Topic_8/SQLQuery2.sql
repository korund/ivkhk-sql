

/*
-- query 1
select CompanyName,
	Country 
	from Suppliers 
	where SupplierID in (
		select distinct SupplierID 
		from Products 
		where Discontinued=1);

-- query 2
-- no fruits!
select distinct Country from Suppliers
where SupplierID in (
	select SupplierID 
	from Products
	where CategoryID=(
		select CategoryID 
		from Categories
		where CategoryName='Produce'));

-- query 3
/*
1. sum all unitprice by customerID as customersum
2. sum all customersum's by country
*/
select Country
	,sum([Order Details].UnitPrice) as CountrySum 
	from Customers 
	inner join Orders on Customers.CustomerID=Orders.CustomerID 
	inner join [Order Details] on Orders.OrderID=[Order Details].OrderID
	group by Country
	order by Country asc;

-- query 4
select datepart(yy, OrderDate) as OrderYear
	,sum(UnitPrice) as YearSum 
	from Orders	inner join 
	[Order Details] on Orders.OrderID=[Order Details].OrderID
	group by datepart(yy, OrderDate)
	order by OrderYear;

-- query 5
select * from Products
	where UnitPrice=(select min(UnitPrice) from Products);

-- query 6
select CompanyName,
	Country,
	ProductID,
	ProductName,
	UnitPrice from Suppliers inner join 
	Products on Suppliers.SupplierID=Products.SupplierID
	where Country='Japan';

-- query 7
/* just to see the difference 2007 was replaced by 1997 
because all orders are in between 1996 and 1998 year */
select * from Customers where exists(
	select null from Orders
	where Customers.CustomerID=Orders.CustomerID and
		OrderDate='1997-02-12');

-- query 8
select * from Customers where not exists(
	select null from Orders
	where Customers.CustomerID=Orders.CustomerID and
		OrderDate='1997-02-12');

-- query 9
-- customers and count their orders. sort desc.
select Customers.*, OrderCount from Customers inner join
	(select CustomerID,count(OrderID) as OrderCount 
		from Orders 
		group by CustomerID)
	t1 on Customers.CustomerID=t1.CustomerID
	order by OrderCount desc;

-- query 10
-- no orders at all
select * from Customers where not exists(
	select null from Orders 
		where Customers.CustomerID=Orders.CustomerID);

-- query 11
select Customers.*,OrderCount,QuantitySum from Customers 
inner join (
	select CustomerID 
	,count(OrderID) as OrderCount 
	from Orders 
	group by CustomerID)
t1 on Customers.CustomerID=t1.CustomerID 
inner join (
	select CustomerID
	,sum(Quantity) as QuantitySum
	from Orders 
	inner join [Order Details] on Orders.OrderID=[Order Details].OrderID
	group by CustomerID)
t2 on Customers.CustomerID=t2.CustomerID
where Country='USA';
*/
-- query 13
-- question here!
-- in case exist select from order where orderdate=datex, then yes
/*
select CustomerID
	,case OrderDate when '07-19-1996' then 'yes' else 'no' end as dateX
from Orders;

select * from Customers
where exists(
	select null from Orders 
	where Customers.CustomerID=Orders.CustomerID and 
		OrderDate='07-19-1996')

-- query 15
select City from Employees
union
select City from Customers;

-- query 16
select City from Employees
intersect
select City from Customers;

-- query 17
select * from Employees
where EmployeeID in (
	select EmployeeID 
	from Orders 
	where CustomerID='savea'
	except
	select EmployeeID
	from Orders
	where CustomerID='oldwo'
	group by EmployeeID);
*/
-- query 18
select e1.EmployeeID,e2.EmployeeID 
from Employees e1 join Employees e2
on e1.EmployeeID=e2.EmployeeID
where e1.EmployeeID != e2.EmployeeID;
	