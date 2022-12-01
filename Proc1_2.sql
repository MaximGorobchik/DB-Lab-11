use LAB10
go
create proc proc_sql_10
as
update SubjectSuccess
set Rating = 4
where (select count(Ss.Rating) from SubjectSuccess as Ss where SubjectSuccess.StudID = Ss.StudID and Ss.Rating = 2 group by StudID having count(Ss.Rating) < 3)

--exec proc_sql_10
--drop proc proc_sql_10