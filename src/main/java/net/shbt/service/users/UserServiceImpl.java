package net.shbt.service.users;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.shbt.dao.users.UserDAO;
import net.shbt.domain.users.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO userDAO;

	@Override
	public void register(UserVO userVO) throws Exception {
		
		userDAO.register(userVO);
	}

	@Override
	public boolean userIdCheck(String userId) throws Exception {
		
		return userDAO.userIdCheck(userId);
	}

	@Override
	public UserVO loginCheck(UserVO userVO) throws Exception {
		
		return userDAO.loginCheck(userVO);
	}
	
}
