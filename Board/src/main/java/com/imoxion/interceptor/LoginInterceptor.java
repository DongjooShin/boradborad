package com.imoxion.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session == null || session.getAttribute("m_id") == null) {

			System.out.println("비 로그인 상태");
			response.sendRedirect("/member/login");
			request.setAttribute("loginOn", 1);
			return false;

		} else {
			System.out.println("로그인 상태");
			return true;
		}

	}

}
