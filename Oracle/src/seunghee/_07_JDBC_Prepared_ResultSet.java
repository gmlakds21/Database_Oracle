package seunghee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class _07_JDBC_Prepared_ResultSet {
	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from Books where BOOKNAME like ?";
		StringBuilder sb = new StringBuilder();
		String fmt = "%3s, %15s, %10s, %10s\n";
		
		Scanner sc = new Scanner(System.in);
		System.out.print("검색하실 도서 제목을 입력하세요 : ");
		String order = sc.nextLine();
		
		try {
			conn = makeConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+order+"%");
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				Books book = new Books(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				// VO 객체단위로 활용
				// 여기에서는 String.format 에 바로 넣어도 된다.
				String result = String.format(fmt, book.getBookid(), book.getBookname(), book.getPublisher(), book.getPrice());
				sb.append(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, conn);
		}
		
		System.out.println(sb.toString());
	}
	
	// 데이터 베이스 연결
	public static Connection makeConn() {
		Connection conn = null;
		String drv = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String usr = "playgrounda";
		String pwd = "test1234";
		
		try {
			Class.forName(drv);
			conn = DriverManager.getConnection(url, usr, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// 데이터베이스 연결 종료
	public static void closeConn(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if(rs != null) { rs.close(); }
			if(stmt != null) { stmt.close(); }
			if(conn != null) { conn.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}