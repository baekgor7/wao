package net.shbt.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import net.shbt.dao.users.UserDAO;
import net.shbt.domain.users.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserDAOTest {

	@Inject
	private UserDAO userDAO;
	
	@Test
	public void test1() {
		System.out.println(userDAO);
	}
	
	@Test
	public void test2() {
		System.out.println(userDAO.getTime());
	}
	
	@Test
	public void test3() throws Exception {
		
		UserVO userVO = new UserVO();
		userVO.setUserId("fdsa3");
		userVO.setPassword("!1q2w3e4r");
		userVO.setUserNm("홍길동");
		userVO.setEmail("test@test.com");
		
		userDAO.register(userVO);
	}
}
