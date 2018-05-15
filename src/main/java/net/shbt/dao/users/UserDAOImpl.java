package net.shbt.dao.users;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.shbt.domain.users.UserVO;

@Repository	//Repository는 일반적으로 DAO에서 사용됨
public class UserDAOImpl implements UserDAO {

	@Inject	
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "net.shbt.sql.user";

	@Override
	public String getTime() {

		return sqlSession.selectOne(NAMESPACE+".getTime");
	}	

	@Override
	public void register(UserVO userVO) throws Exception {
		
		sqlSession.insert(NAMESPACE+".register", userVO);
	}

	@Override
	public boolean userIdCheck(String userId) throws Exception {
		
		boolean idFlag = false;
		
		String idVal = sqlSession.selectOne(NAMESPACE+".userIdCheck", userId);
				
		if(idVal == null) idFlag = true;	//ID가 없으면 신청가능
		
		return idFlag;
	}

	@Override
	public UserVO loginCheck(String userId, String password) throws Exception {		
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", userId);
		paramMap.put("password", password);
		
		return sqlSession.selectOne(NAMESPACE+".loginCheck", paramMap);
	}
	
	@Override
	public void loginInfoInsert(String userId, String ipAddr) throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userId", userId);
		paramMap.put("ipAddr", ipAddr);
		
		sqlSession.insert(NAMESPACE+".loginInfoInsert", paramMap);
	}
	
}
