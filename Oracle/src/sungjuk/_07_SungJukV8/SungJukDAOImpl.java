package sungjuk._07_SungJukV8;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SungJukDAOImpl implements SungJukDAO {

	SungJukJDBC jdbc = new SungJukJDBC();
	
	@Override
	public String insertSungJuk(SungJukVO person) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String result = "데이터 업로드 실패";
		
		try {
			conn = jdbc.makeConn();
			pstmt = conn.prepareStatement(jdbc.insertSQL);
			pstmt.setString(1, person.getName());
			pstmt.setInt(2, person.getKor());
			pstmt.setInt(3, person.getEng());
			pstmt.setInt(4, person.getMat());
			pstmt.setInt(5, person.getSum());
			pstmt.setDouble(6, person.getMean());
			pstmt.setString(7, String.valueOf(person.getGrd()));
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				result = "데이터 업로드 성공";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.closeConn(pstmt, conn);
		}
		return result;
	}

	@Override
	public ArrayList<SungJukVO> selectSungJuk() {
		ArrayList<SungJukVO> persons = new ArrayList();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = jdbc.makeConn();
			pstmt = conn.prepareStatement(jdbc.selectSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SungJukVO person = new SungJukVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6));
				persons.add(person);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbc.closeConn(rs, pstmt, conn);
		}
		return persons;
	}

	@Override
	public SungJukVO selectOneSungJuk(String target) {
		return null;
	}

	@Override
	public String updateSungJuk(SungJukVO person) {
		return null;
	}

	@Override
	public String deleteSungJuk(String target) {
		return null;
	}

}
