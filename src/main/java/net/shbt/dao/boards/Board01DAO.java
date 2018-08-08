package net.shbt.dao.boards;

import java.util.List;

import net.shbt.domain.boards.Board01VO;
import net.shbt.domain.boards.Paging;

public interface Board01DAO {
	
	public List<Board01VO> list(Paging paging) throws Exception;
	
	public int listCount(Paging paging) throws Exception;
	
	public int bnoSelect() throws Exception;

	public void write(Board01VO board01VO) throws Exception;
	
	public Board01VO view(int bno) throws Exception;
	
	public void update(Board01VO board01VO) throws Exception;
	
	public void delete(int bno) throws Exception;
}
