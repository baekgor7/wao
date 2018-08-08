package net.shbt.web.boards;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.shbt.domain.boards.Board01VO;
import net.shbt.domain.boards.PageMaker;
import net.shbt.domain.boards.Paging;
import net.shbt.interceptor.Auth;
import net.shbt.interceptor.Auth.Role;
import net.shbt.service.boards.Board01Service;

@Controller
@RequestMapping("/boards/board01")
public class Board01Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Board01Controller.class);
	
	@Inject
	private Board01Service board01Service;

	//게시판 목록
	@Auth(role=Role.USER)	//또는 @Auth라고 써도 됨 default라.. 다른값은(@Auth(role=Role.ADMIN) --> 이건 미구현)
	@RequestMapping(method=RequestMethod.GET, value="/list")
	public String list(@ModelAttribute("paging") Paging paging, Model model) throws Exception {
		
		model.addAttribute("list", board01Service.list(paging));	//게시판 목록 데이터
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPaging(paging);
		pageMaker.setTotalCount(board01Service.listCount(paging));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/boards/board01/board01_list";
	}
	
	//게시판 작성폼
	@Auth(role=Role.USER)
	@RequestMapping(method=RequestMethod.GET, value="/writeForm")
	public String writeForm() throws Exception {
		
		return "/boards/board01/board01_write";
	}
	
	//게시판 등록
	@Auth(role=Role.USER)
	@RequestMapping(method=RequestMethod.POST, value="/write")
	public String write(Board01VO board01VO, RedirectAttributes rttr) throws Exception {
		
		board01Service.write(board01VO);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/boards/board01/list";
	}
	
	//게시판 상세보기
	@Auth(role=Role.USER)
	@RequestMapping(method=RequestMethod.GET, value="view")
	public String view(@RequestParam("bno") int bno, @ModelAttribute("paging") Paging paging, Model model) throws Exception {
		
		model.addAttribute(board01Service.view(bno));
		return "/boards/board01/board01_view";
	}
	
	//게시판 수정
	@Auth(role=Role.USER)
	@RequestMapping(method=RequestMethod.POST, value="update")
	public String update(Board01VO board01VO, RedirectAttributes rttr) throws Exception {

		board01Service.update(board01VO);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/boards/board01/view?bno="+board01VO.getBno();
	}
	
	//게시판 삭제
	@Auth(role=Role.USER)
	@RequestMapping(method=RequestMethod.POST, value="delete")
	public String delete(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
		
		board01Service.delete(bno);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/boards/board01/list";
	}
	
}
