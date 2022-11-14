package kr.go.deagu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.go.deagu.dto.UserDTO;

public class UserDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	int cnt = 0;
	
	public int loginUser(UserDTO dto){
	int cnt = 0;
	try{
		con = Maria.getConnection();
		//로그인
		pstmt = con.prepareStatement(Maria.USER_LOGIN);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPw());
		rs = pstmt.executeQuery();
		
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
	return cnt;
	}
	
	public int joinUser(UserDTO dto){
	int cnt = 0;
	try{
		con = Maria.getConnection();
		pstmt = con.prepareStatement(Maria.USER_JOIN);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPw());
		pstmt.setString(3, dto.getName());
		pstmt.setString(4, dto.getAddress());
		pstmt.setString(5, dto.getTel());
		cnt = pstmt.executeUpdate();
		
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
		Maria.close(pstmt, con);
	}
	return cnt;
	}
	
	public int idCheckPro(String id){	//중복 아이디 체크 / 회원가입시 가입 전 체크
		int cnt = 0;
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.USER_ID_CHECK);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){ cnt = cnt + 1; } else { cnt = 0; }
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
