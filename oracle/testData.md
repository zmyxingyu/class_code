```

Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001101','王林','计算机','男','01-1月 -90',50,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001102','程明','计算机','男','02-1月 -90',50,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001103','王燕','计算机','女','03-1月 -90',50,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001104','韦严平','计算机','男','04-1月 -90',50,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001106','李方方','计算机','男','05-1月 -91',50,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001107','李明','计算机','男','06-1月 -93',54,'提前修完《数据结构》，并获学分');
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001108','林一帆','计算机','男','10-7月 -91',52,'已提前修完一门课程');
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001109','张强民','计算机','男','01-8月 -92',50,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001110','张蔚','计算机','女','22-1月 -94',50,'三好生');
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001111','赵琳','计算机','女','01-10月 -95',50,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001113','严红','计算机','女','01-1月 -94',48,'有一门课不及格，待补考');
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001201','王敏','通信工程','男','23-4月 -92',42,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001202','王林','通信工程','男','01-5月 -91',40,'有一门课不及格，待补考');
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001203','王玉民','通信工程','男','01-12月 -92',42,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001204','马琳琳','通信工程','女','22-1月 -90',42,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001206','李计','通信工程','男','01-1月 -95',42,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001210','李红庆','通信工程','男','01-1月 -93',44,'已提前修完一门课，并获得学分');
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001216','孙祥欣','通信工程','男','11-11月 -90',42,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001218','孙研','通信工程','男','01-1月 -92',42,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001221','刘燕敏','通信工程','女','01-1月 -95',42,null);
Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('001241','罗林琳','通信工程','女','01-3月 -90',50,'转专业学习');

Insert into TB_C (CNO,CNAME,TERM,CTIME,CREDIT) values ('101','计算机基础','1',80,5);
Insert into TB_C (CNO,CNAME,TERM,CTIME,CREDIT) values ('102','程序设计与语言','2',68,4);
Insert into TB_C (CNO,CNAME,TERM,CTIME,CREDIT) values ('206','离散数学','4',68,4);
Insert into TB_C (CNO,CNAME,TERM,CTIME,CREDIT) values ('208','数据结构','4',69,4);
Insert into TB_C (CNO,CNAME,TERM,CTIME,CREDIT) values ('209','操作系统','6',68,4);
Insert into TB_C (CNO,CNAME,TERM,CTIME,CREDIT) values ('210','计算机原理','7',85,5);
Insert into TB_C (CNO,CNAME,TERM,CTIME,CREDIT) values ('212','数据库原理','7',69,4);
Insert into TB_C (CNO,CNAME,TERM,CTIME,CREDIT) values ('301','计算机网络','7',51,3);
Insert into TB_C (CNO,CNAME,TERM,CTIME,CREDIT) values ('302','软件工程','7',51,3);


Insert into TB_SC (SNO,CNO,GRADE) values ('001101','101',80);
Insert into TB_SC (SNO,CNO,GRADE) values ('001101','102',78);
Insert into TB_SC (SNO,CNO,GRADE) values ('001101','206',76);
Insert into TB_SC (SNO,CNO,GRADE) values ('001102','102',78);
Insert into TB_SC (SNO,CNO,GRADE) values ('001102','206',78);
Insert into TB_SC (SNO,CNO,GRADE) values ('001103','101',62);
Insert into TB_SC (SNO,CNO,GRADE) values ('001103','102',70);
Insert into TB_SC (SNO,CNO,GRADE) values ('001103','206',81);
Insert into TB_SC (SNO,CNO,GRADE) values ('001104','101',90);
Insert into TB_SC (SNO,CNO,GRADE) values ('001104','102',84);
Insert into TB_SC (SNO,CNO,GRADE) values ('001104','206',65);
Insert into TB_SC (SNO,CNO,GRADE) values ('001106','101',71);
Insert into TB_SC (SNO,CNO,GRADE) values ('001106','102',71);
Insert into TB_SC (SNO,CNO,GRADE) values ('001106','206',80);
Insert into TB_SC (SNO,CNO,GRADE) values ('001107','101',78);
Insert into TB_SC (SNO,CNO,GRADE) values ('001107','102',80);
Insert into TB_SC (SNO,CNO,GRADE) values ('001107','206',87);
Insert into TB_SC (SNO,CNO,GRADE) values ('001108','101',85);
Insert into TB_SC (SNO,CNO,GRADE) values ('001108','102',64);
Insert into TB_SC (SNO,CNO,GRADE) values ('001108','206',87);
Insert into TB_SC (SNO,CNO,GRADE) values ('001109','101',66);
Insert into TB_SC (SNO,CNO,GRADE) values ('001109','102',85);
Insert into TB_SC (SNO,CNO,GRADE) values ('001109','206',70);
Insert into TB_SC (SNO,CNO,GRADE) values ('001110','101',95);
Insert into TB_SC (SNO,CNO,GRADE) values ('001110','102',90);
Insert into TB_SC (SNO,CNO,GRADE) values ('001110','206',89);
Insert into TB_SC (SNO,CNO,GRADE) values ('001111','101',91);
Insert into TB_SC (SNO,CNO,GRADE) values ('001111','102',70);
Insert into TB_SC (SNO,CNO,GRADE) values ('001111','206',76);
Insert into TB_SC (SNO,CNO,GRADE) values ('001113','101',63);
Insert into TB_SC (SNO,CNO,GRADE) values ('001113','102',79);
Insert into TB_SC (SNO,CNO,GRADE) values ('001113','206',60);
Insert into TB_SC (SNO,CNO,GRADE) values ('001201','101',46);
Insert into TB_SC (SNO,CNO,GRADE) values ('001202','101',65);
Insert into TB_SC (SNO,CNO,GRADE) values ('001203','101',87);
Insert into TB_SC (SNO,CNO,GRADE) values ('001204','101',91);
Insert into TB_SC (SNO,CNO,GRADE) values ('001210','101',76);
Insert into TB_SC (SNO,CNO,GRADE) values ('001216','101',81);
Insert into TB_SC (SNO,CNO,GRADE) values ('001218','101',82);
Insert into TB_SC (SNO,CNO,GRADE) values ('001220','101',82);
Insert into TB_SC (SNO,CNO,GRADE) values ('001221','101',76);
Insert into TB_SC (SNO,CNO,GRADE) values ('001241','101',90);
```