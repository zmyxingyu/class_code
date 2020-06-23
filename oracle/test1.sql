set SERVEROUTPU on;

DECLARE
fen number:=80;
BEGIN
if fen<60 then
DBMS_OUTPUT.PUT_LINE('������');
ELSIF fen <80 then  
DBMS_OUTPUT.PUT_LINE('����');
ELSIF fen<100 THEN
DBMS_OUTPUT.PUT_LINE('����');
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
DBMS_OUTPUT.PUT_LINE('�����'||r);
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
DBMS_OUTPUT.PUT_LINE('�����'||r);
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





--�ָ�

-- type&rowtype

DECLARE
vname tb_s.sname%TYPE;
vdept tb_s.dept%TYPE;
BEGIN
  SELECT sname,dept INTO vname,vdept FROM tb_s WHERE sno = '001101';
  DBMS_OUTPUT.PUT_LINE('����:' || vname || '   ���ţ�' || vdept);
END;

DECLARE
stu tb_s%ROWTYPE;
BEGIN
  SELECT * INTO stu FROM tb_s WHERE sno = '001101';
  DBMS_OUTPUT.PUT_LINE('����:' || stu.sname || '   ���ţ�' || stu.dept);
END;

--��������
set SERVEROUT on
DECLARE
  --����һ��pl/sql��¼����emp_record_type��
  --���Ͱ���3������NAME, SALARY, TITLE��˵���ˣ�����һ�����Ϳ��Դ��3�����ݣ���Ҫ��Ϊ�˷������ 
  TYPE STU_RECORD_TYPE IS RECORD(
    vname   tb_s.sname%TYPE,
    vdept tb_s.dept%TYPE);
  --������һ��sp_record���������������������emp_record_type
  SP_RECORD STU_RECORD_TYPE;
BEGIN
  SELECT sname,dept INTO sp_record FROM tb_s WHERE sno = '001101';
  DBMS_OUTPUT.PUT_LINE('Ա����:' || SP_RECORD.vname || '���ʣ�' || SP_RECORD.vdept);
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
  open �α�; 
  loop? 
     fetch??�α�? into �α����; 
     -- �������; 
     exit when �α�%notfound; 
  end loop; 
  close �α�;  
*/
    OPEN cstu;
    LOOP
    FETCH cstu INTO stu;
        -- �������; 
        dbms_output.put_line('����:'
                             || stu.sname
                             || '   ���ţ�'
                             || stu.dept);

        EXIT WHEN cstu%notfound;
    END LOOP;

    CLOSE cstu;
    
    /*
        for stu in cstu loop
            dbms_output.put_line('����:'
                             || stu.sname
                             || '   ���ţ�'
                             || stu.dept);
    end loop;
    */
    
END;



--��ʽ�α�
BEGIN 
  UPDATE tb_s SET totalcredit=totalcredit+1;
  IF SQL%notfound then
    DBMS_OUTPUT.put_line('û�м�¼������');
  ELSE
    DBMS_OUTPUT.put_line('��'||sql%rowcount||'����¼������');
  END IF;
END;

--�쳣
DECLARE
vname tb_s.sname%TYPE;
vdept tb_s.dept%TYPE;
BEGIN
  SELECT sname,dept INTO vname,vdept FROM tb_s ;
  DBMS_OUTPUT.PUT_LINE('����:' || vname || '   ���ţ�' || vdept);
exception
when no_data_found then
DBMS_OUTPUT.PUT_LINE('û������');
when too_many_rows then
DBMS_OUTPUT.PUT_LINE('too many');
  
END;

--�Զ����쳣
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
DBMS_OUTPUT.put_line('ѧ�ֲ���Ϊ��');
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
dbms_output.put_line('������'||stu.sname||'ѧ�ţ�'||stu.sno); 
exit when i>=5;
i:=i+1;
end loop;
close cstu;
dbms_output.put_line('�����ķָ���'); 
i:=1;
for stu in cstu loop
dbms_output.put_line('������'||stu.sname||'ѧ�ţ�'||stu.sno); 
exit when i>=5;
i:=i+1;
end loop;

end;


--�α����

set SERVEROUT on;
DECLARE 
CURSOR cstu is SELECT
    *
FROM tb_s where dept='�����';
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

for stu in cstu('������') loop
dbms_output.put_line('no:'||stu.sno||',name :'||stu.sname);
end loop;
 
end;



--����

CREATE OR REPLACE FUNCTION fun_getGrade(vno tb_s.sno%type)
RETURN tb_s.totalcredit%type   				--��������
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
dbms_output.put_line('001101 ��ѧ�֣�'||fun_getGrade('001101')); 
end;

-- �����
CREATE OR REPLACE PACKAGE  test_pkg
IS
  rtest test%ROWTYPE;
  --Add ...
  FUNCTION add_test(
           pname VARCHAR2, 
           psex VARCHAR2 DEFAULT '��')
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
    psex VARCHAR2 DEFAULT '��'
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
dbms_output.put_line('ɾ����'+re);

--�鿴�洢�����뺯��
SELECT * FROM  USER_PROCEDURES;  
SELECT * FROM  USER_PROCEDURES where object_type='FUNCTION';

--DROP FUNCTION ��������

select fun_getGrade('001101') grade from dual;


set SERVEROUTPU on;

--�鿴�洢�����뺯��
SELECT * FROM  USER_PROCEDURES;  
SELECT * FROM  USER_PROCEDURES where object_type='FUNCTION';

--DROP FUNCTION ��������

select fun_getGrade('001101') grade from dual;


--�洢����
CREATE OR REPLACE PROCEDURE proc_display_grade(vdept tb_s.dept%TYPE)
   --���β�ȱʡΪin���ͣ���������Ϊemp.job%TYPE
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
exec proc_display_grade('�����')
exec proc_display_grade('������');


