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
print 'Ïîìèëêà. Ïåðåâèùåí³ ãîäèíè äëÿ âèêëàäà÷³â'
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
print 'Ïîìèëêà. Ïåðåâèùåí³ ãîäèíè äëÿ ñòóäåíò³â'
end
end
