package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class DuplidChkServlet
 */
@WebServlet("/dupid.lo")
public class DuplidChkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DuplidChkServlet() {
        super();
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
	//1. 전달받은 데이터 읽기
		String id = request.getParameter("id");
		System.out.println("전달받은데이터: "+id);
	//2. DB 다녀오기
		//int result = new MemberService().dupIdChk(request.getParameter("id"));
		
	//3. 결과에 따라 페이지 전달(페이지 이동 안함)
		PrintWriter out = response.getWriter();
	//	out.println(result);
		out.flush();
		out.close();
		
		
		
	}
}
