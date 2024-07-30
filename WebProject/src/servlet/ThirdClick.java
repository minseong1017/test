package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

@WebServlet("/ThirdClick")
public class ThirdClick extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession(false); // 세션이 존재하지 않으면 null을 반환
	    request.setCharacterEncoding("UTF-8");
	    if (session != null) {
	    	 String userId = (String) session.getAttribute("userId");
	         String userName = (String) session.getAttribute("userName");
	         Integer userPoint = (Integer) session.getAttribute("userPoint");
	         MemberDAO mDAO = new MemberDAO();
	         if(userPoint >= 300000) {
	        	 try {
					mDAO.buyClass(userId, userPoint-300000);
					session.setAttribute("userPoint", userPoint-300000);
					request.setAttribute("buyComplete", "C++");
					request.getRequestDispatcher("mainpage.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
	         }else {
	        	 request.setAttribute("buyFailed", true);
	        	 request.getRequestDispatcher("mainpage.jsp").forward(request, response);
	         }
	         
	    }
	    
	}
}
