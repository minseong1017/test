package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MemberDTO;

public class MemberDAO {
	Connection getConnection() throws Exception{

		String driver = "oracle.jdbc.driver.OracleDriver";
	    String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    String dbId = "user0416";
	    String dbPw = "pass1234";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		return conn;
	}
	
	public void regist(String id, String pw, String name) throws Exception{
		String sql = "INSERT INTO member(ID, PW, NAME) VALUES(?, ?, ?)";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.executeQuery();
		pstmt.close();
		conn.close();
	}
	
	public MemberDTO tryLogin(String id, String pw) throws Exception{
		String sql = "SELECT * FROM member WHERE id=? AND pw=?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs= pstmt.executeQuery();
		if(rs.next()) {
			String name = rs.getString("name");
			int point = rs.getInt("point");
			
			return new MemberDTO(id, pw, name, point);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return null;
	}
	public void buyClass(String id, Integer point) throws Exception{
		String sql = "UPDATE member SET point = ? WHERE id = ?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, point);
		pstmt.setString(2, id);
		pstmt.executeQuery();
		
		pstmt.close();
		conn.close();
	}
	public ArrayList<MemberDTO> memberAll() throws Exception{
		String sql = "SELECT * FROM member";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<MemberDTO> mDTO = new ArrayList<MemberDTO>();
		while(rs.next()) {
			String name = rs.getString("name");
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			Integer point = rs.getInt("point");
			
			mDTO.add(new MemberDTO(id, pw, name, point));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return mDTO;
	}
	
	public void deleteMember(String id) throws Exception{
		String sql = "DELETE FROM member WHERE id = ?";
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeQuery();
		pstmt.close();
		conn.close();
	}
	public MemberDTO getInfo(String id) throws Exception{
		String sql = "SELECT * FROM member WHERE id=?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs= pstmt.executeQuery();
		if(rs.next()) {
			String name = rs.getString("name");
			String pw = rs.getString("pw");
			int point = rs.getInt("point");
			
			return new MemberDTO(id, pw, name, point);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return null;
	}
}
