package kr.go.deagu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.deagu.dto.QnaDTO;

public class QnaDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	
	public ArrayList<QnaDTO> getQnaList(){
		ArrayList<QnaDTO> qnaList = new ArrayList<QnaDTO>();
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.QNA_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				QnaDTO dto = new QnaDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setAuthor(rs.getString("author"));
				dto.setResDate(rs.getDate("resdate"));
				dto.setLev(rs.getInt("lev"));
				dto.setParno(rs.getInt("parno"));
				dto.setSec(rs.getString("sec"));
				dto.setVisited(rs.getInt("visited"));
			}
		}catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("SQL 구문 실패");
			e.printStackTrace();
		}catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못하였습니다.");
			e.printStackTrace();
		}finally{
			Maria.close(rs, pstmt, con);
		}
		return qnaList;
	}
	public QnaDTO getQna(int no){
		QnaDTO dto = new QnaDTO();
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.QNA_VISITED_UP);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = con.prepareStatement(Maria.QNA_SELECT_ONE);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setAuthor(rs.getString("author"));
				dto.setResDate(rs.getDate("resdate"));
				dto.setLev(rs.getInt("lev"));
				dto.setParno(rs.getInt("parno"));
				dto.setSec(rs.getString("sec"));
				dto.setVisited(rs.getInt("visited"));
			}
		}catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("SQL 구문 실패");
			e.printStackTrace();
		}catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못하였습니다.");
			e.printStackTrace();
		}finally{
			Maria.close(rs, pstmt, con);
		}
		return dto;
	}
	public int addQna(QnaDTO dto){
		int cnt = 0;
		int no = 0;
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.QNA_INSERT);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getAuthor());
			pstmt.setString(4, dto.getSec());
			pstmt.setInt(5, dto.getLev());
			cnt = pstmt.executeUpdate();
			pstmt.close();
			pstmt = con.prepareStatement(Maria.QNA_LIMIT);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt("no");
			}
			rs.close();
			pstmt.close();
			System.out.println("추가 번호 :"+no);
			
			pstmt = con.prepareStatement(Maria.QNA_UPDATE_RE);
			pstmt.setInt(1, dto.getParno());
			pstmt.setInt(2, dto.getNo());
			cnt = pstmt.executeUpdate();
			
		}catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("SQL 구문 실패");
			e.printStackTrace();
		}catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못하였습니다.");
			e.printStackTrace();
		}finally{
			Maria.close(rs, pstmt, con);
		}
		return cnt;
	}	
	public int delQna(QnaDTO dto){
		int cnt = 0;
		int tranNo = 0;
		String no = null;
		try{
			con = Maria.getConnection();
			if(no!=null){
				tranNo = dto.getNo();
				pstmt = con.prepareStatement(Maria.QNA_DELETE);
			}else {
				tranNo = dto.getParno();
				pstmt = con.prepareStatement(Maria.QNA_DELETE_RE);
			}
			pstmt.setInt(1, tranNo);
			cnt = pstmt.executeUpdate();
			
		}catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("SQL 구문 실패");
			e.printStackTrace();
		}catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못하였습니다.");
			e.printStackTrace();
		}finally{
			Maria.close(pstmt, con);
		}
		return cnt;
	}
	public int modifyQna(QnaDTO dto){
		int cnt = 0;
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.QNA_UPDATE);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getAuthor());
			pstmt.setString(4, dto.getSec());
			pstmt.setInt(5, dto.getLev());
			pstmt.setInt(6, dto.getNo());
			cnt = pstmt.executeUpdate();
		}catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("SQL 구문 실패");
			e.printStackTrace();
		}catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못하였습니다.");
			e.printStackTrace();
		}finally{
			Maria.close(pstmt, con);
		}
		return cnt;
	}
}