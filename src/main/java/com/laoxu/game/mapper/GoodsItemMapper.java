package com.laoxu.game.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.entity.GoodsItem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 卡密 Mapper 接口
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
public interface GoodsItemMapper extends BaseMapper<GoodsItem> {
    List<GoodsItem> selectGoodsItemList(Page page, @Param("keyword") String keyword);
    int updateByOrder(@Param("orderNo") String orderNo, @Param("qty") int qty);
}
