package com.laoxu.game.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.annotation.OperLogCat;
import com.laoxu.game.common.Result;
import com.laoxu.game.common.ResultUtil;
import com.laoxu.game.entity.GoodsType;
import com.laoxu.game.service.GoodsTypeService;
import com.laoxu.game.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 商品分类 前端控制器
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@RestController
@RequestMapping("/goodsType")
public class GoodsTypeController {
    @Autowired
    private GoodsTypeService typeService;

    @GetMapping("/{id}")
    @ResponseBody
    public Result<GoodsType> get(@PathVariable Integer id){
        GoodsType entity =  typeService.getById(id);

        return ResultUtil.ok(entity);
    }

    /**
     *  分页查询
     * @param pageNo
     * @param pageSize
     * @return
     */
//    @OperLogCat(operModule = "分类管理",operType = "查询",operDesc = "查询分类列表")
    @PostMapping("/list")
    @ResponseBody
    public Result<IPage<GoodsType>> list(
                                    @RequestParam(defaultValue = "1") Integer pageNo,
                                    @RequestParam(defaultValue = "10") Integer pageSize){
        // 构造查询条件
        QueryWrapper<GoodsType> queryWrapper = new QueryWrapper<>();

        Page<GoodsType> page = new Page<>(pageNo,pageSize);

        IPage<GoodsType> result = typeService.page(page,null);
        // 设置总记录数
        result.setTotal(typeService.count(queryWrapper));

        return ResultUtil.ok(result);
    }

    // 列出所有
    @GetMapping("/listAll")
    public Result<List<GoodsType>> listAll(){
        return ResultUtil.ok(typeService.list(null));
    }
    

//    @OperLogCat(operModule = "分类管理",operType = "新增",operDesc = "新增分类")
    @PostMapping("/add")
    @ResponseBody
    public Result<String> add(@RequestBody GoodsType entity){
        typeService.save(entity);

        return ResultUtil.ok("添加成功！");
    }

//    @OperLogCat(operModule = "分类管理",operType = "修改",operDesc = "修改分类")
    @PostMapping("/modify")
    @ResponseBody
    public Result<String> modify(@RequestBody GoodsType entity){
        typeService.saveOrUpdate(entity);

        return ResultUtil.ok("修改成功！");
    }

//    @OperLogCat(operModule = "分类管理",operType = "删除",operDesc = "删除分类")
    @PostMapping("/remove")
    @ResponseBody
    public Result<String> remove(@RequestParam Integer id){
        typeService.removeById(id);

        return ResultUtil.ok("删除成功！");
    }
}
