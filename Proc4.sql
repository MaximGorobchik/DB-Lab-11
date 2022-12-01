use LAB10
go
create proc proc4
@teacher nvarchar(50),
@hours int
as
update Learn
set HoursCount = @hours
where TeacherName = @teacher

--exec proc4 'Марія', 150
--drop proc proc4