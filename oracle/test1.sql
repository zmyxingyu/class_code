set SERVEROUTPU on;

DECLARE
fen number:=80;
BEGIN
if fen<60 then
DBMS_OUTPUT.PUT_LINE('不及格');
ELSIF fen <80 then  
DBMS_OUTPUT.PUT_LINE('良好');
ELSIF fen<100 THEN
DBMS_OUTPUT.PUT_LINE('优秀');
end if;
end;


DECLARE
i number:=10;
j number:=0;
r number:=0;
BEGIN
while j<=i loop 
r:=r+j;
j:=j+1;
end loop;
DBMS_OUTPUT.PUT_LINE('结果：'||r);
end;



DECLARE
i number:=10;
j number:=0;
r number:=0;
BEGIN
for j in REVERSE 1..10 loop 
DBMS_OUTPUT.PUT_LINE('+'||j);
r:=r+j;
end loop;
DBMS_OUTPUT.PUT_LINE('结果：'||r);
end;


--9*9

DECLARE
i number:=10;
j number:=0;
r number:=0;
BEGIN
for i in 1..9 loop 
for j in 1..i loop
dbms_output.put(i||' * '||j||' = '||i*j ||'  ');
end loop;
DBMS_OUTPUT.PUT_LINE('');
end loop;

end;


DECLARE
i number:=10;
j number:=0;
r number:=0;
BEGIN
for i in 1..9 loop 
for j in i..9 loop
dbms_output.put(i||' * '||j||' = '||i*j ||'  ');
end loop;
DBMS_OUTPUT.PUT_LINE('');
end loop;

end;






DECLARE
v_name number:=10;
j number:=0;
r number:=0;
BEGIN
select * from tb_s where sno='001101';
end;





--分割

-- type&rowtype

DECLARE
vname tb_s.sname%TYPE;
vdept tb_s.dept%TYPE;
BEGIN
  SELECT sname,dept INTO vname,vdept FROM tb_s WHERE sno = '001101';
  DBMS_OUTPUT.PUT_LINE('姓名:' || vname || '   部门：' || vdept);
END;

DECLARE
stu tb_s%ROWTYPE;
BEGIN
  SELECT * INTO stu FROM tb_s WHERE sno = '001101';
  DBMS_OUTPUT.PUT_LINE('姓名:' || stu.sname || '   部门：' || stu.dept);
END;

--复合类型
set SERVEROUT on
DECLARE
  --定义一个pl/sql记录类型emp_record_type，
  --类型包含3个数据NAME, SALARY, TITLE。说白了，就是一个类型可以存放3个数据，主要是为了方便管理 
  TYPE STU_RECORD_TYPE IS RECORD(
    vname   tb_s.sname%TYPE,
    vdept tb_s.dept%TYPE);
  --定义了一个sp_record变量，这个变量的类型是emp_record_type
  SP_RECORD STU_RECORD_TYPE;
BEGIN
  SELECT sname,dept INTO sp_record FROM tb_s WHERE sno = '001101';
  DBMS_OUTPUT.PUT_LINE('员工名:' || SP_RECORD.vname || '工资：' || SP_RECORD.vdept);
END;

DECLARE
    CURSOR cstu IS
    SELECT
        *
    FROM
        tb_s;

    stu tb_s%rowtype;
BEGIN
/*
  open 游标; 
  loop? 
     fetch??游标? into 游标变量; 
     -- 处理语句; 
     exit when 游标%notfound; 
  end loop; 
  close 游标;  
*/
    OPEN cstu;
    LOOP
    FETCH cstu INTO stu;
        -- 处理语句; 
        dbms_output.put_line('姓名:'
                             || stu.sname
                             || '   部门：'
                             || stu.dept);

        EXIT WHEN cstu%notfound;
    END LOOP;

    CLOSE cstu;
    
    /*
        for stu in cstu loop
            dbms_output.put_line('姓名:'
                             || stu.sname
                             || '   部门：'
                             || stu.dept);
    end loop;
    */
    
END;



--隐式游标
BEGIN 
  UPDATE tb_s SET totalcredit=totalcredit+1;
  IF SQL%notfound then
    DBMS_OUTPUT.put_line('没有记录被更改');
  ELSE
    DBMS_OUTPUT.put_line('有'||sql%rowcount||'条记录被更改');
  END IF;
END;

--异常
DECLARE
vname tb_s.sname%TYPE;
vdept tb_s.dept%TYPE;
BEGIN
  SELECT sname,dept INTO vname,vdept FROM tb_s ;
  DBMS_OUTPUT.PUT_LINE('姓名:' || vname || '   部门：' || vdept);
