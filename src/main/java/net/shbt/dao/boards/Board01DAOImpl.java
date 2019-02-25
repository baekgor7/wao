package net.shbt.dao.boards;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import net.shbt.domain.boards.Board01VO;
import net.shbt.domain.boards.Paging;
import net.shbt.domain.boards.SearchPaging;

@Repository
public class Board01DAOImpl implements Board01DAO {
	
	private static final Logger logger = LoggerFactory.getLogger(Board01DAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "net.shbt.sql.board01";

	@Override
	public List<Board01VO> list(SearchPaging searchPaging) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".list", searchPaging);
	}	

	@Override
	public int listCount(Paging paging) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".listCount", paging);
	}	
	
	@Override
	public int bnoSelect() throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".bnoSelect");
	}
	
	@Override
	public void write(Board01VO board01VO) throws Exception {
		
		board01VO.setBno(bnoSelect());
		sqlSession.insert(NAMESPACE + ".write", board01VO);
	}

	@Override
	public Board01VO view(int bno) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".view", bno);
	}

	@Override
	public void update(Board01VO board01VO) throws Exception {
		
		sqlSession.update(NAMESPACE + ".update", board01VO);
	}

	@Override
	public void delete(int bno) throws Exception {
		
		sqlSession.delete(NAMESPACE + ".delete", bno);
	}

	
}
