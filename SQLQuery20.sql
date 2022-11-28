--INNER JOIN ON KULLANIMI
--select * from Orders inner join Customers on Orders.CustomerID=Customers.CustomerID

---dahada özelleþtirirsek ;
--select Orders.OrderID, Customers.CompanyName from Orders inner join Customers on Orders.CustomerID=Customers.CustomerID
--select * from Orders
--select * from Customers

--Sonundaki null kýsmý özel olarak ShipRegion sütunundaki görmek istediðimiz yeri temsil eder
--select * from Orders inner join Customers on Orders.CustomerID=Customers.CustomerID where ShipRegion is null



--select * from Products inner join Suppliers on Products.SupplierID=Suppliers.SupplierID
--select * from Products
--select * from Suppliers
-------------------------------------------------------------------------------------------------

--SORU : Hangi Üründen kaç adet satýlmýþtýr?
--select * from  [Order Details]
--select ProductName from Products inner join [Order Details] 
--on Products.ProductID=[Order Details].ProductID

--SORU : En çok kazandýran ilk 3 ürün hangisi ???????????
--select ProductName, UnitPrice, UnitsInStock from Products order by UnitPrice desc

--ALT SORGU??????
--select LastName, FirstName, 
--(select count(Orders.OrderID)from Orders where Orders.CustomerID=Employees.EmployeeID) 
--from Employees 

--ALT SORU SORU :
--Ortalamanýn altýnda bir fiyata sahip ürünlerimin adý ve fiyatý ?
--1.ADIM
--select ProductName, UnitPrice from Products
----2.ADIM
--select avg(UnitPrice) from Products
----3.ADIM BÝRLEÞTÝRME:
--select ProductName, UnitPrice from Products where UnitPrice<(select avg(UnitPrice) from Products)







