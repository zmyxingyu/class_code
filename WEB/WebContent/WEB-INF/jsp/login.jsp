<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录页面</title>
</head>
<body>
	<h2 align="center">
		<font color=red>用户登录页面</font>
	</h2>
	<form action="${APP}/user/login" method="post">
		<table align="center" border="1" style="border-collapse: collapse;">
			<tr>
				<td>用户名:</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="登录" name="login"></td>
				<td><input type="reset" value="重置" name="reset"></td>
			</tr>
		</table>
		<p align="center">
			<a href="${APP}/user/register" color=blue>注册用户</a>
		</p>
	</form>
</body>
</html>