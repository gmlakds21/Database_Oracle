package seunghee.sungjuk._07_SungJukV8;

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
			pstmt.setInt(5, person.getTot());
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
		ArrayList<SungJukVO> persons = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = jdbc.makeConn();
			pstmt = conn.prepareStatement(jdbc.selectSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SungJukVO person = new SungJukVO();
				person.setSno(rs.getInt(1));
				person.setName(rs.getString(2));
				person.setKor(rs.getInt(3));
				person.setEng(rs.getInt(4));
				person.setMat(rs.getInt(5));
				person.setRegdate(rs.getString(6));
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
		SungJukVO person = new SungJukVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = jdbc.makeConn();
			pstmt = conn.prepareStatement(jdbc.selectOneSQL);
			pstmt.setString(1, target);
			rs = pstmt.executeQuery();
			if( rs.next()) {
				person.setSno(rs.getInt(1));
				person.setName(rs.getString(2));
				person.setKor(rs.getInt(3));
				person.setEng(rs.getInt(4));
				person.setMat(rs.getInt(5));
				person.setTot(rs.getInt(6));
				person.setMean(rs.getDouble(7));
				person.setGrd(rs.getString(8).charAt(0));
				person.setRegdate(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbc.closeConn(rs, pstmt, conn);
		}
		
		return person;
	}

	@Override
	public String updateSungJuk(SungJukVO person) {
		String result = "업데이트 실패";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = jdbc.makeConn();
			pstmt = conn.prepareStatement(jdbc.updateSQL);
			pstmt.setInt(1, person.getKor());
			pstmt.setInt(2, person.getEng());
			pstmt.setInt(3, person.getMat());
			pstmt.setInt(4, person.getTot());
			pstmt.setDouble(5, person.getMean());
			pstmt.setString(6, String.valueOf(person.getGrd()));
			pstmt.setInt(7, person.getSno());
			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				result = "업데이트 성공";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.closeConn(pstmt, conn);
		}
		
		return result;
	}

	@Override
	public String deleteSungJuk(String target) {
		String result = "삭제 실패";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = jdbc.makeConn();
			pstmt = conn.prepareStatement(jdbc.deleteSQL);
			pstmt.setString(1, target);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				result = "삭제 성공";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbc.closeConn(pstmt, conn);
		}
		
		return result;
	}

}
