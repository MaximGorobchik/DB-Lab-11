use LAB10
go
create proc proc_sql_8
As
insert into Student (StudID, GroupID, FirstName, LastName, DateOfBirth)
values(6,3,'Новичок','Новичков', '2003-07-07')
insert into SubjectSuccess (StudID, PredmetID, Rating)
values(6,3,5)

--exec proc_sql_8
--drop proc proc_sql_8