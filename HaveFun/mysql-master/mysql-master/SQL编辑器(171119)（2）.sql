2.
//在 Table1 上建立 Insert 触发器 T1 
CREATE TRIGGER  T1 AFTER INSERT  ON  table1 
for each row
BEGIN
   SET @F1=new.F1;
   SET @F2=new.F2;
   SET @T_F1=new.F1 ;
      IF (@F2=1) THEN
      SET @F2=0 ;
      WHILE  LENGTH(RTRIM(@F1))>0  DO
          SET @F2=@F2+CAST(LEFT(RTRIM(@F1),1) AS SIGNED) ;
          SET @F1=RIGHT(RTRIM(@F1),LENGTH(RTRIM(@F1))-1);
      END WHILE;
    ELSE
       SET @F2=CEILING(LENGTH(TRIM(@F1))/2.0);
   END IF;
   INSERT INTO Table2(F1,F2) VALUES(@T_F1,@F2);
END;
// 在 Table2 上建立删除触发器 T2
CREATE TRIGGER  T2 AFTER delete  ON  table2 
for each row
BEGIN
   SET @F1=old.F1;
   SET @T_F2=old.F2;
SELECT F2 INTO @F2 FROM table1 WHERE F1=@F1;
  IF @F2=1 THEN
      UPDATE Table1 
   SET F1=CONCAT(TRIM(F1),TRIM(CAST(@T_F2 AS CHAR(10))),RIGHT(TRIM(CAST(@T_F2 AS CHAR(10))),1)) 
      WHERE F1=@F1 ;
   END IF;
  IF @F2=2 THEN
     UPDATE Table1 
       SET F1=CONCAT(TRIM(F1),LTRIM(CAST(@T_F2 AS CHAR(40))),LTRIM(CAST(ASCII(SUBSTRING(LTRIM(F1),1,3)) AS CHAR(40) ) )) 
       WHERE F1=@F1;
  END IF;
  IF  @F2=3 THEN
    UPDATE Table1 
      SET F1=CONCAT(TRIM(F1),LTRIM(CAST(@T_F2 AS CHAR(40))),RTRIM(LTRIM(CHAR(64+@T_F2))))
      WHERE F1=@F1 ;
  END IF;
  IF @F2=4 THEN
       UPDATE Table1 
       SET F1=CONCAT(TRIM(F1),LTRIM(CAST(@T_F2 AS CHAR(40))),RTRIM(LTRIM(CONNECTION_ID())))
       WHERE F1=@F1 ;
  END IF;  
END;
3.
CREATE  PROCEDURE  Exam_Proc(IN Student_ID CHAR(20), IN Student_Name CHAR(20), OUT Exam_Str CHAR(100))
BEGIN
       DECLARE CF1 CHAR(255);
       DECLARE done INT DEFAULT FALSE;  
        DECLARE  cur CURSOR FOR SELECT F1 FROM Table1;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;  
  IF LENGTH(TRIM(Student_ID))<>10 THEN
       SET Exam_Str = ' 学号 长度不对 ';
  ELSE
       DELETE FROM Table2;
       DELETE FROM Table1;
       INSERT INTO Table1(F1,F2) VALUES(RIGHT(Student_ID,6),1);
       INSERT INTO Table1(F1,F2) VALUES(TRIM(Student_Name),2);
       INSERT INTO Table1(F1,F2) VALUES(TRIM(SUBSTRING_INDEX(USER(),'@',-1)),3);
       INSERT INTO Table1(F1,F2) VALUES(TRIM(CONCAT(VERSION(),'MySQL')),4);
      DELETE FROM table2;
      SET Exam_Str = '';

      OPEN cur;
      FETCH cur INTO CF1;
      WHILE ( NOT done ) DO
         SET  Exam_Str = CONCAT(TRIM(Exam_Str),TRIM(CF1));
         FETCH cur INTO CF1;
      END WHILE;
      CLOSE  cur; 
      
   END IF;
END;

USE mysql;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY 'root' WITH GRANT OPTION;
FLUSH PRIVILEGES;

