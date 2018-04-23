package com.abc12366.wx.web;

import java.security.interfaces.RSAPublicKey;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.misc.BASE64Encoder;

import com.abc12366.wx.component.MD5;
import com.abc12366.wx.component.RSA;
import com.alibaba.fastjson.JSONObject;

@Controller
public class LoginController extends BaseController{

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@PostMapping("/login.html")
	public @ResponseBody String loginPwd(@RequestBody Map<String, Object> body,HttpServletRequest request){
	    HttpEntity httpEntity = new HttpEntity(getHeadersTwo( request));
	    String userBo= exchange(cfg.getUrl() + "/uc/user/u/"+body.get("usernameOrPhone"), HttpMethod.GET, httpEntity);
	    JSONObject userjson=JSONObject.parseObject(userBo);
	    if(userjson.getIntValue("code")!=2000){
	    	return "{\"code\":9999,\"message\":\""+userjson.getString("message")+"\"}";
        }
	    
	    String returnStr= exchange(cfg.getUrl() + "/uc/rsa/public", HttpMethod.GET, httpEntity);
	    JSONObject json=JSONObject.parseObject(returnStr);
	    RSAPublicKey publickey =RSA.getRSAPublidKey(json.getString("modulus"), json.getString("exponent"));
	    if(publickey==null){
	    	return "{\"code\":9999,\"message\":\"获取公钥失败\"}";
	    }

	    MD5 md5 = new MD5(body.get("password") + userjson.getJSONObject("data").getString("salt"));
        BASE64Encoder base64Encoder=new BASE64Encoder();
        String md5str = md5.compute();
        String rsastr = RSA.encryptString(publickey, md5str);
        
        String base64str = base64Encoder.encodeBuffer(rsastr.getBytes());
        body.put("password", base64str);
        HttpEntity httpEntityA = new HttpEntity(body, getHeadersTwo(request));
        
		return exchange(cfg.getUrl() + "/uc/login", HttpMethod.POST, httpEntityA);
	}
}
