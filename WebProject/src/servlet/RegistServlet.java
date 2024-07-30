package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;


@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		System.out.println("전달된 id + pw = " + id+pw+name);
		MemberDAO mDAO = new MemberDAO();
		try {
			mDAO.regist(id, pw, name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
}
