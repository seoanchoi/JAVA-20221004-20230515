package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dto.BookmarkDTO;
import model.dto.UserDTO;
import model.service.BookmarkService;
import page.Paging;

public class BookmarkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageNumber = req.getParameter("p");
		int pNum;
		if(pageNumber == null || pageNumber.isEmpty()) {
			pNum = 1;
		} else {
			pNum = Integer.parseInt(pageNumber);
		}
		
		Cookie cookie = null;
		Cookie[] cookies = req.getCookies();
		for(Cookie c: cookies) {
			if(c.getName().equals("cnt")) {
				cookie = c;
			}
		}
		
		String cnt = req.getParameter("cnt");
		if(cnt != null) {
			if(cnt.isEmpty()) {
				if(cookie != null) {
					cnt = cookie.getValue();
				} else {
					cnt = "10"; // 초기값
				}
			}
		} else {
			if(cookie != null) {
				cnt = cookie.getValue();
			} else {
				cnt = "10";
			}
		}
		
		cookie = new Cookie("cnt", cnt);
		cookie.setMaxAge(60 * 60 * 24 * 5);
		resp.addCookie(cookie);
		
		HttpSession session = req.getSession();
		
		UserDTO userData = (UserDTO)session.getAttribute("user");
		BookmarkDTO dto = new BookmarkDTO();
		dto.setUserId(userData.getUserId());
		
		BookmarkService service = new BookmarkService();
		Paging paging = service.getPage(dto, pNum, Integer.parseInt(cnt));
		req.setAttribute("paging", paging);
		
		req.getRequestDispatcher("/WEB-INF/view/bookmark.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		UserDTO userData = (UserDTO)session.getAttribute("user");
		
		BookmarkDTO dto = new BookmarkDTO();
		dto.setUserId(userData.getUserId());
		dto.setUrl(req.getParameter("url"));
		dto.setName(req.getParameter("name"));
		
		BookmarkService service = new BookmarkService();
		boolean result = service.add(dto);
		
		if(result) {
			resp.sendRedirect("./bookmark");
		} else {
			resp.sendRedirect("./fail");
		}
	}

}