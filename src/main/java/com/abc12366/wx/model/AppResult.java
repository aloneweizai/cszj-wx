package com.abc12366.wx.model;

/**
 * App登录结果
 *
 * @author lijun <ljun51@outlook.com>
 * @create 2017-07-13 4:10 PM
 * @since 1.0.0
 */
public class AppResult extends Result {

    private String token;
    private Long expiresIn;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Long getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(Long expiresIn) {
        this.expiresIn = expiresIn;
    }

    @Override
    public String toString() {
        return "AppResult{" +
                "token='" + token + '\'' +
                ", expiresIn='" + expiresIn + '\'' +
                "} " + super.toString();
    }
}
