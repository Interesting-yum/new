package com.cafuc.ssm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @auther: ly
 * @date: 17:26 2018/8/28
 * @Description: SpringBoot 启动类
 */
@SpringBootApplication
@MapperScan("com.cafuc.ssm.mapper")
public class SpringbootSpringmvcMybatisApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootSpringmvcMybatisApplication.class, args);
    }
}
