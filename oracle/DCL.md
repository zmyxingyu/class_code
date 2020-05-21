###  创建用户

```
-- USER SQL
CREATE USER "STUDENT" IDENTIFIED BY "student"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

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