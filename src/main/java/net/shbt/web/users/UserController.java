package net.shbt.web.users;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.shbt.domain.users.UserVO;
import net.shbt.service.users.UserService;

@Controller
@RequestMapping("/users")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService userService;
	
	@RequestMapping(method=RequestMethod.GET, value="/loginForm")
	public String loginForm() {
		
		return "/users/loginForm";
	}
	
	@RequestMapping("/registerForm")
	public String registerForm() {
		
		return "/users/registerForm";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/register")
	public String register(UserVO userVO, String encPw, RedirectAttributes rttr) throws Exception {
		
		logger.info("userVO=="+userVO.toString());
		logger.info("encPw=="+encPw);
		
		userVO.setPassword(encPw);	//암호화된 패스워드로 셋팅
		userService.register(userVO);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/users/loginForm";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/userIdCheck")
	public @ResponseBody boolean userIdCheck(String userId) throws Exception {
		
		logger.info("userIdCheck : userId=="+userId);
		boolean flag = userService.userIdCheck(userId);
		logger.info("flag=="+flag);
		return flag;
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/login")
	public String login(UserVO userVO, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		logger.info("login : userVO=="+userVO);
		
		UserVO loginUser = userService.loginCheck(userVO);
		
		if(loginUser == null) {	//데이터가 없으면
			rttr.addFlashAttribute("msg", "FAIL");
			return "redirect:/users/loginForm";
		}
		
		session.setAttribute("sessionedUserId", loginUser.getUserId());
		session.setAttribute("sessionedUserNm", loginUser.getUserNm());
		
		return "/main";
	}
}
