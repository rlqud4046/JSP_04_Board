package com.sist.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.model.BoardDAO;
import com.sist.model.BoardDTO;

@WebServlet("/delete.do")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8"); 
		
		int board_no = Integer.parseInt(request.getParameter("no"));
		String board_pwd = request.getParameter("pwd").trim();
		
		// BoardDTO dto = new BoardDTO();  원칙적으로 dto로 데이터를 넘겨주어야 하나 아래처럼 메서드에 인자로 넘겨줘도 되긴함.
		
		BoardDAO dao = new BoardDAO();
		int res = dao.deleteBoard(board_no, board_pwd);
			
		PrintWriter out = response.getWriter();

		if (res > 0) {
			out.println("<script>");
			out.println("alert('게시물 삭제 성공')");
			out.println("location.href='select.do'"); 
			out.println("</script>");
		} else if (res == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.')");
			out.println("history.back()"); 
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('게시물 삭제에 실패했습니다.')");
			out.println("history.back()"); 
			out.println("</script>");

		}

	}

}
