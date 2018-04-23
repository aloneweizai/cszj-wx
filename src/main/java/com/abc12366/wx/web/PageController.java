package com.abc12366.wx.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PageController extends BaseController {

	// 首页
	@RequestMapping("/")
	public String index(
			@RequestParam(value = "charge", required = false) String charge,
			@RequestParam(value = "code", required = false) String code,
			HttpServletRequest request) {
		System.out.println(code);
		request.setAttribute("charge", charge);
		request.setAttribute("cfgUrl", cfg.getUrl());
		return "index";
	}

	// 登录页面
	@RequestMapping("/login.html")
	public String login() {
		return "login";
	}

	@RequestMapping("/profile.html")
	public String profile() {
		return "user/profile";
	}

	@RequestMapping("/myaddress.html")
	public String myaddress() {
		return "user/myaddress";
	}

	@RequestMapping("/company.html")
	public String company() {
		return "uc/company";
	}

	@RequestMapping("/realname.html")
	public String realname() {
		return "uc/realname";
	}

	@RequestMapping("/points.html")
	public String points() {
		return "uc/points";
	}

	@RequestMapping("/exps.html")
	public String exps() {
		return "uc/exp";
	}

	@RequestMapping("/message.html")
	public String message() {
		return "uc/message";
	}

	@RequestMapping("/invoice.html")
	public String invoice() {
		return "uc/invoice";
	}

	@RequestMapping("/order.html")
	public String order() {
		return "uc/order";
	}
	

	@RequestMapping("/school.html")
	public String school() {
		return "home/school/school";
	}
	@RequestMapping("/csdtlist.html")
	public String csdtlist() {
		return "home/find/csdtlist";
	}
	
	@RequestMapping("/csdtinfo.html")
	public String csdtinfo(@RequestParam("id") String id,HttpServletRequest request) {
		request.setAttribute("id", id);
		return "home/find/csdtinfo";
	}
	
	@RequestMapping("/classinfo.html")
	public String school(@RequestParam("id") String id,HttpServletRequest request) {
		request.setAttribute("id", id);
		return "home/find/classinfo";
	}

}
