package com.abc12366.wx.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(path = "/authorize")
public class AuthorizeController extends BaseController{
      
	 @RequestMapping("/showwxbind/{id}")
	 public String showWxBind(@PathVariable("id") String id,@RequestParam String code){
		 System.out.println(id);
		 System.out.println(code);
		 return "authorize/wxbind";
	 }
}
