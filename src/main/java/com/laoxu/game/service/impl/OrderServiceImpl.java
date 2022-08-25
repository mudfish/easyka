package com.laoxu.game.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.entity.Order;
import com.laoxu.game.mapper.GoodsItemMapper;
import com.laoxu.game.mapper.OrderMapper;
import com.laoxu.game.service.GoodsItemService;
import com.laoxu.game.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    @Autowired
    OrderMapper orderMapper;

    @Autowired
    GoodsItemMapper kmMapper;

    @Override
    public Page<Order> selectOrderList(Page<Order> page, String keyword) {
        page.setRecords(orderMapper.selectOrderList(page,keyword));
        return page;
    }

    @Override
    public Order getOrder(String orderNo) {
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("order_no", orderNo);
        return orderMapper.selectOne(queryWrapper);
    }

    /**
     * 更新订单支付状态
     * @param orderNo
     * @return
     */
    @Override
    public boolean paySuccess(String orderNo) {
        try {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:sss");
            Order order = getOrder(orderNo);
            if (order == null) {
                throw new Exception("订单不存在");
            }
            // 幂等
            if (order.getStatus() == 1) {
                return true;
            }

            order.setStatus(1); // 支付状态更新为已支付
            order.setPayTime(sf.format(new Date()));

            orderMapper.updateById(order);
            // 占用卡密
            Integer qty = order.getQty();
            kmMapper.updateByOrder(orderNo,qty);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public int finish(List<Integer> ids) {
        return 0;
    }
}