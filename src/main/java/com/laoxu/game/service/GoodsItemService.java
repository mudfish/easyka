package com.laoxu.game.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.entity.GoodsItem;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 卡密 服务类
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
public interface GoodsItemService extends IService<GoodsItem> {
    Page<GoodsItem> selectGoodsItemList(Page<GoodsItem> page, String keyword);
    void removeUsedKm();
    void removeAllKm();
}
