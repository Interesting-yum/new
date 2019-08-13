package com.cafuc.ssm;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @auther: ly
 * @date: 17:26 2018/8/28
 * @Description: Springboot Servlet初始化
 */
public class ServletInitializer extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SpringbootSpringmvcMybatisApplication.class);
    }

}
