package dao;

import java.util.ArrayList;

public interface UserDAO {
	public void addUser(User user);
	public void deleteUser(Long id);
	public void updateUser(User user);
	public User getUserById(Long id);
	public ArrayList<User> getAllUsers();
}
