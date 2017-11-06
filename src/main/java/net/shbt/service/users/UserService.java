package net.shbt.service.users;

import net.shbt.domain.users.UserVO;

public interface UserService {

	public void register(UserVO userVO) throws Exception;
	
	public boolean userIdCheck(String userId) throws Exception;
	
	public UserVO loginCheck(String userId, String password) throws Exception;
}
