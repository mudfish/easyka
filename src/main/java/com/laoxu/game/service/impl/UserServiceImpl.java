package com.laoxu.game.service.impl;

import com.laoxu.game.entity.User;
import com.laoxu.game.mapper.UserMapper;
import com.laoxu.game.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户 服务实现类
 * </p>
 *
 * @author test
 * @since 2021-05-06
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
