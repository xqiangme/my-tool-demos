package com.example.task.demo;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 有参数任务-执行Demo
 */
@Component("taskHasArgsDemo")
public class TaskHasArgsDemo {

    private static Logger log = LoggerFactory.getLogger(TaskHasArgsDemo.class);


    public void hasOneArgsMethod(String args) {
        log.info("[ hasOneArgsMethod ] > 任务 start args:{}", args);
        //模拟程序执行
        this.sleep(1000);
        log.info("[ hasOneArgsMethod ] > 任务 end args:{}", args);
    }

    public void hasTwoArgsMethod(String args1, String args2) {
        log.info("[ hasTwoArgsMethod ] > 任务 start args1:{} , args2:{}", args1, args2);
        //模拟程序执行
        this.sleep(1100);
        log.info("[ hasTwoArgsMethod ] > 任务 end args1:{} , args2:{}", args1, args2);
    }

    public void hasThreeArgsMethod(String args1, String args2, String args3) {
        log.info("[ hasThreeArgsMethod ] > 任务 start args1:{} , args2:{} , args3:{}", args1, args2, args3);
        //模拟程序执行
        this.sleep(1200);
        log.info("[ hasThreeArgsMethod ] > 任务 end args1:{} , args2:{} , args3:{}", args1, args2, args3);

    }

    private void sleep(long millis) {
        try {
            Thread.sleep(millis);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}