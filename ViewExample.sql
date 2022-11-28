use Northwind

--Create View

--The query that gives how many units an order was sold by which employee, to which customer, in which category of product, at what price.
Create view SalesReport
as
select o.OrderID,p.ProductName,e.FirstName+' '+e.LastName as 'FullName',c.CompanyName,ct.CategoryName,od.UnitPrice as 'Birim Fiyat', od.Quantity,sum(od.Quantity*od.UnitPrice-(1-od.Discount)) as 'Sipari� Fiyat' from Orders o
	join Employees e on e.EmployeeID=o.EmployeeID
		join [Order Details] od on od.OrderID=o.OrderID
			join Products p on p.ProductID=od.ProductID
				join Categories ct on ct.CategoryID=p.CategoryID
					join Customers c on c.CustomerID=o.CustomerID
						group by o.OrderID,p.ProductName,e.FirstName,e.LastName,c.CompanyName,ct.CategoryName,od.UnitPrice,od.Quantity


select * from SalesReport where [Birim Fiyat] > 100 order by [Birim Fiyat] asc --Query in View

--The view that gives the categories as ID and name
Create view Kategoriler
as
select CategoryID,CategoryName from Categories 

select * from Kategoriler

--Update View

alter view Kategoriler
as
select CategoryID,CategoryName,Description from Categories

--Delete View
drop view Kategoriler

--View insert and Update

create view Calisanlar --The view that gives the id, name, surname, title and city of the employees
as
select EmployeeID,FirstName,LastName,Title,City from Employees

select * from Calisanlar

insert Calisanlar values ('Enes','Serenli','IT Representative','�stanbul') --If you want, you can enter information to the views.
insert Calisanlar values ('Onur','Do�ru','FrontEnd Developer','Ankara')

update Calisanlar set Title='Developer' where FirstName='Enes' and LastName ='Serenli' --You can update the information in the View.

alter view Calisanlar
as
select EmployeeID,FirstName,LastName,Title,City from Employees where City = '�stanbul' --List of employees living in Istanbul


--With chech option

alter view Calisanlar
as
select EmployeeID,FirstName,LastName,Title,City from Employees where City = '�stanbul' 
with check option --performs the insertion operation according to the specified rule.

insert Calisanlar values ('Enesovic','Serenli','FullStack Developer','Bursa') --Adding is not possible. Bursa does not follow the rule.

--View Encryption
alter view Calisanlar
with encryption --If we do not want the codes that make up the view to be seen by others, we can encrypt the views with encryption.
as
select EmployeeID,FirstName,LastName,Title,City from Employees where City = '�stanbul' 
with check option

--Note => If we want to remove encryption, we need to update the view and delete the with encryption part.
