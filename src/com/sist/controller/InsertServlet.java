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

@WebServlet("/insert.do")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset =UTF-8");

		// 1. 게시물 입력폼 창에서 넘어온 데이터들을 처리해 주자
		String board_writer = request.getParameter("writer").trim();
		String board_title = request.getParameter("title").trim();
		String board_cont = request.getParameter("content");
		String board_pwd = request.getParameter("pwd").trim();

		// 2. DB에 전송할 객체인 BoardDTO 객체에 파라미터로 받은 데이터들을 setter() 메서드에 인자로 넘겨주자
		BoardDTO dto = new BoardDTO();
		dto.setBoard_writer(board_writer);
		dto.setBoard_title(board_title);
		dto.setBoard_cont(board_cont);
		dto.setBoard_pwd(board_pwd);
		
		// 3. BoardDTO 객체를 DB에 전송해 주어야 한다. BoardDAO 객체 생성 후 해당 메서드의 인자로 dto객체를 넘겨주면 된다.
		BoardDAO dao = new BoardDAO();
		int res = dao.insertBoard(dto);
		
		PrintWriter out = response.getWriter();
		if(res == 1) { // 게시물 작성에 성공한 경우
			response.sendRedirect("select.do"); // 글 작성이 끝나고 바로 글 목록으로 이동하게 함			
		}else { // 게시물 작성에 실패한 경우
			out.println("<script>");
			out.println("alert('게시물 작성에 실패했습니다.')");
			out.println("history.back()"); // 이전 페이지인 게시물 작성 폼 페이지로 이동
			out.println("</script>");
		}
		
	}

}
