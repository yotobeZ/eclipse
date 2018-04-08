1.
insert into student(Sno,sname, Sbirthday, Sclass )
values('011110101','章海潮','1982.02.07','信管系 0101'); 
insert into student(Sno,sname, Sbirthday, Sclass )
values('011111103','王天力', '1982.03.04', '电商系 0101' );
insert into student(Sno,sname, Sbirthday, Sclass ) 
values('011111204',' 董丞悟 ','1982.06.06',' 电商系 0102'  ); 
insert into student(Sno,sname, Sbirthday, Sclass ) 
values('011112110', '马丽鹃', '1982.04.03', '工商系 0101' ); 
insert into student(Sno,sname, Sbirthday, Sclass ) 
values('011113104', '杨乾坤', '1982.03.23', '会计系 0101' ); 
insert into student(Sno,sname, Sbirthday, Sclass ) 
values('011113221', '刘抗齐', '1983.01.16', '会计系 0102'  ); 
insert into student(Sno,sname, Sbirthday, Sclass ) 
values('011114111', '丘海棠', '1983.02.08', '旅游系 0101'); 
insert into student(Sno,sname, Sbirthday, Sclass ) 
values('011115208', '齐振国', '1982.07.22', '旅游系 0102' ); 
insert into student(Sno,sname, Sbirthday, Sclass ) 
values('011115209', '李晓', '1985.08.12', '旅游系 0102' ); 
insert into student(Sno,sname, Sbirthday, Sclass ) 
values('001011101', '王晓悦', '1982.01.12', '材料系 0001'); 
insert into student(Sno,sname, Sbirthday, Sclass ) 
values('001011212', '程伊莲', '1982.03.21', '材料系 0002' ); 

insert into course(Cno ,Cname, Credit, Ctime  ) 
values('C001', '数据库原理',  '4', '64'  ); 
insert into course(Cno ,Cname, Credit, Ctime  ) 
values('C002', '高等数学',  '4', '72' ); 
insert into course(Cno ,Cname, Credit, Ctime  ) 
values('C006', '计算机文化基础',  '2', '32' ); 
insert into course(Cno ,Cname, Credit, Ctime  ) 
values('C008', '管理学_原理与方法' , '2', '32'  ); 
delete from course where cno='C001';
insert into course(Cno ,Cname,cpno, Credit, Ctime  ) 
values('C004', '操作系统', 'C006', '3', '32' ); 
insert into course(Cno ,Cname,cpno, Credit, Ctime  ) 
values('C007', 'C 语言程序设计', 'C006', '3', '32'); 
insert into course(Cno ,Cname,cpno, Credit, Ctime  ) 
values('C005', '数据结构', 'C007', '4', '32' ); 
insert into course(Cno ,Cname,cpno, Credit, Ctime  ) 
values('C001', '数据库原理', 'C005', '4', '64'  ); 
insert into course(Cno ,Cname,cpno, Credit, Ctime  ) 
values('C003', '管理信息系统', 'C001', '4', '54'  ); 


insert into score(Sno, Cno,Score )
values('011110101' ,'C001', '90'  );
insert into score(Sno, Cno,Score )
values('011111103', 'C001', '85' );
insert into score(Sno, Cno,Score )
values('011111204', 'C001', '73'  );
insert into score(Sno, Cno,Score )
values('011112110', 'C001', '98 '  );
insert into score(Sno, Cno,Score )
values('011113104' ,'C001' ,'96'  );
insert into score(Sno, Cno,Score )
values('011113221', 'C001', '97 '  );
insert into score(Sno, Cno,Score )
values('011114111', 'C001' ,'83'  );
insert into score(Sno, Cno,Score )
values('011115208', 'C001', '85 '  );
insert into score(Sno, Cno)
values('011113221', 'C006' );
insert into score(Sno, Cno,Score )
values('011110101', 'C007', '92'  );
insert into score(Sno, Cno,Score )
values('011111103', 'C007', '97 '  );


insert into teacher(Tno, Tname, Tsex ,Department ,tbirthday )
values('T001', '江承基', '男', '信息管理系','1964.03.21' );

insert into teacher(Tno, Tname, Tsex ,Department ,tbirthday )
values('T002', '梁其征', '男', '信息管理系', '1973.12.12' );

