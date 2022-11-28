--1998 yýlý mart ayýndaki sipariþlerimin adresi, sipariþi alan çalýþanýn adý, çalýþanýn soyadý
select
o.ShipAddress,e.FirstName,e.LastName 
from Orders as o
inner join Employees e
on e.EmployeeID = o.EmployeeID
where YEAR(o.OrderDate) = 1998 and Month(o.OrderDate) = 3
 
 
--1997 yýlý þubat ayýnda kaç sipariþim var?
select count(*) Adet from Orders as o where YEAR(o.OrderDate) = 1997 and Month(o.OrderDate) = 2
 
--London þehrinden 1998 yýlýnda kaç sipariþim var?
select count(*) Adet from Orders o where YEAR(o.OrderDate) = 1998 and  o.ShipCity = 'London'
 
--1997 yýlýnda sipariþ veren müþterilerimin contactname ve telefon numarasý
select c.ContactName, c.Phone from Orders o inner join Customers c
on o.CustomerID = c.CustomerID
where YEAR(o.OrderDate) = 1997
 
--Taþýma ücreti 40 üzeri olan sipariþlerim ( Freight)
select * from Orders where Freight > 40 order by Freight
 
--Taþýma ücreti 40 ve üzeri olan sipariþlerimin þehri, müþterisinin adý
select o.ShipCity,c.ContactName from Orders o inner join Customers c
on o.CustomerID = c.CustomerID
where Freight >= 40
 
--1997 yýlýnda verilen sipariþlerin tarihi, þehri, çalýþan adý -soyadý ( ad soyad birleþik olacak ve büyük harf)
select
o.OrderDate,
o.ShipCity,
UPPER(emp.FirstName + ' ' + emp.LastName)
from Orders as o inner join Employees as emp
on o.EmployeeID = emp.EmployeeID
where YEAR(o.OrderDate) = 1997
 
 
--1997 yýlýnda sipariþ veren müþterilerin contactname i,  ve telefon numaralarý ( telefon formatý 2223322 gibi olmalý )
 
select
c.ContactName,
TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(c.Phone,'(',''),')',''),' ',''),'.',''),'-',''))
from Orders as o inner join Customers as c
on o.CustomerID = c.CustomerID
where YEAR(o.OrderDate) = 1997
 
--Sipariþ tarihi, müþteri contact name, çalýþan ad, çalýþan soyad (3 tablo birleþtirilecek)
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
 
--Geciken sipariþlerim?
select * from Orders as o where o.RequiredDate < o.ShippedDate
 
--Geciken sipariþlerimin tarihi, müþterisinin adý
select
o.OrderDate,
c.ContactName
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
where o.RequiredDate < o.ShippedDate
 
--10248 nolu sipariþte satýlan ürünlerin adý, kategorisinin adý, adedi ( category,product,order details )
select
p.ProductName,
c.CategoryName,
od.Quantity
from [Order Details] od inner join Products p
on od.ProductID = p.ProductID
inner join Categories c
on p.CategoryID = c.CategoryID
where od.OrderID = 10248
 
--10248 nolu sipariþin ürünlerinin adý , tedarikçi adý (Orders, products, suppliers )
select
p.ProductName,
s.CompanyName
from [Order Details] od
inner join Products p
on od.ProductID = p.ProductID
inner join Suppliers s
on p.SupplierID = s.SupplierID
where od.OrderID = 10248
 
 
--3 numaralý ID ye sahip çalýþanýn 1997 yýlýnda sattýðý ürünlerin adý ve adeti 
select
p.ProductName,
od.Quantity
from [Order Details] od
inner join Orders o
on od.OrderID = o.OrderID
inner join Products p
on od.ProductID = p.ProductID
where o.EmployeeID = 3 and YEAR(o.OrderDate) = 1997
 
--1997 yýlýnda bir defasinda en çok satýþ yapan çalýþanýmýn ID,Ad soyad 
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
 
 
--1997 yýlýnda en çok satýþ yapan çalýþanýmýn ID,Ad soyad ****
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
 
--En pahalý ürünümün adý,fiyatý  ve kategorisin adý nedir? 
select
top 1 p.ProductName,
c.CategoryName,
p.UnitPrice 
from Products p inner join Categories c
on p.CategoryID = c.CategoryID
order by p.UnitPrice desc
 
--Sipariþi alan personelin adý,soyadý, sipariþ tarihi, sipariþ ID. Sýralama sipariþ tarihine göre 
select
o.OrderID,
emp.FirstName + ' ' + emp.LastName,
o.OrderDate 
from Orders o inner join  Employees emp
on o.EmployeeID = emp.EmployeeID
order by o.OrderDate
 
--SON 5 sipariþimin ortalama fiyatý ve orderid nedir? (sepet toplamý ortalamasý) 
select top 5
o.OrderID,
AVG(od.UnitPrice * od.Quantity)
from Orders o inner join [Order Details] od
on o.OrderID = od.OrderID
group by o.OrderID
order by o.OrderID desc
 
