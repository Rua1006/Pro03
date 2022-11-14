package kr.go.deagu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.deagu.dto.UserDTO;
import kr.go.deagu.model.UserDAO;

import com.crypto.util.AES256;


@WebServlet("/UserUpdateCtrl.do")
public class UserUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address = request.getParameter("address");
		if(address1!=null){
			address = address1 + "<br>" + address2;
		}
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String birth = request.getParameter("birth");
        
		boolean result = false;

		int cnt = 0, suc = 0;
		UserDAO dao = new UserDAO();	
		UserDTO user = new UserDTO();
        String key = "%02x";
        String encrypted = "";
        try {
			encrypted = AES256.encryptAES256(pw, key);
		} catch (Exception e) {
			e.printStackTrace();
		} 
        
		user.setId(id);
		user.setPw(encrypted);
		user.setName(name);
		user.setAddress(address);
		user.setTel(tel);
		user.setEmail(email);
		user.setBirth(birth);
		suc = dao.updateUser(user);
		
		if(suc>=1){
			response.sendRedirect("/");
		} else {
			response.sendRedirect("UserInfoCtrl");
		}
	}
}
