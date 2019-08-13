package com.cafuc.ssm.service;

import com.cafuc.ssm.entity.User;

import java.util.List;

/**
 * @author ly
 * @time 2019/6/29  14:47
 * @description 用户服务接口
 */
public interface UserService {
    List<User> getAll();

    void save();

    boolean delete(Integer userId);

    boolean add(User user);
}
