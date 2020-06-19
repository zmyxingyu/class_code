<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.top {
	overflow: hidden;
	height: 80px;
	background-color: #5b615b;
	position: relative;
	color: white;
}

.title {
	text-align: center;
	background-color: 006700;
	width: 100%;
}

.nav {
	position: absolute;
	right: 0;
	bottom: 0;
	right: 5%;
}

.nav a {
	text-decoration: none;
	display: inline-block;
	margin: 5px;
	color: white;
}

.nav a:hover {
	color: #3d057e;
}

.welcome {
	display: inline-block;
	margin-right: 20px;
}
</style>


<div class="top">
	<h2 class="title">学生信息管理系统</h2>
	<div class="nav">
		<c:if test="${empty sessionScope.userName }">
			<a href="${APP }/user/login">登录</a>
			<a href="${APP }/user/logout">注册</a>
		</c:if>
		<c:if test="${!empty sessionScope.userName }">
			<p class="welcome">欢迎：${ sessionScope.userName}</p>
			<a href="${APP }/user/logout">注销</a>
		</c:if>
	</div>
</div>
