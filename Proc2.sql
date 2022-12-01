use LAB10
go
create proc proc2
as
select top(5) Student.LastName, Student.FirstName, Student.GroupID, SubjectSuccess.PredmetID, Learn.TeacherName
from Student,SubjectSuccess,Learn
Where SubjectSuccess.PredmetID = Learn.PredmetID and SubjectSuccess.StudID = Student.StudID
order by SubjectSuccess.Rating desc

--exec proc2
--drop proc proc2