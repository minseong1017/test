package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

@WebServlet("/WatchAd")
public class WatchAd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession(false); // 세션이 존재하지 않으면 null을 반환
	    request.setCharacterEncoding("UTF-8");
	    if (session != null) {
	    	 String userId = (String) session.getAttribute("userId");
	         String userName = (String) session.getAttribute("userName");
	         Integer userPoint = (Integer) session.getAttribute("userPoint");
	         int newPoint = (int)(Math.random()*999+1);
	         MemberDAO mDAO = new MemberDAO();
	        	 try {
					mDAO.buyClass(userId, userPoint+newPoint);
					session.setAttribute("userPoint", userPoint+newPoint);
					request.setAttribute("watchAd", newPoint);
					request.getRequestDispatcher("mainpage.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
	         
	    }
	    
	}
}
