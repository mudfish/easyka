package com.laoxu.game.common;

/**
 * 请求返回结果
 *
 * @author test
 * @create 2018-10-23
 **/
public class Result<T> {
    private boolean success = true;
    private int code = ErrorStatus.OK.getCode();
    private String message = "";
    private T data;

    public static <T> Result<T> newInstance() {
        return new Result<T>();
    }

    public Result() {

    }

    public Result(T data) {
        this.data = data;
    }

    public Result(ErrorStatus status) {
        this.message = status.getMessage();
        this.code = status.getCode();
    }

    public Result(String message) {
        this.message = message;
    }


    public Result(int code, String message) {
        this.message = message;
        this.code = code;
    }

    public Result(int code, String message, T data) {
        this.message = message;
        this.code = code;
        this.data = data;
    }


    public Result<T> status(ErrorStatus status) {
        this.message = message;
        this.code = code;
        return this;
    }

    public Result<T> ok() {
        success = true;
        return this;
    }

    public Result<T> fail() {
        success = false;
        return this;
    }

    public Result<T> message(String message) {
        this.message = message;
        return this;
    }

    public Result<T> data(T data) {
        this.data = data;
        return this;
    }


    public Result<T> code(int code) {
        this.code = code;
        return this;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
