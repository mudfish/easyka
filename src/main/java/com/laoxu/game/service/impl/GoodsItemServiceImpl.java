package com.laoxu.game.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.entity.GoodsItem;
import com.laoxu.game.mapper.GoodsItemMapper;
import com.laoxu.game.service.GoodsItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 卡密 服务实现类
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@Service
public class GoodsItemServiceImpl extends ServiceImpl<GoodsItemMapper, GoodsItem> implements GoodsItemService {
    @Autowired
    GoodsItemMapper goodsItemMapper;

    @Override
    public Page<GoodsItem> selectGoodsItemList(Page<GoodsItem> page, String keyword) {
        page.setRecords(goodsItemMapper.selectGoodsItemList(page, keyword));
        return page;
    }
}
