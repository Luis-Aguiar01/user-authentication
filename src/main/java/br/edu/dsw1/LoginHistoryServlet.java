package br.edu.dsw1;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/history.do")
public class LoginHistoryServlet extends HttpServlet {
	private final static long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		var session = request.getSession(false);
		if (session == null) {
			response.sendRedirect("login.do");
		} else {
			response.sendRedirect("history.jsp");
		}
	}
}
