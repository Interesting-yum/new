package com.cafuc.ssm.service.impl;

import com.cafuc.ssm.mapper.UserMapper;
import com.cafuc.ssm.service.UserService;
import com.cafuc.ssm.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ly
 * @time 2019/6/29  14:52
 * @description 用户服务接口实现类
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getAll() {
        return userMapper.getAll();
    }

    @Override
    public void save() {

    }

    @Override
    public boolean delete(Integer userId) {
        return userMapper.delete(userId);
    }

    @Override
    public boolean add(User user) {
        return userMapper.add(user);
    }
}
