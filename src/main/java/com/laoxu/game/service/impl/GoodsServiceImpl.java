package com.laoxu.game.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.entity.Goods;
import com.laoxu.game.mapper.GoodsMapper;
import com.laoxu.game.service.GoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品表 服务实现类
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {
    @Autowired
    GoodsMapper goodsMapper;

    @Override
    public Page<Goods> selectGoodsList(Page<Goods> page) {
        page.setRecords(goodsMapper.selectGoodsList(page));
        return page;
    }

    @Override
    public List<Goods> selectGoodsList(Integer typeId, Integer onSale) {
        return goodsMapper.selectGoodsListByMap(typeId, onSale);
    }

    @Override
    public Map<String, Object> kmtj(Integer goodsId) {
        return goodsMapper.kmtj(goodsId);
    }


}
