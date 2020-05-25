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
<title>学生信息</title>
</head>
<body>
	<h2 style="text-align: center;">学生信息</h2>

	<div style="text-align: center; width: 60%; margin: 0 auto;">
		<h2>查询学生信息</h2>
		<form action="" method="get">
			<label for="no">name：</label> <input type="text" id="no" name="name">
			<input type="submit" value="query">
		</form>
		<div
			style="text-align: right; width: 60%; margin: 0 auto; margin-bottom: 20px;">
			<a href="addStudent.jsp">add</a>
		</div>
	</div>



	<table border="1"
		style="text-align: center; border-collapse: collapse; width: 60%; margin: 0 auto;">
		<tr>
			<th>学号</th>
			<th>姓名</th>
			<th>部门</th>
			<th>性别</th>
			<th>学分</th>
			<th colspan="2">action</th>
		</tr>
		<%!StudentDao dao = new StudentDao();%>

		<%
			String action = request.getParameter("action");
			if (action != null && action.length() > 0) {
				if ("delete".equalsIgnoreCase(action)) {
					String id = request.getParameter("id");
					int flag = dao.delStudent(id);
					if (flag > 0) {
						request.getRequestDispatcher("msg.jsp?msg=success");

					}
				}
			}
			String name = request.getParameter("name");
			if (name != null) {
				String sql = "select * from tb_s where sname like '%" + name + "%'";
				System.out.println(name);
				List<Student> list = dao.queryStudents(sql);
				System.out.println(list);
				pageContext.setAttribute("students", list);
			} else {
				List<Student> l = dao.queryStudents("select * from tb_s");
				pageContext.setAttribute("students", l);
			}
			System.out.println(name);
		%>

		<c:forEach items="${students}" var="stu" varStatus="row">
			<tr>
				<td>${stu.id}</td>
				<td>${stu.name}</td>
				<td>${stu.dept}</td>
				<td>${stu.sex}</td>
				<td>${stu.totalCredit}</td>
				<td><a onclick="updateStudent('${stu.id}')">修改</a></td>
				<td><a onclick="deleteStudent('${stu.id}')">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	<script type="text/javascript">
		function deleteStudent(id) {
			if (confirm("你确定要删除吗？") == true) {
				window.location = "index.jsp?action=delete&id=" + id;
			} else {
			}
		}

		function updateStudent(id) {
			window.location = "updateStudent.jsp?id=" + id;
		}
	</script>
</body>
</html>