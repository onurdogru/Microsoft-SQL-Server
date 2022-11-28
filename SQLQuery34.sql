--1998 y�l� mart ay�ndaki sipari�lerimin adresi, sipari�i alan �al��an�n ad�, �al��an�n soyad�
select
o.ShipAddress,e.FirstName,e.LastName 
from Orders as o
inner join Employees e
on e.EmployeeID = o.EmployeeID
where YEAR(o.OrderDate) = 1998 and Month(o.OrderDate) = 3
 
 
--1997 y�l� �ubat ay�nda ka� sipari�im var?
select count(*) Adet from Orders as o where YEAR(o.OrderDate) = 1997 and Month(o.OrderDate) = 2
 
--London �ehrinden 1998 y�l�nda ka� sipari�im var?
select count(*) Adet from Orders o where YEAR(o.OrderDate) = 1998 and  o.ShipCity = 'London'
 
--1997 y�l�nda sipari� veren m��terilerimin contactname ve telefon numaras�
select c.ContactName, c.Phone from Orders o inner join Customers c
on o.CustomerID = c.CustomerID
where YEAR(o.OrderDate) = 1997
 
--Ta��ma �creti 40 �zeri olan sipari�lerim ( Freight)
select * from Orders where Freight > 40 order by Freight
 
--Ta��ma �creti 40 ve �zeri olan sipari�lerimin �ehri, m��terisinin ad�
select o.ShipCity,c.ContactName from Orders o inner join Customers c
on o.CustomerID = c.CustomerID
where Freight >= 40
 
--1997 y�l�nda verilen sipari�lerin tarihi, �ehri, �al��an ad� -soyad� ( ad soyad birle�ik olacak ve b�y�k harf)
select
o.OrderDate,
o.ShipCity,
UPPER(emp.FirstName + ' ' + emp.LastName)
from Orders as o inner join Employees as emp
on o.EmployeeID = emp.EmployeeID
where YEAR(o.OrderDate) = 1997
 
 
--1997 y�l�nda sipari� veren m��terilerin contactname i,  ve telefon numaralar� ( telefon format� 2223322 gibi olmal� )
 
select
c.ContactName,
TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(c.Phone,'(',''),')',''),' ',''),'.',''),'-',''))
from Orders as o inner join Customers as c
on o.CustomerID = c.CustomerID
where YEAR(o.OrderDate) = 1997
 
--Sipari� tarihi, m��teri contact name, �al��an ad, �al��an soyad (3 tablo birle�tirilecek)
select
o.OrderDate,
c.ContactName,
emp.FirstName,
emp.LastName
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
inner join Employees as emp
on o.EmployeeID = emp.EmployeeID
 
--Geciken sipari�lerim?
select * from Orders as o where o.RequiredDate < o.ShippedDate
 
--Geciken sipari�lerimin tarihi, m��terisinin ad�
select
o.OrderDate,
c.ContactName
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
where o.RequiredDate < o.ShippedDate
 
--10248 nolu sipari�te sat�lan �r�nlerin ad�, kategorisinin ad�, adedi ( category,product,order details )
select
p.ProductName,
c.CategoryName,
od.Quantity
from [Order Details] od inner join Products p
on od.ProductID = p.ProductID
inner join Categories c
on p.CategoryID = c.CategoryID
where od.OrderID = 10248
 
--10248 nolu sipari�in �r�nlerinin ad� , tedarik�i ad� (Orders, products, suppliers )
select
p.ProductName,
s.CompanyName
from [Order Details] od
inner join Products p
on od.ProductID = p.ProductID
inner join Suppliers s
on p.SupplierID = s.SupplierID
where od.OrderID = 10248
 
 
--3 numaral� ID ye sahip �al��an�n 1997 y�l�nda satt��� �r�nlerin ad� ve adeti 
select
p.ProductName,
od.Quantity
from [Order Details] od
inner join Orders o
on od.OrderID = o.OrderID
inner join Products p
on od.ProductID = p.ProductID
where o.EmployeeID = 3 and YEAR(o.OrderDate) = 1997
 
