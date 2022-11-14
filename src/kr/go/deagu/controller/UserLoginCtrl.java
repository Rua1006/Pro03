package kr.go.deagu.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.deagu.dto.UserDTO;
import kr.go.deagu.model.UserDAO;


@WebServlet("/UserLoginCtrl.do")
public class UserLoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		int cnt = dao.loginUser(dto);
		HttpSession session = request.getSession();

		if(cnt>0) {
			session.setAttribute("sid", id);
			session.setAttribute("name", "사용자");
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("./user/login.jsp");
		}
	}
}
