package com.cafuc.ssm.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.apache.ibatis.annotations.ConstructorArgs;

import java.io.Serializable;

/**
 * @author ly
 * @time 2019/6/29  14:40
 * @description 用户实体类
 */
@Data
@AllArgsConstructor
public class User implements Serializable {
    private static final long serialVersionUID = 6433668843764732351L;
    private Integer userId;     //用户主键
    private String userName;    //用户姓名
    private String loginName;   //用户名
    private String password;    //密码
    private Integer gender;     //性别

    public User(){}
}
