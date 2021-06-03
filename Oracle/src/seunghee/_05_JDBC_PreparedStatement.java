package seunghee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class _05_JDBC_PreparedStatement {
	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into Books values(?,?,?,?)";
		
		try {
			Books book = makeVO();  // 값을 입력받음
			conn = makeConn();		// 데이터 베이스에 연결
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getBookid());
			pstmt.setString(2, book.getBookname());
			pstmt.setString(3, book.getPublisher());
			pstmt.setString(4, book.getPrice());
			
			int cnt = pstmt.executeUpdate(sql);
			if (cnt > 0) {
				System.out.println("데이터 추가 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, conn);
		}
	}

	// VO 단위로 정보 담기
	public static Books makeVO() {
		Scanner sc = new Scanner(System.in);
		Books book = null;

		System.out.print("Bookid : ");
		book.setBookid(sc.nextLine());
		System.out.print("Bookname : ");
		book.setBookname(sc.nextLine());
		System.out.print("Publisher : ");
		book.setPublisher(sc.nextLine());
		System.out.print("Price : ");
		book.setPrice(sc.nextLine());
		
		return book;
	}

	// 데이터베이스 연결
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
	public static void closeConn(PreparedStatement pstmt, Connection conn) {
		try {
			if(pstmt != null) { pstmt.close(); }
			if(conn != null) { conn.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
