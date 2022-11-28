use MovieDataDB

--Create Sp
Create Procedure sp_GetUserList
    as 
Begin 
   select FirstName+' '+ LastName as [fullname]  
from Users
end;

execute sp_GetUserList  


create procedure sp_moviebycategory @id int  --You can give parameters to storage procedures.
     as
   begin
     select m.MovieName,
            g.Name
      from Movies m 
      join MovieGenres mg on m.MovieID=mg.Movie_Id
	  join Genres g on g.GenreID=mg.Genre_Id
where g.GenreID = @id
end

 execute sp_moviebycategory @id=8

 
  create procedure sp_search @moviename nvarchar(20)
  as 
  begin
  select MovieName, Description from Movies 
  where  MovieName=@moviename
  end 

  execute sp_search 'Suicide Squad'


  --Update Sp
 alter procedure sp_search @moviename nvarchar(50)
  as 
  begin
  select MovieName, Description,Rating from Movies 
  where  MovieName=@moviename
  end 

  execute sp_search 'Suicide Squad'

  --Delete Sp
  drop procedure sp_search