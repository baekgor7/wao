package net.shbt.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.shbt.domain.ProductVO;

@Controller
public class SimpleController {

	private static final Logger logger = LoggerFactory.getLogger(SimpleController.class);
	
	@RequestMapping("/doA")
	public void doA() {
		
		logger.info("doA.................");
		
		//void인 경우 doA 페이지를 찾음
	}
	
	@RequestMapping("doE")
	public String doE(RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("msg", "msg data send");
		return "redirect:/doF";
	}

	@RequestMapping("doF")
	public void doF(String msg) {
		
		//doE에서 보내온 msg 데이터를 받을수 있음
		//rediect 원래 데이터를 받을수 없지만 RedirectAttributes class에 addFlashAttribute 메소드를 통해서 보내면 가능
		logger.info("doF called===="+msg);
	}
	
	@RequestMapping("doJSON")
	public @ResponseBody ProductVO doJSON() {
		
		ProductVO vo = new ProductVO();
		vo.setName("sample Product");
		vo.setPrice(3000);
		
		return vo;
	}
}
