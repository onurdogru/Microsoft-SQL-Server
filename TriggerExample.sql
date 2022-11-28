--After insert Order
CREATE Trigger trg_GetInsertedOrder on [Order Details]  -- CREATED Trigger
      After insert 
      As 
Begin
      Declare  @quantity Int, @productId int;   --you defined parameter and type
	  select @quantity=Quantity, @productId=ProductID from inserted
	  Update Products
	   Set UnitsInStock=UnitsInStock- @quantity
	   where ProductID=@productId
End 

Insert into [Order Details] (OrderId,ProductID,UnitPrice,Quantity) values (11079,4,22,3)    

select ProductID,ProductName,UnitsInStock from Products where ProductID=1

--After Delete Order
CREATE Trigger trg_GetStockBack on [Order Details]
     after delete 
      as 
begin
Declare  @quantity Int, @productId int;
	  select @quantity=Quantity, @productId=ProductID from deleted
	  Update Products
	   Set UnitsInStock=UnitsInStock+@quantity
	   where ProductID=@productId
end                        


Delete from [Order Details] where OrderID=11079 and Quantity=3
	
select ProductID,ProductName,UnitsInStock from Products where ProductID=4

--After Update Order
create trigger trg_StockUpdate on [Order Details]
after update
as 
  begin 
        declare @oldquantity smallint, @newquatity smallint, @productId int;
        select @oldquantity=Quantity,@productId=ProductID from deleted 
        select @newquatity=Quantity from inserted

        update Products
         set UnitsInStock+= @oldquantity-@newquatity
        where ProductID=@productId
   end



update [Order Details] set Quantity=7 where OrderID=11079 and ProductID=4

select ProductID,ProductName,UnitsInStock from Products where ProductID=4

select * from [Order Details] where OrderID = 11079


--Delete Trigger

   drop trigger trg_StockUpdate