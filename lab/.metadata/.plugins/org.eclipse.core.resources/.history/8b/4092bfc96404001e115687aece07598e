create or replace procedure CountSelected(
sStudentId in varchar2,
nYear in number,
nSemester in number,
nTotalUnit OUT number,
nTotalCourse OUT number
)

is
v_course course%ROWTYPE;

cursor cur
is
select c.c_id, c.c_id_no, c.c_unit
from enroll e, course c, teach t
where e.s_id = sStudentId and e.e_year = nYear
and e.e_semester = nSemester and
e.t_id = t.t_id and
t.c_id = c.c_id and t.c_id_no = c.c_id_no;

begin
nTotalUnit := 0;
nTotalCourse := 0;

open cur;
loop
fetch cur into v_course.c_id, v_course.c_id_no, v_course.c_unit ;
exit when cur%notfound;
nTotalUnit := nTotalUnit + v_course.c_unit;
nTotalCourse := nTotalCourse + 1;
end loop;
close cur;
end;
/