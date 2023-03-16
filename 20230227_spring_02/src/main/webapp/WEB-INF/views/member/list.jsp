<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원목록</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<style>
	.f-3 {
		display: flex;
		height: 50px;
		width:300px;
	}
	.f-3 div:not(:last-child){
		border: 1px black solid;
		width: 100px;
		flex-shrink: 0;
	}
	.f-3 div:last-child{
		border: 1px black solid;
		width: 150px;
	}
</style>
</head>
<body>
<div class="f-3">
	<div>아이디</div>
	<div>이름</div>
	<div>이메일</div>
</div>
<c:forEach items="${memberlist }" var="member">
<a href = "<%=request.getContextPath()%>/member/info?id=${member.id }">
<div class="f-3">
		<div>${member.id }</div>
		<div>${member.name }</div>
		<div>${member.email }</div>
</div>
</a>
</c:forEach>
</body>
</html>