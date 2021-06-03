package seunghee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class _02_JDBC_Statement_Basic {
	public static void main(String[] args) {
		
		// insert 문을 위한 값 입력 받기
		Scanner sc = new Scanner(System.in);
		System.out.print("Bookid : ");
		String bookid = sc.nextLine();
		System.out.print("Bookname : ");
		String bookname = sc.nextLine();
		System.out.print("Publisher : ");
		String publisher = sc.nextLine();
		System.out.print("Price : ");
		String price = sc.nextLine();
		
		// insert 문 작성
		String sql = "insert into Books values('"+bookid+"','"+bookname+"','"+publisher+"','"+price+"')";
		System.out.println(sql);
		
		// 드라이버 접속
		String drv = "oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(drv);
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버를 설치하세요");
			e.printStackTrace();
		}
		
		// JDBC 접속
		Connection conn = null;	
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String usr = "playgrounda";
		String pwd = "test1234";		
		try {
			conn = DriverManager.getConnection(url, usr, pwd);
			if(!conn.isClosed()) 
				System.out.println("playgroundA 데이터 베이스 접속 성공");
		} catch (SQLException e) {
			System.out.println("데이터 베이스 접속 실패");
			e.printStackTrace();
		}
		
		// SQL 문 실행하기
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			boolean isOk = stmt.execute(sql);
			if(!isOk)
				System.out.println("Insert 구문 실행 완료");
		} catch (SQLException e) {
			System.out.println("SQL 문 실행 실패");
			e.printStackTrace();
		}
		
		// 닫기
		if (stmt != null) {			
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
