package net.shbt.dao.users;

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
	public UserVO loginCheck(UserVO userVO) throws Exception {		
		
		UserVO test = sqlSession.selectOne(NAMESPACE+".loginCheck", userVO);
		if(test != null) {
			System.out.println("test=============="+test.toString()); 
		}
		
		return test;
	}
	
}
