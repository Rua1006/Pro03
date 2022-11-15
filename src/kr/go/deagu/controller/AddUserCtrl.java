package kr.go.deagu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crypto.util.AES256;

import kr.go.deagu.dto.UserDTO;
import kr.go.deagu.model.UserDAO;


@WebServlet("/AddUserCtrl.do")
public class AddUserCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//필요한거 id, pw, name, birth, email, tel, address
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		
		boolean result = false;
		int cnt = 0, suc = 0;
		UserDAO dao = new UserDAO();
		cnt = dao.idCheckPro(id);
		
		UserDTO user = new UserDTO();
		
		String key = "%02x";
		String encrypted = "";
		
		try{
			encrypted = AES256.encryptAES256(pw, key);
			System.out.println("비밀번호 암호화 : "+encrypted);
		}catch(Exception e){
			e.printStackTrace();
		}
		if(cnt>=1){
			result = false;
			response.sendRedirect("./user/signUp.jsp?qid="+id);
		}else {
			result = true;
			user.setId(id);
			user.setPw(encrypted);
			user.setName(name);
			user.setAddress(address1 + "<br>" +address2);   //주소 줄 바꿈하기 위해 쓰는 경우
			user.setTel(tel);
			user.setEmail(email);
			user.setBirth(birth);
			suc = dao.addUser(user);
			if(suc>=1){
				response.sendRedirect(request.getContextPath());
			} else {
				response.sendRedirect("./user/signUp.jsp?qid="+id);
			}
		}
	}
}
