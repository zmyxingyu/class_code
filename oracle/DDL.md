### create
```
     CREATE TABLE <表名>(  
    <列名1> 数据类型 [列级完整性约束条件]
    [, <列名2> 数据类型 [列级完整性约束条件] ]
    [,表级完整性约束条件]··· )；    



[列级完整性约束条件]有:
Primary key: 主键约束。每个表只能创建一个主键约束;
Unique: 唯一性约束(即候选键)。可以有多个唯一性约束;
Not null: 非空约束。是指该列不允许有空值出现;
Default: 默认值 。是指该列在不输入值时的取值;
Check:检查列值是否满足一个布尔表达式.

create table "test"(
id char(4) PRIMARY KEY,
name VARCHAR2(30)
);

```
### drop
```
drop table "test";



DELETE
DML语言
可以回退
可以有条件的删除
DELETE FROM 表名 WHERE 条件

TRUNCATE TABLE
DDL语言
无法回退
默认所有的表内容都删除
删除速度比delete快
TRUNCATE TABLE 表名

DROP TABLE
用于删除表（表的结构、属性以及索引也会被删除）;
DROP TABLE 表名
```
### alter
```

ALTER TABLE <表名>
   [ADD <新列名> <数据类型> [完整性约束]]
   [DROP <完整性约束名>]
   [MODIFY <列名>  <数据类型>];
   [DROP COLUMN <列名> ];



修改表名

Alter table tableName  rename to  newTableName  语法结构

修改列明

alter table productionfo rename  column productType to type

修改列的类型

alter table productionfo modify productType varchar(30)

添加列

Alter table productionfo add miaoshu varchar2(20)

删除数据表一列

Alter table productionfo drop column miaoshu 


约束

alter table tableName  add constraints pk_productId  primary key (productid)

移除主键约束
alter table production drop constraints pk_productid             -------pk_productid  是添加主键时的名字。
　
外键约束

外键约束可以保证使用外键约束的数据表列与所运用的主键约束的数据列一致，外键约束可以再同一表中添加多个　　

语法：alter table table1add constraint  fk_name(外键名称) foreign key (要设为外键的列名) references table2(columnName)(与哪个表有关联表2中该列列名);

检查约束--check约束

ALTER TABLE table_name
ADD CONSTRAINT constraint_name CHECK (column_name condition) [DISABLE];

如：constraint constraint_productId  check(productId <100)
修改表的时候添加  add constraint constraint_name check(column condition)

UNIQUE 约束  唯一性约束
可以设置表中输入的字段都是唯一的。
CONSTRAINT constraint_name UNIQUE(column_name)


NOT NULL 约束
创建表的时候直接在字段后边添加 not null 关键字即可
修改表时：alter table table_name modify column not null;


禁用CHECK约束
语法
ALTER TABLE table_name
DISABLE CONSTRAINT constraint_name;


约束详细信息查看
语句:


--查看约束的详细信息
select 
constraint_name,--约束名称
constraint_type,--约束类型
table_name,--约束所在的表
search_condition,--约束表达式
status--是否启用
from user_constraints--[all_constraints|dba_constraints]
where constraint_name='CHECK_TB_SUPPLIER_ID';


```