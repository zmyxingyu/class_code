
# PL/SQL

Oracle PL/SQL 语言（Procedural Language/SQL）是结合了结构化查询与 Oracle 自身过程控制为一体的强大语言， PL/SQL 不但支持更多的数据类型，拥有自身的变量声明、赋值语句，而且还有条件、循环等流程控制语句。过程控制结构与 SQL 数据处理能力无缝的结合形成了强大的编程语言，可以创建过程和函数以及程序包等。

PL/SQL语言的应用基本贯彻了Oracle学习和开发的全过程，它是作为一个Oracle开发程序员必备的知识。只有认真掌握、理解和应用才能算真正入门。因此，本篇幅我们会认真讲解Oracle PL/SQL教程，希望对大家有所帮助。主要内容有：

1. PL/SQL简介：它是Oracle公司在标准SQL语言的基础上进行扩展，可以在数据库上进行设计编程的一种过程化的语言，类似程序语言JAVA一样可以实现逻辑判断、条件循环、异常处理等细节操作，可以处理复杂性问题。
2. PL/SQL块：** PL/SQL块是PL/SQL程序的最基本的单位 **，它由声明部分、执行部分和异常处理三部分组成。其中声明部分由declare开始，执行部分由begin开始，异常处理部分由exception开始。
3. PL/SQL数据类型：PL/SQL数据类型不但支持Oracle SQL中的数据类型，还有自身自带的数据类型。其中，包括标量数据类型，引用数据类型。
4. PL/SQL控制结构：PL/SQL是既然是过程语言，那么就有PL/SQL的逻辑控制结构，拥有PL/SQL顺序结构、PL/SQL条件结构、PL/SQL循环结构。
5. PL/SQL动态执行DDL语句：PL/SQL程序中可以执行DML语句和事物控制等语句，但是直接DDL是不可以的，但是可以通过动态SQL语句执行，间接到达执行DDL操作的目的。
6. PL/SQL异常处理：PL/SQL异常处理是PL/SQL块中对执行部分出现异常进行处理的部分。PL/SQL异常可以分为预定义异常、非预定义异常、自定义异常三种。
7. Oracle创建函数：Oracle创建函数是通过PL/SQL自定义编写的，通过关键字function按照自己的需求把复杂的业务逻辑封装进PL/SQL函数中，函数提供一个返回值，返回给使用者。这样使用者就不需要去理解业务逻辑，把PL/SQL函数中的业务逻辑交给专门的开发人员进行编写。
8. Oracle存储过程：Oracle存储过程在实际数据库开发过程当中会经常使用到，作为一个数据库开发者必备的技能，它有着SQL语句不可替代的作用。所谓存储过程，就是一段存储在数据库中执行某块业务功能的程序模块。它是由一段或者多段的PL/SQL代码块或者SQL语句组成的一系列代码块。
9. Oracle游标：Oracle游标是通过关键字CURSOR的来定义一组Oracle查询出来的数据集，类似数组一样，把查询的数据集存储在内存当中，然后通过游标指向其中一条记录，通过循环游标达到循环数据集的目的。
10. Oracle触发器：Oracle触发器是开发者对Oracle数据库的对象做特定的操作时，触发的一段PL/SQL程序代码，叫做触发器。触发的事件包括对表的DML操作，用户的DDL操作以及数据库事件等，通过关键字trigger进行创建的。
11. Oracle DML类型触发器：Oracle DML类型触发器是Oracle开发过程当中最经常用到，也是最常见的触发器，主要是对DML操作，如：insert、delete、update操作事件进行触发。
12. Oracle DDL类型触发器：Oracle DDL类型触发器主要是对于Oracle数据库的DDL操作触发的触发器，主要包括create、drop、alter等DDL事件，经常利用DDL类型触发器记录DDL操作记录或者限定对某个对象进行DDL操作。
13. Oracle事物：oracle事物主要用于保持oracle数据库的数据一致性，oracle事物可以看成一个SQL块的整体，只要某一个SQL语句错误，那么事物中的SQL被看做一个整体，一起回滚，要么就是一起成功全部提交。
14. Oracle锁：Oracle锁是用于数据共享的情景当中，它是一种Oracle的访问机制，在访问同一个资源时，防止不同事物操作同一个数据时，出现数据问题。常用的有Oracle排它锁、Oracle共享锁、Oracle行级锁、Oracle表级锁。

--------------------------------------------------

## 语法
PL/SQL块是PL/SQL程序的最基本的单位，它由声明部分、执行部分和异常处理三部分组成。其中声明部分由declare开始，执行部分由begin开始，异常处理部分由exception开始。其中执行部分是必须，即begin..end之间必须要有执行部分。其他两部分可以根据实际情况选择。

