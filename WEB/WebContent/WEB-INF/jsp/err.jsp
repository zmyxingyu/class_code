<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<center>
		<h2>Err</h2>
		<p style="color: red;">${err}</p>
		<c:if test="${showLogin}">
			<p align="center">
				<a href="${APP }/user/login" color=blue>去登录</a>
			</p>
		</c:if>
		<c:if test="${showRegist}">
			<p align="center">
				<a href="${APP }/user/regist" color=blue>去注册</a>
			</p>
		</c:if>
	</center>
</body>
</html>