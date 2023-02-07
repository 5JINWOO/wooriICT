package woo.edu.c.vo;

import java.util.Date;

public class CalendarVo {
	private int calNo;
	private String calYear;
	private String calMonth;
	private String calDay;
	private String calTime;
	private String calReq;
	private Date calDate;
	private String calContents;
	
	public int getCalNo() {
		return calNo;
	}
	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}
	public String getCalYear() {
		return calYear;
	}
	public void setCalYear(String calYear) {
		this.calYear = calYear;
	}
	public String getCalMonth() {
		return calMonth;
	}
	public void setCalMonth(String calMonth) {
		this.calMonth = calMonth;
	}
	public String getCalDay() {
		return calDay;
	}
	public void setCalDay(String calDay) {
		this.calDay = calDay;
	}
	public String getCalTime() {
		return calTime;
	}
	public void setCalTime(String calTime) {
		this.calTime = calTime;
	}
	public String getCalReq() {
		return calReq;
	}
	public void setCalReq(String calReq) {
		this.calReq = calReq;
	}
	public Date getCalDate() {
		return calDate;
	}
	public void setCalDate(Date calDate) {
		this.calDate = calDate;
	}
	public String getCalContents() {
		return calContents;
	}
	public void setCalContents(String calContents) {
		this.calContents = calContents;
	}
	
	@Override
	public String toString() {
		return "CalendarVo [달력번호===" + calNo + ", " + calYear + "년 " + calMonth + "월 " + calDay + "일 " + calTime  + "분, 중요여부 " + calReq  + ", 날짜 " + calDate + ", 내용 " + calContents +"]";
	}	

}