PL/SQL块语法结构：
```
[DECLARE]
声明语句...
BEGIN
执行语句...
[EXCEPTION]
异常处理语句...
END;
```

语法解析：
1、声明部分是可选部分，由DECLARE开始，声明执行部分所需的变量或者常量。假如，没有用到变量或者常量可以省略。

2、执行部分是由BEGIN开始，END结束。是PL/SQL块语句的核心部分，所有的可执行的PL/SQL语句和操作变量都放在该部分。是必选的部分，不能省略。

3、异常部分是由EXCEPTION开始。主要处理执行部分过程中的执行语句或者赋值操作出现错误时，就会进入该部分。是PL/SQL程序的异常处理部分，不是必须的。

案例1、我们通过简单的PL/SQL语句块输出学生信息表中的某一位学生的基本信息。代码如下：

```
declare
xsjbxx varchar2(50);
begin
  select '姓名:' ||t.stuname || ' 学号:' || t.stuid || ' 年龄：' || t.age
   into xsjbxx
    from stuinfo t
   where t.stuname = '张三';
  dbms_output.put_line(xsjbxx);
exception
  when no_data_found  then
     dbms_output.put_line('该学生在学生信息表中找不到');
end;
```




## PL/SQL数据类型

PL/SQL数据类型不但支持Oracle SQL中的数据类型，**还有自身自带的数据类型**。学习任何一门语言，都需要了解一下该语言支持哪些数据类型，PL/SQL数据类型可以分为标量数据类型和引用数据类型两大部分。

标量数据类型
标量数据类型的变量只有一个值，且内部没有分量。标量数据类型包括数字型，字符型，日期型和布尔型。这些类型有的是 Oracle SQL 中有的数据类型，有的是 PL/SQL 自身附加的数据类型。下面我们来详细介绍一下常用的的标量数据类型：

**1、数值类型：**主要用来存储数值类型的数据。常用的有NUMBER、PLS_INTEGER、BINARY_INTEGER和SIMPLE_INTEGER类型。

NUMBER：可以存储小数和整数类型数据，格式为NUMBER(p,s)，其中p表示的是精度（既是位数的长度），s表示的是小数点后的位数。例如：number（3,2）表示的范围-9.99—9.99。

PLS_INTEGER、BINARY_INTEGER、SIMPLE_INTEGER：主要用来存储整数类型，它们存储整数的范围都是-(2^31)...(2^31-1)。但是BINARY_INTEGER发生内存溢出的时候会给它分配一个number类型的数据，而PLS_INTEGER会直接抛异常报错，SIMPLE_INTEGER是PLS_INTEGER的一个子类型，它不允许存在NULL值数据。

2、字符类型：用来存储单个字符或字符串。主要有的类型有如下类型：

CHAR类型：固定长度的字符串，CHAR(n)：默认长度是1，当字符串长度小于n时，会自动右补空格，所以在取数据的时候要注意补空格。

VARCHAR2类型：该类型存储可变长度的字符串VARCHAR2(n)，最大存储的长度为4000个字节。当字符串长度小于n时，不会补齐空格。

LONG类型：该类型存储可变长度的字符串，不同于VARCAHR2类型，它对于字段的存储长度可达2G，但是作为PL/SQL变量，和VARCHAR2一样，只能存储最大32767字节。

3、时间类型：主要和SQL中的时间类型一致，有DATE和TIMESTAMP两种时间类型。

4、布尔类型：PL/SQL程序中的逻辑判断的值有：TRUE、FALSE、NULL值。

**引用数据类型**
引用数据类型是PL/SQL程序语言特有的数据类型，是用来引用数据库当中的某一行或者某个字段作为数据类型的声明。其中有两种引用类型：%TYPE和%ROWTYPE。

%TYPE类型：
引用数据库中表的某列的类型作为某变量的数据类型，也可以直接引用PL/SQL程序中某个变量作为新变量的数据类型。下面我们通过一个案例做下测试：

```
declare
ls_stuname stuinfo.stuname%type;--通过学生姓名字段声明ls_stuname
begin
  select t.stuname into ls_stuname
    from student.stuinfo t
   where t.stuid = 'SC201801006';   
  dbms_output.put_line(ls_stuname);
exception
  when no_data_found  then
     dbms_output.put_line('该学生在学生信息表中找不到');
end;
结果如下：
```
%type

% ROWTYPE 类型：
%ROWTYPE类型是PL/SQL程序引用数据库表中的一行作为数据类型，即 RECORD 类型（记录类型）表示一条数据记录。类似java程序当中的对象的实例。可以使用“.”来访问记录中的属性。下面我们通过实例来做下测试：

