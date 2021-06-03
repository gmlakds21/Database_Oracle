package seunghee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class _01_JDBC_Test {
	public static void main(String[] args) {
		
	    // 1. JDBC 드라이버를 메모리에 적재함
		Connection conn = null;
	    try {
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        // MariaDB - Class.forName("org.mariadb.jdbc.Driver")
	        
	        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	        String user = "playgroundA";
	        String pw = "playground2020";
	        
	        conn = DriverManager.getConnection(url, user, pw);
	        System.out.println("Database에 연결되었습니다.");
	    } catch (ClassNotFoundException cnf) {
	        System.out.println("JDBC 드라이버를 설치하세요");
	    } catch (SQLException sqle) {
	    	System.out.println("DB 접속실패");
	    } catch (Exception e) {
	    	System.out.println("Unknown error");
	    	e.printStackTrace();
	    } finally {
	    	if(conn != null) {
	    		try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
	    	}
	    }
	}
}
