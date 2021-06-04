package seunghee.sungjuk._07_SungJukV8;

public class SungJukVO {
	
	private int sno;
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private double mean;
	private char grd;
	private String regdate;
 
	public SungJukVO() { }
	
	public SungJukVO(String name, int kor, int eng, int mat) {
		this.name = name;
	    this.kor = kor;
	    this.eng = eng;
	    this.mat = mat;
	}  
	
	public SungJukVO(int sno, String name, int kor, int eng, int mat, String regdate) {
		this.sno = sno;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.regdate = regdate;
	}
	
	public SungJukVO(int sno, String name, int kor, int eng, int mat, int tot, double mean, char grd, String regdate) {
		super();
		this.sno = sno;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.tot = tot;
		this.mean = mean;
		this.grd = grd;
		this.regdate = regdate;
	}

	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
    public void setName(String name) {
    	this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public int getTot() {
		return tot;
	}	
	public void setTot(int tot) {
		this.tot = tot;
	}
	public double getMean() {
		return mean;
	}
	public void setMean(double mean) {
		this.mean = mean;
	}
	public char getGrd() {
		return grd;
	}
	public void setGrd(char grd) {
		this.grd = grd;
	}
}