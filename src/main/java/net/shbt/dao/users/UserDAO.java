package net.shbt.dao.users;

import net.shbt.domain.users.UserVO;

public interface UserDAO {
	
	public String getTime();

	public void register(UserVO userVO) throws Exception;
	
	public boolean userIdCheck(String userId) throws Exception;
}
