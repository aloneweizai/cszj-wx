package com.abc12366.wx.component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类
 *
 * @author lijun <ljun51@outlook.com>
 * @create 2017-05-03 10:57 AM
 * @since 1.0.0
 */
public class DateUtils {

    /**
     * 日期转字符串
     *
     * @param date 日期
     * @param format 格式
     * @return string
     */
    public static String dateToStr(Date date, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    /**
     * 字符串转换成日期
     *
     * @param str 日期字符串
     * @param format 格式
     * @return date
     */
    public static Date strToDate(String str, String format) {

        SimpleDateFormat sdf = new SimpleDateFormat(format);
        Date date = null;
        try {
            date = sdf.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 添加年份
     *
     * @param date 需要添加年份的日期
     * @param year 需要添加的年份数
     * @return Date 添加年份数之后的日期
     */
    public static Date addYears(Date date, int year) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.YEAR, year);
        return calendar.getTime();
    }

    /**
     * 添加小时
     *
     * @param date 需要添加小时的日期
     * @param hour 需要添加的小时数
     * @return Date 添加小时数之后的日期
     */
    public static Date addHours(Date date, int hour) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.HOUR, hour);
        return calendar.getTime();
    }
}
