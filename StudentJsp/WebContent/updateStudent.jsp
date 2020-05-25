<%@page import="com.baiyun.dao.StudentDao"%>
<%@page import="com.baiyun.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改学生</title>
</head>
<body>
	<%!StudentDao dao = new StudentDao();
	String id;%>

	<%
		request.setCharacterEncoding("utf-8");
		id = request.getParameter("id");
		if (null != id && id.length() > 0) {
			String sql = "select * from tb_s where sno=" + id;
			List<Student> list = dao.queryStudents(sql);
			if (list != null && list.size() > 0) {
				Student stu = list.get(0);
				pageContext.setAttribute("student", stu);
			}
		}

		String action = request.getParameter("action");
		System.out.println(action);
		if (null != action && action.length() > 0) {
			if ("update".equalsIgnoreCase(action)) {
				String id = request.getParameter("no");
				String name = request.getParameter("name");
				String dept = request.getParameter("dept");
				System.out.println("name:" + name);
				System.out.println("dept:" + dept);
				String sex = request.getParameter("sex");
				int totalCridit = Integer.valueOf(request.getParameter("totalCredit"));

				Student s = new Student();
				s.setId(id);
				s.setName(name);
				s.setDept(dept);
				s.setSex(sex);
				s.setTotalCredit(totalCridit);

				int flag = dao.updateStudent(s);
				if (flag > 0) {
					response.sendRedirect("index.jsp");
				}
			}
		}
	%>
	<form action="handupdate.jsp?action=update" method="post">
		<table>
			<tbody>学生信息
			</tbody>
			<tr>
				<td><label>学号</label></td>
				<td><input readonly type="text" name="no" id=""
					value="${ student.id}"></td>
			</tr>
			<tr>
				<td><label>姓名</label></td>
				<td><input type="text" name="name" id=""
					value="${ student.name}"></td>
			</tr>
			<tr>
				<td><label>部门</label></td>
				<td><input type="text" name="dept" id=""
					value="${ student.dept}"></td>
			</tr>
			<tr>
				<td><label>性别</label></td>
				<td><input type="text" name="sex" id="" value="${ student.sex}"></td>
			</tr>
			<tr>
				<td><label>学分</label></td>
				<td><input type="number" name="totalCredit" id=""
					value="${ student.totalCredit}"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="reset" value="reset"> <input
					type="submit" value="commit"></td>
			</tr>
		</table>
	</form>

</body>
</html>