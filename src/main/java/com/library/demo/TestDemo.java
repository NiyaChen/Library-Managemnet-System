package com.library.demo;
import com.library.service.ClassInfoService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/*
测试spring 是否单独执行
 */
public class TestDemo {
    @Test
    public void testSpring(){
        //获取spring容器
        ApplicationContext app= new ClassPathXmlApplicationContext("spring.xml");
        //获取bean
        ClassInfoService infoService= (ClassInfoService) app.getBean("classInfoService");
//        infoService.queryClassInfoAll();
    }
}

