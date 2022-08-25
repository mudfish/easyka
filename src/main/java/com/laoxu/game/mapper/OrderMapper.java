package com.laoxu.game.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.entity.Order;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
public interface OrderMapper extends BaseMapper<Order> {
    List<Order> selectOrderList(Page<Order> page, @Param("keyword") String keyword);
    int finish(@Param("ids") List<Integer> ids);
}
