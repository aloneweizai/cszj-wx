package com.abc12366.wx.component;

import java.util.Base64;

/**
 * 工具类
 *
 * @author lijun <ljun51@outlook.com>
 * @create 2017-07-12 5:56 PM
 * @since 1.0.0
 */
public class Utils {

    public static String encode(String str) {
        return Base64.getEncoder().encodeToString(str.getBytes());
    }

    public static String decode(String str) {
        return new String(Base64.getDecoder().decode(str));
    }

    public static void main(String[] args) {
        System.out.println(Utils.encode("/app"));
        System.out.println(Utils.decode(Utils.encode("/app")));
    }
}
