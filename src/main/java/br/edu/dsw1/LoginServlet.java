package br.edu.dsw1;

import java.io.IOException;
import java.time.LocalDateTime;

import br.edu.dsw1.repositories.UserDAO;
import br.edu.dsw1.repositories.UserDAOImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private final static long serialVersionUID = 1L;
	private final UserDAO repository;
	
	public LoginServlet() {
		repository = UserDAOImp.getInstance();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		var username = request.getParameter("username");
		var password = request.getParameter("password");
		
		if (isValidUserCredentials(username, password)) {
			var session = request.getSession();
			var user = repository.findByUsername(username).get();
			session.setAttribute("user", username);
			user.addDateTimeLogin(LocalDateTime.now());
			response.sendRedirect("welcome.jsp");
		} else {
			response.sendRedirect("login.jsp?error=true");
		}
	}
	
	private boolean isValidUserCredentials(String username, String password) {
		var user = repository.findByUsername(username).orElse(null);
		return user != null && 
			   user.getUsername().equals(username) && 
			   user.getPassword().equals(password);
	}
}
