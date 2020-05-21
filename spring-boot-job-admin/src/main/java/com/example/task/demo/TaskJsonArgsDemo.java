package com.example.task.demo;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 有参数任务-执行Demo
 */
@Component
public class TaskJsonArgsDemo {
    private static Logger log = LoggerFactory.getLogger(TaskJsonArgsDemo.class);

    public void jsonArgsDemo(String json) {
        log.info("[ jsonArgsDemo ] > 任务 start args:{}", json);
        JSONObject jsonObject = JSON.parseObject(json);
        log.info("[ jsonArgsDemo ] > JSON 参数:{}", jsonObject.toString());
        //模拟程序执行
        try {
            Thread.sleep(1200);
        } catch (Exception e) {
            e.printStackTrace();
        }
        log.info("[ jsonArgsDemo ] > 任务 end args:{}", json);
    }

}