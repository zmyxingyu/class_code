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
<title>添加学生</title>
</head>
<body>

	<form action="">
		<table>
			<tbody>学生信息
			</tbody>
			<tr>
				<td><label>学号</label></td>
				<td><input type="text" name="no" id=""></td>
			</tr>
			<tr>
				<td><label>姓名</label></td>
				<td><input type="text" name="name" id=""></td>
			</tr>
			<tr>
				<td><label>部门</label></td>
				<td><input type="text" name="dept" id=""></td>
			</tr>
			<tr>
				<td><label>性别</label></td>
				<td><input type="text" name="sex" id=""></td>
			</tr>
			<tr>
				<td><label>学分</label></td>
				<td><input type="number" name="totalCridit" id=""></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="reset" value="reset"> <input
					type="submit" value="commit"></td>
			</tr>
		</table>
	</form>
	<%!StudentDao dao = new StudentDao();%>

	<%
		String id = request.getParameter("no");
		if (null != id && id.length() > 0) {
			String name = request.getParameter("name");
			String dept = request.getParameter("dept");
			String sex = request.getParameter("sex");	
			int totalCridit = Integer.valueOf(request.getParameter("totalCridit"));
			
			Student s = new Student();
			s.setId(id);
			s.setName(name);
			s.setDept(dept);
			s.setSex(sex);
			s.setTotalCredit(totalCridit);
			System.out.println(s.toString());
			int flag = dao.add(s);
			if (flag > 0) {
				response.sendRedirect("index.jsp");
			}
		}
	%>

</body>
</html>