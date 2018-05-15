package net.shbt.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import net.shbt.dao.boards.Board01DAO;
import net.shbt.domain.boards.Board01VO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDAOTest {

	@Inject
	private Board01DAO board01DAO;
	
	@Test
	public void create() throws Exception {		
		
		for(int i=1; i <= 200; i++) {
			Board01VO board01VO = new Board01VO();
			
			board01VO.setBno(board01DAO.bnoSelect());
			board01VO.setTitle("제목 " + i + " 입니다.");
			board01VO.setContents("내용 " + i + " 입니다.");
			board01VO.setWriter("fdsa1");
			
			board01DAO.create(board01VO);
		}
	}
}