--1997 y�l�nda bir defasinda en �ok sat�� yapan �al��an�m�n ID,Ad soyad 
select
top 1(od.UnitPrice * od.Quantity) ToplamSatis,
emp.EmployeeID,
emp.FirstName,
emp.LastName
from [Order Details] od
inner join Orders o
on od.OrderID = o.OrderID
inner join Employees emp
on o.EmployeeID = emp.EmployeeID
where YEAR(o.OrderDate) = 1997
order by ToplamSatis desc
 
 
--1997 y�l�nda en �ok sat�� yapan �al��an�m�n ID,Ad soyad ****
select
top 1 SUM(od.UnitPrice * od.Quantity) ToplamSatis,
emp.EmployeeID,
emp.FirstName,
emp.LastName
from [Order Details] od
inner join Orders o
on od.OrderID = o.OrderID
inner join Employees emp
on o.EmployeeID = emp.EmployeeID
where YEAR(o.OrderDate) = 1997
group by emp.EmployeeID,FirstName,LastName
order by ToplamSatis desc
 
--En pahal� �r�n�m�n ad�,fiyat�  ve kategorisin ad� nedir? 
select
top 1 p.ProductName,
c.CategoryName,
p.UnitPrice 
from Products p inner join Categories c
on p.CategoryID = c.CategoryID
order by p.UnitPrice desc
 
--Sipari�i alan personelin ad�,soyad�, sipari� tarihi, sipari� ID. S�ralama sipari� tarihine g�re 
select
o.OrderID,
emp.FirstName + ' ' + emp.LastName,
o.OrderDate 
from Orders o inner join  Employees emp
on o.EmployeeID = emp.EmployeeID
order by o.OrderDate
 
--SON 5 sipari�imin ortalama fiyat� ve orderid nedir? (sepet toplam� ortalamas�) 
select top 5
o.OrderID,
AVG(od.UnitPrice * od.Quantity)
from Orders o inner join [Order Details] od
on o.OrderID = od.OrderID
group by o.OrderID
order by o.OrderID desc
 
--Ocak ay�nda sat�lan �r�nlerimin ad� ve kategorisinin ad� ve toplam sat�� miktar� nedir?
 select
 p.ProductName,
 c.CategoryName,
 od.Quantity
 from Orders o 
 inner join [Order Details] od
 on o.OrderID = od.OrderID
 inner join Products p
 on p.ProductID = od.ProductID
 inner join Categories c
 on c.CategoryID = p.CategoryID
 where Month(o.OrderDate) = 1
 
 
 --Ortalama sat�� miktar�m�n �zerindeki sat��lar�m nelerdir? (order details tablosu) 
 
 declare @ortalama float
  
 set @ortalama = (select AVG(od.UnitPrice * od.Quantity) from [Order Details] od)
 
 select (od.UnitPrice * od.Quantity) Satis from [Order Details] od 
 where (od.UnitPrice * od.Quantity)  > @ortalama
 order by Satis
 
 
 --En �ok sat�lan �r�n�m�n(adet baz�nda) ad�, kategorisinin ad� ve tedarik�isinin ad� (4 tablo birle�imi) 
 select top 1 
 p.ProductName,
 c.CategoryName,
 s.CompanyName
 from [Order Details]  od
 inner join Products p
 on od.ProductID = p.ProductID
 inner join Categories c
 on c.CategoryID = p.CategoryID
 inner join Suppliers s
 on s.SupplierID = p.SupplierID
 order by Quantity desc
 
 
 -- Ka� �lkeden m��terim var
 select distinct c.Country from Customers c
 
 
 --Hangi �lkeden ka� m��terimiz var
 select
 c.Country,
 COUNT(*) Adet
 from Customers c
 group by c.Country
 
 --3 numaral� ID ye sahip �al��an (employee) son Ocak ay�ndan BUG�NE toplamda ne kadarl�k �r�n satt�? 
 
 select
 SUM(od.UnitPrice * od.Quantity)
 from Orders o
 inner join [Order Details] od
 on o.OrderID = od.OrderID
 where o.EmployeeID = 3 and YEAR(o.OrderDate) >= 1998 and MONTH(o.OrderDate) > 1
 
 --10 numaral� ID ye sahip �r�n�mden son 3 ayda ne kadarl�k ciro sa�lad�m?</pre>
<pre class="a-b-r-La">--10248 nolu sipari�te sat�lan �r�nlerin ad�, kategorisinin ad�, adedi ( category,product,order details )
select
p.ProductName,
c.CategoryName,
od.Quantity
from [Order Details] od inner join Products p
on od.ProductID = p.ProductID
inner join Categories c
on p.CategoryID = c.CategoryID
where od.OrderID = 10248
 
