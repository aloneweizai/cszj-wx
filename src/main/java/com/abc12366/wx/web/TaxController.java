package com.abc12366.wx.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class TaxController extends BaseController {

	// 申报信息查询
	@RequestMapping("/tax/sbxx.html")
	public String sbxx() {
		return "tax/sbxx";
	}
	
	@RequestMapping("/tax/jcxx.html")
	public String jcxx() {
		return "tax/jcxx";
	}
	
	@RequestMapping("/tax/nsjg.html")
	public String nsjg() {
		return "tax/nsjg";
	}
	
	@RequestMapping("/tax/nsxyjb.html")
	public String nsxyjb() {
		return "tax/nsxyjb";
	}
	
	@RequestMapping("/tax/fqjc.html")
	public String fqjc() {
		return "tax/fqjc";
	}
	
	@RequestMapping("/tax/sfxy.html")
	public String sfxy() {
		return "tax/sfxy";
	}
	@RequestMapping("/tax/yhsxba.html")
	public String yhsxba() {
		return "tax/yhsxba";
	}
	
	@RequestMapping("/tax/sbjgcx.html")
	public String sbjgcx() {
		return "tax/sbjgcx";
	}
	
	@RequestMapping("/tax/sqsxjd.html")
	public String sqsxjd() {
		return "tax/sqsxjd";
	}
}
