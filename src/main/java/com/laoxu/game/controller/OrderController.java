package com.laoxu.game.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.annotation.OperLogCat;
import com.laoxu.game.common.Result;
import com.laoxu.game.common.ResultUtil;
import com.laoxu.game.entity.Order;
import com.laoxu.game.service.OrderService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  订单管理控制器
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @GetMapping("/{id}")
    @ResponseBody
    public Result<Order> get(@PathVariable Integer id){
        Order entity =  orderService.getById(id);

        return ResultUtil.ok(entity);
    }

    @GetMapping("/{orderNo}")
    @ResponseBody
    public Result<Order> get(@PathVariable String orderNo){
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("orderNo", orderNo);
        Order entity =  orderService.getOne(queryWrapper);

        return ResultUtil.ok(entity);
    }

    /**
     *  分页查询
     * @param keyword 搜索关键词
     * @param pageNo
     * @param pageSize
     * @return
     */
    @PostMapping("/list")
    @ResponseBody
    public Result<IPage<Order>> list(
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "1") Integer pageNo,
            @RequestParam(defaultValue = "10") Integer pageSize){
        // 构造查询条件
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();

        if(!StringUtils.isEmpty(keyword)){
            queryWrapper.eq("order_no", keyword).or().eq("pay_no",keyword).or().eq("contact",keyword);
        }
        Page<Order> page = new Page<>(pageNo,pageSize);

        IPage<Order> result = orderService.selectOrderList(page,keyword);
        // 设置总记录数
        result.setTotal(orderService.count(queryWrapper));

        return ResultUtil.ok(result);
    }

    @PostMapping("/add")
    @ResponseBody
    public Result<String> add(@RequestBody Order entity){
        orderService.save(entity);

        return ResultUtil.ok("添加成功！");
    }

    @PostMapping("/modify")
    @ResponseBody
    public Result<String> modify(@RequestBody Order entity){
        orderService.saveOrUpdate(entity);

        return ResultUtil.ok("修改成功！");
    }

    @PostMapping("/remove")
    @ResponseBody
    public Result<String> remove(@RequestParam Integer id){
        orderService.removeById(id);

        return ResultUtil.ok("删除成功！");
    }

    @PostMapping("/removes")
    public Result<String> remove(@RequestBody Long[] ids) {
        orderService.removeByIds(Arrays.asList(ids));

        return ResultUtil.ok();
    }

    @PostMapping("/finish")
    @ResponseBody
    public Result<String> finish(@RequestBody Integer[] ids){
        int result = orderService.finish(Arrays.asList(ids));

        return ResultUtil.ok("操作成功！");
    }

}
