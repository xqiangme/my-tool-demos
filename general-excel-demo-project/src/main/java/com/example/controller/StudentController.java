
package com.example.controller;

import com.example.entity.StudentInfo;
import com.example.mapper.db1.StudentInfo1Mapper;
import com.example.mapper.db2.StudentInfo2Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 多数据源测试
 *
 * @author mengqiang
 */
@RestController
@RequestMapping("/student")
public class StudentController {

    @Resource
    private StudentInfo1Mapper studentInfo1Mapper;

    @Resource
    private StudentInfo2Mapper studentInfo2Mapper;

    /**
     * 获取 db1与 db2的所有学生
     * 用与双数据源demo项目测试
     *
     * @author mengqiang
     */
    @PostMapping("/list-all")
    public Map<String, Object> getAllUser() {
        List<StudentInfo> studentInfoDb1 = studentInfo1Mapper.listAll();
        List<StudentInfo> studentInfoDb2 = studentInfo2Mapper.listAll();
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("db1-student-size", studentInfoDb1.size());
        result.put("db2-student-size", studentInfoDb2.size());
        result.put("db1-student-list", studentInfoDb1);
        result.put("db2-student-list", studentInfoDb2);
        return result;
    }
}