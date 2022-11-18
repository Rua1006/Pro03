package kr.go.deagu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.deagu.dto.ImpressDTO;

public class ImpressDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	
	public ArrayList<ImpressDTO> getImpressList(){
		ArrayList<ImpressDTO> impList = new ArrayList<ImpressDTO>();
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.IMPRESS_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ImpressDTO dto = new ImpressDTO();
				dto.setNo(rs.getInt("no"));
				dto.setCate(rs.getString("cate"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setStar(rs.getDouble("star"));
				dto.setRegdate(rs.getString("regdate"));
				impList.add(dto);
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
			return impList;
		}
	public ImpressDTO getImp(int no){
		ImpressDTO dto = new ImpressDTO();
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.IMPRESS_SELECT_ONE);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto.setNo(rs.getInt("no"));
				dto.setCate(rs.getString("cate"));
				dto.setTourno(rs.getString("tourno"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setStar(rs.getDouble("star"));
				dto.setImgSrc(rs.getString("imgSrc"));
				dto.setRegdate(rs.getString("regdate"));
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
		return dto;
	}
	public int addImp(ImpressDTO dto){
		int cnt = 0;
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.IMPRESS_INSERT);
			pstmt.setString(1, dto.getCate());
			pstmt.setString(2, dto.getTourno());
			pstmt.setString(3, dto.getContent());
			pstmt.setDouble(4, dto.getStar());
			pstmt.setString(5, dto.getImgSrc());
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
	public int delImp(int no){
		int cnt  = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.IMPRESS_DELETE);
			pstmt.setInt(1, no);
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
	public int modifyImp(ImpressDTO dto){
		int cnt = 0;
		try{
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.IMPRESS_UPDATE);
			pstmt.setString(1, dto.getCate());
			pstmt.setString(2, dto.getTourno());
			pstmt.setString(3, dto.getContent());
			pstmt.setDouble(4, dto.getStar());
			pstmt.setString(5, dto.getImgSrc());
			pstmt.setInt(6, dto.getNo());
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
}
