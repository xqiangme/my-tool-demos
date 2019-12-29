package com.example.config.datasource;

import com.alibaba.druid.pool.DruidDataSource;
import com.tool.general.excel.common.constants.GenExcelMapperConstant;
import com.tool.general.excel.util.GenExcelMapperLocationUtil;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * 数据源3 >  配置
 *
 * @author mengqiang
 * @date 2019-03-25
 */
@Configuration
@MapperScan(basePackages = {"com.example.mapper.db3", GenExcelMapperConstant.MAPPER_ROOT_PACKAGE}, sqlSessionTemplateRef = "test3SqlSessionTemplate")
public class DataSource3Config {

    /**
     * 数据源配置
     * 使用的连接池是 DruidDataSource
     */
    @Bean(name = "test3DataSource")
    @ConfigurationProperties(prefix = "spring.datasource.test3")
    public DataSource test3DataSource() {
        return DataSourceBuilder.create().type(DruidDataSource.class).build();
    }


    /**
     * 创建 SqlSessionFactory 工厂
     */
    @Bean(name = "test3SqlSessionFactory")
    public SqlSessionFactory test3SqlSessionFactory(@Qualifier("test3DataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        //数据源
        bean.setDataSource(dataSource);

        //mapper文件 扫描地址
        Resource[] resource = GenExcelMapperLocationUtil.init()
                //项目业务xml 地址
                //.addMapperLocations("classpath:mybatis/mapper/db3/*.xml")
                //gen-excel xml地址配置
                .addMapperLocations(GenExcelMapperConstant.XML_ROOT_LOCATIONS)
                .build();

        //mapper 地址
        bean.setMapperLocations(resource);
        return bean.getObject();
    }


    /**
     * 事务管理
     */
    @Bean(name = "test3TransactionManager")
    public DataSourceTransactionManager test3TransactionManager(@Qualifier("test3DataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    /**
     * MyBatis提供的持久层访问模板化的工具
     * 线程安全，可通过构造参数或依赖注入SqlSessionFactory实例。
     */
    @Bean(name = "test3SqlSessionTemplate")
    public SqlSessionTemplate testSqlSessionTemplate(@Qualifier("test3SqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}
