package seunghee.sungjuk._07_SungJukV8;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SungJukJDBC {
	
	public String insertSQL = "insert into SungJuk (sno, name, kor, eng, mat, tot, mean, grd) values (sj_seq.nextval,?,?,?,?,?,?,?)";
	public String selectSQL = "select sno, name, kor, eng, mat, regdate from Sungjuk order by sno";
	public String selectOneSQL = "select * from Sungjuk where sno = ?";
	public String updateSQL = "update Sungjuk set kor=?, eng=? ,mat=?, tot=?, mean=?, grd=?, regdate=sysdate where sno=?";
	public String deleteSQL = "delete from Sungjuk where sno = ?";
	
	public Connection makeConn() {
		Connection conn = null;
		String drv = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String usr = "sungjuk";
		String pwd = "test1234";
		
		try {
			Class.forName(drv);
			conn = DriverManager.getConnection(url, usr, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null) {rs.close();}
			if (pstmt != null) {pstmt.close();}
			if (conn != null) {conn.close();}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void closeConn(PreparedStatement pstmt, Connection conn) {
		try {
			if (pstmt != null) {pstmt.close();}
			if (conn != null) {conn.close();}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
