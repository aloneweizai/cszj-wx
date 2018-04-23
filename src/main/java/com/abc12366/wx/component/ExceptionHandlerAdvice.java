package com.abc12366.wx.component;

import com.abc12366.wx.model.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 异常处理Advice
 *
 * @author lijun <ljun51@outlook.com>
 * @create 2017-07-14 12:02 PM
 * @since 1.0.0
 */
@ControllerAdvice
public class ExceptionHandlerAdvice {

    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public Result exception(Exception exception) {
        return new Result.Builder().code("4000").message(exception.getMessage()).build();
    }
}
