package net.shbt.service.boards;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.shbt.dao.boards.Board01DAO;
import net.shbt.domain.boards.Board01VO;
import net.shbt.domain.boards.Paging;
import net.shbt.domain.boards.SearchPaging;

@Service
public class Board01ServiceImpl implements Board01Service {

	@Inject
	private Board01DAO board01DAO;
	
	@Override
	public List<Board01VO> list(SearchPaging searchPaging) throws Exception {
		
		return board01DAO.list(searchPaging);
	}

	@Override
	public int listCount(Paging paging) throws Exception {
		
		return board01DAO.listCount(paging);
	}

	@Override
	public void write(Board01VO board01VO) throws Exception {
		
		board01DAO.write(board01VO);
	}

	@Override
	public Board01VO view(int bno) throws Exception {
		
		return board01DAO.view(bno);
	}

	@Override
	public void update(Board01VO board01VO) throws Exception {
		
		board01DAO.update(board01VO);		
	}

	@Override
	public void delete(int bno) throws Exception {
		
		board01DAO.delete(bno);
	}
	
	

}
