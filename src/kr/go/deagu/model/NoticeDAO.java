package kr.go.deagu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.deagu.dto.NoticeDTO;

public class NoticeDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	
	public ArrayList<NoticeDTO> getNoticeList(){
		ArrayList<NoticeDTO> notiList = new ArrayList<NoticeDTO>();
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.NOTICE_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				NoticeDTO dto = new NoticeDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegDate(rs.getString("regdate"));
				dto.setVisited(rs.getInt("visited"));
				notiList.add(dto);
			}
		}catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("SQL 구문 실패");
			e.printStackTrace();
		}catch(Exception e){
			System.out.println("잘못된연산");
			e.printStackTrace();
		}finally{
			Maria.close(rs, pstmt, con);
		}
		return notiList;
	}
	
}
