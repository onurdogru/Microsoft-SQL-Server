--Alıştırmalar - 1
-- * yerine kolon adı konulursa NULL olmayanları hesaplar
select COUNT(*) from Employees
 
--Ürünleri listele
select * from Products 
 
--Ürünleri ad sırasına göre (A-Z) listele 
select * from Products order by ProductName
 
--Ürünleri ad sırasına göre tersten listele (Z-A) 
select * from Products order by ProductName desc
 
--CategoryID si 3 olan ürünleri listele 
select * from Products where CategoryID = 3
 
--CategoryID si 3 olan ürünleri ada göre listele (A-Z) 
select * from Products where CategoryID = 3 order by ProductName
 
--Fiyatı 30 dan büyük kaç ürün var? ( COUNT(*) )
select COUNT(*) Adet from Products where UnitPrice > 30
 
--Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele 
select LOWER(ProductName), UnitPrice from Products order by UnitPrice desc
 
 
--İsmi ‘a’ harfi ile başlayan ürünlerin sadece adını ekrana yaz 
select ProductName from Products where ProductName like 'a%'
 
--İsmi a harfi ile başlayan VE fiyatı 20 den büyük eşit ürünleri isme göre listele 
select * from Products where ProductName like 'a%' and UnitPrice >= 20 order by ProductName
 
--Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır  ( Employee)
select FirstName + ' ' + LastName [Full Name] from Employees
 
--Ürünün sadece KDV li fiyatını ekrana yazdır(tek kolon)
 select UnitPrice * 0.18 from Products
 
--Region alanı NULL olan kaç tedarikçim var? ( Supplier ) ( İnternetten bakılmalı )
select COUNT(*) from Suppliers where Region is null
--Null olmayanlar
select COUNT(*) from Suppliers where Region is not null
 
 
--İlk 5 tedarikçimi getir  
select top 5 * from Suppliers
 
--İlk 5 tedarikçimi getir. Sadece ID ve CompanyName yazsın
select top 5 SupplierID,CompanyName from Suppliers 
 
 
--CompanyName e göre ilk 5 tedarikçimi getir ve ekrana sadece isimlerini yaz 
select top 5 CompanyName from Suppliers order by CompanyName
 
--en ucuz 5 ürünü getir
select top 5 * from Products order by UnitPrice
 
--En ucuz 5 ürünün ortalama fiyatı nedir? 
select top 5 AVG(UnitPrice) from Products order by UnitPrice
 
 
--Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.
select 'TR ' + UPPER(ProductName) from Products
 
﻿--Ürünleri ada göre sırala
select * from Products order by ProductName
 
--Ürünleri ada göre tersten sırala
select * from Products order by ProductName desc
 
--Ürün adı, fiyatı ve kdv ekrana yazdır
select ProductName,UnitPrice, UnitPrice * 0.18 KDV from Products
 
--Fiyatı 20den küçük ürünlerin adının başına TR ekle
select 'TR-' + ProductName [Ürün Ad] from Products where UnitPrice < 20
 
--Ürünün adı içerisinde a harfi geçenler
select * from Products where ProductName like '%a%'
 
--Ürün adı a ile başlayanlar
select * from Products where ProductName like 'a%'
 
--Ürün adı a ile bitenler
select * from Products where ProductName like '%a'
 
select upper('çağatay')
 
--mevcut metni büyültür
select UPPER(ProductName) [ürün adı] from Products
 
--mevcut metni küçültür
select LOWER(ProductName) [ürün adı]  from Products
 
select SUM(UnitPrice) from Products
 
select AVG(UnitPrice) from Products