package com.example.config;

import com.example.config.property.OssProperty;
import com.tool.general.excel.config.GenExcelDataSourceConfig;
import com.tool.general.excel.config.GenExcelOssProperty;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 公共导出-数据源关系配置
 *
 * @author mengqiang
 */
@Configuration
public class GenExcelConfig {

    @Autowired
    @Qualifier("test1SqlSessionFactory")
    private SqlSessionFactory test1SqlSessionFactory;
    @Autowired
    @Qualifier("test2SqlSessionFactory")
    private SqlSessionFactory test2SqlSessionFactory;
    @Autowired
    @Qualifier("test3SqlSessionFactory")
    private SqlSessionFactory test3SqlSessionFactory;

    @Autowired
    private OssProperty ossProperty;

    /**
     * 数据源与SqlSessionFactory关系配置
     */
    @Bean
    public GenExcelDataSourceConfig genExcelSqlSessionFactory() {
        return GenExcelDataSourceConfig.initDefault(16)
                //数据库编码 对应 export_template_info表 >  db_code
                .addSqlSessionFactory("DB1001", test1SqlSessionFactory)
                .addSqlSessionFactory("DB1002", test2SqlSessionFactory)
                .addSqlSessionFactory("DB1003", test3SqlSessionFactory);
    }

    /**
     * oss 配置
     */
    @Bean
    public GenExcelOssProperty genExcelOssProperty() {
        GenExcelOssProperty genExcelOssProperty = new GenExcelOssProperty();
        genExcelOssProperty.setAccessId(ossProperty.getAccessId());
        genExcelOssProperty.setAccessKey(ossProperty.getAccessKey());
        genExcelOssProperty.setBucket(ossProperty.getBucket());
        genExcelOssProperty.setDefaultDir(ossProperty.getDefaultDir());
        genExcelOssProperty.setEndpoint(ossProperty.getEndpoint());
        return genExcelOssProperty;
    }
}