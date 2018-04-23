package com.abc12366.wx.web;

import com.abc12366.wx.component.DateUtils;
import com.abc12366.wx.component.RSAUtils;
import com.abc12366.wx.config.ApplicationConfig;
import com.abc12366.wx.model.AppResult;
import com.abc12366.wx.model.DzsjResult;
import com.abc12366.wx.model.PublicKey;
import com.abc12366.wx.model.Result;
import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.ObjectInputStream;
import java.security.interfaces.RSAPublicKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 提供访问外部接口的API
 *
 * @author lijun <ljun51@outlook.com>
 * @create 2017-02-20 8:00 PM
 * @since 1.0.0
 */
public class BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(BaseController.class);

    // App缓存信息
    private static Map<String, String> appCache = new ConcurrentHashMap<>();

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    protected ApplicationConfig cfg;

    // API接口版本
    private static final String API_VERSION = "1";
    private static final String VERSION = "Version";
    private static final String ACCESS_TOKEN = "Access-Token";
    protected static final String USER_TOKEN = "User-Token";

    // 客户端每次接口访问，在请求头中传入用户IP、用户代理类型，以便服务端记录
    // 客户端IP
    protected final static String CLIENT_IP = "Client-Ip";
    // 客户端用户代理
    protected final static String CLIENT_USER_AGENT = "Client-User-Agent";

    protected final String ADMIN = "/admins";
    protected final String BB = "/bangbang";
    protected final String CMS = "/cms";
    protected final String IMAGES = "/images";
    protected final String MESSAGE = "/message";
    protected final String UC = "/uc";

    /**
     * 对请求参数为Map的exchange方法的封装，可以参考对应的方法RestTemplate.exchange
     *
     * @param url           相对url地址
     * @param method        HttpMethod方法类型
     * @param requestEntity 包含请求头(HttpHeaders)或(和)请求体(Object)的实体
     * @param responseType  响应类型，通常为Object.class
     * @param uriVariables  uri中的参数占位符
     * @param <T>           范型T
     * @return T
     */
    public <T> T exchange(String url,
                          HttpMethod method,
                          HttpEntity<?> requestEntity,
                          Class<T> responseType,
                          Map<String, ?> uriVariables) {
        LOGGER.info("Request: {}, {}", url, requestEntity);

        ResponseEntity<T> responseEntity = null;
        try {
            responseEntity = restTemplate.exchange(url, method, requestEntity, responseType, uriVariables);
        } catch (RestClientException e) {
            LOGGER.error("RestClient调用服务出现异常: " + e.getMessage(), e);
        }
        LOGGER.info("Response: {}, {}", url, responseEntity);
        return responseEntity != null ? responseEntity.getBody() : null;
    }

    /**
     * 对请求参数为rest型变量的exchange方法的封装，可以参考对应的方法RestTemplate.exchange
     *
     * @param url           相对url地址
     * @param method        HttpMethod方法类型
     * @param requestEntity 包含请求头(HttpHeaders)或(和)请求体(Object)的实体
     * @param uriVariables  uri中的参数占位符
     * @return String
     */
    public String exchange(String url,
                           HttpMethod method,
                           HttpEntity<?> requestEntity,
                           Object... uriVariables) {
        LOGGER.info("Request: {}, {}", url, requestEntity);

        ResponseEntity<String> responseEntity = null;
        Result result = null;
        try {
            responseEntity = restTemplate.exchange(url, method, requestEntity, String.class, uriVariables);
        } catch (RestClientException e) {
            LOGGER.error("RestClient调用服务出现异常: " + e.getMessage(), e);
            result = new Result.Builder().code("5003").message(e.getMessage()).build();
        }
        LOGGER.info("Response: {}, {}", url, responseEntity);

        return responseEntity != null ? responseEntity.getBody() : result != null ? JSON.toJSONString(result) : null;
    }

    /**
     * 获取App的token
     *
     * @return token
     */
    protected String getToken(HttpServletRequest request) {
        if (appCache.containsKey("token") &&
                !StringUtils.isEmpty(appCache.get("token")) &&
                appCache.containsKey("expiresTime") &&
                !StringUtils.isEmpty(appCache.get("expiresTime")) &&
                !isExpires(Long.parseLong(appCache.get("expiresTime")))) {

            return appCache.get("token");
        } else {
            AppResult result = getAppLogin(request);
            if (result == null) {
                return null;
            }
            appCache.put("token", result.getToken());
            appCache.put("expiresTime", String.valueOf(new Date().getTime() + result.getExpiresIn() * 1000));
            return result.getToken();
        }
    }

    /**
     * 带"Version"的请求头
     *
     * @return HttpHeaders
     */
    protected HttpHeaders getHeadersOne(HttpServletRequest request) {
        HttpHeaders headers = new HttpHeaders();
        headers.add(VERSION, API_VERSION);
        headers.add(CLIENT_IP, request.getRemoteAddr());
        headers.add(CLIENT_USER_AGENT, request.getHeader("User-Agent"));
        headers.add("Client_Type", "PHONECLIENT");
        return headers;
    }

    /**
     * 带"Version,Access-Token"的请求头
     *
     * @return HttpHeaders
     */
    protected HttpHeaders getHeadersTwo(HttpServletRequest request) {
        HttpHeaders headers = getHeadersOne(request);
        headers.add(ACCESS_TOKEN, getToken(request));
        return headers;
    }

    /**
     * 带"Version,Access-Token,User-Token"的请求头
     *
     * @return HttpHeaders
     */
    protected HttpHeaders getHeadersThree(String userToken, HttpServletRequest request) {
        HttpHeaders headers = getHeadersTwo(request);
        headers.add(USER_TOKEN, userToken);
        return headers;
    }

    /**
     * 提前3分钟判断App的token是否过期
     *
     * @return 过期:true, 否则:false
     */
    private boolean isExpires(Long expiresTime) {
        Date now = new Date();
        LOGGER.info("过期时间：" + DateUtils.dateToStr(new Date(expiresTime), "yyyy-MM-dd HH:mm:ss") +
                ", 系统时间：" + DateUtils.dateToStr(now, "yyyy-MM-dd HH:mm:ss"));
        return now.getTime() > expiresTime - 3 * 60 * 1000;
    }

    /**
     * App登录
     *
     * @return 登录结果信息
     */
    private AppResult getAppLogin(HttpServletRequest request) {
        HttpHeaders headers = getHeadersOne(request);

        Map<String, String> map = new HashMap<>();
        map.put("name", cfg.getName());
        map.put("password", cfg.getPassword());

        String url = cfg.getUrl() + UC + "/app/login";
        String str = exchange(url, HttpMethod.POST, new HttpEntity<>(map, headers));
        return JSON.parseObject(str, AppResult.class);
    }

    /**
     * 电子税局登录
     */
    private DzsjResult getDzsjLogin() {
        Map<String, String> map = new HashMap<>();
        map.put("appId", cfg.getAppId());
        map.put("secret", cfg.getSecret());

        String url = cfg.getDzsjUrl() + "/app/login";
        String str = exchange(url, HttpMethod.POST, new HttpEntity<Object>(map));
        return JSON.parseObject(str, DzsjResult.class);
    }

    /**
     * 获取电子税局请求头
     */
    protected HttpHeaders getHttpHeader() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("platform", "CSZJ");
        headers.add("accessToken", getAccessToken());
        return headers;
    }

    /**
     * 获取电子税局token
     */
    protected String getAccessToken() {
        if (appCache.containsKey("accessToken") &&
                !StringUtils.isEmpty(appCache.get("accessToken")) &&
                appCache.containsKey("expiresIn") &&
                !StringUtils.isEmpty(appCache.get("expiresIn")) &&
                !isExpires(DateUtils.strToDate(appCache.get("expiresIn"), "yyyy-MM-dd HH:mm:ss").getTime())) {

            return appCache.get("accessToken");
        } else {
            DzsjResult result = getDzsjLogin();
            if (result == null) {
                return null;
            }
            appCache.put("accessToken", result.getAccessToken());
            appCache.put("expiresIn", result.getExpiresTime());
            return result.getAccessToken();
        }
    }

    /**
     * 获取rsa公钥
     */
    public RSAPublicKey getPublicKey() {
        HttpEntity httpEntity = new HttpEntity(getHttpHeader());
        String pkStr = exchange(cfg.getDzsjUrl() + "/pk", HttpMethod.GET, httpEntity);
        PublicKey publicKey = JSON.parseObject(pkStr, PublicKey.class);
        try (ObjectInputStream ois = new ObjectInputStream(new ByteArrayInputStream(publicKey.getPk()))) {
            return (RSAPublicKey) ois.readObject();
        } catch (Exception e) {
            LOGGER.error(e.getMessage() + e);
        }
        return null;
    }

    /**
     * 加密json字符串
     */
    public String rsaEncrypt(String json) {
        try {
            LOGGER.info("rsa:{}", json);
            return new String(RSAUtils.encrypt(getPublicKey(), json.getBytes()), "iso-8859-1");
        } catch (Exception e) {
            LOGGER.error(e.getMessage() + e);
        }
        return null;
    }

    public Map getEncryptBody(String json) {
        Map<String, String> body = new HashMap<>();
        body.put("p", rsaEncrypt(json));
        return body;
    }
}
