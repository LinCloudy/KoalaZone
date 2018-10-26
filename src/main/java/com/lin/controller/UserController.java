package com.lin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lin.entity.User;
import com.lin.service.ArticleService;
import com.lin.service.UserService;

@Controller
public class UserController {
	@Resource
	private ArticleService articleService;
	@Resource
	private UserService userService;

	@RequestMapping("/lin")
	public String admin(Model model) {
		model.addAttribute("articles", articleService.getAllArticle());
		return "admin/index";
	}

	@RequestMapping("/lin/login")
	public String login() {
		return "admin/login";
	}

	@RequestMapping(value = "/lin/dologin", method = RequestMethod.POST)
	public String doLogin(HttpServletRequest request, User user, Model model) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		user.setUsername(username);
		user.setPassword(password);
		if (userService.login(username, password)) {
			request.getSession().setAttribute("user", user);
			model.addAttribute("user", user);
			return "redirect:/lin";
		} else {
			model.addAttribute("error", "用户名或密码错误");
			return "admin/login";
		}
	}

	@RequestMapping(value = "/lin/dologin", method = RequestMethod.GET)
	public String doLogin(HttpServletRequest request, Model model) {
		if (request.getSession().getAttribute("user") == null) {
			return "admin/login";
		}
		return "redirect:/lin";
	}
}
