package services;

import java.util.ArrayList;

import dao.User;

public interface UserBusiness {
	public void addUser(User user);
	public void deleteUser(Long id);
	public User getUserById(Long id);
	public ArrayList<User> getAllUsers();
}