exception
when no_data_found then
DBMS_OUTPUT.PUT_LINE('没有数据');
when too_many_rows then
DBMS_OUTPUT.PUT_LINE('too many');
  
END;

--自定义异常
declare
 zdy_e exception;
 grade number;
BEGIN 
  grade:=&totalGrade;
  if grade<0 then
  raise zdy_e;
  else
   update tb_s set totalcredit = grade where sno='001101';
  end if;

EXCEPTION
WHEN zdy_e THEN
DBMS_OUTPUT.put_line('学分不能为负');
WHEN OTHERS THEN
DBMS_OUTPUT.put_line('except');
END;



DECLARE 
i number:=1;
stu tb_s%rowtype;
CURSOR cstu is 
SELECT * FROM tb_s ORDER BY totalcredit desc;
BEGIN 
OPEN cstu;
loop
FETCH cstu INTO stu;
dbms_output.put_line('姓名：'||stu.sname||'学号：'||stu.sno); 
exit when i>=5;
i:=i+1;
end loop;
close cstu;
dbms_output.put_line('亮丽的分割线'); 
i:=1;
for stu in cstu loop
dbms_output.put_line('姓名：'||stu.sname||'学号：'||stu.sno); 
exit when i>=5;
i:=i+1;
end loop;

end;


--游标变量

set SERVEROUT on;
DECLARE 
CURSOR cstu is SELECT
    *
FROM tb_s where dept='计算机';
BEGIN
for stu in cstu loop
dbms_output.put_line('no:'||stu.sno||',name :'||stu.sname);
end loop;
end;


DECLARE 
CURSOR cstu(vdept tb_s.dept%type) is SELECT
    *
FROM tb_s where dept=vdept;
BEGIN

for stu in cstu('大数据') loop
dbms_output.put_line('no:'||stu.sno||',name :'||stu.sname);
end loop;
 
end;



--函数

CREATE OR REPLACE FUNCTION fun_getGrade(vno tb_s.sno%type)
RETURN tb_s.totalcredit%type   				--返回类型
AS
v_grade tb_s.totalcredit%type;
BEGIN
  SELECT totalcredit INTO v_grade FROM tb_s WHERE sno = vno;
  RETURN v_grade;
  EXCEPTION
    WHEN OTHERS THEN
    dbms_output.put_line('');  
END fun_getGrade;


CREATE or REPLACE FUNCTION func_area(bj number) RETURN number
is
pi CONSTANT NUMBER := 3.14;
BEGIN
RETURN bj*bj*pi;
end func_area;

select func_area(10)  from dual;

BEGIN
dbms_output.put_line('001101 的学分：'||fun_getGrade('001101')); 
end;

-- 定义包
CREATE OR REPLACE PACKAGE  test_pkg
IS
  rtest test%ROWTYPE;
  --Add ...
  FUNCTION add_test(
           pname VARCHAR2, 
           psex VARCHAR2 DEFAULT '男')
  RETURN NUMBER;
  
  --delete ...
  FUNCTION delete_test(pno NUMBER)
  RETURN NUMBER;
  
  --query dept...
  PROCEDURE query_test(pno NUMBER);
END test_pkg;


--

CREATE OR REPLACE PACKAGE BODY test_pkg
IS 

FUNCTION add_test
(
    pname VARCHAR2, 
    psex VARCHAR2 DEFAULT '男'
)
RETURN NUMBER
IS
BEGIN
  INSERT INTO test VALUES(pname,SQ_TEST.nextval , psex);
  IF SQL%FOUND THEN
     RETURN 1;
  END IF;
EXCEPTION
     WHEN OTHERS THEN
        RETURN -1;
END add_test;

FUNCTION delete_test(pno NUMBER)
RETURN NUMBER
IS 
BEGIN
  DELETE FROM test WHERE aid = pno;
  IF SQL%FOUND THEN
    RETURN 1;
  ELSE
    RETURN 0;
END IF;
EXCEPTION
  WHEN OTHERS THEN
    RETURN -1;
END delete_test;

PROCEDURE query_test(pno IN NUMBER)
IS
BEGIN
    SELECT * INTO rtest FROM test WHERE aid=pno;
END query_test;
END test_pkg;

DECLARE
re number;
begin
test_pkg.delete_add('hallo');
end

re:=test_pkg.delete_test(201701);
if re=1 then
dbms_output.put_line('删除：'+re);

--查看存储过程与函数
SELECT * FROM  USER_PROCEDURES;  
SELECT * FROM  USER_PROCEDURES where object_type='FUNCTION';

--DROP FUNCTION 函数名称

select fun_getGrade('001101') grade from dual;


set SERVEROUTPU on;

