package com.laoxu.game.entity;

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
 * 卡密
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_goods_item")
public class GoodsItem extends Model<GoodsItem> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 所属商品
     */
    private Integer goodsId;

    @TableField(exist = false)
    private String goodsName;

    /**
     * 卡密名称
     */
    private String km;

    /**
     * 添加时间
     */
    private Date createTime;

    /**
     * 归属订单号
     */
    private String orderNo;

    @TableField(exist = false)
    private String payNo;

    @TableField(exist = false)
    private String contact;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
