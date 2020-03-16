<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<hr width="50%" color="red">
		<h3>BOARD1 메인 페이지</h3>
		<hr width="50%" color="red">
		<br> <br> <br>
		<%--현재 프로젝트명을 반환하는 메서드 --%>
		<a href="<%=request.getContextPath()%>/select.do">[레코드 검색]</a>
		<!-- 두가지 방식 다 사용 가능하나 원칙적으로 위의 방식을 쓴다. -->

	</div>

</body>
</html>