CREATE OR REPLACE PROCEDURE proc_get_avg_grade(vdept tb_s.dept%TYPE,avg_grade out NUMBER )
   --���β�ȱʡΪin���ͣ���������Ϊemp.job%TYPE
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
proc_get_avg_grade('������',avg_grade);
DBMS_OUTPUT.put_line('avg grade:'||avg_grade);
end;

desc tb_s;
desc proc_get_avg_grade;






--�޲���
CREATE OR REPLACE PROCEDURE display_systime
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('CURRENT TIME IS '||sysdate);
END display_systime;
EXECUTE display_systime; 

-- 
CREATE OR REPLACE PROCEDURE proc_add_test(name in test.name%type,sex in test.sex%type DEFAULT '��' )
AS
BEGIN
INSERT into test values(in ,sq_test.nextval,sex);
END;


-- �����
CREATE OR REPLACE PACKAGE test_pkg IS
    rtest test%rowtype;
  --Add ...
    FUNCTION add_test (
        pname   VARCHAR2,
        psex    VARCHAR2 DEFAULT '��'
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
        psex    VARCHAR2 DEFAULT '��'
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
������
*/
/*

���������﷨��
create [or replace] tigger �������� ����ʱ�� �����¼�
on ����
[for each row]
begin
  pl/sql���
end
���У�
������������������������ơ����ڴ����������ݿ��Զ�ִ�еģ���˸�����ֻ��һ�����ƣ�û��ʵ�ʵ���;��
����ʱ�䣺ָ����������ʱִ�У���ֵ��ȡ��
before����ʾ�����ݿ⶯��֮ǰ������ִ��;
after����ʾ�����ݿ⶯��֮�󴥷���ִ�С�
�����¼���ָ����Щ���ݿ⶯���ᴥ���˴�������
insert�����ݿ����ᴥ���˴�����;
update�����ݿ��޸Ļᴥ���˴�����;
delete�����ݿ�ɾ���ᴥ���˴�������
�� �������ݿⴥ�������ڵı�
for each row���Ա��ÿһ�д�����ִ��һ�Ρ����û����һѡ���ֻ��������ִ��һ�Ρ�

��������ʵ�����¹��ܣ�

���ܣ�
1�� ����/���ƶԱ���޸�
2�� �Զ����������У����������ֶ�
3�� ǿ������һ����
4�� �ṩ��ƺ���־��¼
5�� ��ֹ��Ч��������
6�� ���ø��ӵ�ҵ���߼�
*/


CREATE TABLE del_test AS SELECT * FROM test WHERE 1=2; --������empͬ�ṹ�Ŀձ�

CREATE OR REPLACE TRIGGER tr_del_test 
   BEFORE DELETE 			--ָ������ʱ��Ϊɾ������ǰ����
   ON test 
   FOR EACH ROW   		--˵�����������м�������
BEGIN                                                   --���޸�ǰ���ݲ��뵽��־��¼��del_emp 
   INSERT INTO del_test 
VALUES( :old.name, :old.aid, :old.sex );
END;




create or replace trigger auth_secure before insert or update or delete 
on tb_s
begin
   IF(to_char(sysdate,'DY')='������') THEN
       RAISE_APPLICATION_ERROR(-20600,'��������ĩ�޸ı�tb_emp');
   END IF;
END;

--ʹ�ô�����ʵ���������


CREATE OR REPLACE TRIGGER trg_test_aid
BEFORE INSERT ON test
  FOR EACH ROW--�Ա��ÿһ�д�����ִ��һ��
DECLARE
  NEXT_ID NUMBER;
BEGIN
  SELECT sq_test.NEXTVAL INTO NEXT_ID FROM DUAL;
  :NEW.aid := NEXT_ID; --:NEW��ʾ�²����������¼
END;

insert into test(name,sex) values('admin','��');
insert into test(name,sex) values('test','Ů');
COMMIT;
SELECT * FROM test;


--������¼���Ա�
CREATE TABLE test_log(
   l_user   VARCHAR2(15),
   l_type   VARCHAR2(15),
   l_date   VARCHAR2(30)
);



--����������
CREATE OR REPLACE TRIGGER trg_test_log
AFTER DELETE OR INSERT OR UPDATE ON TEST
DECLARE
  V_TYPE TEST_LOG.L_TYPE%TYPE;
BEGIN
  IF INSERTING THEN
    --INSERT����
    V_TYPE := 'INSERT';
    DBMS_OUTPUT.PUT_LINE('��¼�Ѿ��ɹ����룬���Ѽ�¼����־');
  ELSIF UPDATING THEN
    --UPDATE����
    V_TYPE := 'UPDATE';
    DBMS_OUTPUT.PUT_LINE('��¼�Ѿ��ɹ����£����Ѽ�¼����־');
  ELSIF DELETING THEN
    --DELETE����
    V_TYPE := 'DELETE';
    DBMS_OUTPUT.PUT_LINE('��¼�Ѿ��ɹ�ɾ�������Ѽ�¼����־');
  END IF;
  INSERT INTO TEST_LOG
  VALUES
    (USER, V_TYPE, TO_CHAR(SYSDATE, 'yyyy-mm-dd hh24:mi:ss')); --USER��ʾ��ǰ�û���
END;

--�����������ֱ�ִ��DML���
insert into test(name,sex) values('hello all','��');
set SERVEROUTPUT ON
UPDATE test SET name = 'ni hap' WHERE aid = '201762';
DELETE test WHERE aid = '201762';
--Ȼ��鿴Ч��
SELECT * FROM test;
SELECT * FROM test_log;





