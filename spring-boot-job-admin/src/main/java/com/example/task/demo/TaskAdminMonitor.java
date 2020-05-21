package com.example.task.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * job-admin 任务监控
 * 可以设置每分钟执行，判断项目是否还活着
 */
@Component
public class TaskAdminMonitor {

    private static Logger log = LoggerFactory.getLogger(TaskAdminMonitor.class);


    public void monitor() {
        log.info("[ job-admin-monitor ]> job-admin is alive");
    }

}