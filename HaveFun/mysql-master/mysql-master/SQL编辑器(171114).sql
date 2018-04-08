(查询某个学号全部成绩)
select score from score where sno="011110101";
35.
select sno,score from score where  cno="C001"
order by score desc;
36.
select * from student order by (year(curdate())-year(sbirthday)) desc,sclass asc;
37.
select count(*) from student;
38.
select count(distinct sno) from score;
39.
select max(score) from score where cno="c001";
40.
select sno,score from score where score=(select max(score) from score);
41.
select cno,count(distinct sno) from score group by cno;
42.
select score.sno,sname from score,student where score.sno=student.sno and sclass="电商系 0102"
group by sno having count(distinct cno)>2;
43.
select first.cno,second.cpno from course first,course second where first.cpno=second.cno;
44.
select sname,score from score,student where student.sno=score.sno 
and score.cno="c001" and score>90;
45.
select sname,cname,score from score,student,course where score.sno=student.sno 
and course.cno=score.cno;
46.
select sname from student where not exists (select * from course where not exists
(select * from score where student.sno=score.sno and course.cno=score.cno)); 
47.
select sname from student where not exists(select * from course where credit="4" and 
not exists (select * from score where student.sno=score.sno and course.cno=score.cno));
48.
select sno from score where cno="c005" and score>(select max(score) from score where cno="c003")
order by sno desc;
49.
select distinct score.sno,sname from score,student where score.sno in(select score.sno from score 
where score.cno="c001" or score.cno="c007")and score.sno=student.sno;
50.
select distinct a.sno,sname from student,(select score.sno from score where score.cno="c001") a,
(select score.sno from score where score.cno="c007") b where a.sno=b.sno and a.sno=student.sno;  
51.
select sname from student where sclass="会计系 0102" or (year(curdate())-year(sbirthday))<=27;
52.
select student.sno,sname,ssex,(year(curdate())-year(sbirthday)) as 年龄 from student,score,course 
where score.sno=student.sno and course.cno=score.cno and course.cname="数据库原理";
53.
select sname from student where sclass not like"信管系 0101" and (year(curdate())-year(sbirthday))
<(select min((year(curdate())-year(sbirthday))) from student where sclass="信管系 0101");
//查询结果为按年计算年龄，没有考虑同年不同月份的差别
select sname from student where sclass not like"信管系 0101" and ((from_days(datediff(now(),sbirthday))))
<(select min((from_days(datediff(now(),sbirthday)))) from student where sclass="信管系 0101");
//考虑同年不同月份差别的计算结果
54.
select sno,sname,ssex,(year(curdate())-year(sbirthday)) as 年纪 from student where sclass 
in (select sclass from student where sname="齐振国");
55.
create view info_student1 as select * from student where sclass="信管系 0101";
56.
create view info_student2 as select * from student where sclass="信管系 0101" with check option;


























