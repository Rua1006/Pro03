package kr.go.deagu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.go.deagu.model.TourDAO;


@WebServlet("/AddTourCtrl.do")
public class AddTourCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String tourno = request.getParameter("tourno");
		String no = request.getParameter("no");
		
		TourDAO dao = new TourDAO();
		
		
		JSONObject json = new JSONObject();
		json.put("no", no);
		PrintWriter out = response.getWriter();
		out.println(json.toString());
		
	}

}
