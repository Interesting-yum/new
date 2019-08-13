package com.cafuc.ssm.controller;

import com.cafuc.ssm.base.controller.BaseController;
import com.cafuc.ssm.base.util.RedisConstants;
import com.cafuc.ssm.entity.User;
import com.cafuc.ssm.base.util.RedisUtil;
import com.cafuc.ssm.base.util.StateParameter;
import com.cafuc.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author ly
 * @time 2019/8/6  22:13
 * @description Redis控制类
 */
@Controller
@RequestMapping("/redis")
public class RedisController extends BaseController {

    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private UserService userService;

    /**
     * @auther: ly
     * @date: 17:26 2018/8/28
     * @param: []
     * @return: org.springframework.ui.ModelMap
     * @Description: 测试redis存储&读取
     */
    @RequestMapping(value="/test")
    @ResponseBody
    public ModelMap test(){
        try {
            redisUtil.set("redisTemplate","这是一条测试数据", RedisConstants.datebase2);
            redisUtil.expire("redisTemplate",60);
            String value = redisUtil.get("redisTemplate",RedisConstants.datebase2).toString();
            logger.info("redisValue="+value);
            logger.info("读取redis成功");
            return getModelMap(StateParameter.SUCCESS, value, "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            return getModelMap(StateParameter.FAULT, null, "操作失败");
        }
    }

    @RequestMapping(value="/hSet")
    @ResponseBody
    public ModelMap hSetTest(){
        try {
            redisUtil.hset("ly","hehe",userService.getAll());
            String value = redisUtil.hget("ly","hehe").toString();
            logger.info("redisValue="+value);
            logger.info("读取redis成功");
            return getModelMap(StateParameter.SUCCESS, value, "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            return getModelMap(StateParameter.FAULT, null, "操作失败");
        }
    }

    @RequestMapping(value="/setUser")
    @ResponseBody
    public ModelMap setUser(){
        try {
            List<User> list = userService.getAll();
            redisUtil.set("userList",list, RedisConstants.datebase1);
            List<User> obj =(List<User>) redisUtil.get("userList",RedisConstants.datebase1);
            logger.info("res="+obj.toString());
            logger.info("读取redis成功");
            return getModelMap(StateParameter.SUCCESS, obj, "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            return getModelMap(StateParameter.FAULT, null, "操作失败");
        }
    }
}
