package seunghee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class _03_JDBC_Statement {
	public static void main(String[] args) {
		
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
		
		// JDBC 접속
		Connection conn = null;	
		Statement stmt = null;
		String drv = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String usr = "playgrounda";
		String pwd = "test1234";
		
		try {
			Class.forName(drv);
			conn = DriverManager.getConnection(url, usr, pwd);
			stmt = conn.createStatement();
			int cnt = stmt.executeUpdate(sql);
			if (cnt > 0) {
				System.out.println("데이터 추가 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt != null) { stmt.close(); }
				if(conn != null) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
