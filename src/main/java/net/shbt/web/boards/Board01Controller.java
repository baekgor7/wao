package net.shbt.web.boards;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.shbt.domain.boards.PageMaker;
import net.shbt.domain.boards.Paging;
import net.shbt.service.boards.Board01Service;

@Controller
@RequestMapping("/boards/board01")
public class Board01Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Board01Controller.class);
	
	@Inject
	private Board01Service board01Service;

	@RequestMapping(method=RequestMethod.GET, value="/list")
	public String list(@ModelAttribute("paging") Paging paging, Model model) throws Exception {
		
		model.addAttribute("list", board01Service.list(paging));	//게시판 목록 데이터
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPaging(paging);
		pageMaker.setTotalCount(board01Service.listCount(paging));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/boards/board01/board01_list";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/registerForm")
	public String registerForm() {
		
		return "/boards/board01/board01_register";
	}
}
