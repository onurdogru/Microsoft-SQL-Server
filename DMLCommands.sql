use MovieDataDB

--Directors Table
--insert I
insert into Directors(FullName) values ('James Gunn')

--insert II
insert Directors values ('Ridley Scott')
insert Directors values ('M. Night')
insert Directors values ('Christophe Lourdelet')
insert Directors values ('David Ayer')
insert Directors values ('Yimou Zhang')
insert Directors values ('Damien Chazelle')
insert Directors values ('Sean Foley')
insert Directors values ('James Gray')
insert Directors values ('Morten Tyldum')
insert Directors values ('Christopher Nolan')

--Genres Table
insert Genres values ('Action')
insert Genres values ('Adventure')
insert Genres values ('Sci-Fi')
insert Genres values ('Mystery')

--Movies Table

insert into Movies (MovieName,Description,Year,Duration,DirectorId) values ('Guardians of the Galaxy','A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe.',2014,121,1)

insert Movies values ('Prometheus','Following clues to the origin of mankind, a team finds a structure on a distant moon, but they soon realize they are not alone.',2012,124,2,null)


insert Movies values ('Robin Hood','In 12th century England, Robin and his band of marauders confront corruption in a local village and lead an uprising against the crown that will forever alter the balance of world power.',2010,140,2,67)
insert Movies values ('A Good Year','A British investment broker inherits his uncles chateau and vineyard in Provence, where he spent much of his childhood. He discovers a new laid-back lifestyle as he tries to renovate the estate to be sold.',2006,117,2,69)


--MovieGenres table
insert MovieGenres values(1,1)
insert MovieGenres values(1,2)
insert MovieGenres values(1,3)

--Users Table

insert Users values ('Groovy','Primat','CreastFall','12345678','gp@hotmail.com','05374425178')
insert Users values ('Kensei','Mugurama','hcitdox','12345678','bombs@hotmail.com',null)

--Comments Table

insert Comments values ('Harika bir film',null,1,17)
insert Comments values ('Kesinlikle izlenmeli!!',getdate(),1,21)

--Update

Update Movies set Rating=81 where MovieID=1
Update Users set UserName='Faker' where UserID=2

--Delete
Delete from Directors where Id=11

--Delete from Directors where FullName='Christopher Nolan'