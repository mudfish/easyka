package com.laoxu.game.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.laoxu.game.common.MD5Util;
import com.laoxu.game.common.Result;
import com.laoxu.game.common.ResultUtil;
import com.laoxu.game.entity.User;
import com.laoxu.game.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @Description: 登录控制器
 * @Author test
 * @Date 2020/12/26
 **/
@Controller
@RequestMapping("/")
public class AdminController {
    @Autowired
    UserService userService;

    @PostMapping("doLogin")
    @ResponseBody
    public Result<String> login(@RequestParam String username,
                                @RequestParam String password,
                                Model model,
                                HttpServletRequest request,
                                HttpServletResponse response){
        QueryWrapper<User> param = new QueryWrapper<>();
        param.eq("username", username);
        User user = userService.getOne(param);
        // 未找到用户
        if(user == null){
            return ResultUtil.fail("用户不存在");
        }

        if(!MD5Util.encode(password).equals(user.getPassword())){
            return ResultUtil.fail("密码错误");
        }

        model.addAttribute("username",username);
        request.getSession().setAttribute("user",user);

        return ResultUtil.ok("登录成功！");
    }

    @GetMapping("logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "login";
    }

/*    @PostMapping("/doRegister")
    @ResponseBody
    public Result<String> register(@RequestParam String username,
                                   @RequestParam String password,
                                   @RequestParam String repassword,
                                   @RequestParam String truename,
                                   @RequestParam Integer areaId,
                                   HttpServletRequest request){

        // 1. 合法性校验
        if(StringUtils.isEmpty(username)){
            return ResultUtil.fail("用户名为空！");
        }
        if(StringUtils.isEmpty(password)){
            return ResultUtil.fail("密码为空！");
        }
        if(StringUtils.isEmpty(repassword)){
            return ResultUtil.fail("确认密码为空！");
        }
        if(StringUtils.isEmpty(truename)){
            return ResultUtil.fail("姓名为空！");
        }
        if(areaId==null){
            return ResultUtil.fail("所属区县为空！");
        }

        if(!(password.equals(repassword))){
            return ResultUtil.fail("两次密码输入不一致！");
        }
        // 3.检查用户名是否存在
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",username);
        User entity = userService.getOne(queryWrapper);
        if(entity!=null){
            return ResultUtil.fail("用户名已存在！");
        }

        //4.新增
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        userService.save(user);

        return ResultUtil.ok();
    }*/

    /**
     *  修改密码
     * @param param
     * @return
     */
    @PostMapping("/modifyPassword")
    @ResponseBody
    public Result<String> modifyPassword(@RequestBody Map<String,String> param, HttpServletRequest request){
        // 校验密码
        String oldPassword = param.get("oldPassword");
        String newPassword = param.get("newPassword");
        String newPassword2 = param.get("newPassword2");

        if(StringUtils.isEmpty(oldPassword)){
            return ResultUtil.fail("原密码不能为空！");
        }

        if(StringUtils.isEmpty(newPassword)){
            return ResultUtil.fail("新密码不能为空！");
        }

        if(StringUtils.isEmpty(newPassword2)){
            return ResultUtil.fail("确认密码不能为空！");
        }

        User user = (User) request.getSession().getAttribute("user");

        String realPassword = user.getPassword();
        if(!(MD5Util.encode(oldPassword).equals(realPassword))){
            return ResultUtil.fail("原密码输入错误！");
        }

        if(!(newPassword.equals(newPassword2))){
            return ResultUtil.fail("新密码输入不一致！");
        }

        user.setPassword(MD5Util.encode(newPassword));

        userService.saveOrUpdate(user);

        return ResultUtil.ok();
    }
}
