package com.laoxu.game.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_oper_log")
public class OperLog extends Model<OperLog> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 操作模块
     */
    private String operModule;

    /**
     * 操作了哪个方法
     */
    private String operMethod;

    /**
     * 操作类型，例如查询删除等
     */
    private String operType;

    /**
     * 操作描述
     */
    private String operDesc;

    /**
     * 请求方法
     */
    private String reqMethod;

    /**
     * 请求参数
     */
    private String operParam;

    /**
     * 请求IP
     */
    private String operIp;

    /**
     * 请求地址
     */
    private String operUri;

    /**
     * 操作人
     */
    private String operUser;

    /**
     * 操作时间
     */
    private Date createTime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
