<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册页面</title>
</head>
<body>
	<h2 align="center">
		<font color=red>用户注册页面</font>
	</h2>
	<form action="${APP }/user/register" method="post">
		<table align="center" border="1" style="border-collapse: collapse;">
			<tr>
				<td>用户名:</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>确认密码:</td>
				<td><input type="password" name="password2"></td>
			</tr>
			<tr>
				<td><input type="submit" value="注册" name="login"></td>
				<td><input type="reset" value="重置" name="reset"></td>
			</tr>
		</table>
		<p align="center">
			<a href="${APP }/user/login" color=blue>登录用户</a>
		</p>
	</form>
</body>
</html>