package kh.spring.s02.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.s02.board.model.service.BoardService;
import kh.spring.s02.board.model.vo.BoardVo;

@Controller
//@WebServlet("/boardinsert")
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView viewListBoard( ModelAndView mv) {
		System.out.println("board list controller!!!!");
		mv.addObject("boardlist", service.selectList());
		mv.setViewName("board/list");
		return mv;
	}
	
//	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void viewUpdateBoard() {
		
	}

	
	@GetMapping("/delete")
	public void viewDeleteBoard() {
		int boardNum = 10;
		int result = service.delete(boardNum);
	}
	
	@GetMapping("/read")
	public void viewReadBoard() {
		int boardNum = 1;
		String writer = "user22";
		BoardVo vo = service.selectOne(boardNum,  writer);
	}
	
	@GetMapping("/insert")
	public ModelAndView viewInsertBoard(
			ModelAndView mv
			, HttpServletRequest req
			, HttpSession session
			, BoardVo vo
			) {
		mv.setViewName("board/insert");
		return mv;
	}
	
//	@PostMapping("/insert")
	// TODO
	@GetMapping("/insertPostTest")
	public ModelAndView doInsertBoard(ModelAndView mv
			, BoardVo vo
			) {
		vo.setBoardContent("임시내용");
		vo.setBoardTitle("임시제목");
		vo.setBoardWriter("user22");
		int result = service.insert(vo);
		
		return mv;
	}
	
//	@RequestMapping(value = "/boardinsert")
	@RequestMapping("/test")
	public ModelAndView test(ModelAndView mv) {

		return mv;
	}
	
}