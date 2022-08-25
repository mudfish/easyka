package com.laoxu.game.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.entity.Goods;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品表 服务类
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
public interface GoodsService extends IService<Goods> {
    Page<Goods> selectGoodsList(Page<Goods> page);
    List<Goods> selectGoodsList(Integer typeId, Integer onSale);
    Map<String,Object> kmtj(Integer goodsId);
}
