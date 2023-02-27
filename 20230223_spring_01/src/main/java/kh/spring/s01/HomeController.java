package kh.spring.s01;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.spring.s01.board.model.vo.BoardVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/aaaa", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<String> boardvolist = sqlSession.selectList("board.list"); /* 보드맵퍼의 namespace.id */
		model.addAttribute("boardlist", boardvolist);

		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		// model: Controller ---전달데이터를 담는 객체--> JSP
		model.addAttribute("serverTime", formattedDate);	/* MVC -->req.setAtrribute */

		return "home";
	}
	
	@GetMapping("/home")
	public void aaa() {
		return;
	}

}
