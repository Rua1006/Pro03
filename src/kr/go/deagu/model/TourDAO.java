package kr.go.deagu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.go.deagu.dto.TourDTO;

public class TourDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	
	public int addtour(TourDTO tour){
		int cnt = 0;
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_INSERT);
			pstmt.setString(1, tour.getTitle());
			pstmt.setString(2, tour.getContent());
			pstmt.setString(3, tour.getFile1());
			pstmt.setString(4, tour.getFilename());
			cnt = pstmt.executeUpdate();
			
		}catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		}catch(SQLException e){
			System.out.println("SQL 구문 실패");
		}catch(Exception e){
			System.out.println("잘못된연산");
		}finally{
			Maria.close(rs, pstmt, con);
		}
		return cnt;
	}
}
