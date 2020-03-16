package com.sist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.model.BoardDAO;
import com.sist.model.BoardDTO;

@WebServlet("/cont.do")
public class ContServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int board_no = Integer.parseInt(request.getParameter("no"));
		BoardDAO dao = new BoardDAO();
		dao.boardHit(board_no); // 해당 번호 글의 조회수 증가 메서드 호출
		BoardDTO cont = dao.getCont(board_no); // 여기서 한번 더 DAO에 접근할 것이므로 위의 boardHit에서 con 객체를 닫아주면 안된다.
	
		request.setAttribute("Cont",cont);
	
		RequestDispatcher rd = request.getRequestDispatcher("board_cont.jsp");
		rd.forward(request, response);
	}

}












