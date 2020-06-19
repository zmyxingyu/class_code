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
<style>
* {
	margin: 0;
	padding: 0;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 5px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}

.button1:hover {
	background-color: #4CAF50;
	color: white;
}
</style>
<body>

	<jsp:include page="top.jsp"></jsp:include>


	<div
		style="text-align: center; width: 60%; margin: auto; margin-top: 20px;">
		<form action="${APP}/student/query" method="get">
			<label for="no">name：</label> <input type="text" id="no" name="name">
			<input type="submit" value="query">
		</form>
		<div
			style="text-align: right; width: 60%; margin: 0 auto; margin-bottom: 20px;">
			<a class="botton button1" href="${APP}/student/add">add</a>
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
				window.location = "${APP}/student/delete/?no=" + id;
			} else {
			}
		}

		function updateStudent(id) {
			window.location = "${APP}/student/update/?no=" + id;
		}
	</script>
</body>
</html>