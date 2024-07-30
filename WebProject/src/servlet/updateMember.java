package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/updateMember")
public class updateMember {
	private static final long serialVersionUID = 1L;
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String id = request.getParameter("id");
	        MemberDAO memberDao = new MemberDAO();
	        
	        try {
	            request.getRequestDispatcher("admin.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
