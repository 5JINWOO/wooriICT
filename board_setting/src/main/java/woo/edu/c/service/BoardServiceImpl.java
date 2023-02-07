package woo.edu.c.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.BoardDao;
import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;


@Service
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private BoardDao boardDao;

	@Override
	public List<testVo> test() {
		return boardDao.test();
	}
	
	@Override
	public List<boardVo> boardList() {
		return boardDao.boardList();
	}
	
	@Override
	public int boardRegi(boardVo vo) {
		return boardDao.boardRegi(vo);
	}
	
	@Override
	public boardVo boardDetail(int boardNo) {
		return boardDao.boardDetail(boardNo);
	}	
	
	@Override
	public int boardUpdate(boardVo vo) {
		return boardDao.boardUpdate(vo);
	}
	
	@Override
	public int boardDelete(int boardNo) {
		return boardDao.boardDelete(boardNo);
	}
	
	/*------------ 캘린더------------- */
	@Override
	public List<CalendarVo> schList(CalendarVo vo) {
		return boardDao.schList(vo);
	}
	
	@Override
	public int schRegi(CalendarVo vo) {
		return boardDao.schRegi(vo);
	}
	
	@Override
	public int schDel(int calNo) {
		return boardDao.schDel(calNo);
	}	
	
	@Override
	public List<CalendarVo> schView(CalendarVo vo) {
		return boardDao.schView(vo);
	}
	
}
