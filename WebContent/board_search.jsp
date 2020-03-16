<%@page import="com.sist.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<BoardDTO> search = (List<BoardDTO>) request.getAttribute("List");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<hr width="50%" color="tomato">
		<h3>BOARD1 테이블 게시물 검색 목록</h3>
		<hr width="50%" color="tomato">
		<br> <br>
		<table border="1" cellspacing="0" width="400">
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>
			<%
				if (search.size() != 0) { // 검색한 레코드가 있으면
						// 검색된 레코드 수만큼 반복해서 웹에 출력
						for (int i = 0; i < search.size(); i++) {
							BoardDTO dto = search.get(i);
			%>
			<tr>
				<td><%=dto.getBoard_no()%></td>
				<td><a href="cont.do?no=<%=dto.getBoard_no()%>"> <!-- no라는 변수를 cont에 넘겨준다. -->
						<!-- ?변수명=값  >>> get방식 --> <%=dto.getBoard_title()%></a></td>
				<td><%=dto.getBoard_hit()%></td>
				<td><%=dto.getBoard_regdate()%></td>

			</tr>

			<%
				}
				} else {
			%>
			<tr>
				<td colspan="4" align="center">
					<h3>검색된 레코드가 없습니다</h3>
				</td>
			</tr>
			<%
				}
			%>

		</table>


		<br>
		<hr width="50%" color="tomato">
		<br> <input type="button" value="전체목록 "
			onclick="location.href ='select.do'"> <br>





	</div>

</body>
</html>