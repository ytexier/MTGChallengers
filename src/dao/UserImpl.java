package dao;

import java.util.ArrayList;

public class UserImpl implements UserDAO {

	private ArrayList<User> users = new ArrayList<User>();
	
	public void init(){
		System.out.println("Bean User Init");
	}
	
	public void addUser(User user) {
		user.setId(new Long(users.size() + 1));
		users.add(user);
	}

	public void deleteUser(Long id) {
		users.remove(getUserById(id));		
	}

	public User getUserById(Long id) {
		User user = null;
		for(User u : users){
			if(u.getId().equals(id)){
				user = u;
				break;
			}
		}
		return user;
	}

	public ArrayList<User> getAllUsers() {
		return users;
	}
	
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}

}
