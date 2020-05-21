package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 多数据源测试
 *
 * @author mengqiang
 */
@Controller
public class IndexController {

    /**
     * @author mengqiang
     */
    @RequestMapping("/")
    public String index() {
        return "redirect:/job-admin/index";
    }
}