<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 수정</title>
<%@ include file="./module/css_js_import.jsp" %>
</head>
<body>
	<%@ include file="./module/top_nav.jsp" %>
	<h2>수정 폼</h2>
	<form action="./update" method="post">
		<input type="text" name="nickname" value="<%=((VisitDTO)request.getAttribute("dataList")).getnickname() %>">
		<input type="text" name="context" value="<%=((VisitDTO)request.getAttribute("dataList")).getcontext() %>">
		<div>
			<button type="submit">수정</button>
		</div>
	</form>
</body>
</html>