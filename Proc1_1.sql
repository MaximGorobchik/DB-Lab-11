use LAB10
go
create proc proc_sql_9
as
delete	from SubjectSuccess
where StudID in (select StudID from SubjectSuccess where Rating = 2 group by StudID having count(Rating) >= 3)

--exec proc_sql_9
--drop proc proc_sql_9