--查看存储过程与函数
SELECT * FROM  USER_PROCEDURES;  
SELECT * FROM  USER_PROCEDURES where object_type='FUNCTION';

--DROP FUNCTION 函数名称

select fun_getGrade('001101') grade from dual;


--存储过程
CREATE OR REPLACE PROCEDURE proc_display_grade(vdept tb_s.dept%TYPE)
   --该形参缺省为in类型，数据类型为emp.job%TYPE
   AS
     v_avg_grade tb_s.totalcredit%TYPE;
     v_max_grade tb_s.totalcredit%TYPE;
     v_min_grade tb_s.totalcredit%TYPE;
   BEGIN
     SELECT avg(totalcredit) INTO v_avg_grade FROM tb_s WHERE dept=vdept;
     SELECT max(totalcredit) INTO v_max_grade FROM tb_s WHERE dept=vdept;
     SELECT min(totalcredit) INTO v_min_grade FROM tb_s WHERE dept=vdept;
     DBMS_OUTPUT.PUT_LINE('DEPT '||vdept||' avg sal:'||v_avg_grade);
     DBMS_OUTPUT.PUT_LINE('DEPT '||vdept||' max sal:'||v_max_grade);
     DBMS_OUTPUT.PUT_LINE('DEPT '||vdept||' min sal:'||v_min_grade);
             
 EXCEPTION
     WHEN NO_DATA_FOUND THEN
          DBMS_OUTPUT.PUT_LINE('NOT FOUND RECORD!');
END proc_display_grade;

set SERVEROUTPUT ON
exec proc_display_grade('计算机')
exec proc_display_grade('大数据');


CREATE OR REPLACE PROCEDURE proc_get_avg_grade(vdept tb_s.dept%TYPE,avg_grade out NUMBER )
   --该形参缺省为in类型，数据类型为emp.job%TYPE
   AS
     v_avg_grade tb_s.totalcredit%TYPE;
     v_max_grade tb_s.totalcredit%TYPE;
     v_min_grade tb_s.totalcredit%TYPE;
   BEGIN
     SELECT avg(totalcredit) INTO v_avg_grade FROM tb_s WHERE dept=vdept;
     SELECT max(totalcredit) INTO v_max_grade FROM tb_s WHERE dept=vdept;
     SELECT min(totalcredit) INTO v_min_grade FROM tb_s WHERE dept=vdept;
     DBMS_OUTPUT.PUT_LINE('DEPT '||vdept||' avg sal:'||v_avg_grade);
     DBMS_OUTPUT.PUT_LINE('DEPT '||vdept||' max sal:'||v_max_grade);
     DBMS_OUTPUT.PUT_LINE('DEPT '||vdept||' min sal:'||v_min_grade);
     avg_grade:=v_avg_grade;
             
 EXCEPTION
     WHEN NO_DATA_FOUND THEN
          DBMS_OUTPUT.PUT_LINE('NOT FOUND RECORD!');
END;

DECLARE
avg_grade number;
BEGIN
proc_get_avg_grade('大数据',avg_grade);
DBMS_OUTPUT.put_line('avg grade:'||avg_grade);
end;

desc tb_s;
desc proc_get_avg_grade;






--无参数
CREATE OR REPLACE PROCEDURE display_systime
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('CURRENT TIME IS '||sysdate);
END display_systime;
EXECUTE display_systime; 

-- 
CREATE OR REPLACE PROCEDURE proc_add_test(name in test.name%type,sex in test.sex%type DEFAULT '男' )
AS
BEGIN
INSERT into test values(in ,sq_test.nextval,sex);
END;


-- 定义包
CREATE OR REPLACE PACKAGE test_pkg IS
    rtest test%rowtype;
  --Add ...
    FUNCTION add_test (
        pname   VARCHAR2,
        psex    VARCHAR2 DEFAULT '男'
    ) RETURN NUMBER;
  --delete ...

    FUNCTION delete_test (
        pno NUMBER
    ) RETURN NUMBER;
  
  --query dept...

    PROCEDURE query_test (
        pno NUMBER
    );

END test_pkg;

--hh
CREATE OR REPLACE PACKAGE BODY test_pkg IS

    FUNCTION add_test (
        pname   VARCHAR2,
        psex    VARCHAR2 DEFAULT '男'
    ) RETURN NUMBER IS
    BEGIN
        INSERT INTO test VALUES (
            pname,
            sq_test.NEXTVAL,
            psex
        );

        IF SQL%found THEN
            RETURN 1;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN -1;
    END add_test;

    FUNCTION delete_test (
        pno NUMBER
    ) RETURN NUMBER IS
    BEGIN
        DELETE FROM test
        WHERE
            aid = pno;

        IF SQL%found THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN -1;
    END delete_test;

    PROCEDURE query_test (
        pno IN NUMBER
    ) IS
    BEGIN
        SELECT
            *
        INTO rtest
        FROM
            test
        WHERE
            aid = pno;
    DBMS_OUTPUT.put_line('name:'||rtest.name);

    END query_test;