--10248 nolu sipari�in �r�nlerinin ad� , tedarik�i ad� (Orders, products, suppliers )
select
p.ProductName,
s.CompanyName
from [Order Details] od
inner join Products p
on od.ProductID = p.ProductID
inner join Suppliers s
on p.SupplierID = s.SupplierID
where od.OrderID = 10248
 
 
--3 numaral� ID ye sahip �al��an�n 1997 y�l�nda satt��� �r�nlerin ad� ve adeti 
select
p.ProductName,
od.Quantity
from [Order Details] od
inner join Orders o
on od.OrderID = o.OrderID
inner join Products p
on od.ProductID = p.ProductID
where o.EmployeeID = 3 and YEAR(o.OrderDate) = 1997
 
--1997 y�l�nda bir defasinda en �ok sat�� yapan �al��an�m�n ID,Ad soyad 
select
top 1(od.UnitPrice * od.Quantity) ToplamSatis,
emp.EmployeeID,
emp.FirstName,
emp.LastName
from [Order Details] od
inner join Orders o
on od.OrderID = o.OrderID
inner join Employees emp
on o.EmployeeID = emp.EmployeeID
where YEAR(o.OrderDate) = 1997
order by ToplamSatis desc
 
 
--1997 y�l�nda en �ok sat�� yapan �al��an�m�n ID,Ad soyad ****
select
top 1 SUM(od.UnitPrice * od.Quantity) ToplamSatis,
emp.EmployeeID,
emp.FirstName,
emp.LastName
from [Order Details] od
inner join Orders o
on od.OrderID = o.OrderID
inner join Employees emp
on o.EmployeeID = emp.EmployeeID
where YEAR(o.OrderDate) = 1997
group by emp.EmployeeID,FirstName,LastName
order by ToplamSatis desc
 
--En pahal� �r�n�m�n ad�,fiyat�  ve kategorisin ad� nedir? 
select
top 1 p.ProductName,
c.CategoryName,
p.UnitPrice 
from Products p inner join Categories c
on p.CategoryID = c.CategoryID
order by p.UnitPrice desc
 
--Sipari�i alan personelin ad�,soyad�, sipari� tarihi, sipari� ID. S�ralama sipari� tarihine g�re 
select
o.OrderID,
emp.FirstName + ' ' + emp.LastName,
o.OrderDate 
from Orders o inner join  Employees emp
on o.EmployeeID = emp.EmployeeID
order by o.OrderDate
 
--SON 5 sipari�imin ortalama fiyat� ve orderid nedir? (sepet toplam� ortalamas�) 
select top 5
o.OrderID,
AVG(od.UnitPrice * od.Quantity)
from Orders o inner join [Order Details] od
on o.OrderID = od.OrderID
group by o.OrderID
order by o.OrderID desc
 
--Ocak ay�nda sat�lan �r�nlerimin ad� ve kategorisinin ad� ve toplam sat�� miktar� nedir?
 select
 p.ProductName,
 c.CategoryName,
 od.Quantity
 from Orders o 
 inner join [Order Details] od
 on o.OrderID = od.OrderID
 inner join Products p
 on p.ProductID = od.ProductID
 inner join Categories c
 on c.CategoryID = p.CategoryID
 where Month(o.OrderDate) = 1
 
 
 --Ortalama sat�� miktar�m�n �zerindeki sat��lar�m nelerdir? (order details tablosu) 
 
 declare @ortalama float
  
 set @ortalama = (select AVG(od.UnitPrice * od.Quantity) from [Order Details] od)
 
 select (od.UnitPrice * od.Quantity) Satis from [Order Details] od 
 where (od.UnitPrice * od.Quantity)  > @ortalama
 order by Satis
 
 
 --En �ok sat�lan �r�n�m�n(adet baz�nda) ad�, kategorisinin ad� ve tedarik�isinin ad� (4 tablo birle�imi) 
 select top 1 
 p.ProductName,
 c.CategoryName,
 s.CompanyName
 from [Order Details]  od
 inner join Products p
 on od.ProductID = p.ProductID
 inner join Categories c
 on c.CategoryID = p.CategoryID
 inner join Suppliers s
 on s.SupplierID = p.SupplierID
 order by Quantity desc
 
 
 -- Ka� �lkeden m��terim var
 select distinct c.Country from Customers c
 
 
 --Hangi �lkeden ka� m��terimiz var
 select
 c.Country,
 COUNT(*) Adet
 from Customers c
 group by c.Country
 
 --3 numaral� ID ye sahip �al��an (employee) son Ocak ay�ndan BUG�NE toplamda ne kadarl�k �r�n satt�? 
 
 select
 SUM(od.UnitPrice * od.Quantity)
 from Orders o
 inner join [Order Details] od
 on o.OrderID = od.OrderID
 where o.EmployeeID = 3 and YEAR(o.OrderDate) >= 1998 and MONTH(o.OrderDate) > 1