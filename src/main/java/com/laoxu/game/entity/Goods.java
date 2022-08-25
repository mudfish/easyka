package com.laoxu.game.entity;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 商品表
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_goods")
public class Goods extends Model<Goods> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 所属分类ID
     */
    private Integer typeId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品描述
     */
    private String goodsDesc;

    /**
     * 商品价格
     */
    private BigDecimal price;

    // 商品图片
    private String pic;

    /**
     * 是否上架；1是0否
     */
    private Integer onSale;

    /**
     * 商品排序
     */
    private Integer seqNo;

    private LocalDateTime createTime;

    private String createUser;

    private LocalDateTime updateTime;

    private String updateUser;

    // 所属分类名称
    @TableField(exist = false)
    private String typeName;
    // 卡密总数
    @TableField(exist = false)
    private Integer kmQty;
    // 剩余卡密
    @TableField(exist = false)
    private Integer kmLeft;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
