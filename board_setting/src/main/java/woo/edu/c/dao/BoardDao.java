package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;

public interface BoardDao {

	List<testVo> test();
	
	List<boardVo> boardList();
	
	int boardRegi(boardVo vo);
	
	boardVo boardDetail(int boardNo);
	
	int boardUpdate(boardVo vo);
	
	int boardDelete(int boardNo);
	
	/*------------ 캘린더------------- */
	List<CalendarVo> schList(CalendarVo vo);
	
	int schRegi(CalendarVo vo);
	
	int schDel(int calNo);
	
	List<CalendarVo> schView(CalendarVo vo);

}
