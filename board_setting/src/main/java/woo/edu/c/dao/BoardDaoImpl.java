package woo.edu.c.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;
import woo.edu.c.vo.testVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// mybatis
	@Inject
	private SqlSession sql;
	
	private static String namespace = "boardMapper";

	@Override
	public List<testVo> test() {
		return sql.selectList(namespace + ".test");
	}
	
	@Override
	public List<boardVo> boardList() {
		return sql.selectList(namespace + ".boardList");
	}
	
	@Override
	public int boardRegi(boardVo vo) {
		return sql.insert(namespace + ".boardRegi", vo);
	}
	
	@Override
	public boardVo boardDetail(int boardNo) {
		return sql.selectOne(namespace + ".boardDetail", boardNo);
	}
	
	@Override
	public int boardUpdate(boardVo vo) {
		return sql.update(namespace + ".boardUpdate", vo);
	}
	
	@Override
	public int boardDelete(int boardNo) {
		return sql.delete(namespace + ".boardDelete", boardNo);
	}
	
	@Override
	public List<CalendarVo> schList(CalendarVo vo) {
		return sql.selectList(namespace + ".schList", vo);
	}
	
	@Override
	public int schRegi(CalendarVo vo) {
		return sql.insert(namespace + ".schRegi", vo);
	}
	
	@Override
	public int schDel(int calNo) {
		return sql.delete(namespace + ".schDel", calNo);
	}	
	
	@Override
	public List<CalendarVo> schView(CalendarVo vo) {
		return sql.selectList(namespace + ".schView", vo);
	}
}
