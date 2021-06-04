package seunghee.sungjuk._07_SungJukV8;

import java.util.ArrayList;
import java.util.Scanner;

public class SungJukServiceImpl implements SungJukService {

	Scanner sc = new Scanner(System.in);
	SungJukDAOImpl dao = new SungJukDAOImpl();
	
	@Override
	public void display() {
		StringBuilder sb = new StringBuilder();
		sb.append("-----------------\n");
		sb.append(" 1. 학생 성적 입력 \n");
		sb.append(" 2. 학생 성적 조회 \n");
		sb.append(" 3. 학생 성적 상세 조회 \n");
		sb.append(" 4. 학생 성적 수정 \n");
		sb.append(" 5. 학생 성적 삭제 \n");
		sb.append(" 0. 프로그램 종료 \n");
		sb.append("-----------------\n");
		sb.append(" 원하시는 작업은 ? : ");
		System.out.print(sb.toString());
	}

	@Override
	public void readSungJuk() {
		SungJukVO person = new SungJukVO();
		
		System.out.print("이름을 입력해 주세요 : ");
		person.setName(sc.nextLine());
		System.out.print("국어 점수를 입력해 주세요 : ");
		person.setKor(Integer.parseInt(sc.nextLine()));
		System.out.print("영어 점수를 입력해 주세요 : ");
		person.setEng(Integer.parseInt(sc.nextLine()));
		System.out.print("수학 점수를 입력해 주세요 : ");
		person.setMat(Integer.parseInt(sc.nextLine()));
		
		computeSungJuk(person);
		
		String result = dao.insertSungJuk(person);
		System.out.println(result);
	}
	
	@Override
	public void computeSungJuk(SungJukVO person) {
		person.setTot(person.getKor() + person.getEng() + person.getMat());
		person.setMean(person.getTot()/3.0);
		
		switch((int) person.getMean()/10) {
			case 10 : 
			case 9 : person.setGrd('수'); break;
			case 8 : person.setGrd('우'); break;
			case 7 : person.setGrd('미'); break;
			case 6 : person.setGrd('양'); break;
			default : person.setGrd('가');
		}
	}
	
	@Override
	public void showSungJuk() {
		String fmt = "번호 : %2d, 이름 : %s, 국어 : %d, 영어 : %d, 수학 : %d, 등록일 : %s\n";
		StringBuilder sb = new StringBuilder();
		
		ArrayList<SungJukVO> persons = dao.selectSungJuk();
		for(SungJukVO person : persons) {
			String result = String.format(fmt, person.getSno(), person.getName(), person.getKor(), person.getEng(), person.getMat(), person.getRegdate());
			sb.append(result);
		}
		System.out.println(sb.toString());
	}

	@Override
	public void showAllSungJuk() {
		System.out.print("상세 조회할 학생의 번호를 입력해 주세요 : ");
		String target = sc.nextLine();
		
		SungJukVO person = dao.selectOneSungJuk(target);
		String fmt = "번호 : %2d, 이름 : %s, 국어 : %d, 영어 : %d, 수학 : %d, "
				+ "총점 : %d, 평균 : %.2f, 학점 : %s, 등록일 : %s\n";
		String result = String.format(fmt, person.getSno(), person.getName(), person.getKor(), person.getEng(), person.getMat(), person.getTot(),
				person.getMean(), person.getGrd(), person.getRegdate());
		System.out.println(result);
	}

	@Override
	public void modifySungJuk() {
		SungJukVO person = new SungJukVO();
		
		System.out.print("수정할 학생의 번호를 입력해 주세요 : ");
		person.setSno(Integer.parseInt(sc.nextLine()));
		System.out.print("국어 점수를 입력해 주세요 : ");
		person.setKor(Integer.parseInt(sc.nextLine()));
		System.out.print("영어 점수를 입력해 주세요 : ");
		person.setEng(Integer.parseInt(sc.nextLine()));
		System.out.print("수학 점수를 입력해 주세요 : ");
		person.setMat(Integer.parseInt(sc.nextLine()));
		
		computeSungJuk(person);
		
		String result = dao.updateSungJuk(person);
		System.out.println(result);
	}

	@Override
	public void removeSungJuk() {
		System.out.print("삭제할 성적 번호를 입력해 주세요 : ");
		String target = sc.nextLine();
		
		String result = dao.deleteSungJuk(target);
		System.out.println(result);
	}
}
