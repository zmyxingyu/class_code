package com.baiyun.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.baiyun.model.Student;
import com.baiyun.tools.ConnDB;

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
	public List<Student> queryStudents(String sql){
		List<Student> students = new ArrayList<Student>();
		ResultSet rs = connDB.executeQuery(sql);
		
		try {
			while(rs.next()) {
				Student student = new Student();
				student.setId(rs.getString("SNO"));
				student.setName(rs.getString("SNAME"));
				student.setDept(rs.getString("DEPT"));
				student.setSex(rs.getString("SEX"));
				students.add(student);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return students;
		
	}

}
