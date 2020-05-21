package com.example.task.demo;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 任务执行Demo
 */
@Component
public class TaskLongSleepDemo {

    private static Logger log = LoggerFactory.getLogger(TaskLongSleepDemo.class);


    public void sleep30Second() {
        log.info("[ sleep30Second ] > 任务 start");
        for (int i = 0; i < 30; i++) {
            this.sleep(1000);
            log.info("[ sleep30Second ] > runing i={}", i);
        }
        log.info("[ sleep30Second ] > 任务 end");
    }

    public void sleep60Second() {
        log.info("[ sleep60Second ] > 任务 start");
        //模拟程序执行
        this.sleep(60000);
        log.info("[ sleep20Second ] > 任务 end");
    }

    private void sleep(long millis) {
        try {
            Thread.sleep(millis);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}