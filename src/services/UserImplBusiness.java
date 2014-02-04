package services;

import java.util.ArrayList;

import dao.User;
import dao.UserDAO;

public class UserImplBusiness implements UserBusiness {

	private UserDAO dao;
	

	public void addUser(User user) {
		dao.addUser(user);
	}

	public void deleteUser(Long id) {
		dao.deleteUser(id);
	}

	public User getUserById(Long id) {
		return dao.getUserById(id);
	}

	public ArrayList<User> getAllUsers() {
		return dao.getAllUsers();
	}

	public void setDao(UserDAO dao) {
		this.dao = dao;
	}

	
}
