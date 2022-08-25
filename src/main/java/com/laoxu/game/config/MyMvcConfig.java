package com.laoxu.game.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class MyMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/admin").setViewName("admin");
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/goods").setViewName("goods");
        registry.addViewController("/goodsType").setViewName("goodsType");
        registry.addViewController("/operlog").setViewName("operlog");
        registry.addViewController("/km").setViewName("km");
        registry.addViewController("/order").setViewName("order");
        registry.addViewController("/getAllKm").setViewName("getAllKm");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginFilter()).addPathPatterns("/**").
                excludePathPatterns("/login","/","/index","/doLogin","/static/**","/logout","/error","/webapi/**","/api/file/downloadImage/**","/getAllKm");
    }

}
