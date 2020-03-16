package com.sist.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.model.BoardDAO;
import com.sist.model.BoardDTO;

@WebServlet("/search.do")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 한글 인코딩 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		
		// 1. 검색 창에서 넘어온 데이터를 처리
		String find_field = request.getParameter("find_field");
		String find_name = request.getParameter("find_name");
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> search = dao.searchBoard(find_field, find_name);
		
		request.setAttribute("List", search);
		RequestDispatcher rd = request.getRequestDispatcher("board_search.jsp");
		rd.forward(request, response);
	}

}
