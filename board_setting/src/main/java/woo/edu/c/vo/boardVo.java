package woo.edu.c.vo;

import java.util.Date;

public class boardVo {
	private int boardNo; 
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private Date boardDate;
	
	public int getBoardNo() {
		return boardNo;
	}
	
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	
	@Override
	public String toString() {
		return "BoardVo [게시글번호=" + boardNo + ", 제목" + boardTitle + ", 내용=" + boardContent + ", 작성자" + boardWriter + ", 작성날짜" + boardDate +"]";
	}
	
}
