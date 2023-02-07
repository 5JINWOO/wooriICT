package woo.edu.c.service;

import java.util.List;

import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;

public interface BoardService {

	List<testVo> test();

	/* 게시글조회 */
	List<boardVo> boardList();

	/* 게시글 등록 */
	int boardRegi(boardVo vo);

	/* 게시글 상세 */
	boardVo boardDetail(int boardNo);
	
	/* 게시글 수정 */
	int boardUpdate(boardVo vo);
	
	/* 게시물 삭제 */
	int boardDelete(int boardNo);
	
	/*------------ 캘린더------------- */
	List<CalendarVo> schList(CalendarVo vo);
	
	/* 스케줄 등록 */
	int schRegi(CalendarVo vo);
	
	/* 스케줄 삭제 */
	int schDel(int calNo);
	
	List<CalendarVo> schView(CalendarVo vo);
	
}
