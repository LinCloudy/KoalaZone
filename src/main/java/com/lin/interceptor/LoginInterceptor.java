package com.lin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o)
			throws Exception {
		httpServletRequest.setCharacterEncoding("UTF-8");
		StringBuffer requestURL = httpServletRequest.getRequestURL();
		if (requestURL.toString().contains("lin") && !requestURL.toString().contains("lin/login")
				&& !requestURL.toString().contains("lin/dologin")) {
			Object user = httpServletRequest.getSession().getAttribute("user");
			if (user == null) {
				httpServletResponse.sendRedirect("/lin/login");
				return false;
			} else {
				return true;
			}
		} else {
			return true;
		}
	}

	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Object o, Exception e) throws Exception {
	}

}
