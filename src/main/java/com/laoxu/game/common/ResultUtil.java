package com.laoxu.game.common;

/**
 * @Description: 返回结果工具类
 * @Author test
 * @Date 2020/12/26
 **/
public class ResultUtil {
    public static boolean isOk(Result<?> result){
        return null != result && result.getCode() == ErrorStatus.OK.getCode();
    }

    public static <T> Result<T> ok(){
        return new Result<T>(ErrorStatus.OK);
    }

    public static <T> Result<T> ok(T data){
        return new Result<T>(ErrorStatus.OK.getCode(), ErrorStatus.OK.getMessage(), data);
    }

    public static <T> Result<T> fail(){
        return new Result<T>(ErrorStatus.BAD_REQUEST).fail();
    }

    public static <T> Result<T> status(ErrorStatus status){
        return new Result<T>(status.getCode(), status.getMessage()).fail();
    }

    public static <T> Result<T> fail(ErrorStatus status){
        return new Result<T>(status.getCode(), status.getMessage()).fail();
    }

    public static <T> Result<T> fail(String message){
        return fail(ErrorStatus.BAD_REQUEST.getCode(), message, (T)null).fail();
    }

    public static <T> Result<T> fail(int code, String message){
        return new Result<T>(code, message).fail();
    }

    public static <T> Result<T> fail(int code ,String message, T data){
        return new Result<T>(code, message, data).fail();
    }

    public static <T> Result<T> notfound(){
        return new Result<T>(ErrorStatus.NOT_FOUND).fail();
    }

}
