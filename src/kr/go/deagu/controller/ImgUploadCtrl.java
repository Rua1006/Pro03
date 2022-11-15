package kr.go.deagu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.go.deagu.dto.PicDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/ImgUploadCtrl.do")
public class ImgUploadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int pos = Integer.parseInt(request.getParameter("pos"));
		int tourno = Integer.parseInt(request.getParameter("tourno"));
		String file1 = "", fileName = "";
		String pat = "./upload/";
		String realPat = "D:\\kbs\\pro01\\pro02\\WebContent\\upload";
		String saveDir = "upload";
		String encyType = "UTF-8";
		String realPath = "";
		int maxSize = 10*1024*1024;
		String pdata = request.getParameter("picname");
		
		try{
			ServletContext context = request.getServletContext();
			realPath = context.getRealPath(saveDir);
			
			MultipartRequest multi = new MultipartRequest(
					request, 
					pat, 
					maxSize, 
					"UTF-8",
					new DefaultFileRenamePolicy());
			
			PicDTO dto = new PicDTO();	
			
			pos = Integer.parseInt(multi.getParameter("pos"));
			tourno = Integer.parseInt(multi.getParameter("tourno"));
			file1 = multi.getParameter("file1");
			fileName = multi.getParameter("fileName");
			
			Enumeration files = multi.getFileNames();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		JSONObject json = new JSONObject();
		json.put("tourno", tourno);
		PrintWriter out = response.getWriter();
		out.println(json.toString());
	}

}
