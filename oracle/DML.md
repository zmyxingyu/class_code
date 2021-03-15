
### 基本查询


```
SELECT <目标列表达式> 
FROM <表名>
[WHERE <条件表达式>]
[GROUP BY <列名1>[HAVING<条件表达式>]]
[ORDER BY <列名2>[ASC|DESC]]；

```
条件表达式
条件 | 谓词
---|---
比较 | =,>,<,!=
范围| BETWEEN AND，NOT BETWEEN AND
确定集合| IN,NTO IN
字符匹配| like ,mot like
空值|is null,is not null
多重条件| and,or ,not



```



select dept 系 from TB_S;

--去重复
select DISTINCT dept 系 from TB_S;

-- 排序
select * from TB_S ORDER BY sno DESC;

--where
select * from TB_S WHERE sno = 001111;

--and

select * from TB_S where dept='计算机' and sex = '女';

--or 
select * from TB_S where dept='计算机' or totalcredit = 50;

模糊查询
select * from tb_s where sname like '王_';

多个字符匹配
select * from tb_s where sname like '王%';

```

### 常用聚合函数


```
count() 计数
sum() 求和
avg() 平均数
max() 最大值
min() 最小值


select count(*) "数量",dept "学院", max(totalcredit) "学分" from tb_s group by dept ;

```



### 连接查询

```
select tb_s.sno, sname, cname ,grade from tb_s JOIN tb_sc on tb_s.sname='王林' and tb_s.sno = tb_sc.sno
JOIN tb_c on tb_c.cno = tb_sc.cno and tb_c.cname = '计算机基础'

```

#### 单行子查询：

子查询 (内查询) 在主查询之前一次执行完成。子查询的结果被主查询(外查询)使用 ，单行子查询，一个子查询语句只返回一行结果，不能返回空值

可以使用>,<,<>(!=),=,<=,>=


```

SELECT
    *
FROM tb_s

where totalcredit > (select totalcredit from tb_s WHERE sname='乔峰');

```

#### 多行子查询：

子查询返回多行值，可使用多行比较符：in(not in)(等于/不等于返回值的任意一个),any(和返回值的某一个值比较),all(和返回值的所有值比较)

```
select last_name,salary

from employees

where salary = (

select min(salary)

from employees);



SELECT
    *
FROM
    tb_c
WHERE
    cno IN (
        SELECT
            cno
        FROM
            tb_sc
        GROUP BY
            cno
        HAVING
            AVG(grade) = (
                SELECT
                    MAX(AVG(grade))
                FROM
                    tb_sc
                GROUP BY
                    cno
            )
    );
```


### update


```
UPDATE <表名> [别名]    SET <列名>=<表达式>         [,<列名>=<表达式>]…   [WHERE <条件表达式>];
   其中：表达式={表达式|常量|列名}
```


