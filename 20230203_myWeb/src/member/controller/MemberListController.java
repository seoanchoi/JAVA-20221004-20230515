package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.model.vo.EmpDto;
import member.model.service.MemberService;
import member.model.vo.MemberVo;

/**
 * Servlet implementation class MemberListController
 */
@WebServlet("/MemberList")
public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object b = new Object();
		String a = (String)b;
		
//		String c = "a";
//		Object d = c;
//		Object d = new String();
//		String e = (String)d;
//		
//		Object f = new String();
//		EmpDto g = (EmpDto)f;
		
		// 로그인 되어있는가?
		try {
		Object obj = request.getSession().getAttribute("loginss");
		if(obj instanceof String) {
			String loginss = (String)obj;
			// 로그인한 계정의 롤에 따라 보여줄지 말지 결정
			if(loginss.equals("Y")) {
				List<MemberVo> volist = new MemberService().selectMemberList();
				request.setAttribute("memberlist", volist);
				request.getRequestDispatcher("/WEB-INF/memberlist.jsp").forward(request, response);
				return;
			}
		}
		
//		List<Integer> list1 = new ArrayList<Integer>();
//		List<String> list2 = new ArrayList<String>();
//		list1.add();
//		list2.add();
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		//로그인 세션 정보가 비정상적일 경우 /로 이동함
		response.sendRedirect(request.getContextPath()+"/");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
