package com.laoxu.game.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.entity.Order;
import com.baomidou.mybatisplus.extension.service.IService;
import com.laoxu.game.vo.KmVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
public interface OrderService extends IService<Order> {
    Page<Order> selectOrderList(Page<Order> page, String keyword);
    Order getOrder(String orderNo);
    boolean paySuccess(String orderNo);
    boolean hasEnoughKm(Integer gid, Integer qty);
    List<KmVO> getOrderKmByKeyword(String keyword);
}
