56.
create view info_student2 as select * from student where sclass="信管系 0101" 
with check option;
57.
create view info_C001_student1 as select student.sno,student.sname from info_student2,student,score
where student.sno=info_student2.sno and student.sno=score.sno and cno="c001";
58.
create view info_c001_student2 as select score.sno,sname from info_C001_student1,score
where info_C001_student1.sno=score.sno and score>90;
//执行此语句结果是，“信管系 0101”班选修了“C001”课程且此学生任意一门成绩在 90 分以上
create view info_c001_student2 as select score.sno,sname from info_C001_student1,score
where info_C001_student1.sno=score.sno and cno="c001" and score>89;
//执行此语句结果是，“信管系 0101”班选修了“C001”课程且此学生c001课程的成绩在 90 分以上
59.
create view vbirthday_student(sno,sname,sage) as select sno,sname,year(curdate())-year(sbirthday)
from student;
60.
create view vfemale_student as select * from student where ssex="女";
61.
create view vaverage_student(sno,avscore) as select sno,avg(score) from score group by sno; 
62.
drop view info_student1;
create view info_student1 as select * from student where sclass="信管系 0101";
63.
select info_student2.sno,info_student2.sname,sage from vbirthday_student,info_student2 
where info_student2.sno=vbirthday_student.sno and sage<27;
64.
select sno,sname from info_C001_student1;
65.
update info_student2 set sname="潘长江" where sno="011111103";
66.
insert into info_student1(sno,sname,ssex,sbirthday) values('011111136','张艺谋','男','1987.11.9');
//执行上面这条语句，只会在student表中插入数据，视图不会有变化
insert into info_student1(sno,sname,ssex,sbirthday,sclass) 
values('011111137','张艺谋','男','1987.11.9','信管系 0101');
//此条语句加入班级，且符合视图定义条件，可以插入到视图中
67.
delete from info_student1 where sno='011111135';
//删除视图中的记录后，表中的记录也相应删除

1.
create table table1(
F1 char(40),
F2 int);

create table table2(
F1 char(40),
F2 int);