```
declare
ls_stuinfo stuinfo%rowtype;
xsjbxx varchar2(50);
begin
  select t.* into ls_stuinfo
    from stuinfo t
   where t.stuid='SC201801006';
   xsjbxx:='姓名:' ||ls_stuinfo.stuname || ' 学号:' ||ls_stuinfo.stuid || ' 年龄：' ||ls_stuinfo.age;
  dbms_output.put_line(xsjbxx);
exception
  when no_data_found  then
     dbms_output.put_line('该学生在学生信息表中找不到');
end;
案例中我们通过查询学生信息表(stuinfo)中学号“SC201801006”的数据记录赋值给ls_stuinfo（%rowtype）变量，结果如下：
```


## PL/SQL控制结构
PL/SQL是既然是过程性语言，那么就有PL/SQL自己的逻辑控制结构，拥有PL/SQL顺序结构、PL/SQL条件结构、PL/SQL循环结构可以在PL/SQL编程过程中完美完成业务逻辑的开发，本节我们重要讲解PL/SQL的控制结构。

### PL/SQL顺序结构
在PL/SQL程序中，顺序结构我们经常使用到GOTO的关键字进行程序的跳转。GOTO的跳转有点类似脚本语言中的GOTO跳转到指定的标签位置，然后继续顺着标签往下走。
标签是用双尖括号括起来的标示符，在 PL/SQL 块中具有唯一的id名，标签后必须紧跟可执行语句或者 PL/SQL 块。GOTO 不能跳转到 IF 语句、 CASE 语句、 LOOP 语句、
或者子块中，因此， ** 不在非不得已的情况下，不使用GOTO语句 ** ，因为这种逻辑控制经常有点僵硬的跳出业务逻辑，容易造成代码编写出错问题。下面通过案例详解GOTO关键字的使用：
```
declare
ls_stuinfo stuinfo%rowtype;
xsjbxx varchar2(50);
begin
  select t.* into ls_stuinfo
    from stuinfo t
   where t.stuid='SC201801006'; 
   xsjbxx:='姓名:' ||ls_stuinfo.stuname || ' 学号:' ||ls_stuinfo.stuid || ' 年龄：' ||ls_stuinfo.age;
  dbms_output.put_line(xsjbxx);
  if ls_stuinfo.age>25 then
    goto flag1;
  else
    goto flag2;  
  end if;
  <<flag1>>
  dbms_output.put_line(xsjbxx||' 年龄大于25岁');
  << flag2>>
  null;
exception
  when no_data_found  then
     dbms_output.put_line('该学生在学生信息表中找不到');
end;
结果如下：
```

解释说明：

1、其中通过判断学生“张三丰”的年龄是否大于25岁，大于就跳转到flag1标志位开始继续顺序执行程序。

2、NULL在PL/SQL程序中是顺序结构当中的一种，表示不执行任何内容，直接跳过，因此，当年龄小于等于25岁，该学生年龄大于25岁的信息将不会被打印出来。

### PL/SQL条件控制
PL/SQL 程序中关于条件控制的关键字有 IF-THEN-END IF 、IF-THEN-ELSE- END  IF、 IF-THEN-ELSIF-END IF 和多分枝条件 CASE，下面我们通过案例进行讲解分析，参考表结构：学生信息系统表。

IF-THEN-END IF
语法结构如下：

if 条件  then
    --满足条件执行体;
end if;
案例1、查询学生信息表（stuinfo）中男生的数量。代码如下：
```
declare
ls_stuinfo stuinfo%rowtype;--学生信息表
ls_number number:=0;--计数器
begin
  --对学生信息表进行全表循环
  for ls_stuinfo in (  select t.* from stuinfo t ) loop
    if ls_stuinfo.sex='1' then--性别编码为1的是男生 
      ls_number:=ls_number+1;--计数器加1
    end if;  
   end loop; 
   dbms_output.put_line('男生的数量是：'||ls_number);
end;
结果：
```


IF-THEN-END IF

IF-THEN-ELSE- END  IF
语法结构如下：

if 条件 then
    --满足条件执行体;
else
    --不满足条件执行体;
end if;
案例2、分别计算学生信息表中男生和女生的数量各多少。代码如下：

```
declare
ls_stuinfo stuinfo%rowtype;--学生信息表
ls_number_boy number:=0;--男生计数器
ls_number_girl number:=0;--女生计算器
begin
  --对学生信息表进行全表循环
  for ls_stuinfo in (  select t.* from stuinfo t ) loop
    if ls_stuinfo.sex='1' then--性别编码为1的是男生 
      ls_number_boy:=ls_number_boy+1;--计数器加1
    else
      --性别编码为2(不为1)的是女生  
      ls_number_girl:=ls_number_girl+1;--计数器加1
    end if;  
   end loop; 
   dbms_output.put_line('男生的数量是：'||ls_number_boy||',女生的数量是：'|| ls_number_girl);
end;
结果如下：
```


