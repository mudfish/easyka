package com.laoxu.game.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.annotation.OperLogCat;
import com.laoxu.game.common.Result;
import com.laoxu.game.common.ResultUtil;
import com.laoxu.game.entity.Goods;
import com.laoxu.game.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品表 前端控制器
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@RestController
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    @GetMapping("/{id}")
    @ResponseBody
    public Result<Goods> get(@PathVariable Integer id){
        Goods entity =  goodsService.getById(id);

        return ResultUtil.ok(entity);
    }

    /**
     *  分页查询
     * @param pageNo
     * @param pageSize
     * @return
     */
    //@OperLogCat(operModule = "商品管理",operType = "查询",operDesc = "查询商品列表")
    @PostMapping("/list")
    @ResponseBody
    public Result<IPage<Goods>> list(
            @RequestParam(defaultValue = "1") Integer pageNo,
            @RequestParam(defaultValue = "10") Integer pageSize){
        // 构造查询条件
        QueryWrapper<Goods> queryWrapper = new QueryWrapper<>();

        Page<Goods> page = new Page<>(pageNo,pageSize);

        IPage<Goods> result = goodsService.selectGoodsList(page);
        // 设置总记录数
        result.setTotal(goodsService.count(queryWrapper));

        return ResultUtil.ok(result);
    }

    // 列出所有
    @GetMapping("/listAll")
    @ResponseBody
    public Result<List<Goods>> listAll(){
        return ResultUtil.ok(goodsService.list(null));
    }


//    @OperLogCat(operModule = "商品管理",operType = "新增",operDesc = "新增商品")
    @PostMapping("/add")
    @ResponseBody
    public Result<String> add(@RequestBody Goods entity){
        goodsService.save(entity);

        return ResultUtil.ok("添加成功！");
    }

//    @OperLogCat(operModule = "商品管理",operType = "修改",operDesc = "修改商品")
    @PostMapping("/modify")
    @ResponseBody
    public Result<String> modify(@RequestBody Goods entity){
        goodsService.saveOrUpdate(entity);

        return ResultUtil.ok("修改成功！");
    }

//    @OperLogCat(operModule = "商品管理",operType = "删除",operDesc = "删除商品")
    @PostMapping("/remove")
    @ResponseBody
    public Result<String> remove(@RequestParam Integer id){
        goodsService.removeById(id);

        return ResultUtil.ok("删除成功！");
    }

//    @OperLogCat(operModule = "商品管理",operType = "修改",operDesc = "修改商品状态")
    @PostMapping("/changeSaleState")
    @ResponseBody
    public Result<String> changeSaleState(@RequestParam Integer id, @RequestParam Integer state){
        Goods entity = goodsService.getById(id);
        entity.setOnSale(state);
        goodsService.saveOrUpdate(entity);

        return ResultUtil.ok("修改成功！");
    }

    @GetMapping("/kmtj/{goodsId}")
    public Result<Map<String,Object>> kmtj(@PathVariable Integer goodsId){
        Map<String,Object> result = goodsService.kmtj(goodsId);

        return ResultUtil.ok(result);
    }

}
