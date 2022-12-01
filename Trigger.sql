use LAB10
go
create trigger trigger5_teachers
on Learn after insert
as
if @@ROWCOUNT = 1
begin
if exists(select TeacherName from Learn group by TeacherName having sum(HoursCount) > 500)
begin
rollback tran
print 'Помилка. Перевищені години для викладачів'
--exec proc3 6,'Софія', 150
end
end

go

create trigger trigger5_students
on SubjectSuccess after insert
as
if @@ROWCOUNT > 0
begin
if exists(select Student.FirstName, Student.LastName, sum(HoursCount) from Learn, SubjectSuccess, Student where Student.StudID = SubjectSuccess.StudID and SubjectSuccess.PredmetID = Learn.PredmetID
group by Student.FirstName, Student.LastName having sum(HoursCount) > 1000)
begin
rollback tran
print 'Помилка. Перевищені години для студентів'
--exec proc3 6,'Софія', 150
end
end

--drop trigger trigger5_teachers
--drop trigger trigger5_students