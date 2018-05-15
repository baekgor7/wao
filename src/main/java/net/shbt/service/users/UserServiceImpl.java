package net.shbt.service.users;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public UserVO login(String userId, String password, String ipAddr) throws Exception {
		
		UserVO userVO = userDAO.loginCheck(userId, password);
		
		//아이디, 비밀번호가 맞으면 로그인정보 등록
		if(userVO != null) {
			userDAO.loginInfoInsert(userId, ipAddr);
		}
		return userVO;
	}
	
}
