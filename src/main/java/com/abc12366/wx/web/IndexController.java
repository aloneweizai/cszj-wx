package com.abc12366.wx.web;

import com.abc12366.wx.component.Utils;
import com.alibaba.fastjson.JSON;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 首页控制器
 *
 * @author lijun <ljun51@outlook.com>
 * @create 2017-07-13 9:24 AM
 * @since 1.0.0
 */
@Controller
public class IndexController extends BaseController {


    /**
     * 访问测试接口
     *
     * @return String
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/test")
    public
    @ResponseBody
    String test(HttpServletRequest request) {
        HttpEntity httpEntity = new HttpEntity(getHeadersTwo(request));
        return exchange(cfg.getUrl() + UC + "/test", HttpMethod.GET, httpEntity);
    }

    /**
     * 提供带方法参数(api)的get查询，不支持其他查询参数
     * 示例：/get?api=/uc/app
     *
     * @param api 接口名称
     * @return String
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @GetMapping("/get")
    public
    @ResponseBody
    String get(@RequestParam("api") String api,
               @RequestHeader(value = USER_TOKEN, required = false) String userToken,
               HttpServletRequest request,
               HttpServletResponse response) {

        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpEntity httpEntity = new HttpEntity(getHeadersThree(userToken, request));
        return exchange(cfg.getUrl() + api, HttpMethod.GET, httpEntity);
    }

    /**
     * 提供带方法参数(api)的get查询，支持多个查询参数，method的值需要Base64编码
     * 示例：/gets?api=L3VjL2FwcD9wYWdlPTEmc2l6ZT0y
     *
     * @param api 接口名称
     * @return String
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @GetMapping("/gets")
    public
    @ResponseBody
    String gets(@RequestParam("api") String api,
                @RequestHeader(value = USER_TOKEN, required = false) String userToken,
                HttpServletRequest request) {

        HttpEntity httpEntity = new HttpEntity(getHeadersThree(userToken, request));
        return exchange(cfg.getUrl() + Utils.decode(api), HttpMethod.GET, httpEntity);
    }

    /**
     * 提供带方法参数(api)的post方法，不支持其他查询参数
     * 示例：/post?api=/uc/app/register body: {"name":"abc12366-test", "password":"abc12366-test"}
     *
     * @param api  接口名称
     * @param body 请求体
     * @return String
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @PostMapping("/post")
    public
    @ResponseBody
    String post(@RequestParam("api") String api,
                @RequestHeader(value = USER_TOKEN, required = false) String userToken,
                @RequestBody Map<String, Object> body,
                HttpServletRequest request) {

        HttpEntity httpEntity = new HttpEntity(body, getHeadersThree(userToken, request));
        return exchange(cfg.getUrl() + api, HttpMethod.POST, httpEntity);
    }

    /**
     * 提供带方法参数(api)的put方法，不支持其他查询参数
     *
     * @param api  接口名称
     * @param body 请求体
     * @return String
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @PutMapping("/put")
    public
    @ResponseBody
    String put(@RequestParam("api") String api,
               @RequestHeader(value = USER_TOKEN, required = false) String userToken,
               @RequestBody Map<String, Object> body,
               HttpServletRequest request) {

        HttpEntity httpEntity = new HttpEntity(body, getHeadersThree(userToken, request));
        return exchange(cfg.getUrl() + api, HttpMethod.PUT, httpEntity);
    }

    /**
     * 提供带方法参数(api)的delete方法，不支持其他查询参数
     *
     * @param api       接口名称
     * @param userToken 用户令牌
     * @return String
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @GetMapping("/delete")
    public
    @ResponseBody
    String delete(@RequestParam("api") String api,
                  @RequestHeader(value = USER_TOKEN, required = false) String userToken,
                  HttpServletRequest request) {

        HttpEntity httpEntity = new HttpEntity(getHeadersThree(userToken, request));
        return exchange(cfg.getUrl() + api, HttpMethod.DELETE, httpEntity);
    }

    /**
     * 调用电子税局的post方法
     *
     * @param api  接口名
     * @param body 请求体
     * @return String
     */
    @PostMapping("/tax/post")
    @ResponseBody
    public String taxPost(@RequestParam("api") String api,@RequestBody Map<String, String> body) {
        String json = JSON.toJSONString(body);
        HttpEntity httpEntity = new HttpEntity(getEncryptBody(json), getHttpHeader());
        return exchange(cfg.getDzsjUrl() +api, HttpMethod.POST, httpEntity);
    }

    /**
     * 调用电子税局的get方法
     *
     * @param api 接口名
     * @return String
     */
    @GetMapping("/tax/get")
    @ResponseBody
    public String taxGet(@RequestParam("api") String api) {

        HttpEntity httpEntity = new HttpEntity(getHttpHeader());
        return exchange(cfg.getDzsjUrl() + api, HttpMethod.GET, httpEntity);
    }

    /**
     * 调用电子税局的示例
     */
    @GetMapping("/tax/rsa")
    @ResponseBody
    public String taxRSA() {

        Map<String, String> params = new HashMap<>();
        params.put("nsrsbh", "430105758044496");
        params.put("skssqq","");
        params.put("skssqz","");
        params.put("zsxmDm","");
        params.put("minNum", "1");
        params.put("maxNum", "10");

        String json = JSON.toJSONString(params);
        HttpEntity httpEntity = new HttpEntity(getEncryptBody(json), getHttpHeader());
        return exchange(cfg.getDzsjUrl() + "/sssearch/querysbxx4cszj", HttpMethod.POST, httpEntity);
    }
}
