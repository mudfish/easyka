package com.laoxu.game.entity;/* GOOG支付接入示例代码 - JAVA版本 */
/* 更多信息请前往官网：https://www.gogozhifu.com */

public class PayParams {
    private String price; //【必传】订单金额，保留两位小数的字符串，例如“1.00”
    private Integer type; //【必传】微信支付传入1 支付宝支付传入2
    private String payId; //【必传】商户订单号，可以是时间戳，不可重复
    private String sign; //【必传】签名，计算方式为将各个参数按顺序拼接后用md5加密， md5(APPID+payId+param+type+price+APPSECRET)
    private String param; //选填
    private String notifyUrl; //选填
    private String returnUrl; //选填
    private Integer isHtml; //选填

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPrice() {
        return price;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public void setPayId(String payId) {
        this.payId = payId;
    }

    public String getPayId() {
        return payId;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public String getParam() {
        return param;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getSign() {
        return sign;
    }

    public void setReturnUrl(String returnUrl) {
        this.returnUrl = returnUrl;
    }

    public String getReturnUrl() {
        return returnUrl;
    }


    public void setNotifyUrl(String notifyUrl) {
        this.notifyUrl = notifyUrl;
    }

    public String getNotifyUrl() {
        return notifyUrl;
    }


    public void setIsHtml(Integer isHtml) {
        this.isHtml = isHtml;
    }

    public Integer getIsHtml() {
        return isHtml;
    }
}
