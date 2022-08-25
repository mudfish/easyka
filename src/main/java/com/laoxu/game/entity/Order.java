package com.laoxu.game.entity;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 *      订单模型
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_order")
public class Order extends Model<Order> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 订单编号
     */
    private String orderNo;

    /**
     * 交易流水号
     */
    private String payNo;

    /**
     * 渠道；ali 支付宝；wx 微信
     */
    private String channel;

    /**
     * 商品ID
     */
    private Integer goodsId;
    /**
     * 商品名称
     */
    @TableField(exist = false)
    private String goodsName;

    /**
     * 联系方式
     */
    private String contact;

    /**
     * 下单时间
     */
    private String createTime;

    /**
     * 成交时间
     */
    private String payTime;

    /**
     * 购买数量
     */
    private Integer qty;

    /**
     * 交易金额
     */
    private BigDecimal amount;

    /**
     * 订单状态： 0未支付；1待处理；2已处理
     */
    private Integer status;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
