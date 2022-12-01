use LAB10
go
create proc proc3
@predmet int,
@teacher nvarchar(50),
@hours int
as
insert into Learn(PredmetID,TeacherName,HoursCount)
values (@predmet,@teacher,@hours)

--exec proc3 6,'Софія', 150
--drop proc proc3