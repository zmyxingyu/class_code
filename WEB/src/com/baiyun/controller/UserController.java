package com.baiyun.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baiyun.dao.UserDao;
import com.baiyun.model.Msg;
import com.baiyun.model.User;

import ioc.annotation.Bean;
import ioc.annotation.Inject;
import lang.StringUtils;
import web.annotation.Handler;
import web.controller.Controller;

@Bean(id = "user")
@Handler(name = "user", url = "/user")
public class UserController implements Controller {

	@Inject(ref="userDao")
	private UserDao dao;

	public UserDao getDao() {
		return dao;
	}

	public void setDao(UserDao dao) {
		this.dao = dao;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response, String action) {
		System.out.println("action:" + action);
		if ("/login".equals(action)) {
			return login(request, response);
		} else if ("/logout".equals(action)) {
			return logout(request, response);
		} else if ("/regist".equals(action)) {
			return regist(request, response);
		}
		return null;
	}

	private String regist(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name"); // 获取并设置用户名

		if (StringUtils.isEmpty(name)) {
			return "/WEB-INF/jsp/register.jsp";
		} else {
			String password = request.getParameter("password");
			User user = new User();
			user.setName(name);
			user.setPassword(password);
			Msg msg = dao.regist(user);
			if (msg.getStatus() == Msg.SUCCESS) {
				return "/student";
			} else {
				request.setAttribute("err", msg.getMsg());
				request.setAttribute("showLogin", true);
				request.setAttribute("showRegist", true);
				return "/WEB-INF/jsp/err.jsp";
			}
		}

	}

	private String login(HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name"); // 获取并设置用户名
		if (StringUtils.isEmpty(name)) {
			return "/WEB-INF/jsp/login.jsp";
		} else {
			String password = request.getParameter("password");
			User user = new User();
			user.setName(name);
			user.setPassword(password);
			return this.login(user, request, response);
		}
	}

	private String login(User user, HttpServletRequest request, HttpServletResponse response) {
		Msg flag = dao.login(user);
		if (flag.getStatus() == Msg.SUCCESS) {

			HttpSession session = request.getSession();
			session.setAttribute("userName", user.getName());// 保存用户名
			return "/student";
		} else {
			request.setAttribute("err", "您输入的用户名或密码错误，请重新输入！");
			request.setAttribute("showLogin", true);
			request.setAttribute("showRegist", true);
			return "/WEB-INF/jsp/err.jsp";
		}
	}

	private String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "/WEB-INF/jsp/login.jsp";
	}

}
