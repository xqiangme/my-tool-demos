package com.example;

import com.xqiang.job.admin.common.constant.JobAdminOpenConstant;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;

/**
 * 启动类
 *
 * @author mengqiang
 * @date 2019-05
 */
@SpringBootApplication
@ComponentScans({@ComponentScan(JobAdminOpenConstant.SCAN_PACKAGE)})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
