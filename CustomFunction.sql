Create Function KDVhesapla(@fiyat money)
 returns money  
 begin
 return @fiyat*1.08
  end

	go

select ProductName,CategoryName,UnitPrice, 
	  dbo.KDVHesapla( UnitPrice) as [KDV] 
from Products P
join Categories C on p.CategoryID=c.CategoryID
order by 4 asc

Create function EmployeeInformation(@employeeId int)
returns table
return select * from Employees Where EmployeeID = @employeeId

select * from dbo.EmployeeInformation(1)


create function OrderQuantity(@started int , @finished int )
returns table 
return select * from [Order Details] where Quantity between @started and  @finished

select * from OrderQuantity(10,15)

 -- Update Function
Alter  function OrderQuantity(@started smallint , @finished smallint )
returns table 
return select * from [Order Details] where Quantity between @started and  @finished
select * from dbo.OrderQuantity(10,20)

--Delete Function

drop function OrderQuantity

