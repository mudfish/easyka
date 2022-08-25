package com.laoxu.game.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.annotation.OperLogCat;
import com.laoxu.game.common.Result;
import com.laoxu.game.common.ResultUtil;
import com.laoxu.game.entity.GoodsItem;
import com.laoxu.game.service.GoodsItemService;
import com.laoxu.game.service.GoodsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 卡密 前端控制器
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@Controller
@RequestMapping("/km")
public class GoodsItemController {
    @Autowired
    private GoodsItemService goodsItemService;

    @GetMapping("/{id}")
    @ResponseBody
    public Result<GoodsItem> get(@PathVariable Integer id){
        GoodsItem entity =  goodsItemService.getById(id);

        return ResultUtil.ok(entity);
    }

    /**
     *  分页查询
     * @param pageNo
     * @param pageSize
     * @return
     */
//    @OperLogCat(operModule = "卡密管理",operType = "查询",operDesc = "查询卡密列表")
    @PostMapping("/list")
    @ResponseBody
    public Result<IPage<GoodsItem>> list(
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "1") Integer pageNo,
            @RequestParam(defaultValue = "10") Integer pageSize){
        // 构造查询条件
        QueryWrapper<GoodsItem> param = new QueryWrapper<>();
        // 根据商品ID查询
        if(!StringUtils.isEmpty(keyword)){
            param.eq("keyword", keyword);
        }
        Page<GoodsItem> page = new Page<>(pageNo,pageSize);

        IPage<GoodsItem> result = goodsItemService.selectGoodsItemList(page, keyword);
        // 设置总记录数
        result.setTotal(goodsItemService.count(param));

        return ResultUtil.ok(result);
    }

    // 列出所有
    @GetMapping("/listAll")
    public Result<List<GoodsItem>> listAll(){
        return ResultUtil.ok(goodsItemService.list(null));
    }


//    @OperLogCat(operModule = "卡密管理",operType = "新增",operDesc = "新增卡密")
    @PostMapping("/add")
    @ResponseBody
    public Result<String> add(@RequestBody GoodsItem entity){
        goodsItemService.save(entity);

        return ResultUtil.ok("添加成功！");
    }

    @PostMapping("/addBatch")
    @ResponseBody
    public Result<String> addBatch(Integer goodsId, @RequestParam("kms[]") String[] kms){
        List<GoodsItem> list = new ArrayList<>();
        GoodsItem entity = null;
        for (int i = 0; i < kms.length; i++) {
            entity = new GoodsItem();
            entity.setGoodsId(goodsId);
            entity.setKm(kms[i]);
            entity.setCreateTime(new Date());

            list.add(entity);
        }

        goodsItemService.saveBatch(list);

        return ResultUtil.ok();
    }

//    @OperLogCat(operModule = "卡密管理",operType = "修改",operDesc = "修改卡密")
    @PostMapping("/modify")
    @ResponseBody
    public Result<String> modify(@RequestBody GoodsItem entity){
        goodsItemService.saveOrUpdate(entity);

        return ResultUtil.ok("修改成功！");
    }

//    @OperLogCat(operModule = "卡密管理",operType = "删除",operDesc = "删除卡密")
    @PostMapping("/remove")
    @ResponseBody
    public Result<String> remove(@RequestParam Integer id){
        goodsItemService.removeById(id);

        return ResultUtil.ok("删除成功！");
    }

}
