<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri= "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="./module/css_js_import.jsp" %>
</head>
<body>
	<%@ include file="./module/top_nav.jsp" %>
	<h1>회원가입</h1>
	<c:url var="joinUrl" value="/join" />
	<form action="${joinUrl }" method="post">
		<div>
			<label>아이디</label>
			<input type="text" name="userId"> 
			<c:if test= "${not empty requestScope.error} }">
				<span style="color: red;">${requestScope.error }</span>
			</c:if>
		</div>
		<div>
			<label>패스워드</label>
			<input type="password" name="password"> 
		</div>
		<div>
			<label>이메일</label>
			<input type="email" name="email" value="${param.email }"> 
		</div>
		<div>
			<button type="submit">가입</button>
		</div>
	</form>
</body>
</html>