package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

@WebServlet("/LoginTry")
public class LoginTry extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("전달된 id + pw = " + id+pw);
		MemberDAO mDAO = new MemberDAO();
		try {
			MemberDTO login = mDAO.tryLogin(id, pw);
			if(login != null) {
				HttpSession session = request.getSession();
	            session.setAttribute("userId", login.getId());
	            session.setAttribute("userName", login.getName());
	            session.setAttribute("userPoint", login.getPoint());
				if(id.equals("admin")) {
					request.getRequestDispatcher("admin.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("mainpage.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("loginFailed", true);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
