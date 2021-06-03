package seunghee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class _04_JDBC_Statement_Function {
	public static void main(String[] args) {
		
		// JDBC 접속
		Connection conn = null;
		Statement stmt = null;
		try {
			String sql = makeSql();
			conn = makeConn();
			stmt = conn.createStatement();
			int cnt = stmt.executeUpdate(sql);
			if (cnt > 0) {
				System.out.println("데이터 추가 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(stmt, conn);
		}
	}
	
	// SQL 문 생성
	public static String makeSql() {
		Scanner sc = new Scanner(System.in);

		System.out.print("Bookid : ");
		String bookid = sc.nextLine();
		System.out.print("Bookname : ");
		String bookname = sc.nextLine();
		System.out.print("Publisher : ");
		String publisher = sc.nextLine();
		System.out.print("Price : ");
		String price = sc.nextLine();
		
		String sql = "insert into Books values('"+bookid+"','"+bookname+"','"+publisher+"','"+price+"')";
		System.out.println(sql);
		return sql;
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
	public static void closeConn(Statement stmt, Connection conn) {
		try {
			if(stmt != null) { stmt.close(); }
			if(conn != null) { conn.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
