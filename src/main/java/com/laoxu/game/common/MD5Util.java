package com.laoxu.game.common;

import cn.hutool.core.date.DateUtil;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

/**
 *  md5工具类
 */
public class MD5Util {
    public static final int time = 5;

    public static final String SALT = "springsecurity";

    /**
     * 密码加密方法
     *
     * @param password
     * @return
     */
    public static String encode(String password) {
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("MD5 algorithm not available.  Fatal (should be in the JDK).");
        }
        try {
            for (int i = 0; i < time; i++) {
                byte[] bytes = digest.digest((password + SALT).getBytes("UTF-8"));
                password = String.format("%032x", new BigInteger(1, bytes));
            }
            return password;
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException("UTF-8 encoding not available.  Fatal (should be in the JDK).");
        }
    }

    // md5加密
    public static String md5(String data) {
        String ret = "";
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] bytes = md5.digest(data.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                String temp = Integer.toHexString(b & 0xff);
                temp = temp.toLowerCase();
                if (temp.length() == 1) {
                    sb.append("0");
                }
                sb.append(temp);
            }

            ret = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return ret;
    }

    public static void main(String[] args) {
        System.out.println(MD5Util.encode("PaJR6htT7"));
    }
}
