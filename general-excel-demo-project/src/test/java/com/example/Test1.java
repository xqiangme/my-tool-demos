package com.example;///**

import com.tool.general.excel.dao.mapper.base.GeneralExcelBaseMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author mengqiang
 * @version .java, v 0.1   -   -
 */
@RunWith(SpringRunner.class)
@SpringBootTest()
public class Test1 {

    @Autowired
    @Qualifier("test1SqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory1;

    @Autowired
    @Qualifier("test2SqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory2;

    @Test
    public void test2s() {

        List<String> columnList = new ArrayList<>();
        columnList.add("a.user_id");
        columnList.add("a.user_name");
        columnList.add("a.real_name");


        Map<String, Object> paramMap = new HashMap<>();
        //表名
        paramMap.put("tableNames", "user_info a");

        //列名
        paramMap.put("columnList", columnList);


        SqlSession sqlSession = sqlSessionFactory2.openSession();

//        //替换后执行该方法
        GeneralExcelBaseMapper mapper = sqlSession.getMapper(GeneralExcelBaseMapper.class);
        System.out.println(null == mapper);
        String statement = "com.mq.general.excel.dao.mapper.base.GeneralExcelBaseMapper.listByCondition";

        //执行通用查询接口
//        List<Map<String, Object>> maps = sqlSession.selectList(statement, paramMap);
        List<Map<String, Object>> maps = mapper.listByCondition(paramMap);

        System.out.println("测试结果：size :" + maps.size());
        System.out.println("测试结果：size :" + maps);

    }
}