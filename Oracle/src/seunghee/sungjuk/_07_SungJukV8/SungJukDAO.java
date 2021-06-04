package seunghee.sungjuk._07_SungJukV8;

import java.util.ArrayList;

public interface SungJukDAO {
	String insertSungJuk(SungJukVO person);
	ArrayList<SungJukVO> selectSungJuk();
	SungJukVO selectOneSungJuk(String target);
	String updateSungJuk(SungJukVO person);
	String deleteSungJuk(String target);
}
