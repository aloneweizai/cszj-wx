package com.abc12366.wx.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * 读取application.properties配置文件内容
 *
 * @author lijun <ljun51@outlook.com>
 * @create 2017-02-24 1:36 PM
 * @since 1.0.0
 */
@Configuration
@PropertySource("classpath:application.properties")
public class ApplicationConfig {

    // 财税专家服务端URL地址
    @Value("${cszj.soa.url}")
    public String url;

    // 财税专家服务端用户名
    @Value("${cszj.soa.name}")
    public String name;

    // 财税专家服务端密码
    @Value("${cszj.soa.password}")
    public String password;

    @Value("${dzsj.soa.url}")
    public String dzsjUrl;

    @Value("${dzsj.soa.appId}")
    public String appId;

    @Value("${dzsj.soa.secret}")
    public String secret;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDzsjUrl() {
        return dzsjUrl;
    }

    public void setDzsjUrl(String dzsjUrl) {
        this.dzsjUrl = dzsjUrl;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }
}
