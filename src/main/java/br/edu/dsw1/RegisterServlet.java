package br.edu.dsw1;

import java.io.IOException;

import br.edu.dsw1.entities.User;
import br.edu.dsw1.repositories.UserDAO;
import br.edu.dsw1.repositories.UserDAOImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
	private final static long serialVersionUID = 1L;
	private final UserDAO repository;
	
	public RegisterServlet() {
		repository = UserDAOImp.getInstance();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		var username = request.getParameter("user");
		var password = request.getParameter("password");
		var out = response.getWriter();
		
		if (username != null && password != null) {
			if (isUsernameAvailable(username)) {
				var user = new User(username, password);
				repository.insertUser(user);
				response.sendRedirect("/login.jsp");
			} else {
				out.println("Nome de usuário já cadastrado.");
			}
		}
	}
	
	private boolean isUsernameAvailable(String username) {
		return repository.getAll().stream()
				.noneMatch(user -> user.getUsername().equalsIgnoreCase(username));
	}
}