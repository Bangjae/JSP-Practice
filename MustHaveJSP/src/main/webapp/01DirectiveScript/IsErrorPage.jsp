<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%> <!-- IsErrorPage 속성에 true를 지정 -->
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>IsErrorPage</title>
</head>
<body>
	<h2>서비스 중 일시적인 오류가 발생하였습니다.</h2>
	<div>
		<img src="../images/Error.jpg" alt="공사중입니다.">
	</div>
	<p>
		오류명 : <%= exception.getClass().getName() %> <br/>
		오류 메세지 : <%= exception.getMessage() %>
	</p>
</body>
</html>