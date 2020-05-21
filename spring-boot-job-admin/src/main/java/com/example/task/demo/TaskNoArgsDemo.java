package com.example.task.demo;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 无参数任务-执行Demo
 */
@Component
public class TaskNoArgsDemo {

    private static Logger log = LoggerFactory.getLogger(TaskNoArgsDemo.class);


    public void noArgsMethod1() {
        log.info("[ noArgsMethod1 ] > 任务 start");
        //模拟程序执行
        this.sleep(1000);
        log.info("[ noArgsMethod1 ] > 任务 end");
    }

    public void noArgsMethod2() {
        log.info("[ noArgsMethod2 ] > 任务 start");

        //模拟程序执行
        this.sleep(2000);
        log.info("[ noArgsMethod2 ] > 任务 end");
    }

    private void sleep(long millis) {
        try {
            Thread.sleep(millis);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}