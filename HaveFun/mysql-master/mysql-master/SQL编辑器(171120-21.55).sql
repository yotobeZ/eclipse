
CREATE TRIGGER  `学生管理`.`TT4` before INSERT ON  `学生管理`.`出库表`
 FOR EACH ROW BEGIN
  DECLARE msg VARCHAR(200);
  UPDATE 库存表 SET 库存量=库存量-new.出库数量 WHERE 货物号=NEW.货物号 AND 库存量>=NEW.出库数量;  
   IF ROW_COUNT() <> 1 THEN  
        SELECT CONCAT(`货物名`, ' 库存不足.') INTO msg  FROM `货物信息表` WHERE 货物号=NEW.货物号;  
        SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = msg;  
    END IF;  
END;  
 //也就是说对于update语句，row_count() 默认返回的是实际被修改的行数；
//但是通过参数设置，也可以返回找到的行数(或者说匹配的行数，受影响的行数)，
//这样设置就能兼容于Oracle  ps/sql中 sql%rowcount 和 sql server 中的 @@RowCount。
 
 
CREATE TRIGGER  `学生管理`.`TT4` before INSERT ON  `学生管理`.`出库表`
 FOR EACH ROW BEGIN
  DECLARE msg VARCHAR(200);
  DECLARE msg1 VARCHAR(200);
  IF EXISTS(SELECT * FROM 库存表 WHERE 货物号=NEW.货物号) then
  UPDATE 库存表 SET 库存量=库存量-new.出库数量 WHERE 货物号=NEW.货物号 AND 库存量>=NEW.出库数量;  
   IF ROW_COUNT() <> 1 THEN  
        SELECT CONCAT(`货物名`, ' 库存不足.') INTO msg  FROM `货物信息表` WHERE 货物号=NEW.货物号;  
        SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = msg;  
    END IF; 
    else set msg1='商品不存在';  
        SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = msg1;  
        end if;
END;  


CREATE TRIGGER  `学生管理`.`TT5` before update ON  `学生管理`.`出库表`
 FOR EACH ROW BEGIN
  DECLARE msg VARCHAR(200);
  UPDATE 库存表 SET 库存量=库存量+old.出库数量-new.出库数量,更新日期=NOW() WHERE 货物号=new.货物号 and 库存量+old.出库数量>new.出库数量 ; 
   IF ROW_COUNT() <> 1 THEN  
        SELECT CONCAT(`货物名`, ' 库存不足.') INTO msg  FROM `货物信息表` WHERE 货物号=NEW.货物号;  
        SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = msg;  
    END IF;  
END;  
