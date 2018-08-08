package net.shbt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import net.shbt.domain.users.UserVO;

//HandlerInterceptorAdapter 사용해서 서블릿 요청 전 필터 처리(권한체크)
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	private static final String LOGIN = "login";

	//컨트롤러에 들어가기 전에 먼저 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		logger.info("request.getRequestURI()==============="+request.getRequestURI());
		
		//1. handler 종류 확인
		//우리가 관심 있는 것은 Controller에 메서드이므로 HandlerMethod 타입인지 체크
		if(handler instanceof HandlerMethod == false) {
			//return ture이면 Controller에 있는 메서드가 아니므로, 그대로 진행
			return true;
		}		
		
		//2. 형변환
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		
		//3. @Auth 받아오기
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);	//메서드에 @Auth 가져오기
		Auth adminRole = handlerMethod.getMethod().getDeclaringClass().getAnnotation(Auth.class);	//클래스에 @Auth 가져오기
		
		logger.info("auth==============="+auth);
		
		//4. method에 @Auth가 없는 경우, 즉 인증이 필요없는 요청
		if(auth == null) {
			return true;
		}
		
		//5. @Auth가 있는 경우이므로, 세션이 있는지 체크
		HttpSession session = request.getSession();		
		logger.info("session==============="+session);
		
		if(session == null) {			
			response.sendRedirect(request.getContextPath()+"/users/loginForm");
			return false;
		}
		
		logger.info("userVO==============="+(UserVO)session.getAttribute(LOGIN));

		//6. 세션이 존재하면 유효한 유저인지 확인
		UserVO userVO = (UserVO)session.getAttribute(LOGIN);
		if(userVO == null) {			
			response.sendRedirect(request.getContextPath()+"/users/loginForm");
			return false;
		}
		
		//7. admin일 경우
		if(adminRole != null) {
			
			String role = auth.role().toString();
			
			if("ADMIN".equals(role)) {
				//admin임을 알수 있는 조건을 작성
				//ex)서비스의 id가 root이면 admin이다.
				if("root".equals(userVO.getUserId()) == false) {	//admin이 아니면
					response.sendRedirect(request.getContextPath());
					return false;
				}
			}
		}
		
		//8. 접근허가, 즉 메서드를 실행하도록 함
		return true;		
	}

	//컨트롤러와 뷰 사이에 실행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

		super.postHandle(request, response, handler, modelAndView);
	}
	
}
