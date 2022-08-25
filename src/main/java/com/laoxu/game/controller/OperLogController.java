package com.laoxu.game.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.laoxu.game.annotation.OperLogCat;
import com.laoxu.game.common.Result;
import com.laoxu.game.common.ResultUtil;
import com.laoxu.game.entity.OperLog;
import com.laoxu.game.service.OperLogService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@RestController
@RequestMapping("/operlog")
public class OperLogController {
    @Autowired
    private OperLogService operLogService;


    /**
     *  分页查询
     * @param operDesc
     * @param pageNo
     * @param pageSize
     * @return
     */
    @PostMapping("/list")
    @ResponseBody
    public Result<IPage<OperLog>> list(@RequestParam(value = "operDesc", required = false) String operDesc,
                                       @RequestParam(defaultValue = "1") Integer pageNo,
                                       @RequestParam(defaultValue = "10") Integer pageSize){
        // 构造查询条件
        QueryWrapper<OperLog> queryWrapper = new QueryWrapper<>();
        if(!StringUtils.isEmpty(operDesc)){
            queryWrapper.like("oper_desc",operDesc);
        }
        Page<OperLog> page = new Page<>(pageNo,pageSize);

        IPage<OperLog> result = operLogService.page(page, queryWrapper);
        // 设置总记录数
        result.setTotal(operLogService.count(queryWrapper));

        return ResultUtil.ok(result);
    }

    @PostMapping("/remove")
    @ResponseBody
    public Result<String> remove(@RequestParam Integer id){
        operLogService.removeById(id);

        return ResultUtil.ok("删除成功！");
    }
}
