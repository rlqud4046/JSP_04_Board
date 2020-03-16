<%@page import="com.sist.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	BoardDTO dto = (BoardDTO) request.getAttribute("cont");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<hr width="50%" color="skyblue">
		<h3>BOARD1 테이블에 게시물 글쓰기 폼</h3>
		<hr width="50%" color="skyblue">

		<form action="<%=request.getContextPath()%>/updateOk.do" method="post">
			<%--type="hidden" : <form>태그에는 보이지 않고 데이터를 서블릿으로 전송하는 속성 --%>
			<input type="hidden" name="no" value="<%=dto.getBoard_no()%>">

			<table border="1" cellspacing="0" width="400">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer"
						value="<%=dto.getBoard_writer()%>" readonly></td>
				</tr>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="title"
						value="<%=dto.getBoard_title()%>"></td>
				</tr>
				<tr>
					<th>글내용</th>
					<td><textarea rows="7" cols="30" name="content"
							style="resize: none"><%=dto.getBoard_cont()%></textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="글수정">&ensp; <input type="reset" value="취소"
						onclick="history.back()"></td>
				</tr>

			</table>

		</form>


	</div>



</body>
</html>