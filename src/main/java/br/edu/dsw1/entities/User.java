package br.edu.dsw1.entities;

import java.time.LocalDateTime;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class User {
	private String username;
	private String password;
	private final List<LocalDateTime> dateTimeLoginHistory;
	
	public User() {
		dateTimeLoginHistory = new LinkedList<>();
	}
	
	public User(String username, String password) {
		this();
		this.username = username;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void addDateTimeLogin(LocalDateTime dateTime) {
		dateTimeLoginHistory.add(dateTime);
	}
	
	public List<LocalDateTime> getHistory() {
		return dateTimeLoginHistory;
	}

	@Override
	public int hashCode() {
		return Objects.hash(password, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return Objects.equals(password, other.password) && Objects.equals(username, other.username);
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + "]";
	}
}
