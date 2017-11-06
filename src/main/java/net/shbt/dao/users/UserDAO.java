package net.shbt.dao.users;

import net.shbt.domain.users.UserVO;

public interface UserDAO {
	
	public String getTime();

	public void register(UserVO userVO) throws Exception;
	
	public boolean userIdCheck(String userId) throws Exception;
	
	public UserVO loginCheck(String userId, String password) throws Exception;
}