--Ocak ayýnda satýlan ürünlerimin adý ve kategorisinin adý ve toplam satýþ miktarý nedir?
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
 
 
 --Ortalama satýþ miktarýmýn üzerindeki satýþlarým nelerdir? (order details tablosu) 
 
 declare @ortalama float
  
 set @ortalama = (select AVG(od.UnitPrice * od.Quantity) from [Order Details] od)
 
 select (od.UnitPrice * od.Quantity) Satis from [Order Details] od 
 where (od.UnitPrice * od.Quantity)  > @ortalama
 order by Satis
 
 
 --En çok satýlan ürünümün(adet bazýnda) adý, kategorisinin adý ve tedarikçisinin adý (4 tablo birleþimi) 
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
 
 
 -- Kaç ülkeden müþterim var
 select distinct c.Country from Customers c
 
 
 --Hangi ülkeden kaç müþterimiz var
 select
 c.Country,
 COUNT(*) Adet
 from Customers c
 group by c.Country
 
 --3 numaralý ID ye sahip çalýþan (employee) son Ocak ayýndan BUGÜNE toplamda ne kadarlýk ürün sattý? 
 
 select
 SUM(od.UnitPrice * od.Quantity)
 from Orders o
 inner join [Order Details] od
 on o.OrderID = od.OrderID
 where o.EmployeeID = 3 and YEAR(o.OrderDate) >= 1998 and MONTH(o.OrderDate) > 1
 
 --10 numaralý ID ye sahip ürünümden son 3 ayda ne kadarlýk ciro saðladým?</pre>
<pre class="a-b-r-La">--10248 nolu sipariþte satýlan ürünlerin adý, kategorisinin adý, adedi ( category,product,order details )
select
p.ProductName,
c.CategoryName,
od.Quantity
from [Order Details] od inner join Products p
on od.ProductID = p.ProductID
inner join Categories c
on p.CategoryID = c.CategoryID
where od.OrderID = 10248
 
--10248 nolu sipariþin ürünlerinin adý , tedarikçi adý (Orders, products, suppliers )
select
p.ProductName,
s.CompanyName
from [Order Details] od
inner join Products p
on od.ProductID = p.ProductID
inner join Suppliers s
on p.SupplierID = s.SupplierID
where od.OrderID = 10248
 
 
--3 numaralý ID ye sahip çalýþanýn 1997 yýlýnda sattýðý ürünlerin adý ve adeti 
select
p.ProductName,
od.Quantity
from [Order Details] od
inner join Orders o
on od.OrderID = o.OrderID
inner join Products p
on od.ProductID = p.ProductID
where o.EmployeeID = 3 and YEAR(o.OrderDate) = 1997
 
--1997 yýlýnda bir defasinda en çok satýþ yapan çalýþanýmýn ID,Ad soyad 
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
 
 
--1997 yýlýnda en çok satýþ yapan çalýþanýmýn ID,Ad soyad ****
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
 
--En pahalý ürünümün adý,fiyatý  ve kategorisin adý nedir? 
select
top 1 p.ProductName,
c.CategoryName,
p.UnitPrice 
from Products p inner join Categories c
on p.CategoryID = c.CategoryID
order by p.UnitPrice desc
 
--Sipariþi alan personelin adý,soyadý, sipariþ tarihi, sipariþ ID. Sýralama sipariþ tarihine göre 
select
o.OrderID,
emp.FirstName + ' ' + emp.LastName,
o.OrderDate 
from Orders o inner join  Employees emp
on o.EmployeeID = emp.EmployeeID
order by o.OrderDate
 
--SON 5 sipariþimin ortalama fiyatý ve orderid nedir? (sepet toplamý ortalamasý) 
select top 5
o.OrderID,
AVG(od.UnitPrice * od.Quantity)
from Orders o inner join [Order Details] od
on o.OrderID = od.OrderID
group by o.OrderID
order by o.OrderID desc
 
--Ocak ayýnda satýlan ürünlerimin adý ve kategorisinin adý ve toplam satýþ miktarý nedir?
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
 
 
 --Ortalama satýþ miktarýmýn üzerindeki satýþlarým nelerdir? (order details tablosu) 
 
 declare @ortalama float
  
 set @ortalama = (select AVG(od.UnitPrice * od.Quantity) from [Order Details] od)
 
 select (od.UnitPrice * od.Quantity) Satis from [Order Details] od 
 where (od.UnitPrice * od.Quantity)  > @ortalama
 order by Satis
 
 
 --En çok satýlan ürünümün(adet bazýnda) adý, kategorisinin adý ve tedarikçisinin adý (4 tablo birleþimi) 
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
 
 
 -- Kaç ülkeden müþterim var
 select distinct c.Country from Customers c
 
 
 --Hangi ülkeden kaç müþterimiz var
 select
 c.Country,
 COUNT(*) Adet
 from Customers c
 group by c.Country
 
 --3 numaralý ID ye sahip çalýþan (employee) son Ocak ayýndan BUGÜNE toplamda ne kadarlýk ürün sattý? 
 
 select
 SUM(od.UnitPrice * od.Quantity)
 from Orders o
 inner join [Order Details] od
 on o.OrderID = od.OrderID
 where o.EmployeeID = 3 and YEAR(o.OrderDate) >= 1998 and MONTH(o.OrderDate) > 1