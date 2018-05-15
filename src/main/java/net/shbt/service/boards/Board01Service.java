package net.shbt.service.boards;

import java.util.List;

import net.shbt.domain.boards.Board01VO;
import net.shbt.domain.boards.Paging;

public interface Board01Service {

	public List<Board01VO> list(Paging paging) throws Exception;
	
	public int listCount(Paging paging) throws Exception;
}