5.1
//建表
create table 货物信息表 (
 货物号    Char(4)  , 
 货物名   Char(20),
 规格        Char(20),
 型号 Char(20),
 说明 Char(20),
 primary key(货物号) 
 ); 
 
 create table 库存表 (
 货物号     Char(4),
 更新日期  DateTime,
 库存量    Numeric(9,2),
 primary key(货物号)   );
 
 create table 入库表 (
入库时间 DateTime,
货物号 Char(4),
入库数量 Numeric(9,2),
经办人 Char(10) ,
primary key(货物号,入库时间),
foreign key(货物号)references 货物信息表(货物号)  );

create table 出库表 (
出库时间 DateTime,
货物号 Char(4),
出库数量 Numeric(9,2),
经办人 Char(10) ,
primary key(货物号,出库时间),
foreign key(货物号)references 货物信息表(货物号) );
insert into 入库表(入库时间,货物号,入库数量)
values("2015-6-15","0001","50");
insert into 入库表(入库时间,货物号,入库数量)
values("2015-6-11","0004","20");
5.2
//触发器
// 入库表的Insert触发器
CREATE TRIGGER  `学生管理`.`TT1` AFTER INSERT ON  `学生管理`.`入库表`
 FOR EACH ROW BEGIN
  set @hwh=new.货物号;
  set @rusj=NOW();
  set @rksl=new.入库数量;
  IF EXISTS(SELECT * FROM 库存表 WHERE 货物号=@hwh) then
    UPDATE 库存表 SET 库存量=库存量+@rksl,更新日期=@rusj WHERE 货物号=@hwh;
  ELSE
     INSERT INTO 库存表 VALUES(@hwh,@rusj,@rksl); 
END if;
end;

//入库表的update触发器
CREATE TRIGGER  `学生管理`.`TT2` AFTER update ON  `学生管理`.`入库表`
 FOR EACH ROW BEGIN
  set @hwh=new.货物号;
  set @rusj=NOW();
  set @rksl1=old.入库数量;
  set @rksl2=new.入库数量;
  UPDATE 库存表 SET 库存量=库存量-@rksl1+@rksl2,更新日期=@rusj WHERE 货物号=@hwh ; 
    END;

//入库表的Delete触发器
CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    TRIGGER `学生管理`.`TT3` AFTER DELETE
    ON `学生管理`.`入库表`
    FOR EACH ROW BEGIN
      SET  @hwh=old.货物号;
      SET  @ruSJ=NOW();
      SET  @rksl=old.入库数量  ;
      UPDATE 库存表 SET 库存量=库存量-@rksl,更新日期=@rusj WHERE 货物号=@hwh ; 
    END;

//出库表的Insert触发器
CREATE TRIGGER  `学生管理`.`TT4` AFTER INSERT ON  `学生管理`.`出库表`
 FOR EACH ROW BEGIN
  set @hwh=new.货物号;
  set @rusj=NOW();
  set @rksl=new.出库数量;
  UPDATE 库存表 SET 库存量=库存量-@rksl,更新日期=@rusj WHERE 货物号=@hwh;
end;

//出库表的update触发器
CREATE TRIGGER  `学生管理`.`TT5` AFTER update ON  `学生管理`.`出库表`
 FOR EACH ROW BEGIN
  set @hwh=new.货物号;
  set @rusj=NOW();
  set @rksl1=old.出库数量;
  set @rksl2=new.出库数量;
  UPDATE 库存表 SET 库存量=库存量+@rksl1-@rksl2,更新日期=@rusj WHERE 货物号=@hwh ; 
END;
    
//出库表的Delete触发器
CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    TRIGGER `学生管理`.`TT6` AFTER DELETE
    ON `学生管理`.`出库表`
    FOR EACH ROW BEGIN
      SET  @hwh=old.货物号;
      SET  @ruSJ=NOW();
      SET  @rksl=old.出库数量  ;
      UPDATE 库存表 SET 库存量=库存量+@rksl,更新日期=@rusj WHERE 货物号=@hwh ; 
    END;







