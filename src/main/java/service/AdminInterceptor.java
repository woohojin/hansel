package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String auth = (String) session.getAttribute("userId");
		
		if(auth == null || !auth.equals("admin")) {
			response.sendRedirect(request.getContextPath() + "/member/loginForm?id=fobidden");
			return false;
		} else {
			return true;
		}
		
	}
	
}
