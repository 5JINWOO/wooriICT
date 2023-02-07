package woo.edu.c.controller;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import woo.edu.c.service.BoardService;
import woo.edu.c.vo.CalendarVo;
import woo.edu.c.vo.boardVo;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	
	// 메인 화면
	@RequestMapping(value = "/board/home")
	public String home(Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("/board/home");
		return "home";
	}
	
	/*
	 * // test
	 * 
	 * @RequestMapping(value = "/board/boardList", method = RequestMethod.GET)
	 * public String boardList(Model model) throws Exception {
	 * logger.info("/board/test"); List<testVo> test = boardService.test();
	 * model.addAttribute("boardList", test); return "/board/boardhome"; }
	 */
	// board 목록
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String boardList(Model model) throws Exception {
		logger.info("/board/list");
		List<boardVo> boardList = boardService.boardList();
		System.out.println("boardList====="+boardList);
		model.addAttribute("boardList", boardList); // Model addAttribute(변수명, Object value) model에 담은 데이터를 json화
		return "/board/boardList";
	}
	// board 글쓰기화면
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public String boardWrite(Model model) throws Exception {
		logger.info("/board/write");
		return "/board/boardWrite";
	}	
	// board 글등록
	@ResponseBody
	@RequestMapping(value = "/board/regi", method = RequestMethod.POST)
	public int boardRegi(boardVo vo) throws Exception {
		logger.info("/board/regi");		
		System.out.println(vo);
		int boardRegi = boardService.boardRegi(vo);	
		return boardRegi;
	}
	// board 글수정
	@ResponseBody
    @RequestMapping(value = "/board/update", method = RequestMethod.POST)
    public int boardUpdate(boardVo vo) throws Exception {
	    logger.info("/board/update");
	    int boardUpdate = boardService.boardUpdate(vo);	 	
	 	System.out.println(boardUpdate); 	
		return boardUpdate;
		
   }
    // board 글삭제
    @RequestMapping(value = "/board/delete", method = RequestMethod.GET)
    public String boardDelete(int boardNo) throws Exception {
	   logger.info("/board/delete");
	 	int boardDelete = boardService.boardDelete(boardNo);		
		if(boardDelete == 1) {
			return "redirect:/board/list";
		}else 
			return "/board/boardUpdate";		
   }    
    
	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
	public String boardDetail(int boardNo, Model model) throws Exception {
		logger.info("/board/detail");
		boardVo boardDetail = boardService.boardDetail(boardNo);
		model.addAttribute("boardDetail", boardDetail);	
		System.out.println("boardDetail====="+boardDetail);
		return "/board/boardDetail"; 
	}
	@RequestMapping(value = "/board/updateView", method = RequestMethod.GET)
	public String boardUpdview(int boardNo, Model model) throws Exception {
		logger.info("/board/updateView");
		boardVo boardDetail = boardService.boardDetail(boardNo);
		model.addAttribute("boardDetail", boardDetail);	
		System.out.println("updateView"+boardDetail);
		return "/board/boardUpdate"; 
	}

//================================================================================================================================
	
//	ajax 게시판
	
	// ajax 화면
 	@RequestMapping(value = "/board/ajaxView", method = RequestMethod.GET)
	public String ajaxView() throws Exception {
		logger.info("/board/ajaxView");		
		return "/board/ajaxList";
	} 	
 	
 	//ajax 목록
 	@RequestMapping(value = "/board/ajaxList", method = RequestMethod.GET)
	public @ResponseBody List<boardVo> ajaxList() throws Exception {
 		List<boardVo> ajaxlist = boardService.boardList();
		logger.info("/board/ajaxList");	
		return ajaxlist;
	}
	//ajax 삭제
	
	 @RequestMapping(value = "/board/ajaxDelete", method = RequestMethod.GET)
	 public @ResponseBody String ajaxDelete(int boardNo) throws Exception {
		logger.info("/board/ajaxDelete");
		int ajaxDelete = boardService.boardDelete(boardNo);	
		System.out.println(ajaxDelete);	
		if(ajaxDelete >= 1) {
			return "Y";
		}else return "N";		
	 }
	//ajax 등록	
	@RequestMapping(value = "/board/ajaxRegi", method = RequestMethod.POST)
	public @ResponseBody int ajaxRegi(boardVo vo) throws Exception {
		logger.info("/board/ajaxRegi");
		System.out.println(vo);
		int ajaxRegi = boardService.boardRegi(vo);
		return ajaxRegi;
	}
	//ajax 글 상세
	@RequestMapping(value = "/board/ajaxDetail", method = RequestMethod.GET)
	public @ResponseBody boardVo ajaxDetail(int boardNo, Model model) throws Exception {
		logger.info("/board/ajaxDetail");
		boardVo ajaxDetail = boardService.boardDetail(boardNo);
		System.out.println("boardDetail====="+ajaxDetail);
		return ajaxDetail; 
	}

	//================================================================================================================================
	//자바스크립트 테스트
	@RequestMapping(value = "/board/jsTest")
	public String jsTest() throws Exception {
		logger.info("/board/jsTest");
		return "/board/jsTest";
	}
	//선택 삭제
	@RequestMapping(value = "/board/selDelete", method = RequestMethod.GET)
	public @ResponseBody String selDelete(@RequestParam(value="delList") int[] delList) throws Exception {
		logger.info("/board/selDelete");
		int ajaxDelete = 0;
		for(int i=0; i<=delList.length-1; i++) {
			boardService.boardDelete(delList[i]);
			ajaxDelete++;
		}		
		System.out.println(ajaxDelete);
		if (ajaxDelete >= 1) {
			return "Y";
		} else
			return "N";
	}
	//================================================================================================================================
	//계산기
	@RequestMapping(value = "/board/circulator")
	public String circulator() throws Exception {
		logger.info("/board/circulator");
		return "/board/circulator";
	}
	//================================================================================================================================
	//캘린더
	@RequestMapping(value = "/board/calendar")
	public String calendar() throws Exception {
		logger.info("/board/calendar");
		return "/board/calendar";
	}
	
	//스케쥴 데이터 유무 확인 
 	@RequestMapping(value = "/board/schView", method = RequestMethod.GET)
	public @ResponseBody List<CalendarVo> schView(CalendarVo vo) throws Exception {
 		logger.info("/board/schView"); 		
 		List<CalendarVo> schView = boardService.schView(vo);
 		System.out.println("view=========="+schView);
		return schView;		
	}
	
	//스케쥴 불러오기
 	@RequestMapping(value = "/board/schList", method = RequestMethod.GET)
	public @ResponseBody List<CalendarVo> schList(CalendarVo vo) throws Exception {
 		logger.info("/board/schList");
 		List<CalendarVo> schList = boardService.schList(vo);
 		System.out.println("list=========="+schList);
		return schList;
	}
	
	//스케줄 등록	
	@RequestMapping(value = "/board/schRegi", method = RequestMethod.POST)
	public @ResponseBody int schRegi(CalendarVo vo) throws Exception {
		logger.info("/board/schRegi");
		System.out.println(vo);
		int schRegi = boardService.schRegi(vo);
		return schRegi;
	}
	
	//스케줄 삭제
	 @RequestMapping(value = "/board/schDel", method = RequestMethod.GET)
	 public @ResponseBody String schDel(int calNo) throws Exception {
		logger.info("/board/schDel");
		int schDel = boardService.schDel(calNo);	
		System.out.println(schDel);	
		if(schDel >= 1) {
			return "Y";
		}else return "N";		
	 }
	
}

