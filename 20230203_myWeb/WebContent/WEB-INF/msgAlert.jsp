<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var m = "${msg}";
alert(m);
location.replace("<%=request.getContextPath()%>/");
<%-- location.href="<%=request.getContextPath()%>/";  --%>  
</script>
</body>
</html>