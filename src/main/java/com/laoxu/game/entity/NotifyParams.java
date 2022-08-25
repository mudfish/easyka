package com.laoxu.game.entity;

import lombok.Data;

/**
 * 回调通知参数
 */
@Data
public class NotifyParams {
    private String payId; // 商户订单号
    private String param; // 参数
    private String type; // 支付渠道 1微信 2支付宝
    private String price; // 金额
    private String reallyPrice;  // 实际支付金额
    private String sign; // 加密校验值
}
