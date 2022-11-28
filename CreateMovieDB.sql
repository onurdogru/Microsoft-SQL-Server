--Database
Create Database MovieDataDB
go
use MovieDataDB
go

--Table
Create table Directors(
Id int not null primary key identity (1,1),
FullName nvarchar(150) not null
)

Create table Movies(
MovieID int not null primary key identity(1,1),
MovieName nvarchar(255) not null,
Description nvarchar(1000) not null,
Duration smallint,
Year int,
DirectorId int foreign key references Directors(Id)
)

Create table Genres(
GenreID int not null primary key identity(1,1),
Name nvarchar(30) not null
)

Create table MovieGenres(
Movie_Id int not null foreign key references Movies(MovieID),
Genre_Id int not null foreign key references Genres(GenreID)
)


Create table Users (
UserID int not null primary key identity(1,1),
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
UserName nvarchar(100) not null,
Password nvarchar(8) not null,
Email nvarchar(255) not null,
)

Create table Comments(
Id int not null primary key identity(1,1),
Body nvarchar(Max),
CreatedDate datetime default getdate(),
UserId int not null foreign key references Users(UserID),
MovieId int not null foreign key references Movies(MovieID)
)

--Alter

Alter table Users
add PhoneNumber char(11) --Add cloumn

Alter table Users
add Address nvarchar(500) -- add column

Alter table Movies
add Rating smallint -- add column

--Drop
Create table TestTable(ID int primary key)

drop table TestTable --drop table

--Drop cloumn
Alter table Users
drop column Address

--Drop Database

--Use master
-- drop database MovieDB


