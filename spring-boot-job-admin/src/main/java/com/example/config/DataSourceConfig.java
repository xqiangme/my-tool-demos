package com.example.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.xqiang.job.admin.common.constant.JobAdminOpenConstant;
import com.xqiang.job.admin.common.util.JobAdminMapperLocationUtil;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;


/**
 * 数据源 > 配置
 *
 * @author mengqiang
 * @date 2020-05
 */
@Configuration
@MapperScan(basePackages = {"com.example.mapper", JobAdminOpenConstant.MAPPER_PACKAGE}, sqlSessionTemplateRef = "sqlSessionTemplate")
public class DataSourceConfig {

    /**
     * 数据源配置
     * 使用的连接池是 DruidDataSource
     */
    @Bean(name = "dataSource")
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource() {
        //这里指定使用类型 -- DruidDataSource 连接池
        return DataSourceBuilder.create().type(DruidDataSource.class).build();
    }

    /**
     * 创建 SqlSessionFactory 工厂
     */
    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactory(@Qualifier("dataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        //数据源
        bean.setDataSource(dataSource);

        //mapper文件 扫描地址
        Resource[] resources = JobAdminMapperLocationUtil.init()
                //当前数据源-业务xml地址
                .addMapperLocations("classpath:mybatis/mapper/*.xml")
                //job-admin jar中 xml地址配置
                .addMapperLocations(JobAdminOpenConstant.XML_LOCATIONS)
                .build();
        //mapper 地址
        bean.setMapperLocations(resources);
        return bean.getObject();
    }

    /**
     * 事务管理
     */
    @Bean(name = "transactionManager")
    public DataSourceTransactionManager transactionManager(@Qualifier("dataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    /**
     * MyBatis提供的持久层访问模板化的工具
     * 线程安全，可通过构造参数或依赖注入SqlSessionFactory实例
     */
    @Bean(name = "sqlSessionTemplate")
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier("sqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}
