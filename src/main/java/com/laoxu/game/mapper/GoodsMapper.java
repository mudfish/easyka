package com.laoxu.game.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.entity.Goods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品表 Mapper 接口
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
public interface GoodsMapper extends BaseMapper<Goods> {
    List<Goods> selectGoodsList(Page page);
    List<Goods> selectGoodsListByMap(@Param("typeId") Integer typeId, @Param("onSale") Integer onSale);
    Map<String,Object> kmtj(Integer goodsId);
}