IF-THEN-ELSE- END  IF
IF-THEN -ELSIF-THEN -END IF
语法结构如下：

if 条件1 then 
    --条件1成立执行体;
elsif 条件2 then
    --条件1不成立,条件2成立执行体;
else
    --条件都不成立执行体;
end if;
解释说明：

elsif是对条件控制中前提条件（即上面的条件1）不成立时，再做条件判断，满足的情况下，执行then之后的执行块。这样子就可以做逻辑中条件判断的细分。

CASE...WHEN...THEN
CASE 是一种选择结构的控制语句，可以根据条件从多个执行分支中选择相应的执行动作。也可以作为表达式使用，返回一个值。

语法结构如下：

CASE 选择体 
     WHEN 表达式1 then 执行体;
     WHEN 表达式2 then 执行体;
     WHEN 表达式3 then 执行体;
     ...
     ELSE 表达式n  then 执行体;
END CASE;
语法解析：

如果存在选择体，选择体 与 WHEN 后面的表达式匹配，匹配成功就执行 THEN 后面的语句。如果所有表达式都与选择体不匹配，则执行 ELSE 后面的语句。

案例3、通过选择体CASE WHEN 区分出学生信息表中学生的各个年龄的人数。代码如下：

```
declare
ls_stuinfo stuinfo%rowtype;--学生信息表
ls_number_26 number:=0;--26岁计数器
ls_number_27 number:=0;--27岁计数器
ls_number number:=0;--其它
begin
  --对学生信息表进行全表循环
  for ls_stuinfo in (  select t.* from stuinfo t ) loop
    case ls_stuinfo.age
      when 26 then 
        ls_number_26:=ls_number_26+1;
      when 27 then 
        ls_number_27:=ls_number_27+1;
      else 
        ls_number:=  ls_number+1;
    end case;     
  end loop;
  dbms_output.put_line('26岁：'||ls_number_26||'人，27岁：'||ls_number_27||'人,其它岁数：'||ls_number||'人');
end;
```

结果如下：

case when  then 

group by 

### PL/SQL循环结构
PL/SQL 提供了丰富的循环结构来进行循环操作表中数据。 Oracle 提供的循环类型有：FOR 循环语句和WHILE循环语句。

FOR循环
FOR循环可以根据循环体直接进行 loop循环，也可以通过对循环变量进行循环。

语法结构如下：

--通过循环体直接进行loop循环
>>for 循环体别名 in (SELECT 条件查询数据) loop
>>    --循环执行体；
>>end loop;
 
--通过循环变量进行循环
>>for 循环变量 in 循环下限...循环上限 loop
>>end loop;
案例4、通过循环体直接LOOP循环参考案例1中的对表循环，我们通过第二种方式调整案例1的代码，代码如下：

```
declare
type stuinfo_type is table of  stuinfo%rowtype;--学生信息表
ls_stuinfo stuinfo_type;--声明一个集合变量(学生集合变量)
ls_number number:=0;--计数器
begin
  --赋值给学生集合变量
  select * BULK COLLECT into ls_stuinfo from stuinfo;
  --对集合变量进行for循环，通过下标取值 
  for i in 1.. ls_stuinfo.count loop
    if ls_stuinfo(i).sex='1' then--性别编码为1的是男生 
      ls_number:=ls_number+1;--计数器加1
    end if;  
   end loop; 
   dbms_output.put_line('男生的数量是：'||ls_number);
end;
```

>>BULK COLLECT 子句会批量检索结果，即一次性将结果集绑定到一个集合变量中，并从SQL引擎发送到PL/SQL引擎。通常可以在SELECT INTO、
>>FETCH INTO以及RETURNING INTO子句中使用BULK COLLECT

通过结果可以发现，得到的男生数量是一致的。这种代码相对案例1的代码会更为清晰，当程序的编码量提高时，推荐使用这种方式进行编写FOR循环的循环体。结果如下：

FOR循环



WHILE循环
WHILE循环和其它编程语言的while循环一模一样，当满足 while条件时候，执行循环体，当不满足while条件时，跳出循环，结束循环。语法结构如下：

while 条件  loop
    --循环执行体
end loop;
案例5、一个简单1加到n（n=4）的代码的while循环代码：
```
declare
ls_number number:=0;--结果值
i number:=1;--计数器
begin
while i<=4 loop
   ls_number:=ls_number+i;
   i:=i+1;
end loop;
dbms_output.put_line(ls_number);  
end;
```

结果如下：

