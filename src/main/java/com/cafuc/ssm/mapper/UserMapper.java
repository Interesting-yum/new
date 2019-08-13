package com.cafuc.ssm.mapper;

import com.cafuc.ssm.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author ly
 * @time 2019/6/29  15:38
 * @description 用户数据接口
 */
@Repository
public interface UserMapper {
//    @ResultMap("userResultMap")
//    @Select("select * from user")
    List<User> getAll();

    boolean delete(Integer userId);

    boolean add(User user);
}
