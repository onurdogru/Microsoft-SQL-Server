--INNER JOIN ON KULLANIMI
--select * from Orders inner join Customers on Orders.CustomerID=Customers.CustomerID

---dahada �zelle�tirirsek ;
--select Orders.OrderID, Customers.CompanyName from Orders inner join Customers on Orders.CustomerID=Customers.CustomerID
--select * from Orders
--select * from Customers

--Sonundaki null k�sm� �zel olarak ShipRegion s�tunundaki g�rmek istedi�imiz yeri temsil eder
--select * from Orders inner join Customers on Orders.CustomerID=Customers.CustomerID where ShipRegion is null



--select * from Products inner join Suppliers on Products.SupplierID=Suppliers.SupplierID
--select * from Products
--select * from Suppliers
-------------------------------------------------------------------------------------------------

--SORU : Hangi �r�nden ka� adet sat�lm��t�r?
--select * from  [Order Details]
--select ProductName from Products inner join [Order Details] 
--on Products.ProductID=[Order Details].ProductID

--SORU : En �ok kazand�ran ilk 3 �r�n hangisi ???????????
--select ProductName, UnitPrice, UnitsInStock from Products order by UnitPrice desc

--ALT SORGU??????
--select LastName, FirstName, 
--(select count(Orders.OrderID)from Orders where Orders.CustomerID=Employees.EmployeeID) 
--from Employees 

--ALT SORU SORU :
--Ortalaman�n alt�nda bir fiyata sahip �r�nlerimin ad� ve fiyat� ?
--1.ADIM
--select ProductName, UnitPrice from Products
----2.ADIM
--select avg(UnitPrice) from Products
----3.ADIM B�RLE�T�RME:
--select ProductName, UnitPrice from Products where UnitPrice<(select avg(UnitPrice) from Products)







