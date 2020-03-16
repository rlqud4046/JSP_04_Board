<%@page import="com.sist.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<BoardDTO> board = (List<BoardDTO>) request.getAttribute("List");
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
		<h3>BOARD1 테이블 전체 게시물 목록</h3>
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
				if (board.size() != 0) { // 검색한 레코드가 있으면
						// 검색된 레코드 수만큼 반복해서 웹에 출력
						for (int i = 0; i < board.size(); i++) {
							BoardDTO dto = board.get(i);
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
		<br> <input type="button" value="글쓰기"
			onclick="location.href ='board_write.jsp'"> <br>
		<form action="<%=request.getContextPath()%>/search.do" method="post">
			<select name="find_field"> <%-- 검색을 누르면 넘어가는 타입 --%>
				<option value="title">제목</option>
				<option value="cont">내용</option>
				<option value="title_cont">제목+내용</option>
			</select> 
			<input type="text" name="find_name" size="15"> <%-- 검색을 누르면 넘어가는 내용 --%>
			<input type="submit" value="검색">
		</form>




	</div>











</body>
</html>