BEGIN
null;
END test_pkg;


DECLARE
    re NUMBER;
BEGIN
    --re:=TEST_PKG.ADD_TEST('xxx');
    re:=test_pkg.delete_test(201741);
END;


DECLARE
    re NUMBER;
BEGIN
test_pkg.query_test(201720);
DBMS_OUTPUT.put_line('name:'||test_pkg.rtest.name||',sex:'||test_pkg.rtest.sex);
END;

/*
触发器
*/
/*

触发器的语法：
create [or replace] tigger 触发器名 触发时间 触发事件
on 表名
[for each row]
begin
  pl/sql语句
end
其中：
触发器名：触发器对象的名称。由于触发器是数据库自动执行的，因此该名称只是一个名称，没有实质的用途。
触发时间：指明触发器何时执行，该值可取：
before：表示在数据库动作之前触发器执行;
after：表示在数据库动作之后触发器执行。
触发事件：指明哪些数据库动作会触发此触发器：
insert：数据库插入会触发此触发器;
update：数据库修改会触发此触发器;
delete：数据库删除会触发此触发器。
表 名：数据库触发器所在的表。
for each row：对表的每一行触发器执行一次。如果没有这一选项，则只对整个表执行一次。

触发器能实现如下功能：

功能：
1、 允许/限制对表的修改
2、 自动生成派生列，比如自增字段
3、 强制数据一致性
4、 提供审计和日志记录
5、 防止无效的事务处理
6、 启用复杂的业务逻辑
*/


CREATE TABLE del_test AS SELECT * FROM test WHERE 1=2; --创建与emp同结构的空表

CREATE OR REPLACE TRIGGER tr_del_test 
   BEFORE DELETE 			--指定触发时机为删除操作前触发
   ON test 
   FOR EACH ROW   		--说明创建的是行级触发器
BEGIN                                                   --将修改前数据插入到日志记录表del_emp 
   INSERT INTO del_test 
VALUES( :old.name, :old.aid, :old.sex );
END;




create or replace trigger auth_secure before insert or update or delete 
on tb_s
begin
   IF(to_char(sysdate,'DY')='星期日') THEN
       RAISE_APPLICATION_ERROR(-20600,'不能在周末修改表tb_emp');
   END IF;
END;

--使用触发器实现序号自增


CREATE OR REPLACE TRIGGER trg_test_aid
BEFORE INSERT ON test
  FOR EACH ROW--对表的每一行触发器执行一次
DECLARE
  NEXT_ID NUMBER;
BEGIN
  SELECT sq_test.NEXTVAL INTO NEXT_ID FROM DUAL;
  :NEW.aid := NEXT_ID; --:NEW表示新插入的那条记录
END;

insert into test(name,sex) values('admin','男');
insert into test(name,sex) values('test','女');
COMMIT;
SELECT * FROM test;


--创建记录测试表
CREATE TABLE test_log(
   l_user   VARCHAR2(15),
   l_type   VARCHAR2(15),
   l_date   VARCHAR2(30)
);



--创建触发器
CREATE OR REPLACE TRIGGER trg_test_log
AFTER DELETE OR INSERT OR UPDATE ON TEST
DECLARE
  V_TYPE TEST_LOG.L_TYPE%TYPE;
BEGIN
  IF INSERTING THEN
    --INSERT触发
    V_TYPE := 'INSERT';
    DBMS_OUTPUT.PUT_LINE('记录已经成功插入，并已记录到日志');
  ELSIF UPDATING THEN
    --UPDATE触发
    V_TYPE := 'UPDATE';
    DBMS_OUTPUT.PUT_LINE('记录已经成功更新，并已记录到日志');
  ELSIF DELETING THEN
    --DELETE触发
    V_TYPE := 'DELETE';
    DBMS_OUTPUT.PUT_LINE('记录已经成功删除，并已记录到日志');
  END IF;
  INSERT INTO TEST_LOG
  VALUES
    (USER, V_TYPE, TO_CHAR(SYSDATE, 'yyyy-mm-dd hh24:mi:ss')); --USER表示当前用户名
END;

--下面我们来分别执行DML语句
insert into test(name,sex) values('hello all','男');
set SERVEROUTPUT ON
UPDATE test SET name = 'ni hap' WHERE aid = '201762';
DELETE test WHERE aid = '201762';
--然后查看效果
SELECT * FROM test;
SELECT * FROM test_log;





