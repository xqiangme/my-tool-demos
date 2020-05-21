package com.example.task.demo;

import com.alibaba.fastjson.JSON;
import com.example.entity.StudentInfo;
import com.example.mapper.StudentInfo1Mapper;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * 学生脚本DEMO
 *
 * @author mengq
 */
@Component
public class TaskStudent {

    private static Logger log = LoggerFactory.getLogger(TaskStudent.class);

    @Resource
    private StudentInfo1Mapper studentInfo1Mapper;

    public void student() {
        log.info("[ student-job ]>  is start");
        //查询学生信息
        List<StudentInfo> studentList = studentInfo1Mapper.listAll();
        if (CollectionUtils.isEmpty(studentList)) {
            log.info("[ student-job ]>  is end  size:{}", studentList.size());
            return;
        }
        for (StudentInfo student : studentList) {
            log.info("[ student-job ]>  student:{}", JSON.toJSONString(student));
        }

        log.info("[ student-job ]>  is end  size:{}", studentList.size());
    }

}