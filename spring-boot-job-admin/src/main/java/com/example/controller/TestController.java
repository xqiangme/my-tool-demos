
package com.example.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 多数据源测试
 *
 * @author mengqiang
 */
@RestController
@RequestMapping("/test")
public class TestController {

    /**
     * 获取 db1与 db2的所有学生
     * 用与双数据源demo项目测试
     *
     * @author mengqiang
     */
    @PostMapping("/exce")
    public String getAllUser() {
        if (1 == 1) {
            throw new RuntimeException("测试 RuntimeException ");
        }
        return "success";
    }
}