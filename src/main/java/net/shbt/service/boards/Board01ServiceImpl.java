package net.shbt.service.boards;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.shbt.dao.boards.Board01DAO;
import net.shbt.domain.boards.Board01VO;
import net.shbt.domain.boards.Paging;

@Service
public class Board01ServiceImpl implements Board01Service {

	@Inject
	private Board01DAO board01DAO;
	
	@Override
	public List<Board01VO> list(Paging paging) throws Exception {
		
		return board01DAO.list(paging);
	}

	@Override
	public int listCount(Paging paging) throws Exception {
		
		return board01DAO.listCount(paging);
	}

}
