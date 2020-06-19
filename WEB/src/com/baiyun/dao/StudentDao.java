package com.baiyun.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.baiyun.model.Student;
import com.baiyun.tools.ConnDB;

import ioc.annotation.Bean;

@Bean(id="studentDao")
public class StudentDao {

	private ConnDB connDB;

	public StudentDao() {
		connDB = new ConnDB();
	}

	/**
	 * 
	 * @param sql
	 * @return
	 */
	public List<Student> queryStudents(String sql) {
		List<Student> students = new ArrayList<Student>();
		ResultSet rs = connDB.executeQuery(sql);

		try {
			while (rs.next()) {
				Student student = new Student();
				student.setId(rs.getString("SNO"));
				student.setName(rs.getString("SNAME"));
				student.setDept(rs.getString("DEPT"));
				student.setSex(rs.getString("SEX"));
				student.setTotalCredit(rs.getInt("TOTALCREDIT"));
				students.add(student);
			}
		} catch (SQLException e) {
			System.out.println("sss");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return students;

	}

	public int add(Student stu) {
		int flag = 0;
		String strP = "Insert into TB_S (SNO,SNAME,DEPT,SEX,BIRTHDAY,TOTALCREDIT,REMARKS) values ('%s' , '%s' , '%s'  , '%s' , '01-1月 -90',%d,null)";
		String sql = String.format(strP, stu.getId(), stu.getName(), stu.getDept(), "男", stu.getTotalCredit());
		System.out.println(sql);
		flag = connDB.executeUpdate(sql);
		return flag;
	}

	public int delStudent(String id) {
		int flag = 0;
		String sqlP = "delete from tb_s where sno = '%s'";
		flag = connDB.executeUpdate(String.format(sqlP, id));
		return flag;
	}

	public int updateStudent(Student stu) {
		int flag = 0;
		String sqlP = "UPDATE tb_s set sname = '%s' ,dept = '%s',sex='%s',totalcredit=%d where sno = '%s'";
		String sql = String.format(sqlP, stu.getName(), stu.getDept(), stu.getSex(), stu.getTotalCredit(), stu.getId());
		System.out.println(sql);
		flag = connDB.executeUpdate(sql);
		return flag;
	}

}
