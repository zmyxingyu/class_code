###  创建用户

```
-- USER SQL
CREATE USER "STUDENT" IDENTIFIED BY "123456"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

```
### 删除用户
概述：一般以dba的身份去删除某个用户，如果用其它用户去删除用户则需要具有drop user的权限。
比如drop user 用户名 【cascade】
注意：在删除用户时，如果要删除的用户，已经创建了表，那么就需要在删除的时候带一个参数cascade，即把该用户及表一同删除;

```
drop user test cascade
```


### 权限

```
-- ROLES
GRANT "DBA" TO "student" ;
GRANT "CONNECT" TO "student" ;
GRANT "RESOURCE" TO "student" ;

REVOKE CONNECT, RESOURCE FROM 用户名;
REVOKE SELECT ON 表名 FROM 用户名;
REVOKE SELECT, INSERT, DELETE ON表名 FROM 用户名1, 用户名2;

```

```
CONNECT(基本的连接), RESOURCE(程序开发), DBA(数据库管理)

常用的数据对象权限有以下五个:
ALL ON 数据对象名,
SELECT ON 数据对象名,
UPDATE ON 数据对象名,
DELETE ON 数据对象名,
INSERT ON 数据对象名, 
ALTER  ON 数据对象名


CONNECT角色： 
--是授予最终用户的典型权利，最基本的
        ALTER SESSION --修改会话
        CREATE CLUSTER --建立聚簇
        CREATE DATABASE LINK --建立数据库链接
        CREATE SEQUENCE --建立序列
        CREATE SESSION --建立会话
        CREATE SYNONYM --建立同义词
        CREATE VIEW --建立视图
RESOURCE角色：
    --是授予开发人员的
        CREATE CLUSTER --建立聚簇
        CREATE PROCEDURE --建立过程
        CREATE SEQUENCE --建立序列
        CREATE TABLE --建表
        CREATE TRIGGER --建立触发器
        CREATE TYPE --建立类
        
从dba_sys_privs里可以查到:
SQL> select grantee,privilege from dba_sys_privs where grantee='RESOURCE' order by privilege;
```



```
1.查看所有用户：
  select * from dba_users;
  select * from all_users;
  select * from user_users;
2.查看用户或角色系统权限：
  select * from dba_sys_privs;
  select * from user_sys_privs;
3.查看用户对象权限：
  select * from dba_tab_privs;
  select * from all_tab_privs;
  select * from user_tab_privs;
4.查看所有角色：
  select * from dba_roles;
5.查看用户或角色所拥有的角色：
  select * from dba_role_privs;
  select * from user_role_privs;
  
  ```
  
  
  ### 用户权限
  Oracle数据库用户权限分为：系统权限和对象权限两种。
  
  #### 系统权限：比如：create session可以和数据库进行连接权限、create table、create view 等具有创建数据库对象权限。
  
  #### 对象权限：比如：对表中数据进行增删改查操作，拥有数据库对象权限的用户可以对所拥有的对象进行相应的操作。
  
 ####  数据库角色
  ** oracle数据库角色是若干系统权限的集合， ** 给Oracle用户进行授数据库角色，就是等于赋予该用户若干数据库系统权限。常用的数据库角色如下：
  
  CONNECT角色：connect角色是Oracle用户的基本角色，connect权限代表着用户可以和Oracle服务器进行连接，建立session（会 话）。
  
  RESOURCE角色：resouce角色是开发过程中常用的角色。 RESOURCE给用户提供了可以创建自己的对象，包括：表、视图、序列、过程、触发器、索引、包、类型等。
  
  DBA角色：DBA角色是管理数据库管理员该有的角色。它拥护系统了所有权限，和给其他用户授权的权限。SYSTEM用户就具有DBA权限。
  
  因此，在实际开发过程当中可以根据需求，把某个角色或系统权限赋予某个用户。授权语句如下：
  
  
  
  提示：
   
  系统权限只能通过DBA用户授权，对象权限有拥有该对象权限的对象授权（不一定是本身对象）！用户不能自己给自己授权！
  
  ```
  语法：授权
  
  --GRANT 对象权限 on 对象 TO 用户    
  grant select, insert, update, delete on JSQUSER to STUDENT;
   
  --GRANT 系统权限 to 用户
  grant select any table to STUDENT;
   
  --GRANT 角色 TO 用户
  grant connect to STUDENT;--授权connect角色
  grant resource to STUDENT;--授予resource角色
  
  
  语法：取消用户权限
  
  -- Revoke 对象权限 on 对象 from 用户 
  revoke select, insert, update, delete on JSQUSER from STUDENT;
   
  -- Revoke 系统权限  from 用户
  revoke SELECT ANY TABLE from STUDENT;
   
  -- Revoke 角色（role） from 用户
  revoke RESOURCE from STUDENT;
  
  
  语法：Oracle用户的其他操作
  
  --修改用户信息
  alter user STUDENT
    identified by ******  --修改密码
    account lock;--修改用户处于锁定状态或者解锁状态 （LOCK|UNLOCK ）
	
```