use Northwind
--SELECT KOMUTU
--select ProductName from Products

--WHERE KOMUTU
--select * from Products where ProductID=6
--select * from Products where UnitPrice>40
--select * from Products where ProductName='Tofu'

--BETWEEN OPERATORU
--select * from Products where UnitPrice Between 25 and 50

--IN OPERATÖRÜ
--select * from Categories where CategoryName IN ('Seafood')

--LIKE OPERATÖRÜ
--select * from Products where ProductName like '%Ques%'

--ORDER / KAYIT SIRALAMA
--select * from Products order by UnitPrice desc

--SQL FONKSÝYONLARI - HESAPLAMA
--min(),max(),count(),avg(),sum()
--select min(UnitPrice) as [Onur] from Products 
--select count(UnitPrice) from Products
--select sum(UnitPrice) from Products
--select avg(UnitsInStock) from Products 

--DÝSTÝNCT KOMUTU
--select distinct TitleOfCourtesy from Employees --distinct tekrar ettirmeme komutu


--GROUP BY KOMUTU
--select sum(UnitsInStock) from Products group by ProductName

--HAVING KOMUTU ???
--select sum(UnitsInStock) from Products group by ProductName having count(UnitsInStock)>500

--INSERT INTO (KAYIT EKLEME) KOMUTU
--select * from Products
--insert into  Products (ProductName, QuantityPerUnit, UnitsInStock, UnitsOnOrder)
--values (Elma, 5kg, 20, 50 )

--UPDATE KOMUTU
--update Products Set ProductName= 'Armut', UnitPrice='50.00' where ProductID=3 --where kritik nokta

--DELETE KOMUTU
--delete from Products where ProductName='Chai'







