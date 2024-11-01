package br.edu.dsw1.repositories;

import java.util.List;

import br.edu.dsw1.entities.User;

public interface UserDAO {
	List<User> getAll();
	void insertUser(User user);
}