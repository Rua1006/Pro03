package kr.go.deagu.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.deagu.dto.TourDTO;
import kr.go.deagu.model.TourDAO;

@WebServlet("/GetPlaceSearchCtrl.do")
public class GetPlaceSearchCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

	
		TourDAO dao = new TourDAO();
		ArrayList<TourDTO> tourList = null;
		
		String sel = request.getParameter("sel");
		String keyword = request.getParameter("keyword");
		String place="", comment2="";
		
		if(sel.equals("place")){
			place=keyword;
			tourList = dao.getTourSerachList(place);			
		} else if(sel.equals("comment2")){
			comment2=keyword;
			tourList = dao.getTourSerachList(comment2, keyword);
		} else if(sel.equals("place+comment2")){
			place = keyword;
			comment2 = keyword;
			tourList = dao.getTourSerachList(place, comment2, keyword);
		} else {
			tourList = dao.getTourList();
		}
		
		//dao로 부터 받은 데이터를 view에 디스패치함
		request.setAttribute("list", tourList);
		
		RequestDispatcher view = request.getRequestDispatcher("./tour/tourList.jsp");
		view.forward(request, response);
	}
}