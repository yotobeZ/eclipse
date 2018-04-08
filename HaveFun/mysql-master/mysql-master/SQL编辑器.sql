select 物资编号,发出数量,发出金额,count(*),sum(发出金额)
from 出库单明细,出库单
where 出库单.出库单号=出库单明细.出库单号
and 出库单.领料单位代码 like '014%';

select 物资编号,发出数量,发出金额
from 出库单明细
where 出库单号 in(
select 出库单号
from 出库单
where 领料单位代码 like'014%');

select 物资编号，发出数量，发出金额
from 出库单明细；
where 出库单.出库单号=出库单明细.出库单号
and 出库单.领料单位代码 like '014%';

select productname
from commodity;

select 出库单.出库单号,日期,序号
from 出库单,出库单明细
where 出库单.出库单号=出库单明细.出库单号;