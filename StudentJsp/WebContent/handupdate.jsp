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

</body>
</html>