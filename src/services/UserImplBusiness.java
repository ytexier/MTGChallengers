package services;

import java.util.ArrayList;

import dao.User;
import dao.UserDAO;

public class UserImplBusiness implements UserBusiness {

	private UserDAO dao;
	
	@Override
	public void addUser(User user) {
		dao.addUser(user);
	}

	@Override
	public void deleteUser(Long id) {
		dao.deleteUser(id);
	}

	@Override
	public User getUserById(Long id) {
		return dao.getUserById(id);
	}

	@Override
	public ArrayList<User> getAllUsers() {
		return dao.getAllUsers();
	}

}
