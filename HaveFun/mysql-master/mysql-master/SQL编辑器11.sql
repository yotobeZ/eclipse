
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
Primary key (cno),           
Foreign key (cpno)//此句此时执行错误，因为还无cpno为主码
 );

//Numeric(7，2) 长度为7，小数为2位  7和2之间除了逗号不能有空格，不然会有语法错误
