create table student (
 sno    Char(9), 
 sname Char(10)   not null, 
 sbirthday Datetime, 
 ssex Char(2)  check(ssex in (‘男’,‘女’)), 
sclass Char(20), 
sremark Char(100), 
address Char(40), 
zipcode Char(6), 
phone Char(15), 
email Char(40),    
 primary key(sno)   ); 


create table course (
cno  Char(6), 
cname Char(20), 
cpno Char(6), 
ctime Numeric(2), 
credit Numeric(2),          
Primary key (cno) ,       
Foreign key (cpno) references course(cno)
 );
 
 
 create table score (
 sno Char(9), 
 cno   Char(6), 
 score    Numeric(3),     
 Primary key (sno, cno),           
 Foreign key (sno) references student(sno),          
 Foreign key (cno) references course(cno)
 );
 
 create table teacher (
 tno char(7), 
 tname char(10), 
 tsex char(2) check(tsex in (‘男’,‘女’)), 
 tbirthday datetime, 
 position char(12), 
 department char(16), 
 tamount Numeric(7,2) , 
 experience char(200),
 Primary key (tno) );
 
create table teaching (
tno char(7), 
cno Char(6), 
tdate datetime, 
classroom char(10), 
sclass char(20),         
Primary key (tno, cno)  ,         
Foreign key (tno) references teacher(tno),           
Foreign key (cno)  references course(cno)
);