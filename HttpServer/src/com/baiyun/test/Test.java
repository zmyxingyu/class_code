package com.baiyun.test;

import java.util.List;

import com.baiyun.dao.StudentDao;
import com.baiyun.model.Student;

public class Test {

	public static void main(String[] args) {
		StudentDao sDao = new StudentDao();
		List<Student> list = sDao.queryStudents("select * from tb_s");
		for (Student stu : list) {
			System.out.println(stu);
		}

	}

}