insert into teacher(Tno, Tname, Tsex ,Department ,tbirthday )
values('T003', '徐茉莉', '女', '信息管理系', '1980.02.16 ' );
insert into teacher(Tno, Tname, Tsex ,Department ,tbirthday )
values('T004', '吴雅云', '女', '信息管理系', '1970.03.18 ' );
insert into teacher(Tno, Tname, Tsex ,Department ,tbirthday )
values('T005', '杨运铎', '男', '电子商务系', '1973.10.01 ' );
insert into teacher(Tno, Tname, Tsex ,Department ,tbirthday )
values('T006', '张昌盛', '男', '电子商务系', '1976.07.03 ' );
insert into teacher(Tno, Tname, Tsex ,Department ,tbirthday )
values('T007', '程力衡', '男', '电子商务系', '1958.10.03 ' );

insert into teaching(Tno, cno, tdate ,classroom, sclass )
values('T001', 'C005', '2012-01-09', '西二 405', '信管系 0101'); 
insert into teaching(Tno, cno, tdate ,classroom, sclass )
values('T001', 'C002', '2013-04-10' ,'主 401', '会计系 0102'); 

insert into teaching(Tno, cno, tdate ,classroom, sclass )
values('T002', 'C007', '2012-02-01', '西二 406','电商系 0101 '); 

insert into teaching(Tno, cno, tdate ,classroom, sclass )
values('T003', 'C001', '2012-09-10', '西二 504', '电商系 0102  ');

insert into teaching(Tno, cno, tdate ,classroom, sclass )
values('T004', 'C006', '2013-07-15', '主 401', '工商系 0101 ');
insert into teaching(Tno, cno, tdate ,classroom, sclass )
values('T005','C004','2013-11-12', '主 402', '会计系 0101  ');

insert into teaching(Tno, cno, tdate ,classroom, sclass )
values('T006', 'C002', '2013-05-21', '西二 506','会计系 0102 ');

2.
select * from student;
3.
select sno,sname from student;
4.
select sno,sname,sclass from student  group by sclass;
5.
select sname,year(sbirthday) from student;
6.
select sname,year(curdate())-year(sbirthday)  as '年龄' from student;
7.
select sname from student where sclass like '信管系 0101';
8.
select sname,year(curdate())-year(sbirthday)  as '年龄' 
from student  where year(curdate())-year(sbirthday)<27;
9.
select sno from score where score<60;
10.
select sname,cno from student,score where student.sno=score.sno and score is null;
11.
select sname,sclass,year(curdate())-year(sbirthday)  as '年龄' from student 
where year(curdate())-year(sbirthday) between 15 and 28;
12.
select sname,sclass,year(curdate())-year(sbirthday)  as '年龄' from student 
where year(curdate())-year(sbirthday) not between 15 and 28;
13.
select sname,sbirthday,sclass from student
where sclass  in('信管系 0101','电商系 0102');
14.
select sname,sbirthday,sclass from student
where sclass not in('信管系 0101','电商系 0102');
15.
select * from student where sno='011113104';
16.
select * from student where sno like'0111%';
17.
select sno,sname,ssex,year(curdate())-year(sbirthday)  as '年龄' from student
where sname like '张%';
18.
select sno,sname,ssex,year(curdate())-year(sbirthday) as '年龄' from student
where sname like '_海%';
19.
select sno,sname,ssex,year(curdate())-year(sbirthday)  as '年龄' from student
where sname not like '刘%';
20.
select sname,sclass from student where sname like '%齐%';
21.
select distinct sno from score;
22.
select cno,cname from course where cno like'c%05';
23.
select cno,cname from course where cname like '%/_%'escape'/';
24.
select sno,cno from score where score is not null;
25.
select sno,min(score) as '最低分',max(score) as '最高分',avg(score) as '平均分' 
from score group by sno having min(score)>=60;
26.
create table average(
cno char(6),
caverage numeric(3),
primary key(cno)   );
insert into average
select cno,avg(score) as '课程平均成绩' from score group by cno having avg(score) is not null;
27.
update student set sbirthday='1982.8.20' where sname='马丽鹃';
28.
update student set zipcode='230009';
29.
update average set caverage=0;
30.
delete from average where cno='c007';
31.
delete from average;
32.
create table tstudent(
 sno    Char(9), 
 sname Char(10)   not null,    
 primary key(sno)   ); 
 insert into tstudent select sno,sname from student;
delete from tstudent where sno like'001011%';
33.
select sno,sname from student where sclass='电商系0101' and year(curdate())-year(sbirthday)<27;
34.
select sno,score from score  group by sno having  min(score)>60 and max(score)<90;



























