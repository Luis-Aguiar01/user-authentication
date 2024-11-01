package br.edu.dsw1.repositories;

import java.util.LinkedList;
import java.util.List;

import br.edu.dsw1.entities.User;

public class UserDAOImp implements UserDAO {
	
	private static UserDAOImp instance;
	private final List<User> users;
	
	private UserDAOImp() {
		users = new LinkedList<>();
	}
	
	@Override
	public List<User> getAll() {
		return users;
	}

	@Override
	public void insertUser(User user) {
		if (user != null && !users.contains(user)) {
			users.add(user);
		}
	}
	
	public static UserDAO getInstance() {
		if (instance == null) {
			instance = new UserDAOImp();
		}
		return instance;
	}
}
