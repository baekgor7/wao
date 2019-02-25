package net.shbt.service.boards;

import java.util.List;

import net.shbt.domain.boards.Board01VO;
import net.shbt.domain.boards.Paging;
import net.shbt.domain.boards.SearchPaging;

public interface Board01Service {

	public List<Board01VO> list(SearchPaging searchPaging) throws Exception;
	
	public int listCount(Paging paging) throws Exception;
	
	public void write(Board01VO board01VO) throws Exception;
	
	public Board01VO view(int bno) throws Exception;
	
	public void update(Board01VO board01VO) throws Exception;
	
	public void delete(int bno) throws Exception;
}
