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
 * 数据源2 >  配置
 *
 * @author mengqiang
 * @date 2019-03-25
 */
@Configuration
@MapperScan(basePackages = {"com.example.mapper.db2", GenExcelMapperConstant.MAPPER_COMMON_PACKAGE}, sqlSessionTemplateRef = "test2SqlSessionTemplate")
public class DataSource2Config {

    /**
     * 数据源配置
     * 使用的连接池 DruidDataSource
     */
    @Bean(name = "test2DataSource")
    @ConfigurationProperties(prefix = "spring.datasource.test2")
    public DataSource testDataSource() {
        return DataSourceBuilder.create().type(DruidDataSource.class).build();
    }

    /**
     * 创建 SqlSessionFactory 工厂
     */
    @Bean(name = "test2SqlSessionFactory")
    public SqlSessionFactory testSqlSessionFactory(@Qualifier("test2DataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        //数据源
        bean.setDataSource(dataSource);

        //mapper文件 扫描地址¬
        Resource[] resources = GenExcelMapperLocationUtil.init()
                //当前数据源-业务xml地址
                .addMapperLocations("classpath:mybatis/mapper/db2/*.xml")
                //gen-excel 公共导出xml地址配置
                .addMapperLocations(GenExcelMapperConstant.XML_COMMON_LOCATIONS)
                .build();

        //mapper 地址
        bean.setMapperLocations(resources);
        return bean.getObject();
    }

    /**
     * 事务管理
     */
    @Bean(name = "test2TransactionManager")
    public DataSourceTransactionManager testTransactionManager(@Qualifier("test2DataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    /**
     * MyBatis提供的持久层访问模板化的工具
     * 线程安全，可通过构造参数或依赖注入SqlSessionFactory实例。
     */
    @Bean(name = "test2SqlSessionTemplate")
    public SqlSessionTemplate testSqlSessionTemplate(@Qualifier("test2SqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}
